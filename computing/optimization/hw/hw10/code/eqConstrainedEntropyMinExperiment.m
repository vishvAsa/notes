function eqConstrainedEntropyMinimization()
    [A, b, x_init, l_init] = getData();
    [m, n] = size(A);
    secantScaler = 0.01;
    shrinkageFactor = 0.5;
    cutoff = 10^-5;
    LOG_PATH = '/v/filer4b/v20q001/vvasuki/vishvas/work/optimization/hw/hw10/code/';
    
    objFnHandle = @objFn;
    gradientFnHandle = @gradientFn;
    hessianFnHandle = @hessianFn;
    invHessianFnHandle = @invHessianFn;

%      Find the search direction without taking advantage of structure in H.
    searchDirectionFinderFn = @(x)optimization.DescentMethods.searchDirection_2ndOrderApproxMinEq(x, gradientFnHandle, invHessianFnHandle, A, b);
    domainMembershipFnHandle = @domainMembershipFn;
    
%      Find the search direction WHILE taking advantage of structure in H.
    searchDirectionFinderFnSmart = @(x)optimization.DescentMethods.searchDirection_2ndOrderApproxMinEq_invH(x, 0, gradientFnHandle, invHessianFnHandle, A, b);
    
    stepSizeFinderFnHandle = @(x, searchDirection) optimization.LineSearch.backtrackingSearchWrapper(x, searchDirection, objFnHandle, gradientFnHandle, secantScaler, shrinkageFactor, domainMembershipFnHandle);
    
    
    [x_opt, x_iterates] = optimization.DescentMethods.steepestDescentHessianEq(x_init, objFnHandle, gradientFnHandle, searchDirectionFinderFnSmart, stepSizeFinderFnHandle, cutoff);
    fprintf(1, 'f_0(x_opt): %d \n', objFn(x_opt));
    
%      fig = optimization.DescentMethods.plotError(x_opt, x_iterates, objFnHandle);
%      saveas(fig, [LOG_PATH 'residualNewtonEq.jpg']);
%      close all;
    
    searchDirectionFinderFnSmart = @(x, l)optimization.DescentMethods.searchDirection_2ndOrderApproxMinEq_invH(x, l, gradientFnHandle, invHessianFnHandle, A, b);
    
    stepSizeFinderFnHandle = @(x, searchDirection, lagrangeMultiplier, lagrangeMultiplierSearchDirection) optimization.LineSearch.backtrackingSearchWrapperEq(x, lagrangeMultiplier, searchDirection, lagrangeMultiplierSearchDirection, gradientFnHandle, secantScaler, shrinkageFactor, domainMembershipFnHandle, A, b);
%      
    [x_opt, x_iterates] = optimization.DescentMethods.steepestDescentHessianEqInf(x_init, zeros(m, 1), objFnHandle, gradientFnHandle, searchDirectionFinderFnSmart, stepSizeFinderFnHandle, cutoff);
    fprintf(1, 'f_0(x_opt): %d \n', objFn(x_opt));
    
    
    display 'svAgataM! Ready for inspection!';
    keyboard
end

function [A, b, x_init, l_init] = getData()
    n=100; p=30;
    rand('state',0);
    randn('state',0);
    A = randn(p,n);
    x_init = rand(n,1);
    b = A * x_init;
    l_init = zeros(p, 1);
end

function objValue = objFn(x)
%      Want to define x_i log x_i = 0
    y = log(x);
    y(y == -Inf) = 0;
    objValue = sum(diag(x)*y);
end

function gradient = gradientFn(x)
    n = length(x);
    gradient = log(x) + ones(n, 1);
end

function Hessian = hessianFn(x)
    Hessian = diag(1./x);
end

function Hessian = invHessianFn(x)
    Hessian = diag(x);
end


function bInDomain = domainMembershipFn(x)
    bInDomain = all(x>0);
end
