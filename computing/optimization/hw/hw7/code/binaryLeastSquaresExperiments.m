function binaryLeastSquaresExperiments()
noiseLevels = [0.5 1 2 3];
for i=1:numel(noiseLevels)
    [A, b, xhat] = dataGenerator(noiseLevels(i));
    evaluateHeuristics(A, b, xhat, noiseLevels(i));
    keyboard
end
end

function evaluateHeuristics(A, b, xhat, noiseLevel)
numSamples = 100;
methods = 'ABCD';
numMethods = length(methods);
xhatApprox = cell(numMethods);
xhatApprox{1} = leastSquaresSolution(A, b);
[Z, z]  = convexRelaxation(A, b);
xhatApprox{2} = signConvexRelaxation(A, b, Z, z);
xhatApprox{3} = signRank1approxConvexRelaxation(A, b, Z, z);
xhatApprox{4} = signProbabilisticConvexRelaxation(A, b, Z, z, numSamples);

lowestSquaredError = getSquaredError(A, b, xhat);
fprintf(1, 'Noise level: %d, Rough Lower bound on squared error: %d\n', noiseLevel, lowestSquaredError);
for i = 1:numMethods
    fprintf(1, '%c: disagreement fraction: %d squaredError: %d \n', methods(i), getDisagreement(xhat, xhatApprox{i}), getSquaredError(A, b, xhatApprox{i}));
end
end

function [A, b, xhat] = dataGenerator(s)
%  s is the noise level
randn('state',0)
m = 50;
n = 40;
A = randn(m,n);
xhat = sign(randn(n,1));
b = A*xhat + s*randn(m,1);
end

function squaredError = getSquaredError(A, b, x)
squaredError = (A*x - b)'*(A*x - b);
end

function disagreement = getDisagreement(x1, x2)
n = numel(x1);
disagreement = sum(x1 ~= x2)/n;
end

function xhat_A = leastSquaresSolution(A, b)
x_ls = A\b;
xhat_A = sign(x_ls);
end

function [Z, z]  = convexRelaxation(A, b)
[m, n] = size(A);
%  keyboard
cvx_begin sdp
variable Z(n, n) symmetric;
variable z(n);
minimize trace(A'*A*Z) - sum(2*b'*A*z) + sum(b'*b)
subject to
diag(Z) == ones(n,1);
[Z z; z' 1] >= 0;
cvx_end
end

function xhat_B = signConvexRelaxation(A, b, Z, z)
xhat_B = sign(z);
end

function xhat_C = signRank1approxConvexRelaxation(A, b, Z, z)
[m, n] = size(A);
[v_1, ew_1] = eigs([Z z; z' 1], 1);
xhat_C = sign(v_1(1:n));
end

function xhat_D = signProbabilisticConvexRelaxation(A, b, Z, z, numSamples)
[m, n] = size(A);
xhat_D = zeros(n ,1);
error = Inf;
for i=1:numSamples
    v_samp = z + sqrtm(Z - z*z') * randn(n, 1);
    x_samp = sign(v_samp);
    error_i = getSquaredError(A, b, v_samp);
    if(error_i < error)
        xhat_D = x_samp;
        error = error_i;
    end
end
end
