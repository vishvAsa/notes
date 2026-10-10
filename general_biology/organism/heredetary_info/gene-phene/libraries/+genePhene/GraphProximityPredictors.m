classdef GraphProximityPredictors
methods(Static=true)
function scoreVector = precomputedSimilarityMatrix(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
    scoreVector = bestParameters.ScoreMatrix*GenePheneTraining(:, pheneId);
end

function scoreVector = precomputedSimilarityMatrixLowEv(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
    OPTS.issym = true;
    OPTS.isreal = true;
    OPTS.disp = 0;
    numFactors = 100;
    Laplacian = diag(sum(bestParameters.ScoreMatrix)) - bestParameters.ScoreMatrix;
    [LowEv, S] = eigs(Laplacian, numFactors, 'SM', OPTS);
    weights = LowEv\GenePheneTraining(:, pheneId);
    scoreVector = LowEv*weights;
end

function scoreVector = katz(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
    if(isfield(bestParameters, 'numIterations') == false)
        bestParameters = setfield(bestParameters, 'numIterations', 2);
        bestParameters = setfield(bestParameters, 'beta', 10^(-6));
    end
    
    [numGenes, numPhenes] = size(GenePheneTraining);
    FoldedGenePhene = GenePheneTraining*GenePheneTraining';
    ScoreMatrix = KatzAff.getKatzMatrix(FoldedGenePhene, GenePheneTraining, bestParameters.numIterations, bestParameters.beta);
    scoreVector = ScoreMatrix(:, pheneId);
end

function [GeneGeneMatrix] = getGeneGeneOtherSpecies(GenePhene)
    [numGenes, numPhenes] = size(GenePhene{1});
    numSpecies = length(GenePhene);
    GeneGeneMatrix = sparse(numGenes, numGenes);
    for species = 2:numSpecies
        GeneGeneMatrix = GeneGeneMatrix + GenePhene{species}*GenePhene{species}';
    end
end

function bestParameters = katzSmoothenedOtherSpeciesParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
    import genePhene.*;
    import optimization.*;
    bestParametersOtherSpecies = GraphProximityPredictors.katzOtherSpeciesParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    bestParametersGeneGeneHs = GraphProximityPredictors.katzHumanGeneInteractionsParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    bestParameters.ScoreMatrix = bestParametersGeneGeneHs.ScoreMatrix*bestParametersOtherSpecies.ScoreMatrix;
end

function bestParameters = katzSmoothenedGeneSimilarityParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
    import genePhene.*;
    import optimization.*;
    bestParametersOtherSpecies = GraphProximityPredictors.katzOtherSpeciesParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    bestParametersGeneGeneHs = GraphProximityPredictors.katzHumanGeneInteractionsParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    bestParameters.ScoreMatrix = bestParametersOtherSpecies.ScoreMatrix*bestParametersGeneGeneHs.ScoreMatrix;
end

function bestParameters = katzOtherSpeciesParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
    import genePhene.*;
    import optimization.*;
    bestParameters = GraphProximityPredictors.getPowers(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, 'GenePhenePowers', []);
    bestParameters = setfield(bestParameters, 'numIterations', 4);
    bestParameters = setfield(bestParameters, 'beta', 10^(-6));
    % These have been verified to be the best parameters.
    
    learnBestBeta = false;
    if(learnBestBeta)
        scoreGenerator = @(params)linkPrediction.Katz.getKatzMatrixFromPowers(bestParameters.GenePhenePowers{1}, 10^params(1), bestParameters.numIterations)*GenePheneValidationMatrices{1};
        objFn = @(params)-statistics.Ordering.getPerformance(scoreGenerator, GenePheneValidationMatrices{1}, validationEdgeSets{1}, params, numPredictionsForValidation);
    
        Domain_betaPow = -10:1:-0.5;
        domains = {Domain_betaPow};
    
        [objMin, paramsBest] = DescentMethods.discreteSequentialMinimization(domains, objFn);
        bestParameters.beta = 10^paramsBest(1);
    end

    bestParameters.ScoreMatrix = linkPrediction.Katz.getKatzMatrixFromPowers(bestParameters.GenePhenePowers{1}, bestParameters.beta, bestParameters.numIterations);

end

function bestParameters = katzJointParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
    import genePhene.*;
    import optimization.*;
    [numGenes numPhenes] = size(GenePheneValidationMatrices{1});
    bestParameters = GraphProximityPredictors.getPowers(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, 'GenePhenePowers', []);
    bestParameters = GraphProximityPredictors.getPowers(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, 'GeneGeneHsPowers', bestParameters);
    
    bestParameters = setfield(bestParameters, 'l', .8);
    bestParameters = setfield(bestParameters, 'beta', 10^(-6));
    % These have been verified to be the best parameters.
    
    learnBestBeta = true;
    if(learnBestBeta)
        scoreGenerator = @(params)GraphProximityPredictors.getJoint4KatzScoreMatrixFromPowers(bestParameters.GenePhenePowers{1}, bestParameters.GeneGeneHsPowers{1}, GenePheneValidationMatrices{1}, params(2), params(3), 10^params(1)) * GenePheneValidationMatrices{1};
        
        objFn = @(params)-statistics.Ordering.getPerformance(scoreGenerator, GenePheneValidationMatrices{1}, validationEdgeSets{1}, params, numPredictionsForValidation);
    
        Domain_betaPow = -2:0.5:-0.5;
        Domain_l = 0.1:0.1:3;
        domains = {Domain_betaPow, Domain_l, Domain_l};
    
        % [objMin, paramsBest] = DescentMethods.discreteSequentialMinimization(domains, objFn);
        [objMin, paramsBest] = GlobalOptimization.exhaustiveSearch(domains, objFn);
        
        bestParameters.beta = 10^paramsBest(1);
        bestParameters.l_G = paramsBest(2);
        bestParameters.l_P = paramsBest(3);
        fprintf(' katzParameterLearner...Best params: %d\n', paramsBest);
    end
    
    bestParameters.ScoreMatrix = GraphProximityPredictors.getJoint4KatzScoreMatrixFromPowers(bestParameters.GenePhenePowers{1}, bestParameters.GeneGeneHsPowers{1}, GenePheneValidationMatrices{1} + reshape(validationEdgeSets{1}, numGenes, numPhenes), bestParameters.l_G, bestParameters.l_P, bestParameters.beta);
end

function scoreVector = commonNeighbors(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
    if(isfield(bestParameters, 'numIterations') == false)
        bestParameters = setfield(bestParameters, 'numIterations', 1);
        bestParameters = setfield(bestParameters, 'beta', 10^(-6));
    end
    scoreVector = genePhene.Predictors.katz(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters);
end

function bestParameters = getPowers(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, similarityMatrixType, bestParameters)
    iterations = 5;
%          [GeneGeneMatrix] = genePhene.Predictors.getGeneGeneOtherSpecies(GenePhene);
%          [GenePhenePowers] = linkPrediction.Katz.getPowers(GeneGeneMatrix, iterations);
%          [GeneGeneHsPowers] = linkPrediction.Katz.getPowers(GeneGene_Hs, iterations);
%          save(genePhene.Constants.GENE_PHENE_POWERS, 'GenePhenePowers', 'GeneGeneHsPowers', '-v7.3');
    loadedData = load(genePhene.Constants.GENE_PHENE_POWERS, similarityMatrixType);
    if(~exist('bestParameters') || isempty(bestParameters))
        bestParameters = struct();
    end
    bestParameters = setfield(bestParameters, similarityMatrixType, {getfield(loadedData, similarityMatrixType)});
    
end

function bestParameters = katzHumanGeneInteractionsParameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation)
    import genePhene.*;
    bestParameters = genePhene.GraphProximityPredictors.getPowers(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, 'GeneGeneHsPowers', []);
    bestParameters = setfield(bestParameters, 'numIterations', 4);
    bestParameters = setfield(bestParameters, 'beta', 10^(-6));
    % This has been verified to be the best beta from validation.
    
    bLearnBestBeta = false;
    if(bLearnBestBeta)
        scoreGenerator = @(params)linkPrediction.Katz.getKatzMatrixFromPowers(bestParameters.GeneGeneHsPowers{1}, 10^params(1), bestParameters.numIterations)*GenePheneValidationMatrices{1};
        objFn = @(params)-statistics.Ordering.getPerformance(scoreGenerator, GenePheneValidationMatrices{1}, validationEdgeSets{1}, params, numPredictionsForValidation);
    
        Domain_betaPow = -10:1:-0.5;
        domains = {Domain_betaPow};
    
        [objMin, paramsBest] = DescentMethods.discreteSequentialMinimization(domains, objFn);
        bestParameters.beta = 10^paramsBest(1);
    end

    bestParameters.ScoreMatrix = linkPrediction.Katz.getKatzMatrixFromPowers(bestParameters.GeneGeneHsPowers{1}, bestParameters.beta, bestParameters.numIterations);
end

function scoreVector = katzRandomCheck(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
    [numGenes, numPhenes] = size(GenePheneTraining);
    if(isfield(bestParameters, 'numIterations') == false)
        bestParameters = setfield(bestParameters, 'numIterations', 1);
        bestParameters = setfield(bestParameters, 'beta', 10^(-6));
    end
    [rowIndices, colIndices] = find(GeneGene_Hs);
    numNNZ = numel(rowIndices);
    [randomOrdering] = randperm(numNNZ);
    rowIndices(randomOrdering) = rowIndices;
    [randomOrdering] = randperm(numNNZ);
    colIndices(randomOrdering) = colIndices;

    DataMatrix = [rowIndices, colIndices, ones(numel(rowIndices),1)];
    GeneGeneMatrix = MatrixTransformer.getPatternMatrix(DataMatrix , numGenes, numGenes);
    GeneGeneMatrix = GeneGeneMatrix - (GeneGeneMatrix .* GeneGene_Hs);
    GeneGeneMatrix = GeneGeneMatrix + GeneGeneMatrix';
    GeneGeneMatrix = speye(numGenes);
%          ScoreMatrix = KatzAff.getKatzMatrix(GeneGeneMatrix, GenePheneTraining, bestParameters.numIterations, bestParameters.beta);
    ScoreMatrix = GeneGeneMatrix*GenePheneTraining(:, pheneId);
end

function ScoreMatrix = getJoint4KatzScoreMatrixFromPowers(GenePhenePowers, GeneGenePowers, GenePheneTraining, l_G, l_P, beta)
    powersToBeAdded = {};
    powersToBeAdded{1} = l_G * GeneGenePowers{1};
    P2 = l_G*l_P*GenePhenePowers{1} + GenePheneTraining * GenePheneTraining';
    powersToBeAdded{2} = l_G^2 * GeneGenePowers{2} + P2;
    powersToBeAdded{3} = l_G * GeneGenePowers{1} * powersToBeAdded{2} + l_P * GenePhenePowers{1} * P2;
    powersToBeAdded{4} = l_G * GeneGenePowers{1} * powersToBeAdded{3} + l_G^2 * P2 * GeneGenePowers{2} + P2 * P2;
    ScoreMatrix = linkPrediction.Katz.getKatzMatrixFromPowers(powersToBeAdded, beta, 4);
end

function testClassDefinition
    display 'All is well'
end

end
end

