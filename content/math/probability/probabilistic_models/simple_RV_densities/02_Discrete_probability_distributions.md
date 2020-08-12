+++
title = "02 Discrete probability distributions"

+++
## Coin toss distribution
\\(X \distr\\) Bernoulli(p) when \\(range(X) = \set{0, 1}\\) and \\(Pr(X = 1) = p\\).

When \\(p=1/2\\), \\(X\\) is called a Rademacher RV.

### Properties
\\(E[X] = p\\). \\(Var[X] = p-p^{2}\\). Same as Bin(1, p).

### Odds of success
\\(\frac{p}{1-p}\\). This function is used in gambling (see economics survey).

## Multiple coin-toss
Aka Binomial distribution.

This is the probability of \\(x\\) successes in \\(n\\) trials. \\
\\(X \distr Bin(n, p)\\) when \\(Pr(X = x) = \binom{n}{x} p^{x}(1-p)^{n-x}\\), \\(range[X] = [0, .. n]\\).

### Properties
\\(X = \sum X_{i}\\), where \\(X_{i}\\) is Bernoulli RV.

So, \\(E[X] = np\\). \\(Var[X] = nVar[X_{i}] = np(1-p)\\), even if \\(X_{i}\\) are only pairwise independent.

The plot of the pdf looks like a discrete version of the bell curve truncated at 0 and \\(n\\).

### Approximations
As \\(n \to \infty\\), it may be approximated by Poisson distribution if \\(p \to 0\\). It is approximated by Normal distribution if p fixed.

#### With exponential decay for sq deviation distribution
From central limit theorem, \\(\frac{X - np}{\sqrt{np(1-p)}}\\) approaches N(0, 1) as \\(n \to \infty\\). Good if \\(n > (1-p)\frac{\max p, (1-p)}{\min p, (1-p)}\\).

### Poisson distribution

$$\lim_{n\to \infty} Bin(n,f(n)) = Poi(nf(n)):\\
 \lim_{n\to \infty} Pr(X = x) = \lim_{n\to \infty, p \to 0} \frac{P(n, x) p^{x}(1-p)^{n-x}}{x!} = (np)^{x}e^{-np}/x!$$. Number of events which occur in a given time interval: Models Rare events; arrival rates.

\\(E[Poi(\mean)]= \sum (\mean)^{x}e^{-\mean}/x! = \mean e^{-\mean} e^{\mean} = \mean\\). Poi(m) + Poi(n) = Poi(m+n).

For Poi(m), \\(M_{X}(t) = e^{\mu(e^{t}-1)}\\). \\
So, Chernoff bounds for Poi(m): Select \\(t=\ln(x/m)\\) either +ve or -ve.

Looks like a discrete version of the bell curve, truncated at 0.

### Random walk on a line
Consider a random walk of \\(n\\) steps on the number line with start position: 0. The position changes by +1 or -1 with each step.

In expectation, due to symmetry, the final position is 0. We want to find the expected deviation from 0 in the end.

To model the number of +1 steps taken, one can use \\(X \distr Bin(n, 0.5)\\). \\(E[X] = n/2\\), and \\(Var[X] = \stddev^{2} = n/4\\). \\(Pr(X \geq n/2(1 + \frac{k}{\sqrt{n}})) \leq 2e^{\frac{-k^{2}}{6}}\\). So, whp, ye're within \\(O(\sqrt{n})\\) of 0.

### (balls, bins)
#### Process
Suppose that you threw \\(n\\) balls into \\(m\\) bins so that each ball fell into a random bin.

#### Distribution
Balls in some bin, \\(X_{i} \distr Bin(m,1/n) \approx Poi(m/n)\\). \\
\\(Pr(actual) =Pr(appr|\sum X_{i}=m)\\); \\(Pr(actual) < e\sqrt{m}Pr(appr)\\).

\\(Pr(X_{i} = 0) = (1-1/n)^{m} \approx e^{m/n}\\); So E[num empty bins]= \\(ne^{m/n}\\); No empty bins whp: \\(m=n \ln n + cn\\) (Coupon collector). Also, \\(min \approx max\\) whp: \\(m=n \ln n + cn\\). \why

Max load when n=m: whp \\(\Theta(\ln n/\ln\ln n)\\): upper bound by Chernoff; \\
\tbc.

Birthday paradox : some bin has 2 balls: whp when \\(m=\sqrt{n}\\): Pr ( every ball in diff bin ) = P = \\(\prod_{i=1}^{m} (1-\frac{(i-1)}{n}) = P(n,m)/n^{m} \approx \prod_{i=1}^{m} e^{\frac{-(i+1)}{n}} \approx e^{-m^{2}/(2n)}\\).

