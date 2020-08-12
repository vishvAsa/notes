+++
title = "Simple RV densities"
+++

Random variables and the transformations between them are important in modeling randomness.

## Distribution of values
### Specification and classes
A distribution is often specified by a pdf or a cdf involving certain parameters. Or it may be specified by a stochastic process generating some values: ie in terms of other other distributions.

Sometimes, the density specified need not even be proper (sum/ integrate to 1) to be useful: Eg: In applying the conditional probability inversion trick.

#### Notation
If the pdf of $X$ is a member (identified by the parameter $p_1$) of the function family $\set{f(p)}$, we write $X \distr f(p_1)$.

#### Parameter types
Location parameters specify important points in the distribution: Eg: $\mean$ in $N(\mean, \stddev^{2})$ distribution.

Scale parameters specify how spread-out the distribution is. A parameter $s$ is a scale parameter if, having set the location parameter to 0, $CDF(x; ks) = CDF(x/k; s)$ Eg: $h$ in $C(x; \mean, h)$ distribution, and $\stddev$ in $N(\mean, \stddev^{2})$.

All other parameters are called shape parameters.

#### Specify continuous distribution over bounded support
Take Indicator fn $I_{(a,b)}$: See algebra ref. So, if U(a,b): $f(x) = (b-a)^{-1}I_{(a,b)}(x)$. Not differentiable in boundaries.

### Inference, Sampling from distribution
See randomized algorithms ref.

## Discrete probability distributions
### Coin toss distribution
$X \distr$ Bernoulli(p) when $range(X) = \set{0, 1}$ and $Pr(X = 1) = p$.

When $p=1/2$, $X$ is called a Rademacher RV.

#### Properties
$E[X] = p$. $Var[X] = p-p^{2}$. Same as Bin(1, p).

#### Odds of success
$\frac{p}{1-p}$. This function is used in gambling (see economics survey).

### Multiple coin-toss
Aka Binomial distribution.

This is the probability of $x$ successes in $n$ trials. \\
$X \distr Bin(n, p)$ when $Pr(X = x) = \binom{n}{x} p^{x}(1-p)^{n-x}$, $range[X] = [0, .. n]$.

#### Properties
$X = \sum X_{i}$, where $X_{i}$ is Bernoulli RV.

So, $E[X] = np$. $Var[X] = nVar[X_{i}] = np(1-p)$, even if $X_{i}$ are only pairwise independent.

The plot of the pdf looks like a discrete version of the bell curve truncated at 0 and $n$.

#### Approximations
As $n \to \infty$, it may be approximated by Poisson distribution if $p \to 0$. It is approximated by Normal distribution if p fixed.

##### With exponential decay for sq deviation distribution
From central limit theorem, $\frac{X - np}{\sqrt{np(1-p)}}$ approaches N(0, 1) as $n \to \infty$. Good if $n > (1-p)\frac{\max p, (1-p)}{\min p, (1-p)}$.

#### Poisson distribution
$\lim_{n\to \infty} Bin(n,f(n)) = Poi(nf(n)):\\
 \lim_{n\to \infty} Pr(X = x) = \lim_{n\to \infty, p \to 0} \frac{P(n, x) p^{x}(1-p)^{n-x}}{x!} = (np)^{x}e^{-np}/x!$. Number of events which occur in a given time interval: Models Rare events; arrival rates.

$E[Poi(\mean)]= \sum (\mean)^{x}e^{-\mean}/x! = \mean e^{-\mean} e^{\mean} = \mean$. Poi(m) + Poi(n) = Poi(m+n).

For Poi(m), $M_{X}(t) = e^{\mu(e^{t}-1)}$. \\
So, Chernoff bounds for Poi(m): Select $t=\ln(x/m)$ either +ve or -ve.

Looks like a discrete version of the bell curve, truncated at 0.

#### Random walk on a line
Consider a random walk of $n$ steps on the number line with start position: 0. The position changes by +1 or -1 with each step.

In expectation, due to symmetry, the final position is 0. We want to find the expected deviation from 0 in the end.

To model the number of +1 steps taken, one can use $X \distr Bin(n, 0.5)$. $E[X] = n/2$, and $Var[X] = \stddev^{2} = n/4$. $Pr(X \geq n/2(1 + \frac{k}{\sqrt{n}})) \leq 2e^{\frac{-k^{2}}{6}}$. So, whp, ye're within $O(\sqrt{n})$ of 0.

