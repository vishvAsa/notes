classdef Data
methods(Static=true)
    function [GenePheneTraining, targetEdgeSet, GenePheneValidationMatrices, validationEdgeSets] = getSplits(GenePhene, pheneId, fracTest, fracValidation, numValidation)
%          Input: GenePhene.
%                  pheneId: a scalar.
%                  fracTest, fracValidation, numValidation.
%          Output: GenePheneTraining
%          targetEdgeSet
%          GenePheneValidationMatrices: cell of numValidation validation sets.
%          validationEdgeSets: Corresponding cell of 10 validation edge sets.

        [trainingPheneColumn, targetEdgeSet] = linkPrediction.Predictor.removeRandomEdges(GenePhene(:,pheneId), fracTest);
        GenePheneTraining = GenePhene;
        GenePheneTraining(:,pheneId) = trainingPheneColumn;
        [numGenes, numPhenes] = size(GenePhene);
        [GenePheneValidationMatrices, validationEdgeSets] = genePhene.Data.getValidationSets(GenePheneTraining, fracValidation, numValidation);
    end
    
    function [GenePheneTrainingSets, TargetEdgeSets, GenePheneValidationMatrices, validationEdgeSets] = getValidationAndTestSets(GenePhene, phenesWithManyGenes, fracTest, fracValidation, numValidation)
%          GenePheneValidationMatrices,  validationEdgeSets : cell vars    
        GenePheneTrainingSets = GenePhene;
        TargetEdgeSets = zeros(size(GenePhene));
        [TrainingSets, TargetSets] = linkPrediction.Predictor.removeRandomEdgesColumnUniform(GenePhene(:, phenesWithManyGenes), fracTest);
        GenePheneTrainingSets = GenePhene;
        GenePheneTrainingSets(:, phenesWithManyGenes) = TrainingSets;
        TargetEdgeSets(:, phenesWithManyGenes) = TargetSets;
        
        display 'did splits';
        [GenePheneValidationMatrices, validationEdgeSets] = genePhene.Data.getValidationSets(GenePheneTrainingSets, fracValidation, numValidation, phenesWithManyGenes);
    end
    
    function [GenePheneValidationMatrices, validationEdgeSets] = getValidationSets(GenePheneTraining, fracValidation, numValidation, phenesWithManyGenes)
        GenePheneValidationMatrices = cell(numValidation,1);
        validationEdgeSets = cell(numValidation,1);
        for i = 1:numValidation
            % How about splitting the entire matrix while creating validation sets, rather than just the relevant column, as we did in the case of the creation of the training/ test set?
            % [GenePheneValidationMatrices{i}, validationEdgeSets{i}] = linkPrediction.Predictor.removeRandomEdges(GenePheneTraining, fracValidation);
            [GenePheneValidationMatrices{i}, validationEdgeSets{i}] = linkPrediction.Predictor.removeRandomEdgesColumnUniform(GenePheneTraining(:, phenesWithManyGenes), fracValidation);
        end
    end
    
    function getStatistics
        load(genePhene.Constants.GENE_PHENE_REINDEXED_GENES);
        
        [avgSumAlongRows, avgSumAlongCols, minSumAlongRows, minSumAlongCols, maxSumAlongRows, maxSumAlongCols, numZeroRows, numZeroCols] = MatrixFunctions.getRowColSumStatistics(GeneGene_Hs);
        
        sparsity = MatrixFunctions.getSparsity(GeneGene_Hs);
        fprintf(1, 'avgSumAlongRows %d, avgSumAlongCols %d, minSumAlongRows %d, minSumAlongCols %d, maxSumAlongRows %d, maxSumAlongCols %d, sparsity %d, numZeroRows %d, numZeroCols %d\n\n', avgSumAlongRows, avgSumAlongCols, minSumAlongRows, minSumAlongCols, maxSumAlongRows, maxSumAlongCols, sparsity, numZeroRows, numZeroCols);
        
