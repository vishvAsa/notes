function out = nparafac(X, U, r, opt)
%
% NPARAFAC Nonnegative 3D PARAFAC Decomposition with NNLS
% algorithm.
%
%   out = NPARAFAC(X, U, r, opt) computes the rank(r) nonnegative
%   approximation of nonnegative tensor X, according to the
%   specified dimension r.  The input X is a ktensor.
%   out.T \approx \sum_r out.U{1} \circ out.U{2} \circ out.U{3}, out.U{:} \ge 0.
%
% See also: solopt
%
% Version 0.2 (c) 2009  Dongmin Kim 
% 
global gopt solver

gopt = opt;

out = getout_nta();
out.rank = r;
out.U = U;
out.T = ktensor(U);

switch gopt.fn_algo
  case 'PQN'
    out.algo = 'FNTA-PARAFAC (PQN)';
    solver = @(A, b, x, opt)(pqn(A, b, x, opt));
  case 'PLB'
    out.algo = 'FNTA-PARAFAC (PLB)';
    solver = @(A, b, x, opt)(plb(A, b, x, opt));
  otherwise
    out.algo = 'FNTA-PARAFAC (BBGP)';
    solver = @(A, b, x, opt)(bbgp(A, b, x, opt));
end

tolfun = gopt.tolb;
N = ndims(X);
normX = norm(X);
XD = double(X);

% Overwrite the defaults.
verbosity = gopt.verbose;
gopt.verbose = 0;
gopt.use_tolo = 1;
gopt.use_tolg = 0;

out.start_time = clock;
out.obj = normX^2 + norm(out.T)^2 - 2 * innerprod(X, out.T);

if verbosity
    fprintf('\nNonnegative PARAFAC Decomposition:\n');
    fprintf(' Iter %2d: obj = %e \n', 0, out.obj);
end

% The first iteration
out.U{3} = initC(XD, out.U{1}, out.U{2}, r);

%% Main Loop: Iterate until convergence
for iter = 1 : opt.fn_maxit
    
    out.oldobj = out.obj;
    
    % U1
    out.U{3} = updateC(XD, out.U{1}, out.U{2}, out.U{3}', r, tolfun);
    out.U{2} = updateC(permute(XD, [3 1 2]), out.U{3}, out.U{1}, out.U{2}', ...
                       r, tolfun); 
    out.U{1} = updateC(permute(XD, [2 3 1]), out.U{2}, out.U{3}, out.U{1}', ...
                       r, tolfun); 
    
    out.T = ktensor(out.U);
    out.obj = normX^2 + norm(out.T)^2 - 2 * innerprod(X, out.T);
    errchange = abs(out.oldobj - out.obj);
    
    if verbosity
        fprintf(' Iter %2d: obj = %e obj_delta = %7.1e\n', iter, ...
                out.obj, errchange);
    end
    
    % Check for convergence
    if (iter > 1) && (errchange < gopt.tolmin)
        break;
    end
    
    tolfun = max(gopt.tolmin, tolfun * gopt.step_b);
end

% Assemble the resulting tensor
out.T = ktensor(out.U);
out.iter = iter;
out.time = etime(clock, out.start_time);
out.obj = normX^2 + norm(out.T)^2 - 2 * innerprod(X, out.T);

function C = initC(XD, A, B, r)
    
dims = size(XD);
H = zeros(dims(1) * dims(2), r);
W = zeros(dims(1) * dims(2), dims(3));

for i = 1 : r
    H(:, i) = reshape(A(:, i) * B(:, i)', dims(1) * dims(2), 1);
end

for i = 1 : dims(3)
    W(:, i) = reshape(XD(:, :, i), dims(1) * dims(2), 1);
end

C = initCinner(W, H);
C = C';

function C = initCinner(A, B)
R = triu(qr(B));
C = R \ (R' \ (B' * A));
C = C + R \ (R' \ (B' * (A - B * C)));
C(C < 0) = 0;

function C = updateC(XD, A, B, C, r, tolfun)

dims = size(XD);
H = zeros(dims(1) * dims(2), r);
W = zeros(dims(1) * dims(2), dims(3));

for i = 1 : r
    H(:, i) = reshape(A(:, i) * B(:, i)', dims(1) * dims(2), 1);
end

for i = 1 : dims(3)
    W(:, i) = reshape(XD(:, :, i), dims(1) * dims(2), 1);
end

C = updateCinner(W, H, C, tolfun);
C = C';

function C = updateCinner(A, B, C, tolfun)
for i = 1 : size(C, 2),
    C(:, i) = subproc(B, A(:, i), C(:, i), tolfun);
end

function [x f] = subproc(A, b, x, tolfun)
global gopt solver
gopt.tolo = tolfun;

out = solver(A, b, x, gopt);
x = out.x;
f = out.obj;