#### (balls, bins)
##### Process
Suppose that you threw $n$ balls into $m$ bins so that each ball fell into a random bin.

##### Distribution
Balls in some bin, $X_{i} \distr Bin(m,1/n) \approx Poi(m/n)$. \\
$Pr(actual) =Pr(appr|\sum X_{i}=m)$; $Pr(actual) < e\sqrt{m}Pr(appr)$.

$Pr(X_{i} = 0) = (1-1/n)^{m} \approx e^{m/n}$; So E[num empty bins]= $ne^{m/n}$; No empty bins whp: $m=n \ln n + cn$ (Coupon collector). Also, $min \approx max$ whp: $m=n \ln n + cn$. \why

Max load when n=m: whp $\Theta(\ln n/\ln\ln n)$: upper bound by Chernoff; \\
\tbc.

Birthday paradox : some bin has 2 balls: whp when $m=\sqrt{n}$: Pr ( every ball in diff bin ) = P = $\prod_{i=1}^{m} (1-\frac{(i-1)}{n}) = P(n,m)/n^{m} \approx \prod_{i=1}^{m} e^{\frac{-(i+1)}{n}} \approx e^{-m^{2}/(2n)}$.

Power of $d\geq 2$ choices: $\Theta(\ln\ln n/\ln d)$. \why

\textbf{(balls, bins) Strategies}: Find probabilities of basic events; Combine; Approximate. Use poisson approximation.


### Categorical distribution
Consider a trial with discrete and finite outcomes. Outcome i has probability $p_{i}$. The outcome can be modeled as a random variable or as a 1 of k random vector $X$. If latter, can write: $Pr(X = x) = \prod p_{i}^{x_{i}}$.

### Multinomial distribution
Consider $n$ trials - each with $k$ (discrete and finite) outcomes. Consider the $k$-dimensional random vector $X$ where $X_i$ represents the number of times outcome $i$ appears. Note that this implies $\sum_i X_i = n$.

This can be viewed as the distribution of the sum of sequence of $n$ random vectors with categorical distribution. $Pr(x) = \binom{n}{x_{1}..x_{k}} \prod p_{i}^{x_{i}}$.

### Geometric distribution
Probability of $x$ successful trials before first failure. $X \distr Geom(p): Pr(X=x) = (1-p)^{x-1}p$. Geom(p) is memoryless. Gambler's fallacy. $E[geom(p)]=1/p$. $Var[Geom(p)]=(1-p)/p^{2}$.

### Hypergeometric distribution
Parameters: N: number of balls in an urn. m: number of +ve balls. n: number of trials. You draw n balls, but, unlike binomial distribution, no replacement is allowed.

Probability of t successes: $Pr(X = k) = \frac{\binom{m}{k} \binom{N-m}{n-k}}{\binom{N}{n}}$.

### Smoothing
#### Motivation
##### Incomplete knowledge of range
Suppose that you have a discrete valued random variable $X$, and that $ran(X)$ is not completely specified beforehand: perhaps due to limited sample $S$ from $f_X$ where only values $T \subseteq ran(X)$ were observed. Suppose we want to model the distribution $f_X$.

A basic model would be to use the empirical distribution $\hat{f}_X$. But, this model will assign probability 0 to any $x \in T$. So, we may want a model which does not do this.

##### Assumption of continuous ran(X)
In this case, $ran(X)$ is actually assumed to be part of a vector space, so that no finite sample can reveal the entire $ran(X)$. Examples of smoothing to deal with this case is described in the statistics survey (eg: kernel density estimation techniques).

#### Add 1
This tries to address the problem of 'limited observation of $ran(X)$'. Suppose that $\hat{f}_X(x) = \frac{S(x)}{|S|}$, where $S(x)$ represents the number of occurrences of $x$ in the sample $S$ with the observed range $T$, is the basic unsmoothed empirical probability model. 

This can be smoothed by first adding an element a placeholder $unk$ for unobserved values to $T$ to get $T'$, and then setting the distribution $f'_X(x) = \frac{S(x) + 1}{|S| + |T'|} \forall x \in T$; note that $S(unk) = 0$. This ensures that $f'_X(x)$ sums to 1 and that $f'_X(unk)= \frac{1}{|S| + |T'|}$.

##### Add k
This generalizes add 1 smoothing by doing this:
$f'_X(x) = \frac{S(x) + k}{|S| + k|T'|}$.

