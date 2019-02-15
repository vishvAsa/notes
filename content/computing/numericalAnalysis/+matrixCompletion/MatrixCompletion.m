classdef MatrixCompletion
properties(Static = true)
end
methods(Static = true)
function [X, Y] = sparseSVP(X0, numFactors, density, MaxIter, KnownItems, cutoff)
    XObserved = X0(KnownItems);
    X = X0;
    for iteration = 1:MaxIter 
        %-  X-->Y
        [U S V] = svds(sparse(X), numFactors);
        Y = U*S*V';
    
        %-  Y-->X
        X = Y;
        X = MatrixTransformer.sparsify(X, density);
        
        X(KnownItems) = XObserved;
        if i>1 && norm(X-X_old,'fro')<cutoff
            break;
        end
        X_old = X;
    end
end

end
end