classdef PerformanceTester
methods(Static=true)
function [areaUnderCurve, scoreVector] = tuneAndTestForPhene(predictor, pheneId, GeneGene_Hs, GenePhene, GenePheneTraining, targetEdgeSet, fracValidation, numValidation, parameterLearner, numPredictionsForValidation)
    import genePhene.*;
    bestParameters = struct();
    [GenePheneValidationMatrices, validationEdgeSets] = PerformanceTester.getValidationSets(GenePheneTraining, fracValidation, numValidation);
    
    if (isempty(parameterLearner) == false)
        bestParameters = parameterLearner(GeneGene_Hs, GenePhene,  GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    end
    [areaUnderCurve, scoreVector] = PerformanceTester.testForPhene(predictor, pheneId, GeneGene_Hs, GenePhene, GenePheneTraining, targetEdgeSet, bestParameters);
end
    
function [areaUnderCurve, scoreVector] = testForPhene(predictor, pheneId, GeneGene_Hs, GenePhene, GenePheneTraining, targetEdgeSet, bestParameters)
    %      Return an the area under curve when ROC is approximated by a piecewise linear function.
    import genePhene.*;
    [numGenes, numPhenes] = size(GenePhene{1});
    
    [scoreVector] = predictor(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters);
    
    if(sum(targetEdgeSet) == 0)
        areaUnderCurve = 0;
        return;
    end
    
    maxNumPredictions = full(sum(GenePheneTraining(:,pheneId) == 0));
    
    %   Get the largest set of predictions.
    maskVector = zeros(numGenes,1);
    scoreVector = statistics.Ordering.setLowScoresIgnoreItems(scoreVector, GenePheneTraining(:, pheneId));
    
    [areaUnderCurve] = statistics.ClassificationEvaluation.getAUCApprox(targetEdgeSet, scoreVector, 200);
    
    
end

function qualitativeTestPhenologs(predictor, parameterLearner)
%          Input: predictor: a function handler
%          pheneId, GenePheneTraining, targetEdgeSet, GenePheneValidation, validationEdgeSet
    
%          Identify phenes with atleast 3 genes associated with them
    import genePhene.*;
    
    predictorName = func2str(predictor);
    load(Constants.GENE_PHENE_REINDEXED_GENES);
    phenesWithManyGenes = find(sum(GenePhene{1})>2);
%      phenesWithManyGenes = [2];
    numPhenes = numel(phenesWithManyGenes);
    numGenes = size(GeneGene_Hs, 1);

    bestParameters = [];
    ScoresToIgnore = zeros(size(GenePhene{1}));
    TargetEdgeSets = GenePhene{1};
    ScoreMatrix = zeros(numGenes, numPhenes);
    ScoreMatrix10wise =  zeros(numGenes, numPhenes);   
    [TrainingSets, geneSplits] = Data.create10wiseTrainingTestSets();
    
    for i=1:length(TrainingSets)
        GenePheneTraining = TrainingSets{i};
        fprintf('Found segment %d of ScoreMatrix\n', i);
%          Call parameter learner.
        ScoreMatrix10wise = predictor(phenesWithManyGenes, GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters);
        
        ScoreMatrix(geneSplits{i}, :) = ScoreMatrix10wise(geneSplits{i}, :);
    end

    if ~isempty(strfind(predictorName, 'probabilisticPredictor')) && isempty(strfind(predictorName, 'probabilisticPredictorFixed'))
        save(Constants.PROBABILISTIC_SCORES_RECREATED, 'ScoreMatrix');
    end
    
    areaUnderCurve = zeros(numPhenes,1);
    fprintf('Finding AUC: ');
    for phene = 1:numPhenes
        fprintf('.');
        pheneId = phenesWithManyGenes(phene);
        targetEdgeSet = TargetEdgeSets(:,pheneId);
        areaUnderCurve(phene) =  statistics.ClassificationEvaluation.getAUCApprox(targetEdgeSet,  ScoreMatrix(:,phene), 200);
    end
    fprintf('Done\n');

    PerformanceTester.evaluateAUC(areaUnderCurve, [predictorName 'Qualitative']);
    display 'All done  - ready for inspection!'
    keyboard
end

function [] = test(predictor, bPrelearnParameters, parameterLearner, bOnlyPredictionNoTest)
%          Input: predictor: a function handler
%          pheneId, GenePheneTraining, targetEdgeSet, GenePheneValidation, validationEdgeSet
%          Output: 
    import genePhene.*;
    
    if(isempty(bOnlyPredictionNoTest) ||  ~bOnlyPredictionNoTest) 
        fracTest = 0.3;
    else
        fracTest = 0;
    end
    fracValidation = 0.1;
    numValidation = 3;
    
    load(Constants.GENE_PHENE_REINDEXED_GENES);
%          Identify phenes with atleast 3 genes associated with them
    if(~bOnlyPredictionNoTest)
        phenesWithManyGenes = find(sum(GenePhene{1})>2);
        numPhenes = numel(phenesWithManyGenes);
    else
        numPhenes = size(GenePhene{1}, 2)
        phenesWithManyGenes = 1:numPhenes;
    end
    numGenes = size(GeneGene_Hs, 1);
    
    numPredictionsForValidation = floor(numPhenes * Constants.NUM_PREDICTIONS_MAX/2);

%          predictor = @Predictors.randomPredictor;

%  %          predictor = @LatentFactorsPredictors.svdApprox;
    bestParameters = [];
    
    [GenePheneTrainingSets, TargetEdgeSets, GenePheneValidationMatrices, validationEdgeSets] = Data.getValidationAndTestSets(GenePhene{1}, phenesWithManyGenes, fracTest, fracValidation, numValidation);
    if(bPrelearnParameters && ~isempty(parameterLearner))
        bestParameters = parameterLearner(GeneGene_Hs, GenePhene, GenePheneValidationMatrices, validationEdgeSets, numPredictionsForValidation);
    end
    areaUnderCurve = zeros(numPhenes,1);
    ScoreMatrix = zeros(numGenes, numPhenes);
    for phene = 1:numPhenes
        display '======================';
        pheneId = phenesWithManyGenes(phene);
        GenePheneTraining = GenePhene{1};
        GenePheneTraining(:,pheneId) = GenePheneTrainingSets(:,pheneId);
        if(bPrelearnParameters)
            [areaUnderCurve(phene) ScoreMatrix(:, phene)]= PerformanceTester.testForPhene(predictor, pheneId, GeneGene_Hs, GenePhene, GenePheneTraining, TargetEdgeSets(:,pheneId), bestParameters);
        else
            [areaUnderCurve(phene) ScoreMatrix(:, phene)] = PerformanceTester.tuneAndTestForPhene(predictor, pheneId, GeneGene_Hs, GenePhene, GenePheneTraining, TargetEdgeSets(:,pheneId), fracValidation, numValidation, parameterLearner, numPredictionsForValidation);
        end
        fprintf(1, '*******phene: %d, pheneId: %d, AUC: %d\n', phene, pheneId, areaUnderCurve(phene));
    end
    
    predictorName = func2str(predictor);
    if(StringUtilities.isSubstring(predictorName, 'precomputedSimilarity'))
        if(StringUtilities.isSubstring(predictorName, 'LowEv'))
            detailStr = 'LowEv';
        else
            detailStr = '';
        end
        predictorName = [func2str(parameterLearner) detailStr];
    end
    predictorName = strrep(predictorName, 'ParameterLearner', '');
    predictorName = strrep(predictorName, 'genePhene.*Predictors.', '');
    
    if(~bOnlyPredictionNoTest)
        % Purpose: Both make a prediction, and test the predictor.
        fullFileNameSansExtension = PerformanceTester.evaluateAUC(areaUnderCurve, predictorName);
        % store phenesWithManyGenes. For each phene: Store AUC, score vector, test set.
        file = [fullFileNameSansExtension '.mat'];
    else
        % Purpose: Just make a prediction, don't test. So, just create a file.
        timeStamp = Timer.getTimeStamp();
        file = [Constants.FINAL_PREDICTIONS_PATH predictorName timeStamp '.mat'];
        save(file, 'bOnlyPredictionNoTest');
    end
    save(file,'bOnlyPredictionNoTest','-append');
    save(file,'phenesWithManyGenes','-append');
    save(file,'areaUnderCurve','-append');
    save(file,'ScoreMatrix','-append');
    save(file,'TargetEdgeSets','-append');
    if(bOnlyPredictionNoTest)
        return;
    end
    
    ScoresToIgnore = GenePheneTrainingSets(:, phenesWithManyGenes);
    TargetEdgeSetPhenesWithManyGenes = TargetEdgeSets(:, phenesWithManyGenes);
    fullFileNameSansExtension =  PerformanceTester.evaluateTopScores(ScoreMatrix, ScoresToIgnore, TargetEdgeSetPhenesWithManyGenes, predictorName);
    display 'All done  - ready for inspection!'
    keyboard
end

function fullFileNameSansExtension = evaluateAUC(areaUnderCurve, predictorName)
    import genePhene.*;
    numPhenes = numel(areaUnderCurve);
    fprintf(1, 'Average AUC: %d, numBetterThanRandom: %d\n', mean(areaUnderCurve), sum(areaUnderCurve>0.5));
    display 'Ready to get the figure'
    areaUnderCurveSorted = sort(areaUnderCurve, 'descend');
    [figureHandle, fullFileNameSansExtension] = IO.plotAndSave([1:numPhenes], areaUnderCurveSorted, 'Human disease, rank-ordered by AUC', 'AUC', Constants.LOG_PATH, predictorName);
end

function fullFileNameSansExtension = evaluateTopScores(ScoreMatrix, ScoresToIgnore, TargetEdgeSets, predictorName)
    import genePhene.*;
    if(any(size(ScoreMatrix) ~= size(ScoresToIgnore)) || any(size(ScoreMatrix) ~= size(TargetEdgeSets)))
        error('Invalid input');
    end
    step = 5;
    numPredictionsVector = [step:step:Constants.NUM_PREDICTIONS_MAX];
    [avgPrecisions, avgSensitivities, avgSpecificities] = statistics.ClassificationEvaluation.getAveragePerformance(ScoreMatrix',ScoresToIgnore', TargetEdgeSets', numPredictionsVector);
    display 'Ready to get the figure'
    [figureHandle fullFileNameSansExtension] = IO.plotAndSave((1-avgSpecificities), avgSensitivities, '1-avg. Specificity', 'avg. Sensitivity', Constants.LOG_PATH, [predictorName 'ROC']);
end

function [avgScoreDifference, compensatoryDivergence] = getPredictorDivergence(scores1, scores2)
    import genePhene.*;
    avgScoreDifference = mean(abs(scores1 - scores2));
    compensatoryDivergence = sum((scores1 >= 0.5).*(scores2 < 0.5)) + sum((scores1 < 0.5).*(scores2 >= 0.5));
end

function evaluatePredictorDivergences()
    import genePhene.*;
    fileList = ls([Constants.LOG_PATH '*.mat']);
    matFiles = StringUtilities.split(fileList);
    numFiles = length(matFiles);
    for i = 1:numFiles
        for j = i+1:numFiles
            
            scores_i = load(matFiles{i});
            scores_j = load(matFiles{j});
            [avgScoreDifference, compensatoryDivergence] = PerformanceTester.getPredictorDivergence(scores_i.areaUnderCurve, scores_j.areaUnderCurve);
            
            fprintf(1, 'Comparing: \n %s \n %s \n', strrep(matFiles{i}, [Constants.LOG_PATH ''], ''), strrep(matFiles{j}, [Constants.LOG_PATH ''], ''));
            fprintf(1, 'avgScoreDifference: %d compensatoryDivergence: %d\n', avgScoreDifference, compensatoryDivergence);
        end
    end
    keyboard
end

function outputTopPredictions(numPredictions, matFilename)
    % Invocation example: genePhene.PerformanceTester.outputTopPredictions(50, [genePhene.Constants.LOG_PATH 'genePhene.GraphProximityPredictors.katzHumanGeneInteractions.mat']);
    import genePhene.*;
    import statistics.*;
    
    bOnlyPredictionNoTest = false;
    % This will be overwritten when the file is loaded, but setting a default.
    
    %% Prepare file handle
    [pathStr predictorId] = fileparts(matFilename);
    pathStr = [pathStr '/'];
    txtOutputFile = [Constants.FINAL_PREDICTIONS_PATH  predictorId '_predictions.txt'];
    xmlOutputFile = [Constants.FINAL_PREDICTIONS_PATH  predictorId '_predictions.xml'];
    fileTxt = fopen(txtOutputFile, 'w');
    fileXml = fopen(xmlOutputFile, 'w');
    
    %% Read data.
    load(matFilename);
    load(Constants.GENE_PHENE_REINDEXED_GENES);
    GenePhene = GenePhene{1};
    pheneIds = pheneIds{1};
    
    %% Get top predictions
    topPredictionGenes = Ordering.getTopPredictionSets(numPredictions, ScoreMatrix', GenePhene');
    
    %% Write predictions
    % Prepare xml file
    fprintf(fileXml, '<?xml version="1.0" encoding="ISO-8859-1"?>\n<?xml-stylesheet type="text/xsl" href="simpleTable.xsl"?>\n\n');
    if(bOnlyPredictionNoTest)
        aucStr = '';
    else
        aucStr = ['../' predictorId '.jpg'];
    end
    fprintf(fileXml, ['<predictions predictorId="' predictorId '" aucFile="' aucStr '">\n']);
    
    numPhenes = numel(phenesWithManyGenes);
    % keyboard
    for phene=1:numPhenes
        pheneIdReindexed = phenesWithManyGenes(phene);
        pheneIdOriginal = pheneIds(pheneIdReindexed);
        geneIdsForPhene = geneIds(topPredictionGenes{phene});
        pheneDescription = pheneDescriptions(pheneIdsForPheneDescriptions == pheneIdOriginal);
        pheneDescription = pheneDescription{1};
        % Write to text file.
        fprintf(fileTxt, '============================================\n');
        fprintf(fileTxt, 'Phene Id = %d, AUC = %.3f\n', pheneIdOriginal, areaUnderCurve(phene));
        fprintf(fileTxt, 'Description: %s\n', pheneDescription);
        % fprintf(1, 'pheneIdOriginal = %d, AUC = %d ', pheneIdOriginal, areaUnderCurve(phene));
        fprintf(fileTxt, '%d %d\n', [geneIdsForPhene'; TargetEdgeSets(topPredictionGenes{phene}, pheneIdReindexed)']);
    
        % Write to xml file.
        [xmlTag errorMsg] = sprintf('<phene pheneId="%d" AUC="%.3f">\n', pheneIdOriginal, areaUnderCurve(phene));
        fprintf(fileXml, xmlTag);
        
        [xmlTag errorMsg] = sprintf('<description>%s</description>\n', pheneDescription);
        fprintf(fileXml, xmlTag);
        
        if(numel(topPredictionGenes{phene})>0)
            [xmlTag errorMsg] = sprintf('<gene geneId="%d" bInTestSet="%d"/>\n', [geneIdsForPhene'; TargetEdgeSets(topPredictionGenes{phene}, pheneIdReindexed)']);
            fprintf(fileXml, xmlTag);
        end
        fprintf(fileXml, '</phene>\n');
    
    end
    fclose(fileTxt);

    % End xml file
    fprintf(fileXml, ['</predictions>\n']);
    fclose(fileXml);

end

function makePredictionsKatzHumanGeneInteractions()
    import genePhene.*;
%          parameterLearner = @Predictors.getPowers;
    parameterLearner = @GraphProximityPredictors.katzHumanGeneInteractionsParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrix;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, true);
end

function makePredictionsProbabilisticPredictor()
    import genePhene.*;
    predictor = @Predictors.probabilisticPredictorPerPhene;
    parameterLearner = [];
    PerformanceTester.test(predictor, true, parameterLearner, true);
end

function makePredictionsProbabilisticPredictorFixed()
    import genePhene.*;
    predictor = @Predictors.probabilisticPredictorFixed;
    parameterLearner = [];
    PerformanceTester.test(predictor, true, parameterLearner, true);
end

function experimentKatz()
    import genePhene.*;
    parameterLearner = [];
    predictor = @GraphProximityPredictors.katz;
    PerformanceTester.test(predictor, false, parameterLearner, false);
end

function experimentKatzOtherSpecies()
    import genePhene.*;
    parameterLearner = @GraphProximityPredictors.katzOtherSpeciesParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrix;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, false);
