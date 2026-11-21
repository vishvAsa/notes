function newtonMethodExperiment()
    [secantScaler, shrinkageFactor, A] = getData();
    [m, n] = size(A);
    cutoffNewton = 10^-1;
    cutoffGradientDescent = 10^-1;
    
    objFnHandle = @(x)objFn(x, A);
    gradientFnHandle = @(x)gradientFn(x, A);
    hessianFnHandle = @(x)hessianFn(x, A);
    domainMembershipFnHandle = @(x)domainMembershipFn(x, A);
    stepSizeFinderFnHandle = @(x, searchDirection) optimization.LineSearch.backtrackingSearchWrapper(x, searchDirection, objFnHandle, gradientFnHandle, secantScaler, shrinkageFactor, domainMembershipFnHandle);
    
    x_init = zeros(n,1);
    x_init(1) = 0.0001;
    
    [x_opt, x_iterates] = optimization.DescentMethods.steepestDescentHessian(x_init, objFnHandle, gradientFnHandle, hessianFnHandle, stepSizeFinderFnHandle, cutoffNewton);
    
    fig = optimization.DescentMethods.plotError(x_opt, x_iterates, objFnHandle);
    saveas(fig, '/v/filer4b/v20q001/vvasuki/vishvas/work/optimization/hw/hw9/code/residualNewton.jpg');
    close all;
    
%      [x_opt, x_iterates] = optimization.DescentMethods.gradientDescent(x_init, objFnHandle, gradientFnHandle, stepSizeFinderFnHandle, cutoffGradientDescent);
%      fig = optimization.DescentMethods.plotError(x_opt, x_iterates, objFnHandle);
%      saveas(fig, '/v/filer4b/v20q001/vvasuki/vishvas/work/optimization/hw/hw9/code/residualGradientDescent.jpg');
%      close all;
    
    
    
    
end

function [secantScaler, shrinkageFactor, A] = getData()
    n = 100;
    m = 200;
    secantScaler = 0.01;
    shrinkageFactor = 0.5;
    randn('state',1);
    A = randn(m,n);
end

function value = fn1_Ax(x, A)
    [m, n] = size(A);
    value = ones(m, 1) - A*x;
end

function value = fn1_xx(x)
    n = numel(x);
    value = ones(n, 1) - x.^2;
end

function objValue = objFn(x, A)
    objValue = -sum(log(fn1_Ax(x, A))) - sum(log(fn1_xx(x)));
end


function gradient = gradientFn(x, A)
    v1 = fn1_Ax(x, A);
    v2 = fn1_xx(x);
    gradient = A'*(v1.^-1) + 2*diag(x)*(v2.^-1);
end

function Hessian = hessianFn(x, A)
    [m, n] = size(A);
    v1 = fn1_Ax(x, A);
    v2 = fn1_xx(x);
    D1 = diag(v1.^-2);
%      keyboard
    D2 = diag(2*diag(x.^2)*(v2.^-2) + (v2.^-1));
    Hessian = A'*D1*A + 2*D2;
end

function bInDomain = domainMembershipFn(x, A)
    bInDomain = all(A*x < 1) &&  all(abs(x)<1);
end
