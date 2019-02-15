function out = ntucker(X, core, U, R, opt)
% NTUCKER 3D Nonnegative Tucker Decomposition with NNLS algorithm.
%
%   out = NTUCKER(X,R) computes the rank(R) nonnegative
%   approximation of nonnegative tensor X, according to the
%   specified dimensions in R(1), R(2) and R(3).  The input X is a tensor.
%   T \approx core x_1 U{1} x_2 U{2} x_3 U{3}, core, U{:} \ge 0.
%
global gopt solver

gopt = opt;

out = getout_nta();
out.rank = R;
out.core = core;
out.U = U;
out.T = ttensor(out.core, out.U);

switch gopt.fn_algo
  case 'PQN'
    out.algo = 'FNTA-TUCKER (PQN)';
    solver = @(A, b, x, opt)(pqn(A, b, x, opt));
  case 'PLB'
    out.algo = 'FNTA-TUCKER (PLB)';
    solver = @(A, b, x, opt)(plb(A, b, x, opt));
  otherwise
    out.algo = 'FNTA-TUCKER (BBGP)';
    solver = @(A, b, x, opt)(bbgp(A, b, x, opt));
end

tolfun = gopt.tolb;
N = ndims(X);
normX = norm(X);
D = size(X);

% Overwrite the defaults.
gopt.tolo = tolfun;
verbosity = gopt.verbose;
gopt.verbose = 0;
gopt.use_tolo = 1;
gopt.use_tolg = 0;

out.start_time = clock;
out.obj = normX^2 + norm(out.T)^2 - 2 * innerprod(X, out.T);

if verbosity
    fprintf('\nNonnegative Tucker Decomposition:\n');
    fprintf(' Iter %2d: out.obj = %e \n', 0, out.obj);
end

%% The first iteration
% $$$ A = reshape(double(X), D(1), D(2) * D(3))';
% $$$ B = reshape(double(ttm(out.core, out.U, -1)), R(1), D(2) * D(3))';
% $$$ out.U{1} = initC(A, B);
% $$$ 
% $$$ A = reshape(double(permute(X, [2 3 1])), D(2), D(3) * D(1))';
% $$$ B = reshape(double(permute(ttm(out.core, out.U, -2), [2 3 1])), R(2), D(3) ...
% $$$             * D(1))'; 
% $$$ out.U{2} = initC(A, B);
% $$$ 
% $$$ A = reshape(double(permute(X, [3 1 2])), D(3), D(1) * D(2))';
% $$$ B = reshape(double(permute(ttm(out.core, out.U, -3), [3 1 2])), R(3), D(1) ...
% $$$             * D(2))'; 
% $$$ out.U{3} = initC(A, B);

A = reshape(double(X), prod(size(X)), 1);
B = kron(out.U{3}, kron(out.U{2}, out.U{1}));
C = initC(A, B);
out.core = tensor(reshape(C', size(out.core)), size(out.core));

%% Main Loop: Iterate until convergence
for iter = 1 : gopt.fn_maxit
    out.oldobj = out.obj;

    % U1
    A = reshape(double(X), D(1), D(2) * D(3))';
    B = reshape(double(ttm(out.core, out.U, -1)), R(1), D(2) * D(3))';
    C = out.U{1}';
    C = updateC(A, B, C, tolfun);
    out.U{1} = C';

    % U2
    A = reshape(double(permute(X, [2 3 1])), D(2), D(3) * D(1))';
    B = reshape(double(permute(ttm(out.core, out.U, -2), [2 3 1])), R(2), ...
                D(3) * D(1))'; 
    C = out.U{2}';
    C = updateC(A, B, C, tolfun);
    out.U{2} = C';

    % U3
    A = reshape(double(permute(X, [3 1 2])), D(3), D(1) * D(2))';
    B = reshape(double(permute(ttm(out.core, out.U, -3), [3 1 2])), R(3), ...
                D(1) * D(2))'; 
    C = out.U{3}';
    C = updateC(A, B, C, tolfun);
    out.U{3} = C';

    % Update core tensor
    A = reshape(double(X), prod(size(X)), 1);
    B = kron(out.U{3}, kron(out.U{2}, out.U{1}));
    C = reshape(double(out.core), prod(size(out.core)), 1);
    C = updateC(A, B, C, tolfun);
    out.core = tensor(reshape(C, size(out.core)), size(out.core));

    % Assemble the current approximation
    out.T = ttensor(out.core, out.U);
    
    % Compute fit
    out.obj = normX^2 + norm(out.T)^2 - 2 * innerprod(X, out.T);
    errchange = abs(out.oldobj - out.obj);

    if verbosity
        fprintf(' Iter %2d: out.obj = %e obj_delta = %7.1e\n', iter, ...
                out.obj, errchange);
    end

    % Check for convergence
    if (iter > 1) && (errchange < gopt.tolmin)
        break;
    end

    tolfun = max(gopt.tolmin, tolfun * gopt.step_b);

end

% Assemble the resulting tensor
out.T = ttensor(out.core, out.U);
out.iter = iter;
out.time = etime(clock, out.start_time);
out.obj = normX^2 + norm(out.T)^2 - 2 * innerprod(X, out.T);

function C = initC(A, B)
  R = triu(qr(B));
  C = R \ (R' \ (B' * A));
  C = C + R \ (R' \ (B' * (A - B * C)));
  C(C < 0) = 0;
  C = C';

function C = updateC(A, B, C, tolfun)
  for i = 1 : size(C, 2),
    C(:, i) = subproc(B, A(:, i), C(:, i), tolfun);
  end

function [x f] = subproc(A, b, x, tolfun)
global gopt solver
gopt.tolo = tolfun;

out = solver(A, b, x, gopt);
x = out.x;
f = out.obj;
