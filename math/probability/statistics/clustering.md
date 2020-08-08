+++
title = "Clustering"
+++

## The clustering problem
Given \\(N\\) points, want \\(k\\) clusters. Often, \\(k\\) is not known.

### Use
Summarizing data is important for generalization, understanding future data points.

Supplying labels to unlabeled data; thence classifying new data-points. Eg: Face recognition using Eigenfaces. Use to estimate distribution support and thence in novelty detection.

### Criteria: Continuity vs compactness
Consider a starfish: The continuity critierion will identify the 5 arms as 5 clusters, but the comactness criterion will fail. Consider points produced from two gaussians with distinct centers: the compactness criterion appears better.

### Extensions
Coclustering data-points along with features.

#### Find Non-redundant clusterings
Aka Disparate clusters. Want clusterings based on unrelated criteria. Eg: can classify people based on sex, race etc.. \\(k\\) Disparate clusters can be thought of as lying in \\(k\\) orthogonal subspaces.

#### With background clutter
Consider clustering stars in the night sky to find galaxies. Important for clustering algorithm to ignore clutter.

### Evaluation of clustering
In case the \\(k\\) true labels are known: Just use ways of evaluating classification. Can always do this by generating artificial data.

### Challenges
#### Curse of dimensionality
As dimensions/ features grow, more difficult to group similar things together; there could be irrelevant or noisy features.

Use dimentionality reduction techniques.

#### Number of clusters k
The actual number depends on the data. Choice of \\(k\\) is mostly based on heuristics.

Some methods take \\(k\\) as input, others discover \\(k\\) themselves.

#### Identify important clusters
Clusters which matter remain distinct at different levels of coarsity.

##### Cluster visualization
Look at clusters in 2D or 3D at varying coarsity levels to identify important clusters.

### Approaches
#### Views of the data
Visualize data points as points in feature space.

Or as 'data points (X) vs features (Y)' matrix A. In case features are binary (eg: word present or absent), get contingency table P(X, Y), an estimate of the joint probability matrix.

#### Density estimation
##### Parametric
Try to find distribution of data in the input space. Usually fit some multimodal distribution: the different modes define different cluster representatives.

Eg: Fit a mixture of \\(k\\) Gaussians centered at various spots in the input space.

Advantage of having a parametric model: can extrapolate what the data will look like with more sampling.


##### Non-Parametric
Can do non-parametric density inference, then do density shaving: ignore points with low density, identify the modes.

##### Relative performance
Non parametric methods usually perform better, given enough data-points.

#### Centroid based vs agglomerative clustering
Described fully in another section.

Centroid based clustering methods are usually fast: the costliest step is often assignment of points to clusters: O(kn). Agglomerative methods usually involve comparison between all cluster-pairs for the purpose of agglomeration; so are slower: \\(O(n^{2})\\).

Centroid based methods require \\(k\\) to be known before hand, they need initial points. Agglomerative methods find varying number of clusters: from \\(N\\) to 1; it is up to the user to know where to stop - this can be difficult.

## Agglomerative clustering
Bottom up approach. Start off with \\(N\\) clusters: 1 for each point; pick nearest pair of clusters; merge them; repeat till you have \\(k\\) clusters.

### Intercluster metrics
Distance between means. Or between closest pair of points: tends to produce elongated clusters: clustering by continuity criterion. Or between farthest pair of points: clustering by compactness criterion. These correspond to the 2 clustering criteria.

## Centroid based clustering
Use centroids or cluster representatives to cluster.

### Mean: Best cluster representative wrt Bregman div
Given Bregman div \\(d_f\\) based on convex function f. Show by easy algebra that \\(n^{-1}\sum_i d_\gf(X_i, z) - n^{-1}\sum_i d_\gf(X_i, \mean) = d_f(z, \mean) \geq 0\\). So, mean is best cluster representative wrt 2 norm: 2-norm is also a bregman divergence.

### k means clustering
#### Objective
##### As minimizing within cluster scatter
Find \\(k\\) centroids, make \\(k\\) partitions (Vorinoi tesselations) in the input space: \\
\\(S' = (S_{i}') = argmin_{S} \sum_{i=1}^{k} \sum_{x_{j} \in S_{i}} d(x_{j}, \mean_{i})\\).

##### As maximizing inter-cluster scatter
Use scatter matrices/ scalars \\
\\(S_B, S_W, S_T\\) as in LDA. For any bregman divergence: \\(S_T = S_B + S_W\\). Implicitly tries to maximimze \\(S_B\\) : Between cluster scatter.

#### Algorithm
Start of with \\(k\\) vectors \\((m_{i}^{0})\\) as means of \\((S_{i})\\); At time t, you have: \\((m_{i}^{t})\\). Reassign all points to the \\(S_{i}^{t}\\) corresponding to the closest \\(m_{i}^{t}\\); calculate new means \\((m_{i}^{t+1})\\) as the centers of these \\((S_{i}^{t})\\); repeat.

If \\(d\\) is any Bregman div, \\(k\\) means minimizes this at each iteration: Alg finds better clustering, Mean is best cluster representative.

Time: O(kndt): very fast.

