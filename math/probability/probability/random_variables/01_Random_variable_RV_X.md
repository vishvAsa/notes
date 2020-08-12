+++
title = "01 Random variable (RV) X"

+++
## Map sample space to measurable space
Consider the probability space \\((S, \gs(S), v)\\) and a measurable space \\(R\\) with an associated measure \\(\gm\\) and sigma algebra \\(G\\), aka state space.

\\(X:S \to R\\), where \\(X\\) is a \\((\gs(S), \gs(R))\\) measurable function is a random variable (RV). To emphasize the (sigma algebra membership) structure preserving properties, we write: \\(X:(S; F, v) \to R\\).

Note that \\((R, \gs(R))\\) is usually \\((\Re, B)\\), where B is the union and complement closure of the set of (semi)open intervals.

So, the correct way to write a RV is: \\(X(o) = x\\), value of \\(X\\) over \\(o \in S\\).

## Induced Probability measure Pr
\\(X\\) induces a probability measure over the space \\((R, \gs(R))\\). This is aka probability distribution.

\exclaim{Never write \\(Pr(X)\\), but \\(Pr(X = x)\\) is fine!}

### Probability density function (pdf) wrt measure m
Consider a measure \\(m\\) (such that \\(Pr<<m\\)) over the measurable space \\((R, \gs(R))\\). The pdf wrt \\(m\\) is the inter-measure (Radon/ Nikodym) derivative between \\((v, m)\\), if it exists.

So, it is any function \\(f\\) such that \\(Pr(X \in E) = \int_E f(x) dm = \int_{X^{-1}(E)}dv\\).

Note that \\(f\\) has the property that \\(\int_{R} f(x) dm = Pr(X \in R) = 1\\).

#### Notation
The pdf associated with a random variable \\(X\\) is often denoted by \\(f_X\\).

#### Not probability measure
Note that \\(f\\) is not a probability measure: Together with \\(m\\), it only helps specify \\(Pr\\). Specifically, \\(f(x) \neq Pr(X=x)\\) in general.

Note that \\(f(x) \to \infty\\) as \\(x \to t\\) is possible - but this would be impossible for a probability.

#### Probability mass function (pmf)
Consider the case where range(X) is discrete. Then, the pdf \\(f(x) = Pr(X = x)\\) when used with the counting measure. Such a pdf is called a pmf.

#### Support
\\(\set{x: f_X(x) \neq 0}\\) support of the distribution of \\(X\\).

#### Improper densities
Aka pseudo-density. Sometimes, the pdf is specified in a form which does not sum to 1. \\(f_X(x) = \frac{p_X(x)}{Z}\\), where the constant \\(Z\\) is not specified.

#### In terms of cdf
Derivation trick for some pdf's defined in terms of CDF's:\\ \\(\int_{-\infty}^{y} F(x)^{a} f(x)dx =  \frac{F(y)^{a}}{a}\\).

### Cumulative density functions (CDF)
Take any real valued RV. \\(F(x) = Pr(X \in [-\infty, x])\\). If the pdf exists, this is \\(\int_{-\infty}^{x} f(x) dx\\). Can by itself describe distribution - pdf need not exist; but important for describing continuous distributions.

#### Notation
The CDF associated with a random variable \\(X\\) is often denoted by \\(F_X\\).

#### Properties
The CDF is monotonically increasing. It is right continuous.

#### Connection to discreteness
\\(X\\) is discrete (ie its range is discrete) iff \\(F_X\\) is a step function.

\\(X\\) is continuous iff \\(F_X\\) is continuous.

#### Multidimensional case
Just \\(F(x) = \int_{(-\infty)^{d}}^{x} f(x) dx\\) if \\(x\in R^{d}\\)!

#### Quantiles
points taken at regular intervals from CDF. Types: Percentiles, deciles etc..

### Entropy
See information and coding theory ref.

## Importance
Random variables allow us to express probability measures simply using pdf's and pmf's.

Furthermore, they allow us to study models where an underlying random process (probability space) results in observations in a different space (the range of a random variable).

## Random variable for probability space
For analyzing arbitrary probability spaces using properties/ notation of random variables, one can simply add on a measurable space \\(R'\\) and a measurable function \\(X\\): \\(R'\\) could even be the probability space itself!

### Indicator RV
The indicator function corresponding to the event set can be used as a 2-range random variable: see algebra ref.

## RV from a map
Let \\(X\\) be an RV. Consider a measurable function \\(h:ran(X) \to ran(Y)\\). \\(Y = h(X)\\) is a random variable itself.

### Monotonic maps
Let \\(h\\) be monotonic.

#### CDF
If \\(h\\) is increasing: \\(F_X(x) = F_Y(h(x))\\).

If \\(h\\) is decreasing: \\(F_Y(h(x)) = 1 - F_X(x)\\).

#### pdf
Consider \\(f_Y(y) = \frac{dF_y(y)}{dy} = \frac{dF_x(h^{-1}(y))}{dy}\\). By chain rule, and using the CDF relationships from earlier, \\(f_Y(y) = f_X(h^{-1}(y)) \abs{\frac{dh^{-1}(y)}{dy}}\\).

#### Utility
This is useful in sampling complex distributions by transforming random variables with easy to sample distributions. The monotonicity is useful because we often 'stretch' parts of range(X) to form range(Y) in order to arrive at the more complex distribution of Y.