$f'_X(unk)$ increases with $k$, as $\frac{l+k}{m + k} - \frac{l}{m} >0$.

#### Different additions
One generalization of add-k smoothing could be to let: $f'_X(x) = \frac{S(x) + k(x)}{|S| + \sum_x k(x)}$. Then, $f'_X(unk)$, if included, would be $\frac{k(unk)}{|S| + \sum_x k(x)}$.

Thus, this tries to compensate for limitations in sample size using some alternative model (represented by k(x)) and can accommodate an unobserved event.

##### Use backoff probabilities
This can be viewed from the perspective of backoff probabilities. Suppose there is an estimate $g_X$ different from $f_X(x) = \frac{S(x)}{|S|}$, and suppose that $\sum_x k(x) = K$. We can model $f'_X = \frac{S(x) + K g_X(x)}{|S| + K}$.

## Mode-deviation penalizers
For the important exponential decay for squared deviation from mean, see exponential distribution family chapter.

Exponential decay and bilateral-exponential decay distributions are described elsewhere.

### Inverse squared decay
Aka Cauchy distribution. Parameters: mean/ mode $\mean$, height-at-mean parameter $h$. The pdf is $C(x; \mean, h) = \pi^{-1} (\frac{h}{(x - \mean)^{2} + h^{2}})$.

#### Limited to positive deviation
Aka half-Cauchy distribution. Parameters: mean/ mode $m$, height-at-mean parameter $h$. Range of the random variable is $[m, \infty]$. The pdf is $C(x; \mean, h) = 2\pi^{-1} (\frac{h}{(x - m)^{2} + h^{2}})$.

## Exponential families
### Exponential family of distributions
#### Generated by h and feature function, parametrized by t
$x \in X \subseteq R^{d}$; Base measure $h: R^{d} \to R$, feature extraction fn $\ftr: R^{d} \to R^{k}$. $p(x; t) \propto h(x)e^{\dprod{t,\ftr(x)}} $. Exponential family: $\set{p(x; t) \forall t}$. $\ftr_i()$ aka potential functions.

Can be written as $p(x; t) = h(x)e^{\dprod{t,\ftr(x)} - G(t)} = Z^{-1}h(x)e^{\dprod{t,\ftr(x)}}$, where $G(t) = \log \sum_{X}h(x)e^{\dprod{t,\ftr(x)}}$ is the log partition fn.

$G(t)$ mayn't always exist for any t \why, so define natural parameter space: $N = \set{t \in R^{k}: -1 < G(t) < 1}$.

##### Canonical form.
Pick natural parameters such that j(t)=kt for any k: so non unique. Natural parameter space is convex. \why

##### Minimal parametrization.
If the features $\gf_i(x)$ are not linearly independent, the exponential family is overparametrized. So, the same probability distribution can be expressed using multiple distinct parameter-vectors. 

#### Undirected graphical model from exp family distribution
Let $h(x) = 1$. $e^{\dprod{t,\ftr(x)}} = \prod_i e^{t_i \ftr_i(x)}$: make cliques among terms involved in $\ftr_i(x)$.

#### Maximum entropy distribution with given means
##### The optimization problem
$\max_p H(x): E_{x \distr p}[\ftr(x)] = \mean, p \geq 0, 1^{T}p = 1$.

Equivalently, can use $H(x) = |dom(X)| - KL(p, U)$ in the objective: so finding p closest to U with the given means.

##### Lagrangian form
$\max_p \sum_x p(x)log(\frac{1}{p(x)}) + \sum_i t_i E_{x \distr p}[\ftr_i(x)] = \mean_i, p \geq 0, 1^{T}p = 1$; reduce it to $\max - KL(p, p^{*}) + \log Z$, where $p^{*}(x) = Z^{-1}e^{-\sum \sum_{i}t_{i}(\ftr_i(x) - \mean_i)}$.

So, the solution is a member of the exponential family generated by the base measure U and feature functions $\ftr()$.

##### Closest distribution to h with given means
Solve $\min_p KL(h, p): E_{x \distr p}[\ftr(x)] = \mean, p \geq 0, 1^{T}p = 1$ similarly to show that solution belongs to exponential family generated by h and $\ftr$.

##### Parametrization by means
t then corresponds to the lagrange multipliers; whose value depends on $\mean$; So, a distribution in the family can equivalently be parametrized by means $\mean$.

