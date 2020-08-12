+++
title = "Random variables"
+++

## Random variable (RV) X
### Map sample space to measurable space
Consider the probability space $(S, \gs(S), v)$ and a measurable space $R$ with an associated measure $\gm$ and sigma algebra $G$, aka state space.

$X:S \to R$, where $X$ is a $(\gs(S), \gs(R))$ measurable function is a random variable (RV). To emphasize the (sigma algebra membership) structure preserving properties, we write: $X:(S; F, v) \to R$.

Note that $(R, \gs(R))$ is usually $(\Re, B)$, where B is the union and complement closure of the set of (semi)open intervals.

So, the correct way to write a RV is: $X(o) = x$, value of $X$ over $o \in S$.

### Induced Probability measure Pr
$X$ induces a probability measure over the space $(R, \gs(R))$. This is aka probability distribution.

\exclaim{Never write $Pr(X)$, but $Pr(X = x)$ is fine!}

#### Probability density function (pdf) wrt measure m
Consider a measure $m$ (such that $Pr<<m$) over the measurable space $(R, \gs(R))$. The pdf wrt $m$ is the inter-measure (Radon/ Nikodym) derivative between $(v, m)$, if it exists.

So, it is any function $f$ such that $Pr(X \in E) = \int_E f(x) dm = \int_{X^{-1}(E)}dv$.

Note that $f$ has the property that \\$\int_{R} f(x) dm = Pr(X \in R) = 1$.

##### Notation
The pdf associated with a random variable $X$ is often denoted by $f_X$.

##### Not probability measure
Note that $f$ is not a probability measure: Together with $m$, it only helps specify $Pr$. Specifically, $f(x) \neq Pr(X=x)$ in general.

Note that $f(x) \to \infty$ as $x \to t$ is possible - but this would be impossible for a probability.

##### Probability mass function (pmf)
Consider the case where range(X) is discrete. Then, the pdf $f(x) = Pr(X = x)$ when used with the counting measure. Such a pdf is called a pmf.

##### Support
$\set{x: f_X(x) \neq 0}$ support of the distribution of $X$.

##### Improper densities
Aka pseudo-density. Sometimes, the pdf is specified in a form which does not sum to 1. $f_X(x) = \frac{p_X(x)}{Z}$, where the constant $Z$ is not specified.

##### In terms of cdf
Derivation trick for some pdf's defined in terms of CDF's:\\ $\int_{-\infty}^{y} F(x)^{a} f(x)dx =  \frac{F(y)^{a}}{a}$.

#### Cumulative density functions (CDF)
Take any real valued RV. $F(x) = Pr(X \in [-\infty, x])$. If the pdf exists, this is $\int_{-\infty}^{x} f(x) dx$. Can by itself describe distribution - pdf need not exist; but important for describing continuous distributions.

##### Notation
The CDF associated with a random variable $X$ is often denoted by $F_X$.

##### Properties
The CDF is monotonically increasing. It is right continuous.

##### Connection to discreteness
$X$ is discrete (ie its range is discrete) iff $F_X$ is a step function.

$X$ is continuous iff $F_X$ is continuous.

##### Multidimensional case
Just $F(x) = \int_{(-\infty)^{d}}^{x} f(x) dx$ if $x\in R^{d}$!

##### Quantiles
points taken at regular intervals from CDF. Types: Percentiles, deciles etc..

#### Entropy
See information and coding theory ref.

### Importance
Random variables allow us to express probability measures simply using pdf's and pmf's.

Furthermore, they allow us to study models where an underlying random process (probability space) results in observations in a different space (the range of a random variable).

### Random variable for probability space
For analyzing arbitrary probability spaces using properties/ notation of random variables, one can simply add on a measurable space $R'$ and a measurable function $X$: $R'$ could even be the probability space itself!

#### Indicator RV
The indicator function corresponding to the event set can be used as a 2-range random variable: see algebra ref.

### RV from a map
Let $X$ be an RV. Consider a measurable function $h:ran(X) \to ran(Y)$. $Y = h(X)$ is a random variable itself.

#### Monotonic maps
Let $h$ be monotonic.

##### CDF
If $h$ is increasing: $F_X(x) = F_Y(h(x))$.

If $h$ is decreasing: $F_Y(h(x)) = 1 - F_X(x)$.

##### pdf
Consider $f_Y(y) = \frac{dF_y(y)}{dy} = \frac{dF_x(h^{-1}(y))}{dy}$. By chain rule, and using the CDF relationships from earlier, $f_Y(y) = f_X(h^{-1}(y)) \abs{\frac{dh^{-1}(y)}{dy}}$.

##### Utility
This is useful in sampling complex distributions by transforming random variables with easy to sample distributions. The monotonicity is useful because we often 'stretch' parts of range(X) to form range(Y) in order to arrive at the more complex distribution of Y.

