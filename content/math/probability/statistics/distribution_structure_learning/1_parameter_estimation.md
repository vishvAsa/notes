+++
title = "1 Parameter estimation"
+++

## Estimate parameters using statistics
The distinction between choosing parametric and non-parametric approaches are considered in the decision theory section.

### Statistic, estimator
A statistic \\(\hat{t} = \hat{g}(X)\\) is a function of the sample \\(X\\); an observable random variable. When it is used to estimate some parameter, it is called an estimator. t can be estimated by estimating \\(\gth\\).

#### Point estimation of the parameter
If \\(\hat{t}\\) tries to approximate \\(t\\), it is an estimator.

### Distribution of a statistic
Aka Sampling distribution. Standard deviation of sampling distribution called standard error.

Find by manual calculation of probabilities of values of \\(\set{X_{i}}\\); or by simulation or assume \\(\set{X_{i} \distr N(\mean, \stddev^{2})}\\), using mgf \\(n^{-1}\sum Y_{i} \distr N(\mean, \stddev^{2}/n)\\).

### Summarize Central tendency
Sample and population expectation \\
(\\(\bar{X}, \mu = E[X]\\)), median (m with \\(F(m) = 1/2\\)) where F is CDF, mode.

#### AM, GM, HM
Suppose we have \\(n\\) numbers \\((a_i)\\). Arithmetic mean is \\(n^{-1}\sum_i a_i\\): the name reminisces the arithmetic series. Geometric mean is \\(\prod_i a_i^(n^{-1})\\), and harmonic mean is \\(n^{-1}(\sum_i a_i^{-1})^{-1}\\).

Using weights \\(p_i \in [0, 1]\\) such that \\(\sum_i p_i = 1\\), these quantities can be generalized to define weighted arithmetic, geometric and harmonic means.

\\(\mu \geq GM \geq HM\\). This and other inequalities are considered in the complex analysis survey.

#### Modeling accuracy
If one is trying to use the sample mean to quantify the 'average' phenomenon, it is important to pick the right random variable.

From Tao: 'For instance, consider the question of what the population density of the United States is. If one does a simple average, dividing the population of the US by the area of the US, one gets a density of about 300 people per square mile, which if the population was spread uniformly, would suggest that each person is about 100 yards from the nearest neighbour. Of course, this does not conform to actual experience. It is true that if one selects a random square mile patch of land from the US at random, it will contain about 300 people in it on the average. However, not all such patches are equally inhabited by humans. If one wants to know what what density the average human in the US sees, rather than the average square mile patch of land, one has to weight each square mile by its population before taking an average. If one does so, the human-weighted population density now increases to about 1400 people per square mile - a significantly different statistic.'

