function trigonometricApproximationExperiments
inputPoints = (-pi:0.1:pi)';
stepFunctionValues = (abs(inputPoints) <= pi/2);
K = 10;

cosCoefficients_l2 = getL2ApproxCoefficients(K);
approximateValues_l2 = getApproximateValues(cosCoefficients_l2, inputPoints);

cosCoefficients_l1 = getL1ApproxCoefficients(K);
approximateValues_l1 = getApproximateValues(cosCoefficients_l1, inputPoints);

figureHandle = figure;
figureHandle = plot(inputPoints, stepFunctionValues, '-r');
hold on;
figureHandle = plot(inputPoints, approximateValues_l2, '-b');
hold on;
figureHandle = plot(inputPoints, approximateValues_l1, '-g');
figureHandle = legend('stepFunction', 'l2 approx', 'l1 approx');
saveas(figureHandle, ['/u/vvasuki/vishvas/work/optimization/hw/hw7/code/trigonometricApproximationExperiments.jpg'], 'jpg');
close all;

figureHandle = figure;
bar(hist(abs(approximateValues_l2 - stepFunctionValues)));
title('l2 residuals histogram');
saveas(figureHandle, ['/u/vvasuki/vishvas/work/optimization/hw/hw7/code/trigonometricApproximationExperimentsResidualsL2.jpg'], 'jpg');

figureHandle = figure;
bar(hist(abs(approximateValues_l1 - stepFunctionValues)));
title('l1 residuals histogram');
saveas(figureHandle, ['/u/vvasuki/vishvas/work/optimization/hw/hw7/code/trigonometricApproximationExperimentsResidualsL1.jpg'], 'jpg');
close all;

end

function cosCoefficients = getL2ApproxCoefficients(K)
cosCoefficients = zeros(K+1,1);
cosCoefficients(1) = 1/2;
for l=1:ceil(K/2)
%  Ranging over odd k.
k = 2*l-1;
%  Storing with an offset of 1.
index = k + 1;
cosCoefficients(index) = ((-1)^(l+1))*(2/(k*pi));
end
end

function cosCoefficients = getL1ApproxCoefficients(K)
inputPoints = (-pi:0.1:pi)';
numInputPoints = numel(inputPoints);
stepFunctionValues = (abs(inputPoints) <= pi/2);
A = zeros(numInputPoints, K+1);
for k = 0:K
    A(:, k+1) = cos(k*inputPoints);
end
stepFunctionValues = (inputPoints <= pi/2);
cvx_begin
variable cosCoefficients(K+1);
minimize sum(abs(A*cosCoefficients - stepFunctionValues));
cvx_end
%  keyboard
end


function approximateValues = getApproximateValues(cosCoefficients, inputPoints)
numInputPoints = numel(inputPoints);
approximateValues = zeros(numInputPoints, 1);
for i = 1:numInputPoints
approximateValues(i) = getApproximation(cosCoefficients, inputPoints(i));
end
%  keyboard
end

function approximation = getApproximation(cosCoefficients, t)
K = numel(cosCoefficients) -1;
approximation = 0;
for k = 0:K
approximation = approximation + cosCoefficients(k+1)*cos(k*t);
end
end
