function out = solnls(A, b, x0, opt)
%
% function out = solnls(A, b, x0, opt)
% Solve a nonnegative least squares problem,
% min ||Ax - b||_2, s.t. x \ge 0
%
% x0 -- Starting vector (useful for warm-starts).
%
% OPT -- This structure contains important opt that control how the
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
    switch opt.algo
      case 'PQN'
        out = pqn(A, b, x0, opt);
      case 'PLB'
        out = plb(A, b, x0, opt);
      otherwise
        out = bbgp(A, b, x0, opt);
    end
    