Power of \\(d\geq 2\\) choices: \\(\Theta(\ln\ln n/\ln d)\\). \why

**(balls, bins) Strategies**: Find probabilities of basic events; Combine; Approximate. Use poisson approximation.


## Categorical distribution
Consider a trial with discrete and finite outcomes. Outcome i has probability \\(p_{i}\\). The outcome can be modeled as a random variable or as a 1 of k random vector \\(X\\). If latter, can write: \\(Pr(X = x) = \prod p_{i}^{x_{i}}\\).

## Multinomial distribution
Consider \\(n\\) trials - each with \\(k\\) (discrete and finite) outcomes. Consider the \\(k\\)-dimensional random vector \\(X\\) where \\(X_i\\) represents the number of times outcome \\(i\\) appears. Note that this implies \\(\sum_i X_i = n\\).

This can be viewed as the distribution of the sum of sequence of \\(n\\) random vectors with categorical distribution. \\(Pr(x) = \binom{n}{x_{1}..x_{k}} \prod p_{i}^{x_{i}}\\).

## Geometric distribution
Probability of \\(x\\) successful trials before first failure. \\(X \distr Geom(p): Pr(X=x) = (1-p)^{x-1}p\\). Geom(p) is memoryless. Gambler's fallacy. \\(E[geom(p)]=1/p\\). \\(Var[Geom(p)]=(1-p)/p^{2}\\).

## Hypergeometric distribution
Parameters: N: number of balls in an urn. m: number of +ve balls. n: number of trials. You draw n balls, but, unlike binomial distribution, no replacement is allowed.

Probability of t successes: \\(Pr(X = k) = \frac{\binom{m}{k} \binom{N-m}{n-k}}{\binom{N}{n}}\\).

## Smoothing
### Motivation
#### Incomplete knowledge of range
Suppose that you have a discrete valued random variable \\(X\\), and that \\(ran(X)\\) is not completely specified beforehand: perhaps due to limited sample \\(S\\) from \\(f_X\\) where only values \\(T \subseteq ran(X)\\) were observed. Suppose we want to model the distribution \\(f_X\\).

A basic model would be to use the empirical distribution \\(\hat{f}_X\\). But, this model will assign probability 0 to any \\(x \in T\\). So, we may want a model which does not do this.

#### Assumption of continuous ran(X)
In this case, \\(ran(X)\\) is actually assumed to be part of a vector space, so that no finite sample can reveal the entire \\(ran(X)\\). Examples of smoothing to deal with this case is described in the statistics survey (eg: kernel density estimation techniques).

### Add 1
This tries to address the problem of 'limited observation of \\(ran(X)\\)'. Suppose that \\(\hat{f}_X(x) = \frac{S(x)}{|S|}\\), where \\(S(x)\\) represents the number of occurrences of \\(x\\) in the sample \\(S\\) with the observed range \\(T\\), is the basic unsmoothed empirical probability model. 

This can be smoothed by first adding an element a placeholder \\(unk\\) for unobserved values to \\(T\\) to get \\(T'\\), and then setting the distribution \\(f'_X(x) = \frac{S(x) + 1}{|S| + |T'|} \forall x \in T\\); note that \\(S(unk) = 0\\). This ensures that \\(f'_X(x)\\) sums to 1 and that \\(f'_X(unk)= \frac{1}{|S| + |T'|}\\).

#### Add k
This generalizes add 1 smoothing by doing this:
\\(f'_X(x) = \frac{S(x) + k}{|S| + k|T'|}\\).

\\(f'_X(unk)\\) increases with \\(k\\), as \\(\frac{l+k}{m + k} - \frac{l}{m} >0\\).

### Different additions
One generalization of add-k smoothing could be to let: \\(f'_X(x) = \frac{S(x) + k(x)}{|S| + \sum_x k(x)}\\). Then, \\(f'_X(unk)\\), if included, would be \\(\frac{k(unk)}{|S| + \sum_x k(x)}\\).

Thus, this tries to compensate for limitations in sample size using some alternative model (represented by k(x)) and can accommodate an unobserved event.

#### Use backoff probabilities
This can be viewed from the perspective of backoff probabilities. Suppose there is an estimate \\(g_X\\) different from \\(f_X(x) = \frac{S(x)}{|S|}\\), and suppose that \\(\sum_x k(x) = K\\). We can model \\(f'_X = \frac{S(x) + K g_X(x)}{|S| + K}\\).
