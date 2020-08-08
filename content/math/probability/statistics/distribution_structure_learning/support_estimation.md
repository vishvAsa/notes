+++
title = "Support estimation"
+++


## Estimate support of a distribution D
Find set \\(S'\\) such that \\(Pr(x \notin S')<p \in (0,1]\\), given sample \\(S\\). Can be solved by probability density estimation techniques, but actually simpler.

Visualization: take the input space; draw solid ovals around sampled points; the algorithm will draw a dotted oval around these, which will represent the support of the distribution.


### With soft margin kernel hyperplane
Aka One Class SVM or OSVM.

Given \\(N\\) examples \\(\set{x_{i}}\\); project to some feature space associated with kernel \\(k(x,y) = \ftr(x)^{T}\ftr(y)\\); want to find hyperplane \\(w^{T}\ftr(x) - \gr\\) such that all points in the support fall on one side of the hyperplane, outliers fall on the other side: support identifier \\(f = sgn(w^{T}x - \gr)\\); so, allowing a soft margin, want to solve \\(\max_{\gr, w} \frac{\gr}{\norm{w}} + C\sum \gx_{i}\\) such that \\(w^{T}\ftr(x_{i}) + \gx_{i} \geq \gr, \gx_{i} \geq 0\\); \\(\equiv\\) obj function: \\(\min_{w, \gx, \gr} \norm{w}^{2}/2 + \frac{1}{\gn N} \sum \gx_{i} - \gr\\), for some coefficient \\(0 \leq \gn \leq 1\\).

Thence get Lagrangian: \\
\\(L(w, \gx, \gr, \ga, \gb) =  \norm{w}^{2}/2 + \frac{1}{\gn N} \sum \gx_{i} - \gr - \sum \ga_{i}(w^{T}\ftr(x_{i}) + \gx_{i} - \gr) - \sum \gb_{i}\gx_{i}\\) with \\(\ga, \gb \geq 0\\).

Set derivatives wrt primal vars \\(w, \gx, \gr\\) to 0 to get: \\(w = \sum_{i}\ga_{i}\ftr(x_{i}); \ga_{i} = \frac{1}{\gn N} - \gb_{i} \leq \frac{1}{\gn N}, \sum_{i} \ga_{i} = 1\\). Thence, the support identifier becomes \\
\\(f = sgn(\sum_{i}\ga_{i}k(x_{i},x) - \gr)\\); dual optimization problem becomes \\
\\(max_{\ga} - 2^{-1} \sum_{i,j}\ga_{i}\ga_{j}k(x_{i}, x_{j})\\) subject to \\(0 \leq \ga_{i} \leq (\gn N)^{-1}, \sum_{i}\ga_{i} =1\\). Solving this, discover w; then recover \\(\gr\\) using \\(\gr = w^{T}\ftr(x_{i})\\) for \\(x_{i}\\) with \\(\ga_{i} \neq 0; \gb_{i} \neq 0\\) (support vector with \\(\gb_{i} > 0\\)): \\(\exists x_{i}\\) as \\(\sum \ga_{i} = 1; \ga_{i} \geq 0\\).

#### Choosing kernel, tuning parameters
\\(\gn \propto\\) softness of the margin, number of support vectors, thence the runtime, sensitivity to appearence of novelty.

With Gaussian kernel, any data set is seperable as everything is mapped to same quadrant in feature space.

\oprob How to decide width of Gaussian kernel to use? Can you use information about the abnormal class in choosing the kernel?

#### Comparison with thresholded Kernel Density estimator
If \\(\gn = 1, \ga_{i} = 1/N\\), support identifier \\(f = sgn(\sum_{i}\ga_{i}k(x_{i},x) - \gr)\\) same as one using a Kernel (Parzen) Density estimator. What happens when \\(\gn < 1\\)?


#### Comparison with using soft margin hyperspheres
For homogenous kernels, \\(k(x,x)\\) is a constant and the dual minimization problem \\
\\(\min_{\ga}\sum_{i,j}\ga_{i}\ga_{j}k(x_{i}, x_{j}) - \sum_{i}\ga_{i}k(x_{i}, x_{i})\\) and the support identifier \\
\\(f = sgn(R^{2} - \sum_{i,j}\ga_{i}\ga_{j}k(x_{i}, x_{j}) + 2\sum_{i}k(x_{i}, x)- k(x,x) )\\) is equivalent to the minimization problem derived from the hyperplane formulation. So, all mapped patterns lie in a sphere in feature space; finding the smallest sphere containing them is equivalent to finding the segment of the sphere containing the data points, which reduces to finding the separating hyperplane.

#### Connection to binary classification
Hyperplane \\((w, \gr = 0)\\) \\
separates \\(\set{(x_{i}, 1)}\\) from \\((-x_{i}, -1)\\) with margin \\(\gr/\norm{w}\\) and vice-versa.

### Using soft margin hyperspheres
Aka Support vector data description. Here one solves: 
\\(\min_{R, \gx, c} R^{2} + \frac{1}{\gn N} \sum_{i}\gx_{i}\\) subject to \\(\norm{\ftr(x_{i} - c)}^{2}  - \gx_{i}\leq R^{2}, \gx_{i}\geq 0\\).

After using the Lagrangian, finding the critical points and substituting, this leads to the dual \\(\min_{\ga}\sum_{i,j}\ga_{i}\ga_{j}k(x_{i}, x_{j}) - \sum_{i}\ga_{i}k(x_{i}, x_{i})\\) subject to \\(0 \leq \ga_{i} \leq \frac{1}{\gn N}, \sum \ga_{i} = 1\\), and the solution \\(c = \sum \ga_{i}\ftr(x_{i})\\) corresponding to support identifier \\(f = sgn(R^{2} - \sum_{i,j}\ga_{i}\ga_{j}k(x_{i}, x_{j}) + 2\sum_{i}k(x_{i}, x)- k(x,x) )\\) \chk.

### Using Clustering
Cluster the sample, draw boundaries around the clusters. Eg: Use \\(k\\) means clustering.

## Novelty detection
### Problem
Aka Outlier detection.

In general, we want to find outliers - unlikely data-points according to the conditional distributions \\(f_{X_r|X_{\lnot r}}\\).

#### As One class classification
view as a problem where there are multiple classes, but all training examples are from one class only.

#### Motivation
Outliers are detected either to focus attention on them or to remove them from consideration.

### Using density estimation
Do density estimation; call apparently improbable data points novel.

### Using support of the distribution
Find distrubution support, call anything outside the support an outlier.

#### Ransack
One learns a model \\(M\\) (either \\(f_{X_r|X_{\lnot r}}\\) or \\(E[f_{X_r|X_{\lnot r}}]\\)) using data set \\(S\\).

Then, one finds \\(S' \subset S\\) for which \\(err(M;x) \geq t \forall x \in S'\\).

\\(S'\\) is then added to the set of outliers. 

Finally, one repeats the entire procedure till the set of outliers is stable.

### Boundary methods
#### K nearest neighbors
Estimate local density of \\(x\\) by taking avg distance to \\(k\\) nearest neighbors; similarly estimate local density of each neighbor; call \\(x\\) novel if its local density is much smaller than that of the neighbors.

#### Support vector data description
\tbc

#### PCA
Simplify the data using PCA. \tbc