%          [sumGraphs] = MatrixFunctions.plotRowColSums(GeneGene_Hs);
%          title('GeneGene_Hs');
%          saveas(gcf, [genePhene.Constants.LOG_PATH 'GeneGene_Hs' 'Sums' '.jpg']);
        
        for i = 1: length(GenePhene)
%              [sumGraphs] = MatrixFunctions.plotRowColSums(GenePhene{i});
%              title(['GenePhene' i]);
%              saveas(sumGraphs, [genePhene.Constants.LOG_PATH 'GenePhene' i 'Sums' '.jpg']);
            [avgSumAlongRows, avgSumAlongCols, minSumAlongRows, minSumAlongCols, maxSumAlongRows, maxSumAlongCols, numZeroRows, numZeroCols] = MatrixFunctions.getRowColSumStatistics(GenePhene{i});
            
            sparsity = MatrixFunctions.getSparsity(GenePhene{i});
            fprintf(1, 'avgSumAlongRows %d, avgSumAlongCols %d, minSumAlongRows %d, minSumAlongCols %d, maxSumAlongRows %d, maxSumAlongCols %d, sparsity %d, numZeroRows %d, numZeroCols %d\n\n', avgSumAlongRows, avgSumAlongCols, minSumAlongRows, minSumAlongCols, maxSumAlongRows, maxSumAlongCols, sparsity, numZeroRows, numZeroCols);
            
        end
    end
    
    
    function GenePhene=makeGenePheneMatrix(species,maxGene,maxPhene)
        GenePheneLinks = load([genePhene.Constants.GENE_PHENE_PATH 'genes_phenes.' species]);
        GenePhene = MatrixTransformer.getPatternMatrix(GenePheneLinks, maxGene, maxPhene);
    end
        
    function GeneGene=makeGeneGeneMatrix(maxGene)
        GeneGeneLinks = load([genePhene.Constants.GENE_PHENE_PATH 'genes_genes.Hs']);
        GeneGene = MatrixTransformer.getPatternMatrix(GeneGeneLinks, maxGene, maxGene);
        GeneGene = GeneGene + GeneGene';
    end
    
    function makeGenePheneMatrices
        maxGene = 768.2060e+003;
        maxPhene = 41.3170e+003;
        GP_SPECIES = genePhene.Constants.GP_SPECIES;
        GenePhene = cell(length(GP_SPECIES), 1);
        for i = 1:length(GP_SPECIES)
            species = GP_SPECIES(i,1:2);
            GenePhene{i} = genePhene.Constants.makeGenePheneMatrix(species, maxGene, maxPhene);
        end
        GeneGene_Hs = genePhene.Constants.makeGeneGeneMatrix(maxGene);
        save ([genePhene.Constants.GENE_PHENE_PATH 'genes_phenes.mat']);
    end

    function [GenePhene pheneIds] = removeIrrelevantPhenes(GeneGene_Hs, GenePhene)
        GP_SPECIES = genePhene.Constants.GP_SPECIES;
        dummySocialNet = graph.SocialNet(GeneGene_Hs);
        dummySocialNet = dummySocialNet.updateMembershipCount();
        for i = 1:length(GP_SPECIES)
            size(GenePhene{i})
            dummySocialNet = dummySocialNet.setUserGroupMat(GenePhene{i});
            dummySocialNet = dummySocialNet.removeTinyGroups(1);
            GenePhene{i} = dummySocialNet.userGroup;
            pheneIds{i} = dummySocialNet.groups;
            size(GenePhene{i})
        end
        clear dummySocialNet;
    end
    
    function storeReindexedMatrices
