+++
title = "2 Mean and variance"
+++

## Mean: estimation
### Consistency
Aka Law of large numbers

Let \\(\set{X_{i}}\\) iid. \\(\hat{X}_{n} = n^{-1}\sum^{n} X_{i}\\). As \\(var[\hat{X_{n}}] = \stddev^{2}/n \to 0\\) as \\(n \to \infty\\), Weak law: \\(\hat{X}_{n}\\) is a consistent estimator of \\(\mean\\).

### Normalness of estimator distribution
Aka Central limit theorem (CLT)

Take estimator \\(U_{n} = \frac{\bar{X} - \mean}{\frac{\stddev}{\sqrt{n}}}\\). \\(lt_{n\to \infty} Pr(U_{n} \leq u) = \int_{-\infty}^{u} \frac{1}{\sqrt{2\pi}}e^{-t^{2}/2}dt\\): so approaches CDF of N(0,1): See convergence of moment generating function (MGF) below. So, as n increases, \\(var[\bar{X}]\\) becomes smaller: visualize pdfs of \\(X, \bar{X}_{30}, \bar{X}_{50}\\); see how curve becomes more normal and gets thinner and taller. Generally, can use CLT when \\(n>30\\).

#### Proof showing convergence to Normal MGF
Theorem: MGF \\( M_{U_{n}(t) \to \\) MGF of N(0, 1)}

Proof: iid \\(\set{X_{i}}\\). \\(m_{U_{n}}(t) = E[e^{\frac{t(\sum X_{i} - n\mean)}{\sqrt{n}\stddev}}] = \prod E[e^{\frac{t}{\sqrt{n}}}(\frac{X_{i} - \mean)}{\stddev}] = m_{Z}(t/\sqrt{n})^{n}\\): implicitly defining Z with \\(E[Z] = 0, var[Z] = E[Z^{2}] = 1\\).

But, by Taylor, 
$$m_{Z}(t/\sqrt{n}) = \\
m_{Z}(0) + m_{Z}'(0)(t/\sqrt{n}) + m_{Z}''(h)(t/\sqrt{n})^{2}(1/2!) \\
= 1  + E[Z]t + m''(h)(\frac{t^{2}}{2n})$$
 for some \\(h\in (0, t/\sqrt{n})\\); so \\(m_{Z}(t/\sqrt{n}) = 1 + m''(h)(\frac{t^{2}}{2n}) \to 1 + \frac{t^{2}}{2n}\\) as \\(n \to \infty\\). So, \\(m_{U_{n}}(t) \to (1 + \frac{t^{2}}{2n})^{n} \to e^{t^{2}/2}\\), MGF of N(0, 1).

### Normal distr: Pivotal quantity to estimate mean
Student's t distribution is used to estimate \\(\mean\\) when distribution is assumed to be Normal, n is small and \\(\stddev\\) is unknown. Tables only go up to n = 30 or 40. If \\(\stddev\\) were known, would use normal distribution, or if \\(n > 30\\) would estimate \\(\stddev\\) and use normal distribution tables. 

As \\( (n-1) \frac{S^{2}}{\stddev^{2}} \distr \chi^{2}_{n-1} \\) ,

\\(\sqrt{n}\frac{\bar{X} - \mean}{S} \distr t_{n-1} \\).

### Goodness of empirical estimate
Can apply Chernoff bounds and Azuma Hoeffding inequality etc.. to judge goodness of empirical estimate.

## Variance estimation
### The biased and unbiased estimators
\\(S^{2} = n^{-1}\sum (X_{i} - \bar{X})^{2}\\) biased: \\(B[S^{2}] = n^{-1}E(\sum X_{i}^{2} -2\bar{X}\sum X_{i} + n\bar{X}^{2}) - \stddev^{2} = n^{-1}(nE[X^{2}] -2E[n\bar{X}^{2}] + nE[\bar{X}^{2}]) - \stddev^{2} = n^{-1}(n \stddev^{2} + n \mean^{2} - n var[\bar{X}] + n \mean^{2}) - \stddev^{2} \to n^{-1}(n-1)\stddev^{2} - \stddev^{2}\\) from central limit thm. So, defined as \\(S^{2} = (n-1)^{-1}\sum (X_{i} - \bar{X})^{2}\\) to get unbiased estimator. Difference small as \\(n \to \infty\\).

### Normal distr: Pivotal quantity to estimate variance
\\(N(\mean, \stddev^{2})\\) assumed. If \\(S^{2} = \frac{\sum (X_{i} - \bar{X})^{2}}{n-1}\\), then \\((n-1) \frac{S^{2}}{\stddev^{2}} \distr \chi^{2}_{n-1}\\) \why.

So, can use this as pivotal quantity.

## Sequential data Sample statistics
### k-step Moving averages
Suppose that \\(ran(X_i) \in R\\), and that the sample size is \\(n\\).

#### Simple moving average
This is simply the mean of the last \\(k\\) \\({X_i}\\).

#### Exponential Weighed
Here, one uses an exponentially decreasing weight (with decreasing \\(i\\)) while taking a weighted average of \\(k\\)  \\({X_i}\\).

#### Applications
This is useful while predicting stock prices, for example.

