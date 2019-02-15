function out = bbgp(A, b, x0, opt)
%
% function out = bbgp(A, b, x0, opt)
% Solve a nonnegative least squares problem, min ||Ax - b||_2, s.t. x \ge 0
% Barzilai-Borwein Gradient Projection.
%
%
% x0 -- Starting vector (useful for warm-starts).
%
% OPTIONS -- This structure contains important opt that control how the
% optimization procedure runs. To obtain a default structure the user can
% use 'opt = solopt'. Use 'help solopt' to get a description of
% what the individual opt mean.
%
% OUT contains the solution and other information about the optimization or
% info indicating whether the method succeeded or failed.
%
% See also: solopt
%
% Version 1.2 (c) 2009  Dongmin Kim  and Suvrit Sra
% 
    global gA gb;

    % initialize parameters
    gA = A;
    gb = b;

	out = getout();
    out.x = x0;
    out.obj = func(out.x);
    out.grad = gradf(out.x);
    out.oldgrad = out.grad;
    out.iter = 0;
    out.time = 0;
    out.algo = 'BBGP';
    out.start_time = clock;
    out.status = 'Failure';
    out.step = 1;
    h = 0;
    
    % Main loop
    while 1
        out.iter = out.iter + 1;
        show_status(out.iter, opt, h);
        
        gp = find(out.x == 0 & out.grad > 0);
        out.oldgrad(gp) = 0;

        Ag = A * out.oldgrad;
        
        % termination
        if norm(Ag) < 1e-9
            term_reason = 7;
            break;
        else
            term_reason = check_termination(opt, out);
            if (term_reason > 0)
                break;
            end
        end
        
        % update x & gradient
        if (mod(out.iter, 2) == 0)
            step = (out.oldgrad' * out.oldgrad) / (Ag' * Ag);
        else
            numer = Ag' * Ag;
            Ag = A' * Ag;
            Ag(gp) = 0;
            step = numer / (Ag' * Ag);
        end

        out.x = out.x - step * out.grad;
        out.x(out.x < 0) = 0;                      % projection
        out.oldgrad = out.grad;
        out.grad = gradf(out.x);
        
        if (opt.compute_obj)
            out.oldobj = out.obj;
            out.obj = func(out.x);
        end
        
    end % of while

    out.obj = func(out.x);                                % objective value

    %% ------------------------------------------------
    %  Final statistics and wrap up
    %  ------------------------------------------------
    out.time = etime(clock, out.start_time);
    out.status = 'Success';
    out.term_reason = set_term_reason(term_reason);
    
    if (opt.verbose)
        if (opt.asgui) delete(h); else fprintf('Done\n'); end
    end
    
%--------------------------------------------------------------------------
% Objective functions and gradients
%
function fc = func(x)
    global gA gb;

    Ax = gA * x;
    fc = 0.5 * norm(Ax - gb)^2;
    
function gc = gradf(x)
    global gA gb;

    Ax = gA * x;
    gc = (gA' * (Ax - gb));
    