%          load([genePhene.Constants.GENE_PHENE_PATH 'genes_phenes.mat']);
%          [GenePhene pheneIds] = genePhene.Data.removeIrrelevantPhenes(GeneGene_Hs, GenePhene);
%          save (genePhene.Constants.GENE_PHENE_REINDEXED);
        load([genePhene.Constants.GENE_PHENE_REINDEXED]);
        [sumAlongRows, sumAlongColumns] = MatrixFunctions.getRowColSums(GeneGene_Hs);
        for i = 1:length(GenePhene)
            [tmp, tmpSumAlongColumns] = MatrixFunctions.getRowColSums(GenePhene{i});
            sumAlongColumns = sumAlongColumns + tmpSumAlongColumns;
        end
        geneIds = find(sumAlongColumns);
        GeneGene_Hs = GeneGene_Hs(geneIds,geneIds);
        for i = 1:length(GenePhene)
            GenePhene{i} = GenePhene{i}(geneIds, :);
        end
        [numGenes, numPhenes] = size(GenePhene{1});
        rowIds = 1:numGenes;
        rowIds = rowIds';
        ValuesMatrix = [geneIds ones(numGenes, 1) rowIds];
        rowIdsOfGenes = spconvert(ValuesMatrix);

        clear *Along*;
        clear *tmp*;
        clear species;
        clear i ans rowIds ValueMatrix;
        
%          keyboard
        
        save (genePhene.Constants.GENE_PHENE_REINDEXED_GENES, '-v7.3');
    end

    function importScores
        % Load the scores from the results folder obtained from Marcotte's lab.
        % Assumes results folder is present: Run process_results.sh before this.
        import genePhene.*;
        load (Constants.GENE_PHENE_REINDEXED_GENES);

        Score = [];
        for i=1:length(pheneIds{1})
            pheneId = pheneIds{1}(i);
            X = load ([Constants.PROB_PREDICTOR_SCORES int2str(pheneId)]);
            Score(X(:,1),pheneId) = X(:,2); 
            clear X
            fprintf('%d. ', pheneId);
        end
        ScoreMatrix = Score(geneIds, pheneIds{1});
    end

    function import10wiseSplits
        % Importing the 10 wise splits obtained from Marcotte's lab.
        import genePhene.*;
        load (Constants.GENE_PHENE_REINDEXED_GENES);
        
        geneSplits = {};
        directories = IO.listFiles(Constants.SPLITS_10WISE_PATH);
        for directory=directories
            genesAndScores = load([Constants.SPLITS_10WISE_PATH directory{1} '/1']);
            genes = sort(genesAndScores(:,1), 'ascend');
            genes(find(genes > max(geneIds))) = [];
            geneSplits{end+1} = rowIdsOfGenes(genes);
        end
        save(Constants.SPLITS_10WISE, 'geneSplits');
    end
    
    function [TrainingSets, geneSplits] = create10wiseTrainingTestSets
        % TrainingSets: cell array of training matrices created using the 10 wise gene splits obtained from Marcotte's lab.
        
        import genePhene.*;
        load (Constants.GENE_PHENE_REINDEXED_GENES);
        load(genePhene.Constants.SPLITS_10WISE);
        numSplits = length(geneSplits);
        TrainingSets = cell(numSplits, 1);

        for i=1:numSplits
            Training = GenePhene{1};
            genesInTest = full(geneSplits{i}(geneSplits{i}(:, 1) > 0));
            Training(genesInTest, :) = 0;
            TrainingSets{i} = Training;
            geneSplits{i} = genesInTest;
        end
    end
    
    function getPhenotypeDescriptions
        import genePhene.*;
        load (Constants.GENE_PHENE_REINDEXED_GENES);
        fileName = [Constants.GENE_PHENE_PATH 'phenotype_descriptions.table'];
        file = fopen(fileName);
        content = textscan(file, '%s %d %s %s', 'delimiter', '\t');
        content_species = cell2mat(content{1});
        pheneIdsForPheneDescriptions = content{2};
        pheneDescriptions = content{3};
        fclose(file);
        save(Constants.GENE_PHENE_REINDEXED_GENES,'pheneIdsForPheneDescriptions','-append');
        save(Constants.GENE_PHENE_REINDEXED_GENES,'pheneDescriptions','-append');
        
    end
end
end