#### Combining arithmetic means of subpopulations
(From Tao's blog.) When combining averages of small sub-populations together to form an average of the combined population, one needs to weight each sub-average by the sub-population size in order to not distort the final average. If the sub-populations being averaged over vary, this can then lead to Simpson's paradox.

Eg: it turns out that in most departments, women had a slightly higher success rate in their applications than men, but in the university as a whole, women had a lower success rate. The ultimate reason for this was that women tended to apply to more competitive departments, which lowered their overall average success rate. 

### Other statistics and parameters
#### Summarize variability or dispersion
Sample and population Variance \\
(\\(S^{2}, \stddev^{2}\\)), standard deviation (\\(S, \stddev\\)) . Variance is average of the squared differences from the Mean. Standard deviation is its square root. 

Also, range: max - min.

#### Order statistics
max or nth order statistic \\(X_{(n)}\\), min or first order statistic \\(X_{(1)}\\), kth smallest sample point \\(X_{(k)}\\).

\\(f_{X_{(k)}}(x) = \frac{n!}{(k-1)!(n-k)!}F_{X}(x)^{k-1}(1-F_{X}(x))^{n-k}f(x)\\): consider ways of selecting the kth smallest sample point while ignoring ways of ordering the rest, probability of k-1 of them being smaller and n-k being larger. Treat like any pdf; can find corresponding cdf by integration.

Also, \\(f_{X_{(j)}, X_{(k)}}(x, y) =\\ \frac{n!}{(j-1)!(k-j-1)!(n-k)!}F_{X}(x)^{k-1}(F(y)-F(x))^{k-j-1}(1-F_{X}(x))^{n-k}f(x)f(y)\\).

#### Other statistics
Proportion \\(\bar{p}\\), p: \\(n\bar{p} \distr bin(n, p) \to N(np, np(1-p))\\); \\(\bar{X_{1}} - \bar{X_{2}}, \mean_{1} - \mean_{2}\\); \\(\bar{p_{1}} - \bar{p_{2}}, p_{1} - p_{2}\\). Good pivotal quantity for these: \\(\frac{\hat{t}-t}{\stddev_{\hat{t}}} \distr N(0, 1)\\).

## Estimator properties
Properties of good estimators: low bias, low variance, completeness, consistency, sufficiency.

### Bias
\\(B(\hat{t}) = E[\hat{t}] - t\\). Easy to find unbiased estimator given biased estimator.

### Mean square error: Bias variance decomposition
\\(mse(\hat{t}) = E[(t-\hat{t})^{2}] = var[\hat{t}] - B(\hat{t})^{2}\\) using bias definition.

### Relative efficiency of unbiased estimators
\\(eff(\hat{t}_{1}, \hat{t}_2) = var[\hat{t}_{2}]/var[\hat{t}_{1}]\\). To compare variances of estimators.

### Consistency of unbiased estimators
\\(\hat{t}_{n}\\): derived from sample of size n. Consistent if \\(\forall \eps: lt_{n \to \infty} Pr(|\hat{t}_{n} - t| \leq \eps) = 1\\). Using Chebyshev's thm, consistency if \\(lt_{n \to \infty}var[\hat{t}_{n}] = 0\\). ie: \\(\hat{t_{n}} \to_{p} t\\): \\((\hat{t_{n}})\\).

Let \\(\hat{t_{n}'} \to_{p} t'\\). \\(\hat{t} + \hat{t'} \to_{p} t + t;\ \hat{t}\hat{t'} \to_{p} tt';\ \hat{t}/\hat{t'} \to_{p} t/t'\\). Also, if \\(g() \to R\\) continuous, \\(g(\hat{t_{n}}) \to g(t)\\).


### Sufficiency of unbiased estimator
#### Motivation from MLE
Given sample vector \\(X=x\\), suppose that we want to estimate \\(T=t\\) using estimator \\(\hat{T}=\hat{t}\\). So, we want to find \\(t\\) maximizing \\(f_{T|X}(t|x) = \frac{f_{X|T}(x|t)f_T(t)}{f_{X}(x)}\\).

We may use MLE (assuming all \\(t\\) equally likely), find t maximizing \\(L(t|x) = f_{X|T}(x|t) = f_{X|\hat{T}, T}(x|\hat{t}, t)f_{\hat{T}|T}(\hat{t}|t)\\).

So, if \\(f_{X|\hat{T}, T}(x|\hat{t}, t)\\) is independent of \\(T\\): \\(f_{X|\hat{T}, T}(x|\hat{t}, t) = f_{X|\hat{T}}(x|\hat{t})\\), same as maximizing \\(f_{\hat{T}|T}(\hat{t}|t)\\); can discard \\(X=x\\) after getting \\(T=t\\). So, this sufficient statistic summarizes all info in a sample about a parameter.

Not necessarily unbiased. All good estimators, which are unbiased, are functions of sufficient statistic.

#### To show sufficiency if distribution family known
Show \\(f_{X|\hat{T}, T}(x|\hat{t}, t) = f_{X|\hat{T}}(x|\hat{t})\\); its form is not a function of t. So, show factorization \\(f_{X|T}(x|t) = f_{X|\hat{T}, T}(x|\hat{t}, t)f_{\hat{T}|T}(\hat{t}|t) = g(\hat{t})f(\hat{t},t)\\); Or show \\(\frac{f_{X|T}(x|t)}{f_{\hat{T}|T}(\hat{t}|t)}\\) not a function of t.

#### To find sufficient statistic
Start with \\(f_{X|T}(x|t)\\), factorize it into \\
\\(g(...)f(\hat{t},t)\\); in the part which is a \\(f(.., t)\\), find sufficient statistic \\(\hat{t} = h(X)\\). Eg: \\(f(.., t) = e^{-\sum X_{i}}\\), \\(\sum X_{i}\\) be the minimal sufficient statistic; if \\(f(.., t) = e^{-\sum X_{i} - \sum X_{i}^{2}}\\) \\(\sum X_{i}\\) and \\(\sum X_{i}^{2}\\) are joint sufficient statistics.

### Statistical efficiency
How many observations do you need to get error \\(d(\hat{t}, t) < \eps\\)?

## Find estimator for some parameter
Also see model selection techniques: where you estimate all parameters which define the model from the data.

### From sufficient statistic
Find sufficient statistic, then construct unbiased estimator as a function of it.

### Minimum variance unbiased estimator (MVUE)
(Rao-Blackwell)\\
For parameter t, take any estimator \\(\hat{t}\\), sufficient statistic U; \\(\hat{t'} = E[\hat{t}|U]\\) (Rao-Blackwellization); then \\(E[\hat{t'}] = t, var[\hat{t'}] \leq var[\hat{t}]\\): \\(var[\hat{t'}] = E[E[\hat{t}|U]^{2}] - t^{2} \leq E[E[\hat{t}^{2}|U]] - t^{2} = var[\hat{t}]\\). Rao Blackwellization can't improve variance further.

So, an unbiased estimator which is a function of the sufficient statistic yields MVUE. To find MVUE do this.

### Method of moments
Assume sample moments are good estimators of population moments. Set \\(E[Y|\gth] = \frac{\sum Y_{i}}{n}\\); thence get \\(f(\gth) = \frac{\sum Y_{i}}{n}\\); then solve for \\(\gth\\). If number of parameters in \\(\gth\\) is high, find other moments: \\(E[Y^{k}|\gth] = \frac{\sum Y_{i}^{k}}{n}\\). Result is usually consistent, but not always sufficient.


## Confidence Interval
### Definition
Find intervals of probable values: confidence intervals \\((\hat{t_{1}}, \hat{t_{2}}): Pr(\hat{t_{1}} \leq t \leq \hat{t_{2}}) \leq 1-a\\). Can also use one sided intervals using only upper or lower confidence limits: \\((-\infty, \hat{t_{2}}), (\hat{t_{1}}, \infty)\\).

Contrast with point estimation.

### General procedure
#### Pivotal quantity for estimate
Suppose you have a point estimator \\(\hat{t}\\), which can be expressed as a function of some pivotal quantity \\(q\\). This quantity has the following property: \\(q = g(t, .. )\\), which is a function of \\(t\\) whose distribution function does not depend on \\(t\\), but may depend on other known/ guessable parameters - like sample size.

Sometimes, the pivotal quantity is the estimator itself.

#### Procedure
For a given sample, one can find \\(q\\) +++(- the pivotal quantity)+++, find or bound its distribution function \\(p\\) and finally find suitable confidence interval \\(q \in (a, b)\\) which translates to the confidence interval estimate: \\(t \in (\hat{t_{1}}, \hat{t_{2}})\\).

### Pivotal quantity deviation bounds
Theoretical calculations can provide deviation bounds for the pivotal quantity distribution - Eg: the use of Chernoff deviation bounds in case of binomial random variables.

#### By repeated sampling
If one can sample repeatedly from the actual distribution, one can estimate the confidence interval for a given estimator.

#### By Bootstrap sampling
##### Process
If one is not able to take repeated samples from the actual distribution, one can repeatedly sample (with replacement) from a uniform distributions over the available sample set.

The justifcation is that this distribution is close to the original distribution, so conclusions drawn from it are not too erroneous.

##### Properties

\tbc

### Pivotal quantity for ratio of variances
With F sampling distribution: \\(\frac{S_{1}^{2}\stddev_{2}^{2}}{S_{2}^{2}\stddev_{1}^{2}} \distr F_{n_{1}-1, n_{2}-1}\\).