end

function experimentCommonNeighbors()
    import genePhene.*;
    parameterLearner = [];
    predictor = @Predictors.commonNeighbors;
    PerformanceTester.test(predictor, false, parameterLearner, false);
end

function experimentCommonNeighborsOtherSpecies()
    import genePhene.*;
    parameterLearner = [];
    predictor = @Predictors.commonNeighborsOtherSpecies;
    PerformanceTester.test(predictor, false, parameterLearner, false);
end

function experimentKatzHumanGeneInteractions()
    import genePhene.*;
%          parameterLearner = @Predictors.getPowers;
    parameterLearner = @GraphProximityPredictors.katzHumanGeneInteractionsParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrix;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, false);
end

function experimentKatzHumanGeneInteractionsLowEv()
    import genePhene.*;
%          parameterLearner = @Predictors.getPowers;
    parameterLearner = @GraphProximityPredictors.katzHumanGeneInteractionsParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrixLowEv;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, false);
end

function experimentKatzSmoothenedOtherSpecies()
    import genePhene.*;
%          parameterLearner = @Predictors.getPowers;
    parameterLearner = @GraphProximityPredictors.katzSmoothenedOtherSpeciesParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrix;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, false);
end

function experimentKatzSmoothenedGeneSimilarity()
    import genePhene.*;