#### As low rank factorization with alternating minimization
Let X be the \\(d \times n\\) data matrix. Doing \\(X \approx MW\\), where M is the \\(d \times k\\) means matrix, and \\(W \in \set{0, 1}^{k\times n}\\) denotes membership. For strict partitioning, there is the constraint \\(w_i \in I_k\\).

So, k-means is equivalent to solving \\(\min_{M, W} \norm{X - MW}_F\\) by alternatively minimizing M with W fixed, and W with M fixed subject to constraints on W.

#### Drawbacks and extensions
This is a greedy algorithm, does local minimization of the objective function. Highly sensitive to initial conditions. Can end up with empty clusters, with bad initialization. So, have varied initialization strategies.

Fails to cluster data points arranged in concentric rings. So use the kernel trick here: get kernel \\(k\\) means.

### With GMM
You model the observed data with \\(k\\) normal distributions \\((D_i)\\) specified by means \\((\mean_i)\\), covariances \\((\covmatrix_i)\\), prior probabilities of a point being generated by \\((D_i)\\), aka mixture weights, \\((p_i)\\). If you find the best parameters for this model, you can assign points to the cluster associated with the \\(D_i\\) most likely to have generated it.

Start with some guessed parameters. Repeat the following steps iteratively: a] Assign each point to the \\(D_i\\) most likely to have generated it: do \\(\min_i (\log p_i) (x-m_i)^{T}\covmatrix_i^{-1}(x-m_i)\\): same as minimizing a weighted 'Mahalonobis distance'; \\((\log p_i)\\) can be seen as shrinking \\(D_i\\) appropriately by acting on \\(\covmatrix_i^{-1}\\). Let \\(n_i\\) count the points assigned to cluster i. Update \\(p_i = n_i/n\\). b] Update parameters: \\(\mean_i = n_i^{-1}\sum_{x_j \in i} x_j; \covmatrix_{i, (j, k)} = \frac{1}{n_i-1}(x_i,j - \mean_j)(x_i,k - \mean_j)\\): note unbiased estimater used in estimating covariances.

#### Generalizing k-means
k-means corresponds to GMM clustering with each Normal Distribution in the model constrained to being spherical: at each step you assign the point to the cluster with \\(\mean = \argmin_{m_i} (x-m_i)^{T}(x-m_i)\\).

### With non-negative matrix factorization
Let X be the \\(d \times n\\) data matrix. Doing \\(X \approx MW\\), where \\(M \in R_+^{d \times k}\\) means matrix, and \\(W \in R_+^{k\times n}\\) denotes membership strength.

### Finding the initialization points
Bad initialization points can lead to bad clusters, good ones lead to good clusters. Density estimation useful here. \tbc



## Co-clustering
Cluster both the rows and columns of P simultaneously. Thus dealing with duplicate/ synonymous/ irrelevant features simultaneously while clustering.

### Objective: Information loss minimizing
Find maps $C_{X}: \set{x_{1}, .. x_{m}} \to \set{\hat{x_{1}}, .. , \hat{x_{k}}};\\
 C_{Y}: \set{y_{1}, .. y_{m}} \to \set{\hat{y_{1}}, .. , \hat{y_{l}}}\\(. \\)(C_{X}, C_{Y})\\( is a coclustering; yields corresponding joint distribution matrix \\)p(\hat{X}, \hat{Y})\\(. Best co clustering has minimum mutual information loss: \\)\min I(X;Y) - I(\hat{X},\hat{Y}) = K(p(X,Y)||q(X,Y))\\( where \\)q(X, Y) = p(\hat{X}, \hat{Y})p(X|\hat{X})p(Y|\hat{Y})$.

#### The monotonic optimizer
$K(p(X,Y)||q(X,Y)) = \\
K(p(X,Y,\hat{X},\hat{Y})||q(X,Y,\hat{X},\hat{Y}))$.\\
For any clustering, q preserves marginals and conditionals: \\
\\(q(\hat{x}, \hat{y}) = p(\hat{x}, \hat{y}), q(x, \hat{x}) = p(x, \hat{x}), q(y, \hat{y}) = p(y, \hat{y}), p(x) = q(x), p(x|\hat{x}) = q(x|\hat{x})\\) etc..

So, $K(p(X,Y,\hat{X},\hat{Y})||q(X,Y,\hat{X},\hat{Y})) =\\
 \sum_{\hat{x}} \sum_{x : C_{X}(x) = \\
 \hat{x}} K(p(Y|x)||q(Y|\hat{x}))$; \\
 similar form in terms of \\(K(p(X|y)||q(X|\hat{y}))\\).

Thence information theoretic coclustering alg: Start with \\(C_{X}^{(0)}, C_{Y}^{0}\\); at step t, for each row \\(x\\),  set \\(C_{X}^{(t+1)}(x)= argmin_{\hat{x}} K(p(Y|x)||q^{(t)}(Y|\hat{x}))\\); recompute distributions \\(q^{(t+1)}\\); at step t+2 similarly recluster columns finding local minima; repeat. This minimizes objective function monotonically. Experiments on document clustering tasks show better clustering than 1D clustering.


## Using Graph clustering
For graph clustering methods, see graph theory ref.

