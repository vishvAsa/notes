+++
title = "With alternate labels"
+++

## Data point Neighborhood approach
Make data pts vs data pts matrix which measures similarities; filled using labels from various, usually similar, viewpoints. Thence predict label from target viewpoint. Eg: Amazon: 'others who bought this also bought that'.

## Collaborative filtering
### Latent factor approach
Assume small number of latent random variables, which combine together to form various view points and data points, cause the labels.

#### Low rank factorization
Let values of latent RV behind data pt j be \\(v_{j}\\), behind viewpoint i be \\(u_{i}\\); then get \\(Y_{i,j} = u_{i}^{T}v_{j}\\). Want to have few random variables, so want \\(Y = U^{T}V; U \in R^{q \times N}; V \in R^{q \times D}\\), a low rank factorization of Y. Thence fill missing values.

Can use SVD: finds best rank \\(k\\) solution to \\(\norm{Y - (U\SW )V^{*}}_F\\). instead want to find \\(\norm{W \kron (Y  -  U^{T}V)}\\), where W is mask matrix to indicate known values in Y.

### Association rule mining
Look at co-occurances of various items. Eg: Walmart purchases.

Very slow.

