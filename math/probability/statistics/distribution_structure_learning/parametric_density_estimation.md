+++
title = "Parametric density estimation"
+++

## Problem and solution ideals
### Density estimation using a distribution class
Suppose that parameter \\(t\\) specifies the distribution \\(f_t(x_r|x_{\lnot r})\\), where \\(x_{\lnot r}\\) can be empty! Let \\(T\\) be parameter space spanned by such \\(t\\); it represents the class of distributions which can be specified in this form.

Given finite data set \\(\set{x^{(i)}}\\), we want to approximate an unknown target distribution \\(D(x_r|x_{\lnot r})\\) which may not belong to this distribution family using \\(T\\). The approximation can be a weighted combination of combination of distributions in \\(T\\).

#### Related problems
Note that estimating \\(t\\) which is good at predicting the value of \\(x_r\\) given \\(x_{\lnot r}\\) by doing \\(h(x_{\lnot r}) = \max_{x_r} f_t(x_r|x_{\lnot r})\\) is a separate problem, where a different estimation procedure which minimizes the classification error \\(Pr(h(x_{\lnot r}) \neq x_r)\\) (corresponding to the 0/1 classification loss) may be used.

### Solution ideas
Empirical risk minimization, for various forumulations of risk functions which in someway also incorporate prior belief about the best \\(t\\).

## Approximation with Normal distribution
Aka Laplace approximation. Suppose that we have the probability distribution \\(p(x) = Z^{-1}f(x)\\).

### Algorithm
Here, one finds a mode / strict local maximum \\(x'\\) of the distribution \\(p(x)\\), which corresponds to a mode of \\(f(x)\\), using numerical techniques. Then, one creates a normal distribution \\(N(\mean = x', \stddev)\\) around this point.

