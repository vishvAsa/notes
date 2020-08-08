+++
title = "Dimensionality reduction"
+++

## General motivations
Perhaps one wants to find closest vectors to a given vector - perhaps for the purpose of executing the nearest neighbor algorithm.

Computational efficiency - as in the case of Most variable subspace identification (PCA).

Noise reduction - it could be that many of the features in a vector are not very informative.

## Latent factor modeling
### Problem
Here, one derives generative models to describe  affinity of one discrete variable (say \\(U\\)) with another (say \\(V\\)): eg: features and objects, documents and words.

In the process, one derives low dimensional representation of both these entities. 

#### Matrix view
Suppose that you are given a matrix \\(A\\) whose entires represent affinities between two types of entities. One may need to find a model the strength of this association which is robust to noise in the observations/ which is succinct.

#### Linear model
A linear model would be: \\(A_{ij} = \dprod{u_i, v_j}\\), where \\(u_i\\) and \\(v_j \in R^k\\) are low dimensional representations of entities \\(i\\) and \\(j\\). Precisely, given that those entities are represented by \\(A_{i,:}, A_{:,j}\\), we want to find \\(U^{k}, V^{k}\\) such that \\(A \approx U_k^{T} V_k\\).

#### Motivation
So the motivations described for dimensionality reduction in general apply. In addition, this can be used to find unobserved affinities between entities.

### Matrix factorization by SVD
Taking the top singular vectors, we know that: \\(\norm{A - U_k \SW_k V_k ^T}_2^2\\) is minimzed.

This is a very common form of 'Latent semantic analysis'.

### Non-negative matrix factorization
There could be other constraints such as requiring that the lower dimensional representations be non negative. Non negative matrix factorization is considered elsewhere.

### Probabilistic modeling
Probabilistic models for affinities between the two entity types are considered in the probabilistic models survey.

## Linear dimensionality reduction
A linear map (Eg: a projector) is used on the data to reduce dimensions. So, ratio of distances amongst points are preserved.

### Most variable subspace identification
Aka Principal component analysis (PCA).

#### Problem
Suppose that you have a \\(m \times n\\) data matrix \\(A\\) of \\(n\\) \\(m-\\)dimensional data points. Suppose that we want a very good low dimensional representation of these data points. We have a bunch of points, and we want to pick \\(k < m\\) orthogonal axes along which the data has the greatest variability.

One can visualize most of the data points as being contained in a m-dimensional hyperellipse, whose top \\(k\\) axes we want to use to represent the data points in a low dimensional space.

#### Motivation
Suppose one needs to compare a \\(v \in R^m\\) with all column vectors in \\(A\\) - as in the case of object matching. Computing \\(n\\) inner product is an \\(O(m^2n)\\) operation. By dimensionality reduction, we want to turn this into an \\(O(k^2n)\\) operation. Besides, the latter may be a way to overcome noise - ie ignore unimportant features.

#### Preprocessing, problem statement
One can always get a matrix \\(B\\) with rows centered around the mean. This will enable us to write the covariance matrix as \\(C = n^{-1}BB^{T}\\). We want to find a linear transformation \\(L\\) such that \\(\norm{LL^{T} - BB^{T}}_F^2\\) is minimized.

#### Solution
Using the properties of the SVD. \\(B = U \SW V^{*}\\), \\(BB^{T} = U\SW^{2}U^{*}\\). This covariance matrix can be approximated by \\(nC_k = U_k\SW_k^{2}U_k^{*}\\). So, from \\(\EW_k = \SW_k^{2} = U_k^{*}BB^{T}U_k\\), we see that the low dimensional transformation of \\(B\\), which ensures that most of the variability in the data is preserved, is given by the orthogonal map \\(U_k^{*}B\\).

#### Best target dimension k
Sometimes, can pick the top \\(k\\) ev, so that there is a steep gap betweek \\(\ew_q\\) and \\(\ew_{q+1}\\).

#### Comments
+++(So, the top ew/ sw of the covariance matrix define the subspace of highest variability.)+++

### Factor analysis
Model thus: \\(x - \mean = Lf + \eps\\). \\(x \in R^{d}, L \in R^{d*k}\\). Reducing \\(x\\) to \\(k\\) dimensional vertex. Ideally, cov(f) = I, \\(f \perp \eps, E[f] = 0\\). \\(L\\) is loading matrix, f are factors.

Arrange centered data points as columns of X-M. Then, trying to factor this into LF.

## Supervised linear dimensionality reduction
Labelled data. Done for classification etc..

### Linear discriminant analysis
#### The problem
(Fisher) Want to do dimensionality reduction for the purpose of classification. If \\(x \in R^{d}\\), want to project data points to some k-1 dimensional hyperplane; what is the best hyperplane to do this?

You want to maximize after-projection inter-class scatter: separate means widely, but minimize after-projection intra-class scatter.

Usually k-1 dim hyperplane desired: then you can find a hyperplane between every pair of classes. So you project with \\(y = W^{T}x\\) for orthogonal \\(d*(k-1)\\) dim W.

#### The solution
Before projection: Take \\(S_{T} = \sum_{x}(x - m)(x - m)^{T}\\): total scatter; \\(S_{W} = \sum_{i=1}^{k} \sum_{x \in C_{i}}(x - m_{i})(x - m_{i})^{T}\\): within class scatter matrix; \\(S_{B} = \sum_{i=1}^{k}n_{i}(m_{i}-m)(m_{i}-m)^{T}\\): between class scatter matrix. So, \\(S_{T} = S_{W} + S_{B}\\). Note: \\(S_B\\), the sum of \\(k\\) rank 1 matrices, has rank k-1; so only k-1 ew's are non 0. If \\(k\\) = 2, can define differently: \\(S_B = (m_1 - m_2)(m_1 - m_2)^{T}\\).

After projection scatters will be: \\(S_{W}' = W^{T}S_{W}W, S_{B}' = W^{T}S_{B}W\\). Find \\(\max_{W} \frac{|W^{T}S_{B}W|}{|W^{T}S_{W}W|}\\) or maybe \\(\max_{W} tr((W^{T}S_{W}W)^{-1}(W^{T}S_{B}W))\\), with W having (k-1) independent columns. Maximized by top k-1 generalized ev: see linear algebra ref.

If \\(S_{W}\\) is invertible, same as ev problem \\(S_{W}^{-1}S_Bx = \ew x\\): solution is the top k-1 ev; but matrix is assymetric, so finding ev harder. If just projecting to a line, can also get problem \\(S_{W}^{-1/2}S_{B}S_{W}^{-1/2}x = \ew x\\). See linear algebra ref.

## Non-linear dimensionality reduction
### Kernel PCA
Represent data in feature space corresponding to some kernel, use PCA.

### Manifold learning
Consider the swiss roll/ tissue paper roll dataset. This is a 2 dimensional manifold in a 3-dim space.

\tbc

### Measuring goodness
How well are k-NN properties preserved? Neighborhood rank preserved even if magnitude is not.

