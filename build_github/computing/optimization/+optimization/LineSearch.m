classdef LineSearch
methods(Static=true)
function stepSize = backtrackingSearch(objFnSlice, gradient, searchDirection, secantScaler, shrinkageFactor, domainMembershipFnSlice, changeFnNonDifferentiablePart)
%      Input:
%          objFnSlice: Function handle. objFnSlice(stepSize) = f_0(x + stepSize \change x), where f_0 is the objective of the optimization problem, \change x is the search direction.
%          gradient: \gradient f_0(x), a vector.
%          searchDirection: a vector.
%          secantScaler: used to specify the secant used in the stopping criterion.
%          shrinkageFactor: used to shrink stepSize repeatedly until stopping criterion is satisfied.
%          domainMembershipFnSlice: function handle. Checks if, for a given stepSize, x + stepSize \change x \in dom(f_0).
%      Output: stepSize, a scalar.
    % Process input.
    if(isempty(secantScaler))
        secantScaler = 0.01;
    end
    
    if(isempty(shrinkageFactor))
        % If this is too high (like .99), this step size finding can take a *very* long time.
        shrinkageFactor = 0.5;
    end
    if(~isa(domainMembershipFnSlice, 'function_handle'))
        domainMembershipFnSlice = @(stepSize)true;
    end
    
    searchDirectionMagnitude = max(abs(searchDirection(:)));
    stepSize = 2;
    if(~isa(changeFnNonDifferentiablePart, 'function_handle'))
        changeFnNonDifferentiablePart = @(stepSize)0;
    end
    while(true)
        is_tInDomain = domainMembershipFnSlice(stepSize);
        % fprintf('Took: %d to %d\n',objFnSlice(0), objFnSlice(stepSize));
        if(is_tInDomain && objFnSlice(stepSize) <= (objFnSlice(0) + secantScaler*(stepSize*gradient(:)'*searchDirection(:) + changeFnNonDifferentiablePart(stepSize))))
            % fprintf('Found step size: %d %d\n',stepSize, trace(gradient'*searchDirection));
            break;
        end
        stepSize = shrinkageFactor*stepSize;
        if(searchDirectionMagnitude * stepSize < exp(-16))
            fprintf(' Step size too small, returning 0\n');
            stepSize = 0;
            return;
        end
    end
end

function stepSize = backtrackingSearchEq(x, lagrangeMultiplier, gradientFn, searchDirection, lagrangeMultiplierSearchDirection, secantScaler, shrinkageFactor, domainMembershipFnSlice, A, b)
%    Backtracking search for equality constrained optimization problems with infeasible start.
    if(isempty(secantScaler))
        secantScaler = 0.01;
    end
    
    if(isempty(shrinkageFactor))
        shrinkageFactor = 0.5;
    end
    
    stepSize = 1;
    residualFn = @(x, lagrangeMultiplier)[gradientFn(x) + A'*lagrangeMultiplier; A*x - b];
    while(true)
        is_tInDomain = domainMembershipFnSlice(stepSize);
        if(is_tInDomain && residualFn(x + shrinkageFactor*searchDirection, lagrangeMultiplier + shrinkageFactor*lagrangeMultiplierSearchDirection) < (1 - secantScaler*t) * residualFn(x, lagrangeMultiplier))
            break;
        end
        stepSize = shrinkageFactor*stepSize;
    end
end


function stepSize = backtrackingSearchWrapper(x, searchDirection, objFn, gradientFn, secantScaler, shrinkageFactor, domainMembershipFn, changeFnNonDifferentiablePart)
    objFnSlice = @(stepSize)objFn(x + stepSize*searchDirection);
    gradient = gradientFn(x);
    domainMembershipFnSlice = @(stepSize)domainMembershipFn(x + stepSize*searchDirection);
    stepSize = optimization.LineSearch.backtrackingSearch(objFnSlice, gradient, searchDirection, secantScaler, shrinkageFactor, domainMembershipFnSlice, changeFnNonDifferentiablePart);
end

function stepSize = backtrackingSearchWrapperEq(x, lagrangeMultiplier, searchDirection, lagrangeMultiplierSearchDirection, gradientFn, secantScaler, shrinkageFactor, domainMembershipFn)
    domainMembershipFnSlice = @(stepSize)domainMembershipFn(x + stepSize*searchDirection);
    stepSize = optimization.LineSearch.backtrackingSearchEq(x, lagrangeMultiplier, gradientFn, searchDirection, lagrangeMultiplierSearchDirection, secantScaler, shrinkageFactor, domainMembershipFnSlice);
end

function testClass
    display 'Class definition is ok';
end

end
end