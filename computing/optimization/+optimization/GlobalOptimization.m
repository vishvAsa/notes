classdef GlobalOptimization

methods(Static=true)
function [objMin, xBest, otherReturnValsBest] = exhaustiveSearchScalarFn(domain, objFn, bOtherReturnVals)
    % For documentation, see DescentMethods.
    objMin = +Inf;
    if(~exist('bOtherReturnVals'))
        bOtherReturnVals = false;
    end
    otherReturnValsBest = [];
    otherReturnVals = [];
    for i=1:numel(domain)
        x = domain(i);
        
        % evaluate objFn(x)
        if(bOtherReturnVals)
            [objVal otherReturnVals] = objFn(x);
        else
            objVal = objFn(x);
        end
        
        fprintf(' x: %d, objVal: %d\n', x, objVal);
        % Perhaps identify as the best.
        if(objVal < objMin)
            objMin = objVal;
            xBest = x;
            otherReturnValsBest = otherReturnVals;
        end
    end
    fprintf('xBest: %d\n', xBest);
end

function [objMin, xBest] = exhaustiveSearch(domainSets, objFn)
    import optimization.*;
    scalarFnMinimizer = @(domainSet, objFn, bOtherReturnVals) GlobalOptimization.exhaustiveSearchScalarFn(domainSet, objFn, bOtherReturnVals);
    [objMin, xBest] = DescentMethods.discreteHierarchicalMinimization(domainSets, objFn, scalarFnMinimizer);
end

function x_best = binarySearch(x_min, x_max, objFn, val_tgt, minGap)
    %  Purpose:
    %      Try to find x_best such that val_tgt = objFn(x_best).
    %       It is assumed that objFn is monotonic in x.
    %  Input:
    %      x_min, x_max: Interval to search for x_best.
    %      objFn: The function described above.
    %      val_tgt, minGap: Termination conditions. The algorithm stops trying to find x_best when x_max - x_min < minGap.
    assert(x_min<=x_max, 'Error in interval specified.');
    if(~exist('minGap'))
        minGap = 10^-4;
    end
    
    val_min = objFn(x_min);
    val_max = objFn(x_max);
    fprintf('binarySearch: x_min = %d, x_max = %d, val_min = %d, val_max = %d\n', x_min, x_max, val_min, val_max);
    
    if(val_tgt <= val_min)
        x_best = x_min;
        fprintf(' Could not find x_best in the range: x_min too big. Giving up.\n');
        return;
    end
    
    if(val_max <= val_tgt)
        x_best = x_max;
        fprintf(' Could not find x_best in the range: x_max too small. Giving up.\n');
        return;
    end
    
    while(x_max - x_min >= minGap)
        x = (x_min + x_max)/2;
        val = objFn(x);
        fprintf('x: %d, val: %d\n', x, val);
        
        if(val == val_tgt)
            x_best = x;
            fprintf(' Found x_best!\n');
            return;
        end
        
        if(val < val_tgt)
            x_min = x;
        else
            x_max = x;
        end
    end
    fprintf(' Could not find x_best. Giving up.\n');
    x_best = (x_min + x_max)/2;
end

function testBinarySearch
    import optimization.*;
    x_min = 0;
    x_max = 4;
    objFn = @(x)x^2;
    val_tgt = 2;
    x_best = GlobalOptimization.binarySearch(x_min, x_max, objFn, val_tgt);
    fprintf('x_best: %d, expected: %d\n', x_best, sqrt(2));
end

function testClass
    display 'Class definition is ok';
end


end
end
