classdef Constants
    properties(Static = true)
        GENE_PHENE_PATH='/projects/textmine/Data/gene-phene/';
        LOG_PATH='/u/vvasuki/projectsSvn/gene-phene/log/';
    	PROB_PREDICTOR=[genePhene.Constants.GENE_PHENE_PATH 'probabilisitic_predictor/'];
        PROB_PREDICTOR_SCORES=[genePhene.Constants.PROB_PREDICTOR 'results_probabilisiticpredictor/'];
        PROBABILISTIC_SCORES=[genePhene.Constants.PROB_PREDICTOR 'scores_probabilistic.mat'];
        PROBABILISTIC_SCORES_RECREATED=[genePhene.Constants.PROB_PREDICTOR 'scores_probabilistic_recreated.mat'];
        SPLITS_10WISE_PATH=[genePhene.Constants.PROB_PREDICTOR '10wise_splits/'];
        SPLITS_10WISE = [genePhene.Constants.PROB_PREDICTOR '10wise_splits.mat'];
        GENE_PHENE_REINDEXED = [genePhene.Constants.GENE_PHENE_PATH, 'genes_phenesReindexed.mat'];
        GENE_PHENE_REINDEXED_GENES = [genePhene.Constants.GENE_PHENE_PATH, 'genes_phenesReindexedGenes.mat'];
        GP_SPECIES = ['Hs'; 'At'; 'Ce'; 'Dm'; 'Mm'; 'Sc'];
        GENE_PHENE_POWERS = [genePhene.Constants.GENE_PHENE_PATH, 'genes_phenePowers.mat'];
        NUM_PREDICTIONS_MAX = 25;
        FINAL_PREDICTIONS_PATH = [genePhene.Constants.LOG_PATH 'finalPredictions/']
    end
end