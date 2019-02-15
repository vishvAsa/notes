classdef Sample
methods(Static = true)
    function sample=sampleWithoutReplacement(inputArray, sampleSize)
        % Input: 1. the vector to sample from. 2. the size of the sample to draw.
        % Output: the sample drawn.
        inputVector = inputArray(:);
        inputVector = inputVector';
        perm = randperm(numel(inputVector));
        sample = inputVector(perm(1:sampleSize));
    end
    
    function sample = binaryRandomVariable()
        sample = rand(1)<=0.5;
    end
    function testClass()
        display 'Class is ok!'
    end

end
end

