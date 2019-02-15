function out = fnmae(A, B0, opt)
%
% FNMAe : fast nonnegative matrix factorization 
%         based on the exact NLS.  minimize ||A - BC||_F^2  s.t  B, C \ge 0.
% function out = fnmae(A, B0, opt)
%
% On output, 
% out.B and out.C are non-negative factors, out.obj is objective value
%
% On input, 
% A is the target matrix 
% B0 is the initial B.
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

global gopt solver

gopt = opt;
out = getout_nma(B0);

% Overwrite the defaults
verbosity = gopt.verbose;
gopt.verbose = 0;
gopt.use_tolo = 1;
gopt.use_tolg = 0;

% Initialize
[m, n] = size(A);

switch opt.fn_algo
 case 'PQN'
  if (strcmp(opt.objfn, 'kl'))
    out.algo = 'NMA - FNMAe (PQN) -- KL Divergence';
    solver = @(A,b,x,opt)(pqn_kl(A,b,x,opt));
  else
    out.algo = 'NMA - FNMAe (PQN) -- Least Squares';
    solver = @(A, b, x, opt)(pqn(A, b, x, opt));
  end
 case 'PLB'
  if (strcmp(opt.objfn, 'kl'))
    out.algo = 'NMA - FNMAe (PLB) -- KL Divergence';
    solver = @(A,b,x,opt)(plb_kl(A,b,x,opt));
  else
    out.algo = 'NMA - FNMAe (PLB) -- Least Squares';
    solver = @(A, b, x, opt)(plb(A, b, x, opt));
  end
 otherwise
  gopt.maxit = gopt.max_func_evals;
  if (strcmp(opt.objfn, 'kl'))
    out.algo = 'NMA - FNMAe (BBGP) -- KL Divergence';
    solver = @(A, b, x, opt)(bbkl(A, b, x, opt));
  else
    out.algo = 'NMA - FNMAe (BBGP) -- Least Squares';
    solver = @(A, b, x, opt)(bbgp(A, b, x, opt));
  end
end

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

tolb = gopt.tolb;
tolc = gopt.tolc;

prt_col = floor(n / 20);
prt_row = floor(m / 20);

% Outer iterations
for iter = 1 : gopt.fn_maxit 
    % Solve the subproblems w.r.t 'C'
    for i = 1 : n,
        out.C(:, i) = subproc(out.B, A(:, i), out.C(:, i), tolc);
        
        if verbosity & mod(i, prt_col) == 0
            fprintf('.');
        end	
    end
    
    % Solve the subproblems w.r.t 'B'
    for i = 1 : m
        D(:, i) = subproc(out.C', A(i, :)', out.B(i, :)', tolb);
        
        if verbosity & mod(i, prt_row) == 0
            fprintf('*');
        end	
    end
    
    out.B = D';
    
    % Cool down the thresholds
    tolb = max(gopt.tolmin, tolb * gopt.step_b);
    tolc = max(gopt.tolmin, tolc * gopt.step_c);

    if verbosity
      t = out.B*out.C;
      if (strcmp(opt.objfn, 'kl'))
        out.obj = kldiv(A(:), t(:));
      else
        out.obj = norm(A - t, 'fro');
      end
      fprintf(' Iter %3d: obj = %e \n', iter, out.obj);
    end
end

out.iter = iter;
out.time = etime(clock, out.start_time);
t = out.B*out.C;
if (strcmp(opt.objfn, 'kl'))
  out.obj = kldiv(A(:), t(:));
else
  out.obj = norm(A - t, 'fro');
end
clear t;

function [x f] = subproc(A, b, x, tolfun)
global gopt solver
gopt.tolo = tolfun;

out = solver(A, b, x, gopt);
x = out.x;
f = out.obj;

function o = kldiv(x, y)
v = x;
ax = y;
u = ax;
% 
% % KL-divergence KL(b; Ax)
u = v ./ u;
u(u == 0) = 1;
u = log(u);
u(isnan(u)) = 0;
u(isinf(u)) = 1e+9;
o = sum(v .* u) + sum(ax - v);
