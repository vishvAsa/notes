function out = pqn(A, b, x0, options)
%
% function out = pqn(A, b, x0, options)
% Solve a nonnegative least squares problem, min ||Ax - b||_2, s.t. x \ge 0
% Projected Quasi-Newton Based.
%
%
% x0 -- Starting vector (useful for warm-starts) -- *could* be zero.
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
% Version 1.0 (c) 2008  Dongmin Kim  and Suvrit Sra
% 
    global gA gb;

    % initialize parameters
    gA = A;
    gb = b;

    out = getout();
    out.x = x0;
    out.oldx = x0;
    out.grad = gradf(out.x);
    out.oldobj = func(out.x);
    out.iter = 0;
    out.time = 0;
    out.algo = 'PQN_NNLS';
    out.start_time = clock;
    out.status = 'Failure';
    out.step = 1;
    ihess = eye(length(out.x));                     % inverse Hessian
    h = 0;
    
    % Main loop
    while 1
        out.iter = out.iter + 1;
        show_status(out.iter, options, h);
        out.oldx = out.x; 
        gp = find(out.x == 0 & out.grad > 0);
        out.grad(gp) = 0;                  % \nabla f(\vec{y}^k)

        srch = -ihess * out.grad;
        ns = find(out.x == 0 & srch < 0);
        srch(gp) = 0;               % d
        srch(ns) = 0;               % \bar{d}

        Ad = A * srch;
        out.step = -Ad' * ((A * out.x) - b) / (Ad' * Ad);
        
        out.x = out.x + out.step * srch;
        % Projection
        out.x(out.x < 0) = 0;
        delx = out.x - out.oldx;
        delx(gp) = 0;

        out.grad = gradf(out.x);
        out.obj = func(out.x);

        term_reason = check_termination(options, out);
        if term_reason > 0
            break;
        end
        
        out.oldobj = out.obj;
        
        % Updates the quasi-Newton matrix that approximates
        % the inverse to the Hessian.
        if out.iter > 4 
            Au = A * delx;
            nAu = norm(Au)^2;
            AtAu = A' * Au;
            DAtAu = ihess * AtAu;
            ihess = ihess + ((1 + AtAu' * DAtAu / nAu) * ...
                             delx * delx' - ...
                             (DAtAu * delx' + delx * DAtAu')) / nAu;
        end
    end % of while

    out.obj = func(out.x);                                % objective value

    %% ------------------------------------------------
    %  Final statistics and wrap up
    %  ------------------------------------------------
    out.time = etime(clock, out.start_time);
    out.status = 'Success';
    out.term_reason = set_term_reason(term_reason);
    
    if (options.verbose)
        if (options.asgui) delete(h); else fprintf('Done\n'); end
    end
    
%--------------------------------------------------------------------------
% Objective functions and gradients
%
function fc = func(x)
    global gA gb;

    Ax = gA * x;
    fc = norm(Ax - gb)^2;
    
function gc = gradf(x)
    global gA gb;

    Ax = gA * x;
    gc = (gA' * (Ax - gb));
    
