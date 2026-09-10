classdef LatentFactorsPredictors
properties(Static = true)
    svdApprox_useBigMergedNet = 1;
end
methods(Static=true)
    function scoreVector = svdApprox(pheneId, GeneGene, GenePheneTraining, GenePhene, bestParameters)
        [numGenes, numPhenes] = size(GenePheneTraining);
        ScoreMatrix = affiliationRecommendation.SVDLatentFactors.getScoreMatrix(GeneGene, GenePheneTraining, bestParameters.numFactors, bestParameters.l, genePhene.LatentFactorsPredictors.svdApprox_useBigMergedNet);
        scoreVector = ScoreMatrix(:, pheneId);
    end
    
    function [bestParameters] = svdCombinedParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
        GenePheneHuman = GenePheneValidationMatrices{1};
        validationEdgeSet = validationEdgeSets{1};
        stepNumFactors = 10;
        stepL = 0.2;
        numFactorsRange = 100:stepNumFactors:150;
        lRange = 0:stepL:3.0;
        domainSets = {numFactorsRange, lRange};
        mergedNetType = 1;
        scoreGenerator = @(params)genePhene.LatentFactorsPredictors.getScoreMatrix(GeneGene_Hs, GenePhene, GenePheneHuman, params(1), params(2), mergedNetType);
        
        objFn = @(params)-statistics.Ordering.getPerformance(scoreGenerator, GenePheneHuman, validationEdgeSet, params, numPredictionsForValidation);
        
        [objMin, paramsBest] = optimization.DescentMethods.discreteSequentialMinimization(domainSets, objFn);