%          parameterLearner = @Predictors.getPowers;
    parameterLearner = @GraphProximityPredictors.katzSmoothenedGeneSimilarityParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrix;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, false);
end

function experimentKatzJoint()
    import genePhene.*;
    parameterLearner = @GraphProximityPredictors.katzJointParameterLearner;
    bPrelearnParameters = true;
    predictor = @GraphProximityPredictors.precomputedSimilarityMatrix;
    PerformanceTester.test(predictor, bPrelearnParameters, parameterLearner, false);
end

function experimentKatzRandomCheck()
    import genePhene.*;
    parameterLearner = [];
    predictor = @GraphProximityPredictors.katzRandomCheck;
    PerformanceTester.test(predictor, false, parameterLearner, false);
end

function experimentRandomPredictor()
    import genePhene.*;
    parameterLearner = [];
    predictor = @Predictors.randomPredictor;
    PerformanceTester.test(predictor, false, parameterLearner, false);
end

function experimentSVD()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.svdApprox;
    parameterLearner = @LatentFactorsPredictors.svdApproxParameterLearner;
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentSVDCombined()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.svdCombined;
    parameterLearner = @LatentFactorsPredictors.svdCombinedParameterLearner;
    parameterLearner = [];
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentSVDOtherSpecies()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.svdApproxOtherSpecies;
    parameterLearner = @LatentFactorsPredictors.svdApproxOtherSpeciesParameterLearner;
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentSVDOtherSpecies2()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.svdApproxOtherSpecies2;
    parameterLearner = @LatentFactorsPredictors.svdApproxOtherSpecies2ParameterLearner;
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentSVDOtherSpeciesQualitativeTest()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.svdApproxOtherSpeciesMultiplePhenes;
    parameterLearner = [];
    PerformanceTester.qualitativeTestPhenologs(predictor, parameterLearner);