## Multiple random variables
### Random vector
A random vector is an n-dim vector $X = (A_{i})$, which are a bunch of jointly distributed random variables. Similarly, $X$ can be a $m \times n$ random matrix.

Below, we consider $X = (X_1, X_2)$, where $X_1:(S_1; F_1, v_1) \to R_1$ and $X_2:(S_2; F_2, v_2) \to R_2$.

A random vector is itself a random variable $X:(S_1 \times S_2; F_1 \times F_2, v) \to (R_1 \times R_2)$.

#### Marginalization
The marginalization properties of the joint/ product probability space leads to: $Pr(X_1 \in E_1, X_2 \in S_2) = Pr(X_1 \in E_1)$, so \\$\int_{E_1 \times S_2} f_X(x) dv = \int_{E_1} \int_{x_2 \in S_2} f_{X}(x_1, x_2) dv_2 dv_1 = \int_{E_1} f_{X_1}(x_1)dv_1$.

Hence, $\int_{x_2 \in S_2} f_{X}(x_1, x_2) dv_2 = f_{X_1}(x_1)$.

### Conditional pdf
Definition (described elsewhere) \\of conditional probabilities of the form $Pr(A|B)$ breaks down if $Pr(B)$, the probability measure of the event $B$ is 0.

One can craft a similar definition to cover events $X_2 = b$ with $v_2(X_2 = b) = 0$. Then, \\$Pr(X_1 \in E_1| X_2 = b) = \frac{Pr(X_1 \in E_1 \land X_2 = b)}{f_{X_2}(b)} = \\
\int_{E_1} f_{X}(x_1, b) f_{X_2}(b)^{-1} dv_1$.

$f_{X}(x_1, b) f_{X_2}(b)^{-1} = f_{X_1|X_2 = b}(x_1)$ is aka conditional pdf.

#### Inversion
Similar to the Bayes's rule, using the definition, one can invert the conditional pdf.

$f_{X_2|X_1 = x_1}(x_2) = \frac{f_{X_1|X_2 = x_2}(x_1)f_{X_2}(x_2)}{f_{X_1}(x_1)} = \frac{f_{X_1|X_2 = x_2}(x_1)f_{X_2}(x_2)}{\int_{S_2} f_{X_1|X_2 = x_2}(x_1)f_{X_2}(x_2) dv_2}$.

##### Improper densities
Note that the construction of $f_{X_2|X_1 = x_1}(x_2)$ works even if the prior pdf $f_{X_1}(x_1)$ is an improper density which does not sum to 1! This sometimes makes the task of modeling random processes easier.

### Independence
One can extend the notion of independence of events to random variables, which represent a pair of algebras of events.

Suppose that $f_{X}(x) = f_{X_1}(x_1)f_{X_2}(x_2)$. Then,  $\forall E_1, E_2: Pr(X_1 \in E_1, X_2 \in E_2) = Pr(X \in E_1)Pr(X_2 \in E_2)$. In such a case, $X_1$ and $X_2$ are independent. This is denoted by $I(X_1, X_2)$.

Also independence of events corresponds to independence of corresponding Indicator random variables: $A \perp B$ if $I_A \perp I_B$.

### Conditional Independence
Conditional: \\$X \perp Y|Z$ $\equiv  f_{XY|Z}(x, y|z) = f_{X|Z}(x|z)f_{Y|Z}(y|z) \equiv f_{X|Y, Z}(x|y,z) = f_{X|Z}(x|z) \\
\equiv  f_{X, Y, Z}(x, y, z) = \frac{f_{X, Z}(x,z)f_{Y, Z}(y, z)}{f_Z(z)}$.\\
Marginal: $X \perp Y$ when $Z = \nullSet$.

Amongst sets of vars: $\set{X_{i}} \perp \set{Y_{i}}|\set{Z_{i}}$ iff \\
$f_{(X_{i}|Y_{j},\set{Z_{k}})}(x_{i}|y_{j},\set{z_{k}}) = f_{(X_{i}|\set{Z_{k}})}(x_{i}|\set{z_{k}}) \forall i, j$.

Marginal independence without conditional independent: \\
$X \nvdash Y| X+Y$. Conditional independent sans marginal independent: consider suitable Bayesian network.

Graphical models can be used to specify this.


## Averaging using the pdf
Consider the real valued random variable $X: (S, B) \to (R, B_r, m)$, whose pdf is $f_X$ defined relative to the reference measure $m$.

### Mean/ Expectation of real valued RV
Aka Expected value. $E:\set{RV} \to R$. $E[X] = \mean = \int_{X} x f_X(x) dm = E_{X}[X]$.

This is the weighted average of $range(X)$. $E[X]$ is actually a convex combination of points in range(X).

