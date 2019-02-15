function out = plb(A, b, x0, options)
% PLB -- This function solves the following optimization problem
%  min ||Ax - b||_2, subject to x \ge 0
% based on projected L-BFGS method. 
%
% Usage: 
%       OUT = PLB(A, b, x0, OPTIONS)
%
% x0 -- Starting vector (useful for warm-starts) -- *can* be zero.
%
% OPTIONS -- This structure contains important options that control how the
% optimization procedure runs. To obtain a default structure the user can
% use 'options = solopt'. Use 'help solopt' to get a description of
% what the individual options mean.
%
% OUT contains the solution and other information about the optimization or
% info indicating whether the method succeeded or failed.
%
% See also: solopt
%
% Version 1.2 (c) 2009  Dongmin Kim  and Suvrit Sra
% 

global gA gb

gA = A;
gb = b;

fx = @(x)(func(x));
gfx = @(x)(gradf(x));

%% ------------------------------------------------------
%  INITIALIZATION
%  ------------------------------------------------------
out = getout();
out.iter = 0;
out.time = 0;
out.algo = 'PLB_NNLS';
out.start_time = clock;
out.status = 'Failure';
h = 0;

%% -------------------------------------------------------
%  Prime the pump
%  -------------------------------------------------------

if (options.verbose)
    if (options.asgui) h=waitbar(0, 'Running PLB...'); 
    else fprintf('PLB:\n'); 
    end
end

%% ------------------------------------------------------
%  OTHER INITIALIZATION
%  ------------------------------------------------------
rho = ones(options.maxmem, 1);
alp = rho;
delx = zeros(length(x0), options.maxmem);
delg = delx;
last = 1;

out.x = x0;
out.oldx = x0;
out.obj = fx(x0);
out.oldobj = out.obj;
out.grad = gfx(x0);
out.oldgrad = out.grad;
out.srch = -out.grad;

[out.x, flag] = line_search(out, fx, gfx, options);

out.grad = gfx(out.x);
out.obj = fx(out.x);

%% -----------------------------------------------------
%  The main iterative loop
%  -----------------------------------------------------
while 1
%%
    out.iter = out.iter + 1;
    show_status(out.iter, options, h);
%%    
    gp = find(out.x == 0 & out.grad > 0);

    % Compute L-BFGS.
    delx(:, last) = out.x - out.oldx;
    delg(:, last) = out.grad - out.oldgrad;
    delx(gp, :) = 0;
    delg(gp, :) = 0;

    out.oldx = out.x;
    out.oldgrad = out.grad;
    out.oldobj = out.obj;

    out.grad(gp) = 0;
    out.srch = out.grad;
    rho(last) = 1 / (delx(:, last)' * delg(:, last));
    pt = last;

    for i = 1 : min(out.iter, options.maxmem)
        alp(pt) = rho(pt) * delx(:, pt)' * out.srch;
        out.srch = out.srch - alp(pt) * delg(:, pt);
        pt = options.maxmem - mod(-pt + 1, options.maxmem);
    end

    out.srch = 1 / rho(last) / (delg(:, last)' * delg(:, last)) * out.srch;
    
    for i = 1 : min(out.iter, options.maxmem)
        pt = mod(pt, options.maxmem) + 1;
        b = rho(pt) * delg(:, pt)' * out.srch;
        out.srch = out.srch + (alp(pt) - b) * delx(:, pt);
    end

    last = mod(last, options.maxmem) + 1;

    out.srch = -out.srch;
    out.srch(gp) = 0;
%%
    [out.x, flag] = line_search(out, fx, gfx, options);
    out.grad = gfx(out.x);
    out.obj = fx(out.x);
    
    % termination
    if flag < 0
        term_reason = 6;
    else
        term_reason = check_termination(options, out);
    end
    if (term_reason > 0)
        break;
    end
%%

end % of while

%% ------------------------------------------------
%  Final statistics and wrap up
%  ------------------------------------------------
out.time = etime(clock, out.start_time);
out.status = 'Success';
out.term_reason = set_term_reason(term_reason);

if (options.verbose)
    if (options.asgui) delete(h); else fprintf('Done\n'); end
end

function fc = func(x)
    global gA gb;

    Ax = gA * x;
    fc = norm(Ax - gb)^2;
    
function gc = gradf(x)
    global gA gb;

    Ax = gA * x;
    gc = (gA' * (Ax - gb));