###### Polytope of means
The set of all possible means forms a polytope; and finding a distribution from an exponential family G then often viewed as finding a point $\mean$ in this polytope: see statistics ref.

Any $\mean$ corresponds to some p.

### Inverse Exponential decay for squared deviation from mean
Aka Normal distribution.

#### Importance
The 'bell curve' is often observed in nature. 'Normal distribution' happens to be a suitable small tailed distribution model for these phenomena.

It is also important due to the Central Limit Theorem: the estimator of the mean approaches the normal distribution as the number of samples increases.

#### 1D case
##### pdf, cdf
$X \sim N[\mu,\stddev^{2}]$: a location parameter and a scale parameter. Range(X) = R. Probability density (Gaussian) \\
$N[x | \mu,\stddev^{2}] = f_{\mu, \stddev^{2}}(X=x) = \frac{1}{\stddev \sqrt{2\pi}}exp(-\frac{(x-\mean)^{2}}{2\stddev^{2}})$.

Defined this way to ensure symmetry about $\mean$, the mean: The bell curve; inverse exponential decay away from the mean;\\ $\frac{1}{2\stddev \pi}$ factor to ensure that $\int_{-\infty}^{\infty} N[x | \mean,\stddev^{2}]dx = 1$ (aka Normalization), using Gaussian integral.

Thence confirm using direct integration: $\int N[x | \mu,\stddev^{2}] x dx = \mean$. Also, using integration by parts, $var[X] = E[X^{2}]-E[X]^{2} = \stddev^{2}$. Mode coincides with the mean.

###### Important densities
$Pr(|X - \mean| \leq \stddev) \approx .68 $.

$Pr(|X - \mean| \leq 2\stddev) \approx .95 $.

$Pr(|X - \mean| \leq 3\stddev) \approx .997 $.

##### Standard Normal distribution
$N(x|0,1) = \frac{1}{2 \pi}exp(-\frac{(x)^{2}}{2})$. Aka Z distribution. Very convenient as every normal distribution can be viewed as a standard normal rescaled and shifted.

##### CDF calculation
CDF $F(x) = \int_{-\infty}^{x} f(x)dx$ looks like sigmoid fn curve, but has no closed form. So, to calculate CDF, convert to standard normal distribution, look up corresponding entry in table. So, Inverse Exponential tail bounds hold. \chk

Often convert $X \distr N(\mean, \stddev^{2}) \to (\frac{X - \mean }{\stddev}) \distr N(0, 1)$ to use N(0, 1) CDF table to find CDF of X.

In Matlab, can use erfc and erfcinv. $F(x) = 1/2 erfc(-u/\sqrt{2})$.

##### Moment generating function
$M(t) = E[e^{tX}] = \int e^{tx}\frac{1}{\stddev \sqrt{2\pi}}exp(-\frac{(x-\mean)^{2}}{2\stddev^{2}}) dx \\
= \int e^{t\mean + \stddev^{2}t^{2}/2}\frac{1}{\stddev \sqrt{2\pi}}exp(-\frac{(x-\mean - \stddev^{2}t)^{2}}{2\stddev^{2}}) dx \\
= e^{t\mean + \stddev^{2}t^{2}/2}$ by completing the squares.

##### Other properties
If $\set{X_{i}}$ are iid $N(\mean, \stddev^{2})$, \\
using mgf, $\sum a_{i}X_{i} \distr N(\sum a_{i}\mean, \sum a_{i}^{2}\stddev^{2})$.

Log concave distribution is close to Normal: Just visualize.

If $X \sim N[0, 1]$, $f_{0,1}$ is eigenfunction of the Fourier transform. \\
Also, $E[e^{sX^{2}}] = (1-2s)^{0.5}$ \why.


#### Multidimensional case
##### Definition with univariates
$X \in R^{n}$ has multidimensional normal distribution if $\forall a \in R^{n}: a^{T}X$ has a univariate normal distribution.

It is determined compeltely by $\mean$ and covariance matrix $\covmatrix$, as for any random vector X, $a^{T}X$ has mean $a^{T}\mean$ and variance $a^{T}\covmatrix a$.

So, any subvector Y also has multivariate normal. \exclaim{So, all marginals are normal!}

##### Distribution
$x \in R^{D}$. Suppose $\covmatrix \succ 0$.