#### Subscript notation
See probability section.

#### Conditional Expectation
Conditional expectation of X wrt event A: $E_{X}[X|A]$ is computed  using the conditional pdf $f_{X|A}(x)$. Sometimes, this is considered as a function of variable $A$.

For events with non-0 probability measure, this is $= \frac{E[X I_A(X)]}{Pr(A)}$.

### Expectation: Properties
$E_Y[E_{X}[X|Y]]= E_Y[f(Y)] = E_{X}[X]$.

#### Connection to probability measure
$Pr(B) = E_{X}[Pr(B|X)]$.

If $X$ is an indicator RV, E[X] = Pr(X = 1).

#### Products of independent RV
If expectations are finite: $I(X,Y) \equiv E_{X, Y}[XY]=E_{X}[X]E_Y[Y]$ as $I(X,Y) \equiv f_{X, Y}(x, y) = f_X(x)f_Y(y)$.

#### Linearity properties
$E[k]=k$.

##### Linearity in X
This follows from the linearity of integration.\\ $E[\sum_{i} X_{i}] = \int_{X} (\sum_{i} x_{i}) f_X(x) dm = \sum_{i} \int_{X} x_{i} f_X(x)dm\\ = \sum_{i} \int_{X_i} x_{i} f_{X_i}(x)dm = \sum_{i}E[X_{i}]$

Expectation is linear, even if the summed RVs are dependent.

\exclaim{E[X] is convex!}

##### Importance
\exclaim{Powerful, unintuitive!} 10 folks go to a ghoShTi, leave their hats; retrieve some random hat after the ghoShTi. What is the expected number of people to retrieve the hat they came with? Linearity greatly simplifies calculation.


##### Linearity in pdf
Consider $E[X]$, where $f_X(x)$ is a convex combination of $(f_i(x))$ with coefficients $(a_i)$. Because of the linearity of integration, $E[X]$ is linear in the pdf components: $E[X] = \sum_i a_i E_{f_i}[X]$.

#### Convex function of E[] inequality
Aka Jensen's inequality.

If f is convex, $E[f(X)] \geq f(E[X])$:  \pf{E[X] is actually a convex combination of points in range(X). So, follows directly from definition of convexity (see vector spaces ref).}

So: $E[X^{2}]-(E[X])^{2} \geq 0$.

### Expectation: Analysis tricks
If $X$ and Y are not independent, fix the factor in $X$ and Y which causes the dependence, and ye may have independence.

The fact that $\max X \geq E[X]$ is useful in getting lower bounds on some quantities.


### Variance from mean
$Var[X] = \stddev^{2} = E[X-E[X]]^{2} = E[X^{2}]-(E[X])^{2}$. Weighted avg of square deviation from mean of function over points in sample space.

#### Concavity in p
Consider discrete distributions; let x be a vector of values $X$ takes. $var[X] = p^{T}x - x^{T}pp^{T}x$.

#### Other properties
$Var[\sum a_{i}X_{i}] = \sum a_{i}^{2}Var[X_{i}]+2\sum_{i}\sum_{j}a_{i}a_{j} Cov[X_{i},X_{j}]$: using linearity of expectations on $E[(\sum_{i} (a_{i}X_{i} - a_{i}\mean_{i}))^{2}]$.

##### Translation invariance
var[X + c] = var[X].

### Moments of RV X
#### kth moment
$E[X^{k}]$ is the kth Moment of X. Empirical kth moment is $\frac{\sum_{i=1}^{n} X_i^{k}}{n}$

#### kth moment about the mean
kth Moment of $X$ about 0 : $E[X^{k}]$ vs moment of $X$ about $\mean$ aka central moment: $E[(X - \mean)^{k}]$.

Normalized moments: $\frac{E[(X - \mean)^{k}]}{\stddev^{k}}$.

#### Important moments
Central moment immune to translation; describes shape of pdf. 2nd central moment, aka variance, measures fatness.

Skewness: $\gamma = \frac{E[X - \mean]^{3}}{\stddev^{3}}$: putting more weight on farther points; pdf has left skew if $\gamma<0$.

Kurtosis: measure tallness/ leanness vs shortness/ squatness: $\frac{E[X - \mean]^{4}}{\stddev^{4}} - 3$: 3 term ensures that Normal distribution has Kurtosis 0.

Can easily determine statistics corresponding to these parameters from a sample.

The moments of $X$ completely describe pdf of $X$ \why. $N(\mean, \stddev^{2})$ has only 2 moments \chk.

#### Moment generating function
$M_{X}(t)=E[e^{tX}]$. \\
$\frac{dE[f(x,t)]}{dt} = \frac{d \int f(x, t) dx}{dt} = lt_{\del\int (f(x, t+\del t) - f(x, t))dx \to 0}\frac{}{\del t} = E[\frac{df(x,t)}{dt}]$. So, use to find nth moment of $X$ about 0, $E[X^{n}]=d^{n}M_{X}(t)/(dt)^{n}|_{t=0}$: can also use Taylor series for $e^{tX}$ with linearity of expectations.

