+++
title = "01 Distribution of values"

+++
## Specification and classes
A distribution is often specified by a pdf or a cdf involving certain parameters. Or it may be specified by a stochastic process generating some values: ie in terms of other other distributions.

Sometimes, the density specified need not even be proper (sum/ integrate to 1) to be useful: Eg: In applying the conditional probability inversion trick.

### Notation
If the pdf of \\(X\\) is a member (identified by the parameter \\(p_1\\)) of the function family \\(\set{f(p)}\\), we write \\(X \distr f(p_1)\\).

### Parameter types
Location parameters specify important points in the distribution: Eg: \\(\mean\\) in \\(N(\mean, \stddev^{2})\\) distribution.

Scale parameters specify how spread-out the distribution is. A parameter \\(s\\) is a scale parameter if, having set the location parameter to 0, \\(CDF(x; ks) = CDF(x/k; s)\\) Eg: \\(h\\) in \\(C(x; \mean, h)\\) distribution, and \\(\stddev\\) in \\(N(\mean, \stddev^{2})\\).

All other parameters are called shape parameters.

### Specify continuous distribution over bounded support
Take Indicator fn \\(I_{(a,b)}\\): See algebra ref. So, if U(a,b): \\(f(x) = (b-a)^{-1}I_{(a,b)}(x)\\). Not differentiable in boundaries.

## Inference, Sampling from distribution
See randomized algorithms ref.
