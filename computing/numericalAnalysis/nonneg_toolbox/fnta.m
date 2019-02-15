function out = fnta(X, r, opt)
%
% function out = fnta(X, r, opt)
% Solve 3D nonnegative tensor decomposition.
%
% X -- Input tensor.  'ktensor' for 3D Nonnegative PARAFAC,
%                     'ttensor' for 3D Nonnegative Tucker.
% r -- Rank of the approximation.  r \in R for 3DNPARAFAC,
%                                  r \in R^3 for 3DNTucker,
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
% Version 0.2 (c) 2009  Dongmin Kim 
% 

%% Initialize
    N = ndims(X);
    U = cell(N, 1);
        
    switch opt.decomp
        %% Set up for iterations - initializing U and the fit.
      case 'TUCKER'
        core = tensor(rand(r(1), r(2), r(3)));
        
        for i = 1 : 3
            U{i} = rand(size(X, i), r(i));
        end

        out = ntucker(X, core, U, r, opt);
      otherwise %% PARAFAC
        for i = 1 : 3
            U{i} = rand(size(X, i), r);
        end
        out = nparafac(X, U, r, opt);
    end
    
