classdef VectorOptimization
methods(Static=true)
function [OptValues, obj1Values, obj2Values] = getOptimalTradeoffs(scalarizedObjFn)
%  Get the pareto optimal points.
    weights = [0:0.02:1];
    numWeights = length(weights);
    obj1Values = zeros(numWeights, 1);
    obj2Values = zeros(numWeights, 1);
    OptValues = {};
    for i = 1:numWeights
        weight = weights(i);
        [OptValues{i}, obj1Values(i), obj2Values(i)] = scalarizedObjFn(weight);
    end
end

function testClass
    display 'Class definition is ok';
end

end
end