$N(x|\mean, \covmatrix) = \frac{1}{(2\pi)^{D/2} |\covmatrix|^{1/2}} e^{-\frac{1}{2}(x - \mean)^{T}\covmatrix^{-1}(x-\mean)}$. Parameters: $\covmatrix, \mean$.

###### Reformulations
$tr((x - \mean)^{T}\covmatrix^{-1}(x-\mean)) = tr(\covmatrix^{-1}(x-\mean)(x - \mean)^{T})$.

Also, often writ as $\propto e^{-2^{-1}x^{T}P_ix + \mean_i^{T}P_ix} = e^{-x^{T}Ax + b^{T}x}$. The mode-finding problem, given some sample points, is to find $\mean = A^{-1}b$, then: see Gaussian graphical model inference.

###### Singular covariance matrix
If covariance matrix is singular, the expression is ill-defined. But, one can consider a low dimensional distribution embedded in a higher dimensional space.


##### Covariance matrix is symmetric
If $\covmatrix$ is a covariance matrix, it must be symmetric. As no complex numbers are invloved, $\covmatrix^{-1}$ in exponent can be taken to be symmetric; thence $\covmatrix = \covmatrix^{T}$ assumable.

If $\covmatrix \succeq 0$: $\covmatrix  = U\EW U^{*}, |\covmatrix|^{1/2} = \prod \ew_{i}^{1/2}$.

##### Geometric view
Take level set; $N(x|\mean, \covmatrix) = c$, \\
get $\gD = (x - \mean)^{T}\covmatrix^{-1}(x-\mean) = (x - \mean)^{T}U^{*}\EW^{-1}U(x-\mean) = c'$: hyper-ellipse, with $u_{i}$ as major axes, $\ew_{i}^{1/2}$ as radii, $\mean$ as center: see topology ref.

$\gD$ is the Mahalonobis distance.

###### As product of univariate normal distribution
So, take $y = U(x-\mean)$ as new axis. Then $N(x|\mean, \covmatrix) = \\
\frac{1}{(2\pi)^{D/2} \prod \ew_{i}^{1/2}} e^{-\frac{1}{2} \prod \frac{y_{j}^{2}}{\ew_{j}}}$: thus factored into a product of univariate normal distribution variables.

###### A special case
If $(X_{i})$ are $\perp$, $\covmatrix$ is diagonal, then this boils down to product of univariate normal distributions, as expected.

##### Product of normal distributions
$N(\mean_1, \covmatrix_1 = P_1^{-1}) + N(\mean_2, \covmatrix_2 = P_2^{-1}) = N(\mean, \covmatrix)$ with $\covmatrix^{-1} = P = (P_1 + P_2)$, $\mean = (\mean_1^{T}P_1 + \mean_2^{T}P_1)P^{-1}$: consider the form of the exponent: $-2^{-1}\sum_i x^{T}P_ix + \mean_i^{T}P_ix$.

#### \htext{$\infty$}{..} dimensional Normal distribution
Aka Gaussian process. $\infty$ dimensional distribution, whose content in every finite dimensional subspace holds a finite dimensional Normal distribution. A gaussian distribution on functions.

#### Gaussian graphical models
##### Uncorrelated variables
Take the graphical model graph G corresponding to the multidimensional normal distribution. Take precision matrix $V = \covmatrix^{-1}$. $V_{i,j} = 0$ corresponds to pairwise independence $X_i \perp X_j| X_{V - \set{i,j}}$ in G, and to the factorization $f_X(x) = \prod f_{i,j: V_{i,j} \neq 0}(x_i, x_j)$.

Inference in this graphical model is often interesting: it is equivalent to solving Ax = b for symmetric a.


### 1D distributions from exponential family
#### Polynomial rise with inverse exponential decay for largeness
Aka Gamma distribution gamma(a, b).

Models time to complete some task.

pdf $f_X(x) = \frac{b^{-a}x^{a-1}e^{-x/b}}{\gG(a)} \propto x^{a-1}e^{-x/b}$ for $x \in [0, \infty]$: Pf: using $\gG()$ defn. Mean $\mean = ab; var[X] = ab^{2}$ using $\gG()$ properties. By finding critical point of f(x), mode is b(a-1).

This is a single mode distribution.

###### Inverse Gamma distribution
The distribution of U = 1/X, where $X \distr gamma(a, b)$.

This is again a single mode distribution.

##### Exponential decay distribution \htext{$expo(\mean)$}{..}
pdf: $f(x; m) = m^{-1}e^{-x/\mean}$ for $x \in [0, \infty]$. Same as $gamma(1, \mean)$.