#### 2nd order approximation of log f
\\(\log N(x', \covmatrix)\\) is a quadratic function. So, we try to find \\(\covmatrix\\) such that \\(\log N\\) approximates the 2nd order approximation of \\(\log f\\).

As \\(\gradient f(x')= 0\\), taking the quadratic approximation \\\\(\log f(x) \approx \log f(x') + (f(x'))^{-2} (x-x')^{T}\gradient^{2} f(x')(x - x')\\). So, \\\\(f(x) \approx f(x')exp((f(x'))^{-2} (x-x')^{T}\gradient^{2} f(x')(x - x'))\\)

The RHS can now be used to construct \\(\covmatrix\\). As \\(x'\\) is a mode, \\\\(-2(f(x'))^{-2}\gradient^{2} f(x') \succ 0\\) as expected.

### Properties
#### Estimating Z
Z can be approximated to equal the normailizer of N, which is easily calculated. Note that knowledge of Z is not required to get the approximation \\(N\\).

#### Non-uniqueness
Different modes yield different approximate distributions.

## Log loss minimization
Aka Maximum likelihood estimation (MLE).

### Optimization problem, estimate
Likelihood function: \\(L:T \to [0,1]\\). \\
\\(L(t|\set{x^{(i)}}) = f_t(\set{x_r^{(i)}}|\set{x_{\lnot r}^{(i)}}) = \prod f_t(x^{(i)}|x_{\lnot r}^{(i)})\\).

\\(\hat{t} = argmax_{t} L(t|x)\\). This may be a biased estimator; but is always a sufficient statistic, as it is defined on \\(L(t|x)\\). Often, an equivalent optimization problem: minimizing log-likelihood is used.

#### Functional Invariance property
If you want to estimate \\(g(t)\\), \\(g(\hat{t})\\) is the MLE of g(t). From definition.

#### Avg Log likelihood function
Take \\(l(t|\set{x^{(i)}}) = \ln(L(t|\set{x^{(i)}}))\\), and do \\(\min_t -n^{-1}l(t|X)\\). Useful as often \\(L\\) and distribution of X are from exponential family.

Example: In case of \\(N(\mean, \stddev^{2})\\), \\(\ln f(\set{x^{(i)}}|\mean, \stddev^{2}) = -\frac{1}{2\stddev^{2}}\sum(x^{(i)} - \mean)^{2} - \frac{N}{2}\ln (\frac{\stddev^{2}}{2 \pi})\\); by maximization, MLE is \\(\mean = \bar{x}, \stddev^{2}= N^{-1}(x^{(i)} - \mean)^{2}\\): because biased estimator is used, \\(N^{-1}(x^{(i)} - \mean)^{2}\\) often underestimates.

### Other perspectives
#### As log loss risk minimization
The negative log-likelihood of a single sample-point, \\(-\log L(t|x)\\), is also called the 'log loss' in the general decision theoretic framework. So, by doing maximum likelihood estimation, we are actually minimizing empirical log-loss.

#### Priors as regularizers
If you add regularizer \\(r(t)\\), you are imposing a prior distribution on \\(t\\); so you are doing bayesian inference. The optimization problem becomes: \\(\min l(t|X) + r(t)\\).

#### As empirical code-length divergence minimization
Let \cF be a class of distributions, \\
let \\(D\\) be the actual distribution of \\(X\\). In the limit where $n \to 
\infty\\(, maximum likelihood estimation tries to find \\)\argmin_{F \in \cF} E_D[- \log F(X)]\\(. This is the same problem as finding \\)\argmin_{F \in \cF} E_D[- \log F(X)] - E_D[-\log D(x)] = \argmin_{F \in \cF} KL(F||D)\\(. So we are finding a member of \cF, with minimum code-length divergence to \\)D$.

### Derivatives of log likelihood
#### Score function : Sensitivity of log Likelihood
\\(V(t, X) = \gradient_t{\log L(t|X)} =  L(t|X)^{-1} \gradient_t L(t|X)\\): variability of \\(L(t|X)\\) normalized by \\(L(t|X)\\): like conditioning in numerical analysis.

##### Mean wrt X
Under some regularity conditions, \\
$E_X[V(t, X)] = \int_x (f_{X|T}(x|t)^{-1} \gradient_t f_{X|T}(x|t)) f_{X|T}(x|t))dx =\\
 \gradient_t \int_x f_{X|T}(x|t)) dx = \gradient_t 1 = 0$.

#### Variance wrt X of sensitivity score of likelihood
Aka Fisher Information matrix. As \\(E_X[V(t, X)] = 0\\), \\(I(t) = E_X[V(t, X)^{2}] = E_X[(\gradient_t{\log L(t|X)})^{2} | t]\\). Measures information about t in the observable RV X. If I(t) is high for RV X, then the absolute value of the sensitivity score is high in expectation.

If conditions like those in \\(E_X[V(t, X)] = 0\\) hold,\\ \\(E_X[(f_{X|T}(x|t))^{-1} \gradient_t^{2} f_{X|T}(x|t)] = 0\\) will hold, and so \\\\(I(t) = -E_X[(\gradient_t^{2}{\log L(t|X)})^{2} | t]\\).


### Computational cost
If this optimization problem can be accurately and efficiently: great!

#### Computing partition function
Suppose only \\(f(x, t)\\) proportional to th epdf \\(f_t(x_r|x_{\lnot r})\\) is specified. Doing \\
\\(\max_r \frac{f(x, t)}{\sum_y f(y, t)}\\) is not the same as doing \\(\max_r f(x, t)\\), as the normalizer (aka partition function) \\(Z(t) = \sum_y f(y, t)\\), even though independent of \\(x\\),  varies with \\(t\\).

If range of \\(x\\) is huge, and Z(t) does not have a closed-form solution, computing \\(Z(t) = \sum_y f(y, t)\\) can become costly and MLE is impractical.

##### Ease in case of conditional probabilities
Suppose that \\(range(X_t)\\) is actually small. Here, rather than having to sum over the entire range of \\(X\\),  which may be \\(range(x_r)^{|V|}\\) in size, we just sum over \\(range(x_r)\\) values to get \\(Z(t) = \sum_y f(y, t)\\).

#### Pseudolikelihood maximization
In case finding/ maximizing \\(f_t(x_r|x_{\lnot r})\\) is hard due to the need to compute \\(Z(t)\\), but finding \\(f_{X_{r_j}|X_{\lnot r_j}}\\) is easy. So we can consider maximizing the pseudo-likelihood function \\(\prod_{r_j} f_{X_{r_j}|X_{\lnot r_j}}\\) instead.

## Non uniform model for P(t)
Aka Maximum a posteriori (MAP).

### Objective, estimate
Posterior probability of model considering observations \\(\propto\\) likelihood of observations given the model \\(\times\\) prior probability of model.

So, solve : \\(argmax_{t} f_{X|T}(x|t)f_T(t)\\), or \\(argmax_{t} f_X(x)\\) + regularizer.

### Relation to MLE
MLE is a special case: it ignores prior distribution/ assumes it are uniform. So, often superior MLE. Eg: In MLE, upon seeing 4 H in coin tosses, you would conclude that the coin will always come up H.

The MLE optimization objective with a regularizer is a case of MAP, where the regularizer implitly defines a prior.

### Defining prior distributions
Often, the prior distribution on \\(T\\) may be specified, and the regularizer associated with the risk function may be derived thence.

#### Hyperparameters for prior distribution of parameters
\\(f_{T|C}\\) may have hyperparameters C, which may inturn come from distribution \\(f_{C|D}\\) with hyperparameters \\(D\\). Eventually must fix (hyper)parameter, perhaps with n-fold cross validation.

Eg: Can have hyper-parameters: \\(\stddev\\) for label noise , \\(\ga\\) for prior over \\(\param\\).

These are akin to parameters, but of a special kind.

#### Conjugate prior for a likelihood
You got distribution family \\(f_{X|T=t}\\). Conjugacy: If \\(f_{X|T=t}\\) and \\(f_T(t)\\)\\
 have the same form, finding \\(Pr(t|X) = f_{(X_{i})|t}((x_i))f_T(t) =  \prod_{i} f_{X|T=t}(x_i)f_T(t)\\) simpler. Then can update these probabilities with each incoming observation \\(X_{i}\\) easily.

Eg: For k-categorical distribution: \\(Pr(X_{j}=x|p) = \prod_{i=1}^{k} p_{i}^{x_{i}}\\), dirichlet distribution is the conjugate: \\(f_{P|A=a}(p) = \prod p_{i}^{a_{i}-1}\\) for hyperparameters a.

## Model combination
Aka Fully Bayesian approach. We may first determine posterior distribution over parameters \\(f_{T|S}\\) in the training stage, where \\(S\\) is the training set. We may then arrive at the model \\(f_{L|X, S} = \int_{t \in T} f_{L|X, T=t}f_{T|S}(t)\\).

So you use an ensemble of hypothesis distribution models.


## Information criteria
Bayesian/ Schwartz information criterion (BIC): \\(\min 2^{-1}L(D, t) + p \log n\\), where \\(p\\) is the number of parameters needed to specify \\(t\\), and \\(n\\) is the number of samples.

### Use
These are good if certain 'Gaussianness' assumptions hold, otherwise, the result of using them can be misleading. They allow us to pick \\(t\\) without having to, for example, do cross-validation, which would have been necessary if \\(\min L(D, t) + l r(t)\\) were used instead.

