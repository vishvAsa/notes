+++
title = "Regression"
+++
## General problem
Many (x, y) pairs (observations), h(x, w) form (eg: degree of polynomial) known, parameters \\(w\\) in h(x, w) is unknown. Want to find \\(w\\). range(h) is not finite, it is usually continuous.

y is the response variable, \\(w\\) is called the regression vector. The matrix formed by \\(x\\) is often called the design matrix.

Many such continuous valued models are described in probabilistic models reference.

## Linear regression
### The problem
h(x, w) is linear in \\(w\\) (Eg: \\(w_1 x^{3}+ w_2 \\)x\\( + w_3=0\\): \\(\ftr_{i}(x) = x^{i}\\)).

Make matrix A with each row as feature vector \\(\ftr(x)\\) at data point \\(x\\); take b at diff points; coefficients as variable vector \\(w\\).

### The solution
Want to tune \\(w\\) so that it yields least deviation from b. You measure this using various loss functions.

#### Quadratic loss function
Get least squares problem \\(\min e(w) = \min \norm{Aw - b}_{2}\\). This is symmetric, but is sensitive to outliers.

### Maximum likelihood estimate with Gaussian noise
If you view y as h(x, w) + gaussian noise n, least squares solution is also the maximum likelihood solution.

Noise distribution symmetric about the mean is not sufficient to lead to least squares solution: \\(\min e(w) = \min \norm{Aw - b}_{4}\\) symmetrically penalizes deviation from mean just as well.

### Imposing prior distributions on w
Solutions below assume quadratic loss function to measure deviation from b. Priors implied by regularizers in \\(\min e(w) = \min \norm{Aw - b}_{2} + p(w)\\) where p is some penalty function. Usually \\(p(w) = \norm{w}_{k}\\).

#### Quadratic regularizer
Assuming gaussian noise, the maximum a-posteriori solution yields the ridge regression problem.

#### Priors which prefer sparse w
Can use lasso, or compressed sensing. See optimization ref.

##### Statistical efficiency
N samples, \\(d\\) dimensions. \\(E[\norm{\hat{\gth} - \gth^{*}}_2] \leq \sqrt{\frac{s \log d}{N}}\\).

### Solution
See optimization ref.

