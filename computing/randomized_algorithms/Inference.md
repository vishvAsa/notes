+++
title = "Inference"

+++
Here we only consider inference by sampling. Inference techniques particular to various model classes are considered elsewhere.

## Inference problems
Find Pr(X=x) or \\(Pr(X=x|Y=y)\\). Inference algorithms may be exact or approximate.

Or find E[X] or \\(E[X|Y=y]\\).

Or find the mode of \\(Pr(X=x|Y=y)\\): as done in case of Maximum likelihood estimation.

### Difficulty in calculating Pr(X=x)
Pr(X=x) can be difficult to calculate analytically. One could specify \\(Pr(X=x) = Z^{-1}f(x)\\) by leaving the normalization constant Z unspecified, and describing only \\(f(x)\\).

Similarly, \\(Pr(X=x|Y=y)\\) can involve solving the 'summation problem'.

Can be difficult due to not knowing the normalization constant.

Often probability of an event T cannot be estimated analytically, even when probability of an atomic event is known. Eg: Consider uniform density over a bounded space in \\(R^{d}\\), consider an irregular shape in it representing event T; now find Pr(T). Ye can throw darts/ sample to find the area (Monte carlo!). Or construct a grid to calculate the volume of the irregular shape: but here the computation will be \\(N^{d}\\), where N is number of grid points in each dimension.

## Inference by sampling
### Rejection sampling
To find \\(E[f(X)|E_1]\\), Sample from distribution of X, reject samples for which \\(\lnot E_1\\), then use remaining points to find avg f(X).

### Set counting techniques
Design sample space, sample m times to estimate event probability.

Maybe iteratively constrict sample space and multiply probabilities, derive number of events: Thus, one finds \\\\(Pr(E_{1}), Pr(E_{2}| E_{1}) ..\\) finally finding \\(Pr(Y|E_{1} .. )\\); thence finding Pr(Y).

## Inference quality
### FPRAS for (eps, d) approx.
RAS: Randomized approximation scheme. Suppose \\(Pr(|m^{-1}\sum^{m}_{i=1} (X-\mu)|\geq \epsilon \mu) \leq d\\). If \\(m\\) is FP (Fully Polynomial) in \\(\ln(\frac{2}{d}), \epsilon^{-2}, |x|\\), we have a FPRAS. From Chernoff bound : \\(m \geq \frac{3\ln(\frac{2}{d})}{\epsilon^{2}\mu}\\).

### Fully poly almost uniform samplers (FPAUS)
\tbc