It is unique: If $M_{X}(t) = M_{Y}(t)$, $X$ and Y have same distribution: as it generates all possible moments of $X$ and Y identically. \why

$M_{\sum X_{i}} = E[e^{t \sum X_{i}}] = \prod M_{X_{i}}$ if $\set{X_{i}} \perp$.

#### Characteristic function of X
$f_{X} = E_{X}[e^{itX}]$. Useful as sometimes, the moment generating function is not well defined.

#### For Poisson trials
$M_{X_{i}}(t)=1+p_{i}(e^{t}-1) \leq e^{p_{i}(e^{t}-1)}$. So, if $X = \sum X_{i}, \mean = \sum p_{i}; M_{X} \leq e^{\mean(e^{t}-1)}$.

## Random Vector properties
### Mean
$E[X] \dfn (E[X_i])$.

#### Linearity
If $X$ is a random matrix, A, B, C are constant matrices: $E[AXB + C] = AE[X]B + C$. Proof: by using $(AXB)_{i, j} = A_{i,:} X B_{:, j}$, which is a linear combination of $X_{k,l}$.

Also, if $X$ is random vector, $E[a^{T}X] = a^{T}E[X]$.

### Covariance
#### Definition
How correlated are deviations of X, Y from their means?\\
$cov(X, Y) = E_{x, y}[(X - E[X])(Y - E[Y])]$.

##### Extension to vectors
$cov(X, Y) = E_{x, y}[(X - E[X])^{T}(Y - E[Y])]$:\\ corresponds to measuring $cov(X_i, Y_j)$.

#### Correlation
(Pearson) correlation coefficient: $corr(X, Y) = \frac{cov(X, Y)}{\stddev_{X}\stddev_{Y}}$: normalized covariance.

##### Correlation vs Independence
If $X_{i}\perp X_{j}, Cov[X_{i},X_{j}] = 0$: even if they are only pairwise independent. But, \\
$cov(X, X^{2}) = 0$ even if $(X, X^{2})$ not $\perp$.

If $Cov[X_{i},X_{j}] = 0$ holds, then Xi and Xj are uncorrelated. If they are independent, they are uncorrelated; but not necessarily vice versa.

### Covariance matrix
$\covmatrix = var[X] = cov(X, X) = E[(X-\mean)(X-\mean)^{T}] = E[XX^{T}] - \mean \mean^{T}$.

Diagonal has variances of $(X_{i})$. It is diagonal if $(X_{i})$ are independent.

#### Effect of linear transformation
$Var[BX + a] = E[(BX - BE[X])(BX - BE[X])^{T}] = BVar[X]B^{T}$. As in the scalar case, constant shifts have no effect.

Special case: $var[a^{T}X] = a^{T}var(X)a$.

#### Nonnegative definiteness
$\covmatrix \succeq 0$ as $a^{T}E[(X-\mean)(X-\mean)^{T}]a \geq 0$.

If $a^{T}\covmatrix a = 0$, with probability 1, $a^{T}X - a^{T}\mean = 0$, so some $\set{X_i}$ are linearly dependent. So, $X$ lies on the hyperplane/ subspace with normal a.

#### Precision matrix
$V = \covmatrix^{-1}$. Consider partial correlation deduced in case of multidimensional normal distribution.

#### Moment generating function
$E[e^{t^{T}X}]$ is the moment generating function.

## Random variable sequence
$(X_{i})$ with CDF $(F_i)$.

### Convergence in distribution to X
Aka weak convergence. If $\forall x: \lim_{n \to \infty} F_n(x) = F(x)$, then $X_n \to^{d} X$. Comments about limit of CDF's.

### Convergence in probability to X
If $\forall \eps: \lim_{n \to \infty}Pr(|X_n - X| > \eps) = 0$, say $X_n \to^p c$; so limit of sequence of probabilities. Probability of deviation from $X$ grows smaller and smaller, but doesn't necessarily hit 0. Eg: Weak law of large numbers.

Implies convergence in distribution.

### Almost sure convergence
$Pr(\lim_{n \to \infty}(X_n = X)) = 1$: Note that $\lim$ is inside Pr(); so limit of sequence of boolean events. Eventually, $X_n$ will behave exactly like X. Eg: Animal's daily consumption will some day hit 0 and stay 0.

Implies convergence in probability.

### Sure convergence
All $X_n$ are over exactly same sample space $\gO$. $\forall w \in \gO: \lim_{n \to \infty} X_n(w) = X(w)$. Implies all other forms of convergence.