%       Best in the range 40 to 100.
%          paramsBest = [100; 0.4];
        fprintf(1, 'Best on validation set: numFactors: %d, l: %f\n', paramsBest(1), paramsBest(2));
        bestParameters = struct();
        bestParameters = setfield(bestParameters, 'numFactors', paramsBest(1));
        bestParameters = setfield(bestParameters, 'l', paramsBest(2));
    end
    
    function [bestParameters] = svdApproxParameterLearner(GeneGene, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
%          TODO: learn the best parameters using cross validation.
%          [numFactorsBest, lBest] = affiliationRecommendation.SVDLatentFactors.learnParameters(GeneGene, GenePheneValidationMatrices{1}, validationEdgeSets{1}, genePhene.LatentFactorsPredictors.svdApprox_useBigMergedNet, numPredictionsForValidation);

        stepNumFactors = 10;
        stepL = 0.2;
        numFactorsRange = 10:stepNumFactors:100;
        lRange = 0:stepL:1.0;
        domainSets = {numFactorsRange, lRange};
        [numFactorsBest, lBest] = affiliationRecommendation.SVDLatentFactors.learnParametersSeqMin(GeneGene, GenePheneValidationMatrices{1}, validationEdgeSets{1}, genePhene.LatentFactorsPredictors.svdApprox_useBigMergedNet, domainSets, numPredictionsForValidation);
        bestParameters = struct();
        bestParameters = setfield(bestParameters, 'numFactors', numFactorsBest);
        bestParameters = setfield(bestParameters, 'l', lBest);
    end
    
    function [ScoreMatrix] = svdApproxOtherSpeciesMultiplePhenes(phenes, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
        if isempty(bestParameters)
%          TODO: Fix best parameters.
            bestParameters.numFactors = 70;
            bestParameters.l = 0.2;
        end
        [GeneGeneMatrix] = genePhene.GraphProximityPredictors.getGeneGeneOtherSpecies(GenePhene);
        ScoreMatrix = affiliationRecommendation.SVDLatentFactors.getScoreMatrix(GeneGeneMatrix, GenePheneTraining, bestParameters.numFactors, bestParameters.l, genePhene.LatentFactorsPredictors.svdApprox_useBigMergedNet);
        ScoreMatrix = ScoreMatrix(:, phenes);
    end
    
    function scoreVector = svdApproxOtherSpecies(pheneId, GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters)
        if isempty(bestParameters)
            bestParameters.numFactors = 70;
            bestParameters.l = 0.2;
        end
        [GeneGeneMatrix] = genePhene.GraphProximityPredictors.getGeneGeneOtherSpecies(GenePhene);
        scoreVector = genePhene.LatentFactorsPredictors.svdApprox(pheneId, GeneGeneMatrix, GenePheneTraining, GenePhene, bestParameters);
    end
    
    function scoreVector = svdApproxOtherSpecies2(pheneId, GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters)
        import genePhene.*;
        if isempty(bestParameters)
            bestParameters.numFactors = 70;
            bestParameters.l = 0.2;
        end
        [numGenes, numGenes] = size(GeneGene_Hs);
        GeneGene_Hs = sparse(numGenes, numGenes);
        scoreVector = LatentFactorsPredictors.svdCombined(pheneId, GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters);
    end
    
    function [bestParameters] = svdApproxOtherSpecies2ParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
        import genePhene.*;
        [numGenes, numGenes] = size(GeneGene_Hs);
        GeneGene_Hs = sparse(numGenes, numGenes);
        [bestParameters] = LatentFactorsPredictors.svdCombinedParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    end
    
    function [bestParameters] = svdApproxOtherSpeciesParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidations)
        [GeneGeneMatrix] = genePhene.GraphProximityPredictors.getGeneGeneOtherSpecies(GenePhene);
%          [bestParameters] = genePhene.LatentFactorsPredictors.svdApproxParameterLearner(GeneGeneMatrix, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
        numFactorsBest = 70;
        lBest = 0.2;
        bestParameters = struct();
        bestParameters = setfield(bestParameters, 'numFactors', numFactorsBest);
        bestParameters = setfield(bestParameters, 'l', lBest);
    end

    function MergedNet = makeMergedNet(GeneGene_Hs, GenePhene, GenePheneHuman, l, mergedNetType)
        [numGenes, numPhenes] = size(GenePheneHuman);
        GenePheneOtherSpecies = cell2mat({GenePhene{2:5}});
        numPhenesTotal = size(GenePheneOtherSpecies,2) + numPhenes;
        if mergedNetType == 1
            MergedNet = [l*GeneGene_Hs GenePheneHuman l*GenePheneOtherSpecies; [GenePheneHuman' ;l*GenePheneOtherSpecies'] sparse(numPhenesTotal, numPhenesTotal)];
        end
    end

    function ScoreMatrix = getScoreMatrix(GeneGene_Hs, GenePhene, GenePheneHuman, numFactors, l, mergedNetType)
        [numGenes, numPhenes] = size(GenePheneHuman);
        MergedNet = genePhene.LatentFactorsPredictors.makeMergedNet(GeneGene_Hs, GenePhene, GenePheneHuman, l, mergedNetType);
        currTime = cputime;
        [GeneFactors,S,PheneFactors] = svds(MergedNet, numFactors);
        fprintf(1,'Time elapsed: %d\n', cputime - currTime);
        GeneFactors = GeneFactors * S;
        GeneFactors = GeneFactors(1:numGenes, :);
        PheneFactors = PheneFactors(numGenes+1:numGenes+numPhenes, :);
        ScoreMatrix = GeneFactors*PheneFactors';
    end
    
    function scoreVector = svdCombined(pheneId, GeneGene, GenePheneTraining, GenePhene, bestParameters)
        if isempty(bestParameters)
            bestParameters.numFactors = 100;
            bestParameters.l = 0.4;
        end
        ScoreMatrix = genePhene.LatentFactorsPredictors.getScoreMatrix(GeneGene, GenePhene, GenePheneTraining, bestParameters.numFactors, bestParameters.l, 1);
        scoreVector = ScoreMatrix(:, pheneId);
    end

    function scoreVector = sparseSVPCombined(pheneId, GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters)
        import genePhene.*;
        ScoreMatrix = LatentFactorsPredictors.getScoresSparseSVPCombined(GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters.numFactors, bestParameters.density, bestParameters.l);
        scoreVector = ScoreMatrix(:, pheneId);
    end

    function ScoreMatrix = getScoresSparseSVPCombined(GeneGene_Hs, GenePheneTraining, GenePhene, numFactors, density, l, maxIter)
        import genePhene.*;
        import matrixCompletion.*;
        mergedNetType = 1;
        cutoff = 10^-6;
        if(~exist('maxIter'))
            maxIter = 5;
        end
        [numGenes, numPhenes] = size(GenePheneTraining);
        if(l==0)
            [ScoreMatrix, Y] = MatrixCompletion.sparseSVP(GenePheneTraining, numFactors, density, maxIter, logical(GenePheneTraining), cutoff);
            return;
        end
        
        MergedNet = LatentFactorsPredictors.makeMergedNet(GeneGene_Hs, GenePhene, GenePheneTraining, l, mergedNetType);
        KnownEntries = logical(MergedNet);
        [ScoreMatrix, Y] = MatrixCompletion.sparseSVP(MergedNet, numFactors, density, maxIter, KnownEntries, cutoff);
        ScoreMatrix = ScoreMatrix(1:numGenes, numGenes+1: numGenes+numPhenes);
    end

    function [bestParameters] = sparseSVPHsParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
        import genePhene.*;
        import statistics.*;
        GenePheneHuman = GenePheneValidationMatrices{1};
        validationEdgeSet = validationEdgeSets{1};
        stepNumFactors = 10;
        stepL = 0.2;
        mergedNetType = 1;
        stepDensity = 30;
        maxIter = 1;
        [numGenes, numPhenes] = size(GenePheneHuman);
        
        fprintf('maxIter = %d\n', maxIter);
        
        numFactorsRange = 20:stepNumFactors:120;
        % numFactorsRange = 100; % Temorary
        % lRange = 0:stepL:3.0;
        lRange = 0; % Temorary
        
        % minDensity = MatrixFunctions.getDensity(LatentFactorsPredictors.makeMergedNet(GeneGene_Hs, GenePhene, GenePheneHuman, 1, mergedNetType));
        % maxDensity = min(minDensity*100, .2);
        % densityRange = minDensity * [10:stepDensity:maxDensity/minDensity];
        
        densityRange = (numPredictionsForValidation/(numGenes*numPhenes))*[1:2:10];
        densityRange = 1; % TEMPORARY
        
        domainSets = {numFactorsRange, lRange, densityRange};
        
        scoreGenerator = @(params)LatentFactorsPredictors.getScoresSparseSVPCombined(GeneGene_Hs, GenePheneValidationMatrices{1}, GenePhene, params(1), params(3), params(2), maxIter);
        objFn = @(params)-Ordering.getPerformance(scoreGenerator, GenePheneValidationMatrices{1}, validationEdgeSets{1}, params, numPredictionsForValidation);
        
        scoreGenerator = @(params)LatentFactorsPredictors.getScoresSparseSVPCombined(GeneGene_Hs, GenePheneValidationMatrices{1}, GenePhene, params(1), params(3), params(2), maxIter)';
        objFn = @(params)-Ordering.getAveragePerformance(scoreGenerator, GenePheneValidationMatrices{1}', validationEdgeSets{1}', params, 300);
        
        % [objMin, paramsBest] = optimization.DescentMethods.discreteSequentialMinimization(domainSets, objFn);
        [objMin, paramsBest] = optimization.GlobalOptimization.exhaustiveSearch(domainSets, objFn);
        
        fprintf(1, 'Best on validation set: numFactors: %d, l: %f, density: %f\n', paramsBest(1), paramsBest(2), paramsBest(3));
        bestParameters = struct();
        bestParameters = setfield(bestParameters, 'numFactors', paramsBest(1));
        bestParameters = setfield(bestParameters, 'l', paramsBest(2));
        bestParameters = setfield(bestParameters, 'density', paramsBest(3));
        keyboard
    end
        

    function testClass
        display 'Class definition is ok';
    end
end
end

