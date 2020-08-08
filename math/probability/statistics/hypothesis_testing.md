+++
title = "Hypothesis testing"
+++

## Model selection given 2 models
Aka Confirmatory data analysis: Test hypotheses, as against Exploratory data analysis: Find hypotheses worth testing.

Which process is more likely to have generated the data? Which model is better at explaining the observations? Model selection, with only 2 models.

## Hypotheses
### Null hypothesis
\\(H_{0}: t = t_{0}\\) or \\(t\leq t_{0}\\)

### Alternate hypothesis
\\(H_{a}\\); can be 1 sided like \\(t > t_{a}\\) or 2 sided: \\(t \neq t_{0}\\) or \\(|t-t_{0}| \geq k\\).

### The decision
So, you decide if parameter \\(t \in T_1\\) or if \\(t \in T_2\\).

## Experiment/ Test
Pick sample; find value of estimate test statistic \\(\hat{t}\\); accept \\(H_{a}\\)/ reject \\(H_{0}\\) if \\(|\hat{t} - t_0| > |t' - t_0|\\); fail to reject \\(H_{0}\\) otherwise. Critical value t' defines \\(H_{0}\\) rejection region. Visualize as shaded area under \\(\hat{t}\\) pdf curve. So, you always do hypothesis testing assuming \\(H_{0}\\) is true.

### Errors
#### Type 1
Erroneously accept \\(H_{a}\\): \\(\ga = Pr(\hat{t} > t'|t=t_{0})\\). Say \\(\ga (= 0.05?)\\) level of significance.

#### Type 2
Erroneously fail to reject \\(H_{0}\\): \\(\gb = Pr(\hat{t} \leq t'|t=t_{a})\\).

### Tradeoff
Trying to decrease type 1 error involves increasing t'; But that increases type 2 error rate. Visualize error zones with regions in 2 bell curves with means slightly apart.

To simultaneously decrease both, must increase sample size.

In case of \\(X \distr N(\mean, \stddev^{2}), t=\mean\\), can write \\(\hat{t} > t'\\) as \\(z = \frac{\hat{t} - \mean}{\stddev/\sqrt{n}} > \frac{t' - \mean}{\stddev/\sqrt{n}}; z \distr N(0, 1)\\). Given \\( \mean, \stddev, \ga, \gb\\), can solve for t', n using \\(N(0, 1)\\) table. For small sample size, can use t distribution.

### p-value of the statistic
Given a sample, got \\(\hat{t}\\), for what \\(\min t'\\) we will reject \\(H_{0}\\) based on it? The corresponding \\(\ga\\) is p-value.

### Power of a test
Take \\(H_{0}: t = t_{0}; H_{a}: t = t_{a}\\), fix \\(t'\\). \\(power(t) = 1 - \gb(t)\\): ability to detect if \\(H_{a}\\) is true. \\(power(t_{0}) = \ga\\) \chk. So, power curve has a minimum at \\(t_{0}\\) \chk.

## Test design
Consider goodness of test with \\(\ga, \gb, power(t)\\).

### Best test for given \htext{\\(\ga\\){alpha}}
(Neyman-Pearson): Testing \\(H_{0}: t = t_{0}, H_{a}: t = t_{a}\\). Likelihood ratio test: \\(L = \frac{L(t_{0}|\hat{t})}{L(t_{a}|\hat{t})} \leq? h\\), \\(Pr(L \geq h) = \ga\\). This is the most powerful test.

### Difference in differences
Suppose that using experiment A, where one compares hypotheses H1 and N (for null hyp), it is determined that N cannot be dismissed. In experiment B, one compares H2 and N and observe that N can be dismissed. From this, one cannot conclude that, while comparing H2 and H1, H1 can be dismissed: it is possible that the difference in evidence supporting H1 and H2 is small.

One should instead conduct an experiment comparing H1 and H2 directly. This has been a common mistake in medical research as of 2011!

