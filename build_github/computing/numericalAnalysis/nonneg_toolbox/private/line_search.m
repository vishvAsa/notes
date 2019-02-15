function [x, flag, step] = line_search(out, fx, gfx, options)
%%
%%  Armijo along projection arc.
%%
    step = 1;
    x = out.x + step * out.srch;
    flag = -1;
    
    for i = 1 : options.max_func_evals
        x(x < 0) = 0;
        delx = out.x - x;
        fc = fx(x);
        
        if out.obj - fc >= options.sigma * out.grad' * delx
            flag = 1;
            return;
        end
        
        step = step * options.beta;
        x = out.x + step * out.srch;
    end

    x = out.x;