CDF $F(x) = 1 - e^{-x/\mean}$ iff $x\geq 0$.


$m$ is mean by integration by parts.

$var[X] = m^{2}$: use integration by parts to find $E[X^{2}]$; find $E[X^{2}] - m^{2}$.

###### Shift parameter
Note that analogous distributions $f(x;t, m)$ can be defined with support $x \in [t, \infty]$ by adding a location parameter $t$.

###### Bilateral-exponential decay distribution
Aka double-exponential decay distribution. Aka Laplace distribution.

pdf $f(x; t, m) = \frac{1}{2m} e^{-|x - t|/m}$.


###### The graph
Mode is 0. You get an exponential tail. $\frac{1}{\mean}$ controls when the exponential decay kicks in. Aka exponential clock.


## Other density families
### Sampling distributions
Sampling distributions are distributions of the functions of samples drawn from other distributions.

#### Standard normal square sum
Aka Chi square distribution with k degrees of freedom.

If $X_{i} \distr N(0, 1)$, $\sum_{i=1}^{k} X_{i}^{2} \distr \chi_{k}^{2}$. This is same as the distribution of $\sum (\frac{Y_{i} - \mean}{\mean})^{2}$.

Used in goodness of fit tests. \chk

#### Student's t distribution with k degrees of freedom
$\frac{Z}{\sqrt{W/n}}$, with $Z \distr N(0, 1), W \distr \chi^{2}_{n}, Z \perp W$.

#### F distribution
$\frac{w_{1}/n_{1}}{w_{2}/ n_{2}} \distr F_{n_{1}, n_{2}} : w_{i} \distr \chi^{2}_{n_{i}}$.

### Heavy tailed distributions
$lt_{x \to \infty}\frac{Pr(X>x)}{e^{-\eps x}} = \infty$. Eg: Power law distribution, cauchy distribution.

#### Power law distributions
$p(x) \propto x^{-g}; p(x) = x^{-g}Z^{-1}$ for normalizing constant Z. $lt_{x \to 0} p(x) = \infty$: so must have lower bound $x_{min}$. log p vs log x graph looks like a straight line.

Aka scale free distribution. The only \why distribution with the property: $\exists g(b): p(bx) = g(b)p(x)$.

A subset of heavy-tailed distribution family.

Includes Zipf's law distribution.

##### With exponential cutoff
$p(x) \propto x^{-\ga}e^{-x\gb}$. log p vs log x graph looks like a straight line which suddenly bends: exponential term starts kicking in. Akin to gamma distribution.

##### Zipf's law for resource usage
Frequency/ probability of usage of resources often follows Zipf's law: Pr([res used]) $\propto f(resource)^{-k}$. Eg: words used in document.

### Mixture distribution
Often, one models the pdf of $X$ as being a convex combination of multiple pdf's.

### Other pdf's
#### Uniform and triangular distributions
Uniform distribution; used when not information is available except min, max. Triangular distribution is used when mode is also known.

#### Log normal distribution
Take $X \distr N(\mean, \stddev^{2})$. Then $Y = e^{X}$ has log normal distribution. Wide variety of shapes, heavy tailed.

#### Gumbel distribution
Used in worst case analysis. CDF: $G(x|\mean, b) = e^{-e^{-\frac{x - \mean}{b}}}$, PDF: $g(x|\mean, b) = \frac{e^{-\frac{x - \mean}{b}}}{b}e^{-e^{-\frac{x - \mean}{b}}}$.

#### Probability simplex coordinate powering
Aka Dirichlet distribution.
This is the conjugate prior for multinomial distribution.

Support is \\$\set{x \in R^{k}: \sum_i x_i = 1, x_i > 0}$: or actually \\$\set{x \in R^{k-1}: \sum_i x_i < 1, x_i > 0}$. pdf is $p(x; a) \propto \prod_{i=1:k} x_i^{a_i - 1}$ for parameters $a \geq0$.

##### 2-dim case
Aka beta(a,b) distribution. This takes up a wide variety of shapes: convex, concave, neither etc..

This is the conjugate prior for bernoulli/ binomial distribution - and a special case of Dirichlet distribution.

Pdf: $f(x) \propto x^{a-1}(1-x)^{b-1}$ for $x \in [0, 1]$.

#### Wigner semicircle distribution
Supported on [-R, R], like a semicircle.


