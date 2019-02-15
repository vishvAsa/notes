classdef DescentMethods
methods(Static=true)
function [x_iterates, l_iterates] = descentAlg(x_init, searchDirectionFinderFn, stepSizeFinderFn, stoppingCriterionFn, l_init, objFunction)
%      Input:
%          x_init
%          searchDirectionFinderFn
%          setpSizeFinderFn
%          stoppingCriterionFn
%          l_init : initial guess for dual variable.
%      Output:
%          x_iterates.
    x_opt = x_init;
    lPassed = false;
    if(nargin> 4 && ~isempty(l_init))
%          l has been passed.
        l_opt = l_init;
        lPassed = true;
        l_iterates = {l_opt};
    end
    n = numel(x_opt);
    x_iterates = {x_init};
    while(true)
        fprintf('.');
        if lPassed
            [searchDirection searchDirection_l]= searchDirectionFinderFn(x_opt, l_opt);
            stepSize = stepSizeFinderFn(x_opt, searchDirection, l_opt, searchDirection_l);
            l_opt = l_opt + stepSize*searchDirection_l;
            x_opt = x_opt + stepSize*searchDirection;
            [bStop] = stoppingCriterionFn(x_opt, searchDirection, l_opt);
            l_iterates{end + 1} = l_opt;
        else
            [searchDirection]= searchDirectionFinderFn(x_opt);
            stepSize = stepSizeFinderFn(x_opt, searchDirection);
            if(stepSize < 10^-12)
                fprintf('Quitting: small step size: %d ', stepSize);
                break;
            end
            x_opt = x_opt + stepSize*searchDirection;
            [bStop] = stoppingCriterionFn(x_opt, searchDirection);
        end
        x_iterates{end + 1} = x_opt;
        if(nargin > 5 && ~isempty(objFunction))
            fprintf('stepSize: %d obj: %d ', stepSize, objFunction(x_opt));
        end
        if(bStop)
            break;
        end
    end
    fprintf('\n');
end

function [x_opt, x_iterates] = steepestDescentHessian(x_init, objFn, gradientFn, hessianFn, stepSizeFinderFn, cutoff)
%  The newton method
    if(isempty(cutoff))
        cutoff = 10^-5;
    end
    searchDirectionFinderFn = @(x)optimization.DescentMethods.searchDirection_2ndOrderApproxMin(x, gradientFn, hessianFn);
    stoppingCriterionFn = @(x, searchDirection)optimization.DescentMethods.stoppingCriterionNewton(x, searchDirection, cutoff, gradientFn);
    [x_opt, x_iterates] = optimization.DescentMethods.descentAlg(x_init, searchDirectionFinderFn, stepSizeFinderFn, stoppingCriterionFn);
end

function [x_opt, x_iterates] = gradientDescent(x_init, objFn, gradientFn, stepSizeFinderFn, cutoff)
    searchDirectionFinderFn = @(x)(-gradientFn(x));
    stoppingCriterionFn = @(x, searchDirection)(norm(gradientFn(x)) < cutoff);
    [x_opt, x_iterates] = optimization.DescentMethods.descentAlg(x_init, searchDirectionFinderFn, stepSizeFinderFn, stoppingCriterionFn);
    
end

function searchDirection = searchDirection_2ndOrderApproxMin(x, gradientFn, hessianFn)
%      Finds the search direction used in the newton method
    searchDirection = - hessianFn(x)\gradientFn(x);
end

