+++
title = "Data representation"
+++

## Feature extraction
Use some \\(\ftr\\): d-dim X formed by input vars \\(\to\\) m-dim Feature space; \\(\ftr\\) is a vector function. Basis of feature space are the 'basis functions' \\((\ftr_{i})\\). \tbc

### Dimensionality reduction
Remove irrelevant/ less relevant features, merge duplicate features. Eg: synonymous words in documents.

#### Importance
Treating duplicate features as if they were different harms ability to classify or cluster data points. Irrelevent features also harm predictive ability, by acting as noise.

##### Data visualization
Project high dimensional data to 2D or 3D space. Also see graph drawing/ embedding.

#### Extant of dimensionality reduction
The best dimension should match the  inherent dimensionality of the data.

If there are not-very-useful features, there will be a steep drop in the performance gain by including those features. Often this is not the case, and the choice is rather arbitrary.

## Using Kernel function to implicitly map data to a feature space
See vector spaces ref for info about kernels.

### The Kernel trick
Aka Kernel substitution.

Can reformulate hypothesis model, perhaps a predictor, and any associated optimization objective such that input vector \\(x\\) enters only in terms of inner products. Then can substitute this product with kernel function \\(k(x, x')\\); implicitly using some \\(\ftr(x)\\); can try out various kernels to achieve good performance. Can also use +ve semi-definite d*d kernel matrix K to define inner product in feature space.

### Use
Learning problem; classification or clustering; may be easier to solve in some kernel. Eg: Can't find linear separator for 2 concentric rings of points in original space, but can do so in a high dimensional space.

Save space: If features are high dimensional, may not want to explicitly form feature vectors. Just use the kernel function.

## Casting data into a graph
Take data \\(\set{X_{i}}\\); use similarity measure \\(S(X_{i}, X_{j})\\); Cast into weighted similarity graph: Set \\(w_{u, v} = f(S(u, v))\\). Casting data into a graph simplifies the clustering task: there you only care about the distance.

### \htext{\\(\eps\\){eps} neighborhood graph}
\\((u, v) \in E \equiv d(u, v) < \eps\\), \\
where \\(d(u, v) = g(S(u, v))\\). Usually unweighted as \\(\eps \\) distance does not matter.

### k nearest neighbor directed graph
\\((u, v) \in E \equiv v \in KNN(u)\\).

### Fully connected graph
Useful if S(u, v) like Gaussian kernel: \\(e^{-\norm{u-v}^{2}/(2\stddev^{2})}\\).

## Find similar features
### With Clustering
Coclustering does this.

### Find covariance of various features
#### Sample points and their mean
Each sample pt \\(X^{(i)}\\) is a \\(d\\) dim vector. The mean, \\(E[X] = \mean\\); sample mean is \\(\bar{X} = n^{-1} \sum_i X^{(i)}\\).

#### Sample Covariance matrix C
Estimates \\(\covmatrix\\). So, \\(C_{i,j} = (n-1)^{-1}\sum_k (X_i^{(k)} - \bar{X_i})(X_j^{(k)} - \bar{X_j})\\) estimates \\(cov(X_i, X_j)\\). So, \\(C = (n-1)^{-1}\sum_i (X^{(i)} - \bar{X})^{T}(X^{(i)} - \bar{X})\\).

So, \\(C\\) is symmetric +ve semi-definite; and if \\(n<d\\), \\(C\\) is singular.

## Identify a good metric
### Generalized interpoint distance
Aka Mahalonobis distance. Take covariance matrix C, \\(E[X] = E[Y] = \mean\\); X, Y sample points. \\(d(X, Y) = ((X-Y)^{T}C^{-1}(X-Y))^{1/2}\\). Negates bias due to having features which mostly say the same thing while finding distance.

