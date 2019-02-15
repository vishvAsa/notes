function out = fnma_m(A, B0, M, opt)
%
% FNMA_m : fast nonnegative matrix approximation with missing values. 
% function out = fnma_m(A, B0, M, opt)
%
% Solve a nonnegative matrix approximation problem with missing values, 
%    min ||A - B*S*C||_F^2
%    s.t  B, C \ge 0
% Based on Barzila-Borwein Gradient Projection Based.
%
% On output, 
% out.B and out.C are non-negative factors, out.obj is objective value
%
% On input, 
% A is the target matrix 
% B0 is the initial B.
% M represents the *missing structure* in A.
%
% OPTIONS -- This structure contains important goptions that control how the
% goptimization procedure runs. To obtain a default structure the user can
% use 'options = solopt'. Use 'help solopt' to get a description of
% what the individual goptions mean.
%
% See also: solopt
%
% Version 1.3 (c) 2009  Dongmin Kim 
% 

% Just in case user doesn't pass in a 0/1 matrix
M(M~=0) = 1;
% initialize
out = getout_nma(B0);

out.algo = 'NNMA with missing values - FNMA_m';
subproc = @(A, X, Y, M)(bbgp_mat(A, X, Y, M, opt.max_func_evals));
out.start_time = clock;

if issparse(out.B)
    R = qr(out.B);
else
    R = triu(qr(out.B));
end

out.C = R \ (R' \ (out.B' * A));
out.C(out.C < 0) = 0;

if issparse(out.C)
    R = qr(out.C');
else
    R = triu(qr(out.C'));
end

out.B = (R \ (R' \ (out.C * A')))';
out.B(out.B < 0) = 0;

% Alternate!
for iter = 1 : opt.fn_maxit
    out.B = (subproc(A', out.C', out.B', M'))';
    out.C = (subproc(A, out.B, out.C, M));

    if opt.verbose & mod(iter, 5) == 1
        out.obj = func(A, out.B, out.C, M);
        fprintf(' Iter %3d: obj = %e \n', iter, out.obj);
    end
end

% ensure sum(B.^2) and sum(C'.^2) is always 1
x2      = sqrt(sum(out.B.^2));
y2      = sqrt(sum(out.C'.^2));
s       = x2.*y2;

nz      = find(x2);
out.B(:, nz) = out.B(:, nz) * diag(1./x2(nz));

nz      = find(y2);
out.C(nz, :) = diag(1./y2(nz)) * out.C(nz, :);

% ensure diag(S) is in descending order
[s,idx] = sort(-s);
s       = -s;
out.S   = diag(s);

% reorder B and C properly
out.B       = out.B(:, idx);
out.C       = out.C(idx, :);  

out.iter = iter;
out.time = etime(clock, out.start_time);
out.obj = func(A, out.B * out.S, out.C, M);

function X = bbgp_mat(A, B, X, M, InnerIter)
% Solve a nonnegative least squares problem, min ||Ax - b||_2, s.t. x \ge 0
% Barzilai-Borwein Gradient Projection

grad = gradf(A, B, X, M);
oldgrad = grad;

iter = 1;

% Main loop
while iter < InnerIter
    iter = iter + 1;
    gp = find(X == 0 & grad > 0);
    oldgrad(gp) = 0;
    Ag = B * oldgrad;

    if norm(Ag, 'fro') < 1e-5
        break;
    end

    if (mod(iter, 2) == 0)
        step = diag(oldgrad' * oldgrad) ./ diag(Ag' * Ag);
    else
        Ag(gp) = 0;
        numer = diag(Ag' * Ag);
        Ag = B' * Ag;
        step = numer ./ diag(Ag' * Ag);
    end

    step(isnan(step)) = 0;
    
    X = X - grad * diag(step);
    X(X < 0) = 0;
    oldgrad = grad;
    grad = gradf(A, B, X, M);
end % of while

%--------------------------------------------------------------------------
% Objective functions and gradients
%
function fc = func(A, B, X, M)
  fc = norm((A - B * X) .* M, 'fro')^2;
  
function gc = gradf(A, B, X, M)
%    [size(A)', size(B)', size(X)', size(M)']
  gc = B' * ((B * X - A) .* M);

