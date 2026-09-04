function [X, Y] = sparseSVP(X0, k, lambda, MaxIter)
    eps = 1e-6;
    KnownItems = find(abs(X0)>0);  Xobs = X0(KnownItems);
    X = X0; it = 0;  converge = 0;
    while it < MaxIter & ~converge
        
        it = it + 1;
        %-  X-->Y
        [U S V] = svds(sparse(X), k);
        Y = U*S*V';
    
        %-  Y-->X
        X_old = X;
        absY = abs(Y)-lambda/2; absY(find(absY<0))=0;  X = Y;
        if lambda>0;  X = absY.*sign(Y); end;
        
        X(KnownItems) = Xobs;
        if norm(X-X_old,'fro')<eps; converge = 1; end
    end
end
