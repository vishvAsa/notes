function [distance, numIntersection] = getPhenologDistance(humanPhene, speciesPhene, SpeciesGenePhene)
    % Let X be a random variable that denotes the number of 'good' genes
    % i.e. those that are observed in both the 'humanPhene' and 'speciesPhene'.
    % Let N denote the number of 'orthologs' shared between the humans and
    % the other species.
    % Let n and m denote the number of observed genes in 'humanPhene' and
    % 'speciesPhene' respectively. 
    % Pr(X = k) ~ Hypergeometric(N, m, n)
    % i.e. P(X = k) = mCk * (N-m)C(n-k) / N C n
    % Intuitively, two phenes are closest if the probability of getting at least k
    % 'good' genes, when n genes are randomly drawn from the space of orthologs, is zero.
    % So we interpret the probability as the distance.
    
    n = full(sum(humanPhene));
    m = full(sum(speciesPhene));

    if m <= 2
        % Don't consider such phenes.
        distance = 1;
        numIntersection = 0;
        return
    end
    % Note: We need to consider only those orthologs that are shared by the 
    % two species, while finding the intersection.
    % However, for an ortholog that is not shared between the species,
    % the 'speciesPhene' will have 0. So, we need no gimmicks.
    
    N = full(sum(sum(SpeciesGenePhene,2)>0));
    numIntersection = full(sum(humanPhene .* speciesPhene));
    
    distance = 0;
    % Note, however, that m and n != 0 for gene-phene dataset.
    if min(m,n) == 0
        distance = 1;
        return
    end
    
    k = [numIntersection:min(m,n)];
    distance = sum(hygepdf(k, N, m, n));
end
