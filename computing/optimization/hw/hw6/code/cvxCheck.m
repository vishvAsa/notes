function cvxCheck
    illumdata;
%      equalLampPowers(A);
%      leastSquaresWithSaturation(A);
%      leastSquaresWithRegularization(A);
%      inftyNormApprox(A);
%      exactSolution(A);
    constraintTest
    display 'All done, ready for review!';
%      keyboard;
end

function f_0 = illuminationObjective(A, p)
    f_0 = max(abs(log(A*p)));
end

function equalLampPowers(A)
    [numRows, numParams] = size(A);
    g = [0:0.01:1];
    objFn = @(x)illuminationObjective(A, x*ones(numParams, 1));
    f_0 = VectorFunctions.doElementwise(objFn,g);
    plot(g, f_0);
end

function leastSquaresWithSaturation(A)
%  %  $\min \norm{Ap - 1}$, set values of $p_i >1$ to 1, and values $p_i<0$ to 0.
    [numRows, numParams] = size(A);
    p = A\ones(numRows,1);
    p(find(p>1)) = 1;
    p(find(p<0)) = 0;
    f_0 = illuminationObjective(A, p);
    fprintf(1,'Least squares with saturattion: %d\n',f_0);
end

function leastSquaresWithRegularization(A)
%  $\min \norm{Ap - 1}^{2} + l \norm{p - (1/2)1}^{2}$. We want to find l which satisfies that atleast one i has $p_i \in [0, 0.05]$ or $p_i \in [0.95, 1]$.
    [numRows, numParams] = size(A);
    getRegP = @(l)(A'*A + l*eye(numParams))\(A'*ones(numRows,1) + (l/2)*ones(numParams,1));
    bestL=0;
    for l = [0:0.1:1]
        fprintf(1,'l: %d\n',l);
        p = getRegP(l);
        p'
        if(size(find(p<0.05 & p>=0))>0)
            bestL = l;
            break;
        end
    end
    bestL
    p'
    f_0 = illuminationObjective(A, p);
    fprintf(1,'Least squares with regularization: %d\n',f_0);
end

function inftyNormApprox(A)
%  %  $\min \norm{Ap -1}_\infty : 0 \leq p \leq 1$.
    [numRows, numParams] = size(A);
    cvx_begin
        variable p(numParams);
        minimize norm(A*p - ones(numRows,1), Inf);
        subject to
        p >= 0;
        p <= 1;
    cvx_end
    f_0 = illuminationObjective(A, p);
    fprintf(1,'Constrained Infinity norm approximation: %d\n',f_0);
end

function exactSolution(A)
    [numRows, numParams] = size(A);
    cvx_begin
        variable p(numParams);
        minimize max(max(A*p, inv_pos(A*p)));
        subject to
        p >= 0;
        p <= 1;
    cvx_end
    f_0 = illuminationObjective(A, p);
    fprintf(1,'Exact solution: %d\n',f_0);
end

function constraintTest
    cvx_begin
    %  variable x(2);
    variable x;
    variable y;
    variable z;
    minimize 5
    subject to
    %  norm( [ x + 2*y , x - y ] ) == 0;
    %  [x + 2*y , x - y] == [0, 0]
    %  square_pos( square( x + y ) ) <= x - y
    %  1/x + 1/y <= 1; x >= 0; y >= 0;
    %  inv_pos(x) + inv_pos(y) <=1; x >= 0; y >= 0;
    %  norm([ max( x , 1 ) , max( y , 2 ) ]) <= 3*x + y;
    variable x1;
    variable y2;
    
    max( x , 1 ) - x1 <= 0;
    max( y , 2 ) - y2 <= 0;
    norm([x1, y2]) <= 3*x + y;
    
    %  x*y >= 1; x >= 0; y >= 0;
    %  x >= inv_pos(y); x >= 0; y >= 0;
    %  ( x + y )^2 / sqrt( y ) <= x - y + 5;
    %  x^3 + y^3 <= 1; x>=0; y>=0;
    %  pow_pos(x,3) + pow_pos(y,3) <= 1; x>=0; y>=0;
    %  x+z <= 1+sqrt(x*y-z^2); x>=0; y>=0;
%      A = [x z; z y];
%      x+z - det_rootn(A)<= 1; x>=0; y>=0;
    cvx_end
end