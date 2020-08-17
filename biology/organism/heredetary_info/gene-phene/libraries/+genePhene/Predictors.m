classdef Predictors
methods(Static=true)
    function [ScoreMatrix] = randomPredictor(pheneId, GeneGene_Hs, GenePheneTraining, GenePhene, bestParameters)
        ScoreMatrix = zeros(size(GenePhene{1}));
    end
    
    function [ScoreMatrix] = probabilisticPredictorFixed(phenes, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
        load (genePhene.Constants.PROBABILISTIC_SCORES);
        ScoreMatrix = ScoreMatrix(:, phenes);
    end
    
    function [ScoreMatrix] = probabilisticPredictor(phenes, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
        for pheneId = phenes
            ScoreMatrix(:, pheneId) = genePhene.Predictors.probabilisticPredictorPerPhene(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters);
        end
        ScoreMatrix = ScoreMatrix(:, phenes);
    end
    
    function [scoreVector] = probabilisticPredictorPerPhene(pheneId, GeneGene_Hs, GenePheneTraining,  GenePhene, bestParameters)
        % The probability that a gene is associated with the human phene given the evidences of its
        % association with 'k' nearest neighboring phenes in other species, is interpreted as the score of the gene.
        
        % The number of nearest neighboring phenes whose evidences must be
        % combined.
        bestParameters.numNearest = 10;
        bestParameters.species = [2,3,5,6];

        numSpecies = length(GenePhene);
        [numGenes, numPhenes] = size(GenePheneTraining);
        humanPhene = GenePheneTraining(:, pheneId);
        
        % Calculate the distances between the human phene and every phene
        % of every other species, in the space of the orthologs shared by
        % Humans with the corresponding species.
        i = 1;
        for species=bestParameters.species
            for currPhene=1:size(GenePhene{species},2)
                [distances(i), numIntersection] = genePhene.getPhenologDistance(humanPhene, GenePhene{species}(:,currPhene), GenePhene{species});
                neighbors{i} = {species, currPhene, numIntersection};
                i = i + 1;
            end
        end
        
        % Get 'k' nearest neighbors. 
        % NOTE: We choose all the neighbors within the distance of the kth
        % nearest neighbor. 
        
        %          Sorts in ascending order.
        [sortedDistances, sortedIndices] = sort(distances);
        cutoffDistance = sortedDistances(bestParameters.numNearest);
        newNumNearest = numel(find(sortedDistances <= cutoffDistance));
        nearestNeighbors = neighbors(sortedIndices(1:newNumNearest));
        scoreVector = zeros(numGenes, 1);
        fprintf('Considering %d neighbors\n', newNumNearest);
        for gene=1:numGenes
            score = 1;
            for k=1:newNumNearest
                % Get the neighbor phene from neighbors cell.
                neighborSpecies = nearestNeighbors{k}{1};
                neighborPhene = nearestNeighbors{k}{2};
                neighborPhene = GenePhene{neighborSpecies}(:, neighborPhene);
                probGeneGivenNeighbor = 0;
                if neighborPhene(gene) ~= 0
                    % If this human gene is associated in the neighbor's
                    % phene, weigh this phene proportional to the
                    % number of orthologs shared between the human phene and this phene.
                    % Normalize the weight by the number of genes observed
                    % in the human phene (Training).
                    probGeneGivenNeighbor = nearestNeighbors{k}{3}/sum(neighborPhene);
                end
                score = score * (1 - probGeneGivenNeighbor * (1 - sortedDistances(k)));
            end
            scoreVector(gene) = 1 - score; 
        end
%        keyboard
    end
    
end
end

