%rand('seed',33);  
N = 50;  D = 30;
P  = sprand(N,2,0.5);   Q = sprand(2,D,0.5);
X = P*Q;   B = rand(N,D)<0.3;   X0 = (X+sprand(N,D,0.2)*0.5).*B;


Z = (1-B).*spones(X);
lambda = 0;  MaxIter = 500;  k = 2; 
[Xest0, Y] = SparSVP(X0, k, lambda, MaxIter);
err_svp = norm(Z.*(X-Xest0), 'fro')

lambda = 0.01;  MaxIter = 500;  k = 2; 
[Xest1, Y] = SparSVP(X0, k, lambda, MaxIter);
err_spa1 = norm(Z.*(X-Xest1), 'fro')

lambda = 0.02;  MaxIter = 500;  k = 2; 
[Xest2, Y] = SparSVP(X0, k, lambda, MaxIter);
err_spa2 = norm(Z.*(X-Xest2), 'fro')

lambda = 0.04;  MaxIter = 500;  k = 2; 
[Xest3, Y] = SparSVP(X0, k, lambda, MaxIter);
err_spa3 = norm(Z.*(X-Xest3), 'fro')

lambda = 0.08;  MaxIter = 500;  k = 2; 
[Xest4, Y] = SparSVP(X0, k, lambda, MaxIter);
err_spa4 = norm(Z.*(X-Xest4), 'fro')