function [searchDirection searchDirection_l] = searchDirection_2ndOrderApproxMinEq(x, l, gradientFn, hessianFn, A, b)
%      Finds the search direction used in the newton method for equality constrained (Ax = b) convex optimization problems.
%      Also works with infeasible x.
    [m, n] = size(A);
    M = [hessianFn(x) A'; A zeros(m, m)];
    b = [-gradientFn(x); A*x-b];
    searchDirection_with_l = M\b;
    searchDirection = searchDirection_with_l(1:n);
    searchDirection_l = searchDirection_with_l(n+1:end);
end

function [searchDirection searchDirection_l] = searchDirection_2ndOrderApproxMinEq_invH(x, l, gradientFn, invHessianFn, A, b)
%      Finds the search direction used in the newton method for equality constrained (Ax = b) convex optimization problems. Special for easy to invert hessians.
%      Also works with infeasible x.
    [m, n] = size(A);
%      Solve [H A; A' 0] [searchDir; w] = [-gradientFn(x); 0]
    invH = invHessianFn(x);
    gradient = gradientFn(x);
    searchDirection_l = A*invH*A'\(A*x-b -A*invH*gradient);
    searchDirection = -invH*(gradient + A' * searchDirection_l);
end


function bStop = stoppingCriterionNewton(x, searchDirection, cutoff, gradientFn)
    newtonDecrement = sqrt(-trace(gradientFn(x)'*searchDirection));
    bStop = (abs(newtonDecrement) < cutoff);
end

function bStop = stoppingCriterionNewtonInf(x, lagrangeMultiplier, searchDirection, cutoff, gradientFn)
    residualFn = @(x, lagrangeMultiplier)[gradientFn(x) + A'*lagrangeMultiplier; A*x - b];
    bStop = (norm(residualFn(x, lagrangeMultiplier)) < cutoff);
end

function [x_opt, x_iterates] = steepestDescentHessianEq(x_init, objFn, gradientFn, searchDirectionFinderFn, stepSizeFinderFn, cutoff)
%  The newton method for equality constrained (Ax = b) convex optimization problems.
    stoppingCriterionFn = @(x, searchDirection)optimization.DescentMethods.stoppingCriterionNewton(x, searchDirection, cutoff, gradientFn);
    [x_opt, x_iterates] = optimization.DescentMethods.descentAlg(x_init, searchDirectionFinderFn, stepSizeFinderFn, stoppingCriterionFn);
end

function [x_opt, x_iterates] = steepestDescentHessianEqInf(x_init, l_init, objFn, gradientFn, searchDirectionFinderFn, stepSizeFinderFn, cutoff)
%  The newton method for equality constrained (Ax = b) convex optimization problems.
%      Also works with infeasible x.
    stoppingCriterionFnInf = @(x, searchDirection, l)optimization.DescentMethods.stoppingCriterionNewtonInf(x, l, searchDirection, cutoff, gradientFn);
    [x_opt, x_iterates] = optimization.DescentMethods.descentAlg(x_init, searchDirectionFinderFn, stepSizeFinderFn, stoppingCriterionFnInf, l_init);
end

function [primalValues, dualValues] = barrierSolver(wtInit, wtBoostFactor, primalValueInit, dualValueInit, centeringProblemSolver, stoppingCriterion)
    if(isempty(wtBoostFactor))
        wtBoostFactor = 30;
    end
    if(isempty(wtInit))
        wtInit = 1;
    end
    primalValues = {primalValueInit};
    dualValues = {dualValueInit};
    wt = wtInit;
    bStop = false;
    while(~bStop)
        [primalValuesNew, dualValuesNew] = centeringProblemSolver(wt, primalValues{end});
        numIterates = length(primalValuesNew);
        primalValues = [primalValues primalValuesNew];
        dualValues = [dualValues dualValuesNew];
        wt = wt*wtBoostFactor;
        bStop = stoppingCriterion(primalValues{end}, dualValues{end}, wt);
    end
end

function [x, objVal, numIterations] = descentGeneric(objFn, x_init, stoppingThreshold, maxNumIterations)
    objValPrev = +Inf;
    numIterations = 0;
    x = x_init;
    while(numIterations < maxNumIterations)
        numIterations = numIterations + 1;
        [x, objVal] = objFn(x);
        if(objValPrev - objVal <= stoppingThreshold)
            if(objValPrev < objVal)
                warning(' Check code! Previous Objective: %d\n', objValPrev);
                % keyboard
            end
            break;
        end
        objValPrev = objVal;
    end
end

function figureHandle = plotError(objOpt, x_iterates, objFn)
    figureHandle = figure();
    numIterations = length(x_iterates);
    iterations = 1:numIterations;
    y = [];
    for iteration = iterations
        y(iteration, 1) = objFn(x_iterates{iteration});
    end
    y = abs(objOpt*ones(numIterations, 1)-y);
    figureHandle = semilogy(iterations, y);
    ylabel('log(|f_0(x) - p*|)');
    xlabel('iteration');
%      keyboard
end

function [objMin, xBest, otherReturnValsBest] = discreteSequentialMinimizationScalar(domain, objFn, bOtherReturnVals)
%  Does discrete minimization. Sequential search for the minimum. Assumes discrete quasiconvexity of objFn.
otherReturnValsBest = [];
otherReturnVals = [];

xBest = domain(1);
if(bOtherReturnVals)
    [objMin, otherReturnValsBest] = objFn(xBest);
else
    [objMin] = objFn(xBest);
end
fprintf(1, 'discreteSequentialMinimizationScalar: parameter: %d, obj: %d \n', xBest, objMin);

objOld = objMin;
for x = domain(2:end)
    if(bOtherReturnVals)
        [obj, otherReturnVals] = objFn(x);
    else
        [obj] = objFn(x);
    end
    
    fprintf(1, ' parameter: %d, obj: %d \n', x, obj);
    if(obj > objOld)
        display(' Searched parameter long enough!')
        break;
    end
    if(objMin > obj)
        objMin = obj;
        xBest = x;
        otherReturnValsBest = otherReturnVals;
    end
    objOld = obj;
end

if(xBest == domain(1) || xBest == domain(end))
    fprintf(' ALERT: The best parameter found at the boundary of the domain!, xBest: %d domain(1): %d domain(end): %d\n', xBest, domain(1), domain(end));
end

end

function [objMin, xBest] = discreteSequentialMinimization(domainSets, objFn)
    import optimization.*;
    scalarFnMinimizer = @(domainSet, objFn, bOtherReturnVals) DescentMethods.discreteSequentialMinimizationScalar(domainSet, objFn, bOtherReturnVals);
    [objMin, xBest] = DescentMethods.discreteHierarchicalMinimization(domainSets, objFn, scalarFnMinimizer);
end

function [objMin, xBest] = discreteHierarchicalMinimization(domainSets, objFn, scalarFnMinimizer)
%  INPUT: domainSets: a linear cell array of Domains, each of which is a vector of possible values the corresponding parameter can take.
%       objFn: The objective function, parametrized by a vector.
%  OUTPUT: 
%       objMIn: min_x objFn(x) for x in domainSets.
%       xBest: argmin_x objFn(x) for x in domainSets.
%  Does discrete minimization. Sequential search for the minimum. Assumes discrete quasiconvexity of objFn. Also see discreteScalarSequentialMinimization.
    import optimization.*;
    import functionals.*;
    numVars = length(domainSets);
    if(numVars == 1)
        [objMin, xBest] = scalarFnMinimizer(domainSets{1}, objFn, false);
        return;
    end
    
    cellLengths = cellfun(@length, domainSets);
    
    unfixedVariables = find(cellLengths > 1, 1, 'first');
    numUnfixedVariables = numel(unfixedVariables);
    if(numUnfixedVariables == 0)
        xBest= cell2mat(domainSets)';
        objMin = objFn(xBest);
        return;
    end
    
    unfixedVariable = unfixedVariables(1);
    fprintf('Exploring parameter %d\n', unfixedVariable);
    objFnNew = @(value)DescentMethods.discreteHierarchicalMinimization(Functionals.fixVariableInDomainSets(domainSets, unfixedVariable, value), objFn, scalarFnMinimizer);
    
    
    [objMin, xBest, xBestOtherVars] = scalarFnMinimizer(domainSets{unfixedVariable}, objFnNew, true);
    xBest = xBestOtherVars;
end

function testDiscreteSequentialMinimization()
    objFn = @(x)sum(x);
    domainSets = {[6; (2:5)'], [2; -1; 5], [3;6]};
    [objMin, xBest] = optimization.DescentMethods.discreteSequentialMinimization(domainSets, objFn)
end

function testClass
    display 'Class definition is ok';
end


end
end
