function out = bbkl(A, b, x0, options)
% BBKL -- Projected BB method for KL
% 
% OUT = BBKL(A, b, x0, OPTIONS)
% 
% 
% (c) 2008 -- Suvrit Sra, Dongmin Kim

% for added efficiency, and to prevent matlab from needless copying..

%% ------------------------------------------------------
out.x = x0;
out.oldx = x0;
out.obj = 0;
out.oldobj =  inf;
out.iter = 0;
out.time = 0;
out.algo = 'BBKL2';
out.obj = inf;
out.objwtime = zeros(1000,1);
out.seconds = 1;
out.start_time = clock;
out.Ax = 0;
out.Atx = 0;
out.status = 'Fail';

%if (size(A,2) ~= size(x0,1))
%  show_error('Dimension mismatch between A and x0, plz. chk', opt.asgui);
%  return;
%end

Ax  = A*x0;
%out.obj = kldiv(b, Ax);
out.Ax=1;
out.oldgrad = gradf(Ax, b);
out.oldgrad = A'*out.oldgrad;
out.Atx=1;

Ag = A * out.oldgrad;
out.Ax = out.Ax + 1;

if (norm(Ag) == 0) out.status='Success'; return; end

% the first iteration
step = (out.oldgrad' * out.oldgrad) / (Ag' * Ag);
%step = step*1e-2;
out.x = out.x -  step * out.oldgrad;
out.x(out.x < 0) = 0;                      % projection

Ax = A*out.x;
out.Ax = out.Ax + 1;

out.grad = gradf(Ax, b);
out.grad = A'*out.grad; % + options.beta*out.x;
out.Atx = out.Atx + 1;

out.iter = 1;
out.oldobj = out.obj;
out.obj = kldiv(b, Ax);
out.objwtime(1) = out.obj;
h = 0;


%%
while 1
  term_reason = check_termination(options, out);
  if (term_reason)
    break;
  end
  show_status(out.iter, options, h);
  out.iter = out.iter + 1;
  
  zx = find(out.x == 0);
  gp = find(out.grad > 0);
  gp = intersect(zx, gp);
  gd = out.grad - out.oldgrad;
  xd = out.x - out.oldx;

  % zero out fixed variables
  gd(gp) = 0;
  xd(gp) = 0;
  
  % an additional termination criterion...hmmm...
  if norm(xd) == 0 || norm(gd) < 1e-8
      term_reason=5;
    break;
  end
  
  % store x & gradient
  out.oldgrad = out.grad;
  out.oldx = out.x;

  % update x & gradient
  if (mod(out.iter, 2) == 0)
      step = (xd' * xd) / (xd' * gd);
  else
      step = (xd'* gd) / (gd'*gd);
  end

  %if (step > 100) step = 100; end
  out.x = out.x -  step * out.grad;
  out.x(out.x < 0) = 0;                      % projection
  out.Ax = out.Ax + 1;
  Ax = A*out.x;
  out.grad = gradf(Ax, b);
  out.grad = A'*out.grad; 
  %grad=gfx(out.x);
  out.Atx = out.Atx + 1;
  
  out.oldobj = out.obj;
  out.obj  = kldiv(b, Ax);

end % of while

%%
out.time = etime(clock, out.start_time);
out.status = 'Success';
out.objwtime = out.objwtime(1:out.seconds);
%if (options.verbose)
%    if (asgui) delete(h); else fprintf('Done\n'); end
%end
switch term_reason
    case 1
        out.term_reason = 'Exceeded time limit';
    case 2
        out.term_reason = '|x_t+1 - x_t| smaller than options.tolx';
    case 3
        out.term_reason = 'Relative change in objvalue small enough';
    case 4
        out.term_reason = 'Maximum number of iterations reached';
    case 5
        out.term_reason = 'norm(delta_x) == 0, or norm(delta_grad) < 1e-8';
    otherwise
        out.term_reason = 'Undefined';
end


%--------------------------------------------------------------------------
% Objective functions and gradients
%
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



% gradient of obj. function
function Ax = gradf(Ax, b)
u = b ./ Ax;
u(isnan(u)) = 1;
idx = find(u == 0);
u(idx) = 1 - Ax(idx);
idx = find(isinf(u));
u(idx) = b(idx) + 1;
Ax = (1 - u);
% At this point, we still need to do A'*Ax to get the gradient
