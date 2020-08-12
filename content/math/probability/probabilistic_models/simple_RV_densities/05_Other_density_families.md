+++
title = "05 Other density families"

+++
## Sampling distributions
Sampling distributions are distributions of the functions of samples drawn from other distributions.

### Standard normal square sum
Aka Chi square distribution with k degrees of freedom.

If \\(X_{i} \distr N(0, 1)\\), \\(\sum_{i=1}^{k} X_{i}^{2} \distr \chi_{k}^{2}\\). This is same as the distribution of \\(\sum (\frac{Y_{i} - \mean}{\mean})^{2}\\).

Used in goodness of fit tests. \chk

### Student's t distribution with k degrees of freedom
\\(\frac{Z}{\sqrt{W/n}}\\), with \\(Z \distr N(0, 1), W \distr \chi^{2}_{n}, Z \perp W\\).

### F distribution
\\(\frac{w_{1}/n_{1}}{w_{2}/ n_{2}} \distr F_{n_{1}, n_{2}} : w_{i} \distr \chi^{2}_{n_{i}}\\).

## Heavy tailed distributions
\\(lt_{x \to \infty}\frac{Pr(X>x)}{e^{-\eps x}} = \infty\\). Eg: Power law distribution, cauchy distribution.

### Power law distributions
\\(p(x) \propto x^{-g}; p(x) = x^{-g}Z^{-1}\\) for normalizing constant Z. \\(lt_{x \to 0} p(x) = \infty\\): so must have lower bound \\(x_{min}\\). log p vs log x graph looks like a straight line.

Aka scale free distribution. The only \why distribution with the property: \\(\exists g(b): p(bx) = g(b)p(x)\\).

A subset of heavy-tailed distribution family.

Includes Zipf's law distribution.

#### With exponential cutoff
\\(p(x) \propto x^{-\ga}e^{-x\gb}\\). log p vs log x graph looks like a straight line which suddenly bends: exponential term starts kicking in. Akin to gamma distribution.

#### Zipf's law for resource usage
Frequency/ probability of usage of resources often follows Zipf's law: Pr([res used]) \\(\propto f(resource)^{-k}\\). Eg: words used in document.

## Mixture distribution
Often, one models the pdf of \\(X\\) as being a convex combination of multiple pdf's.

## Other pdf's
### Uniform and triangular distributions
Uniform distribution; used when not information is available except min, max. Triangular distribution is used when mode is also known.

### Log normal distribution
Take \\(X \distr N(\mean, \stddev^{2})\\). Then \\(Y = e^{X}\\) has log normal distribution. Wide variety of shapes, heavy tailed.

### Gumbel distribution
Used in worst case analysis. CDF: \\(G(x|\mean, b) = e^{-e^{-\frac{x - \mean}{b}}}\\), PDF: \\(g(x|\mean, b) = \frac{e^{-\frac{x - \mean}{b}}}{b}e^{-e^{-\frac{x - \mean}{b}}}\\).

### Probability simplex coordinate powering
Aka Dirichlet distribution.
This is the conjugate prior for multinomial distribution.

Support is \\\\(\set{x \in R^{k}: \sum_i x_i = 1, x_i > 0}\\): or actually \\\\(\set{x \in R^{k-1}: \sum_i x_i < 1, x_i > 0}\\). pdf is \\(p(x; a) \propto \prod_{i=1:k} x_i^{a_i - 1}\\) for parameters \\(a \geq0\\).

#### 2-dim case
Aka beta(a,b) distribution. This takes up a wide variety of shapes: convex, concave, neither etc..

This is the conjugate prior for bernoulli/ binomial distribution - and a special case of Dirichlet distribution.

Pdf: \\(f(x) \propto x^{a-1}(1-x)^{b-1}\\) for \\(x \in [0, 1]\\).

### Wigner semicircle distribution
Supported on [-R, R], like a semicircle.

