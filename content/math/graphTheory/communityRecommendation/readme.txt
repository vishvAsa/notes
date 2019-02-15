Read me for the data mining course project by Nagarajan Natarajan and vishvAs vAsuki.

1. Matlab code is available in a separate repository.

2. Data location on any lhug machine.
/scratch/cluster/vvasuki/socialNW/

3. The matlab path:
/projects/textmine/Software/graclus/graclus1.2/matlab
/public/linux/graft/matlabToolboxes/randp
the experiments folder and subfolders
the libaries folder and subfolders not starting with '+'

4. How to run experiments?
We omit describing the data-preparation methods, which are found in the class graphs.SocialNet.

We use the following format below:
section/ subsection name in the report; experiment file(s)

Social Network link prediction experiments.
Baseline performance measures; tkatzUUvsTkatzUGUU.m
A naive attempt: adding katz scores; tkatzUUvsTkatzUGUU.m
Clusters in affiliation network; clusterStatistics.m, UUClusterVsUGCluster.m, tKatzUGClusterMult.m, tKatzUGClusterPreMult.m
Using Supervised katz; supervisedKatz.m
SVD Latent factors; svdLatentFactorsSoc.m


Affiliation Network link prediction experiments. (In experiments/affNet)
Baseline; tkatzUU.m
Merging social and affiliation networks; tkatzUU.m
Using supervised katz; supervisedKatzAff.m
Linked matrix factorization; LMFAM.m
SVD latent factors approach; svdLatentFactors.m