end

function experimentSparseSVPCombined()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.sparseSVPCombined;
    parameterLearner = @LatentFactorsPredictors.sparseSVPCombinedParameterLearner;
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentSparseSVPHs()
    import genePhene.*;
    predictor = @LatentFactorsPredictors.sparseSVPCombined;
    parameterLearner = @LatentFactorsPredictors.sparseSVPHsParameterLearner;
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentProbabilisticPredictorQualitativeTest()
    import genePhene.*;
    predictor = @Predictors.probabilisticPredictor;
    parameterLearner = [];
    PerformanceTester.qualitativeTestPhenologs(predictor, parameterLearner);
end

function experimentProbabilisticPredictor()
    import genePhene.*;
    predictor = @Predictors.probabilisticPredictorPerPhene;
    parameterLearner = [];
    PerformanceTester.test(predictor, true, parameterLearner, false);
end

function experimentProbabilisticPredictorFixedQualitativeTest()
    import genePhene.*;
    predictor = @Predictors.probabilisticPredictorFixed;
    parameterLearner = [];
    bPrelearnParameters = false;
    PerformanceTester.qualitativeTestPhenologs(predictor, parameterLearner);
end

function comparePredictors()
    import genePhene.*;
    filePrefix = [Constants.LOG_PATH 'comparisons/'];
    xLabel = 'Phenes (Rank ordered by AUC)';
    yLabel = 'AUC';
    
    files = IO.listFiles([Constants.LOG_PATH '*probabilistic*Fixed*Qual*.mat']);
    filesPhenologReproduction = IO.listFiles([Constants.LOG_PATH '*probabilisticPredictorQualitative*.mat']);
    files{end + 1} = filesPhenologReproduction{end};
    figureName = 'probabilisticFixedVsProbabilistic_QualitativeTest';
    legendNames = {'phenologs (Marcotte lab)', 'phenologs (Reproduction)'};
    figureHandle = IO.getFiguresAndCombine(files, filePrefix, figureName, xLabel, yLabel, legendNames);
    
    % Use evaluation methods proposed by Marcotte.
    files = IO.listFiles([Constants.LOG_PATH '*probabilistic*Fixed*Qual*.mat']);
    filesSVD = IO.listFiles([Constants.LOG_PATH '*svd*Other*Qual*.mat']);
    files{end + 1} = filesSVD{end};
    figureName = 'probabilisticFixedVsSVDOtherSpecies_QualitativeTest';
    legendNames = {'phenologs (Marcotte lab)', 'svdApproxOtherSpecies'};
    figureHandle = IO.getFiguresAndCombine(files, filePrefix, figureName, xLabel, yLabel, legendNames);
    
    % Use evaluation method B.
    filesProbabilistic = IO.listFiles([Constants.LOG_PATH '*probabilisticPredictorPerPhene2010*.mat']);
    filesSVDOtherSpecies = IO.listFiles([Constants.LOG_PATH '*Latent*svd*OtherSpecies2010*.mat']);
    filesSVDOtherSpecies2 = IO.listFiles([Constants.LOG_PATH '*Latent*svd*OtherSpecies22010*.mat']);
    filesSVDCombined = IO.listFiles([Constants.LOG_PATH '*Latent*svd*Combined2010*.mat']);
    
    files = {filesProbabilistic{end}, filesSVDOtherSpecies{end}, filesSVDCombined{end}, filesSVDOtherSpecies2{end}};
    legendNames = {'phenologs', 'svdApproxOtherSpecies', 'svdCombined', 'svdApproxOtherSpecies2'};
    figureName = 'probabilisticVsLatentFactors';
    figureHandle = IO.getFiguresAndCombine(files, filePrefix, figureName, xLabel, yLabel, legendNames);
    
    filesKatzHumanGeneInteractions = IO.listFiles([Constants.LOG_PATH '*GraphProximity*atz*HumanGeneInteractions2010*.mat']);
    filesKatzOtherSpecies = IO.listFiles([Constants.LOG_PATH '*GraphProximity*atz*OtherSpecies2010*.mat']);
    filesKatzJoint = IO.listFiles([Constants.LOG_PATH '*GraphProximity*atz*Joint2010*.mat']);
    files = {filesProbabilistic{end}, filesKatzOtherSpecies{end}, filesKatzHumanGeneInteractions{end}, filesKatzJoint{end}};
    figureName = 'probabilisticVsGraphProximity';
    legendNames = {'phenologs', 'katzHumanGeneInteractions', 'katzOtherSpecies', 'katzJoint'};
    figureHandle = IO.getFiguresAndCombine(files, filePrefix, figureName, xLabel, yLabel, legendNames);
    
    % Get ROC plots.
    xLabel = '1-avg. Specificity';
    yLabel = 'avg. Sensitivity';
    
    filesProbabilistic = IO.listFiles([Constants.LOG_PATH '*probabilisticPredictorPerPhene*ROC2010*.mat']);
    filesSVDOther = IO.listFiles([Constants.LOG_PATH '*Latent*svd*OtherSpecies*ROC2010*.mat']);
    filesSVDCombined = IO.listFiles([Constants.LOG_PATH '*Latent*svd*Combined*ROC2010*.mat']);
    filesKatzHumanGeneInteractions = IO.listFiles([Constants.LOG_PATH '*GraphProximity*atz*HumanGene*ROC2010*.mat']);
    filesKatzOtherSpecies = IO.listFiles([Constants.LOG_PATH '*GraphProximity*atz*OtherSpecies*ROC2010*.mat']);
    filesSVDOtherSpecies2 = IO.listFiles([Constants.LOG_PATH '*Latent*svd*OtherSpecies2*ROC2010*.mat']);
    filesKatzJoint = IO.listFiles([Constants.LOG_PATH '*GraphProximity*atz*JointROC2010*.mat']);
    
    files = {filesProbabilistic{end}, filesSVDOther{end}, filesSVDCombined{end}, filesSVDOtherSpecies2{end}};
    figureName = 'probabilisticVsLatentFactorsROC';
    legendNames = {'phenologs', 'svdApproxOtherSpecies', 'svdCombined', 'svdApproxOtherSpecies2'};
    figureHandle = IO.getFiguresAndCombine(files, filePrefix, figureName, xLabel, yLabel, legendNames);
    
    files = {filesProbabilistic{end}, filesKatzHumanGeneInteractions{end}, filesKatzOtherSpecies{end}, filesKatzJoint{end}};
    legendNames = {'phenologs', 'katzHumanGeneInteractions', 'katzOtherSpecies', 'katzJoint'};
    figureName = 'probabilisticVsGraphProximityROC';
    figureHandle = IO.getFiguresAndCombine(files, filePrefix, figureName, xLabel, yLabel, legendNames);
    

end

function testClass
    display 'Class definition is ok';
end

end
end
