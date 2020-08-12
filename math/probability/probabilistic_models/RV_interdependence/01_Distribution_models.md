+++
title = "01 Distribution models"

+++
## Discrete L: Response probability: Discriminative models
### Boolean valued functions
One can use boolean valued functions to get deterministic models of the form \\(y = f(x)\\). These functions are considered in the boolean functions survey and the computational learning theory survey.

### Probability from regression models
Take any (continuous variable regression) model \\(f: X \to [0, 1]\\). Such a model can be interpreted as modeling the probability distribution \\(f_L\\).

#### Advantages of modeling probability
The classifier doesn't care whether \\(C_{1}\\) is called class 1 or class 100. So, better than solving regression problem with y as the target.

### Model numeric labels with regression models
One may use regression models together with an appropriate round-off function to model discrete numerical labels.

#### Dependence on choice of ran(Y)
For the same k-classification problem, different choices of Y corresponding to \\(\set{L_{i}}\\) can yield different models classifiers. Ideally they should be independent of choice of labels. So, logistic regression preferred.

Eg: For binary classification problem, picking \\(L_{i} = \set{\pm 1}\\) yields different model from picking \\(L_{i} = \set{\frac{N}{n_{1}}, - \frac{N}{n_{2}}}\\), which yields fisher's linear discriminant!

#### y in 1 of k binary encoding format
Make matrix X with rows \\([1 x_{i}^{T}]\\). Make Y with rows \\(y_{i}^{T}\\). Want to find parameters W such that \\(XW \approx Y\\). Can try \\(\min_{W} \norm{XW-Y}_{F}^{2}\\), get solution: \\((XX^{T})\hat{W} = X^{T}Y\\). But \\(X\hat{W}\\) can have -ve numbers which approximate Y; so not very desirable technique

### Logistic model
Got k-class classification problem. Want to model class probabilities or log odds and make classification decision.

#### Log linear model for class probabilities
\\(\forall i \in [1:k]: Pr(C = i|x) \propto e^{w_{i0} + w_i^{T}x}\\). So, \\(Pr(C = i|x) = \frac{e^{w_{i0} + w_i^{T}x}}{\sum_j e^{w_{j0} + w_j^{T}x}}\\).

\exclaim{But this is over parametrized}: The choice of w is constrained by the fact that specifying \\(Pr(C = i|x) \forall i=1:k-1\\) completely specifies the probability distribution.

#### Equivalent form: model log odds
\\(\forall i\in [1:k-1]: \log\frac{Pr(C = i|x)}{Pr(C = k|x)} = w_{i0} + w_{i}^{T}x\\).

Get: \\(Pr(C = i|x) = \frac{e^{w_{i0}+ w_{i}^{T}x}}{1 + \sum_{j \neq k} e^{w_{j0}+ w_{j}^{T}x}}, Pr(C = k|x) = \frac{1}{1 + \sum_{j\neq k} e^{w_{i0}+ w_{i}^{T}x}}\\).

Same as the model described in previous subsubsection, with all \\(Pr(C = i)\\) scaled to ensure that \\(Pr(C = i|x) \propto e^{w_{i0} + w_i^{T}x} Pr(C = k|x)\\): done by ensuring that \\(w_k = 0\\). Thus taking care of earlier overparametrization!

##### Symmetric notation
Let \\(x \gets (1, x), w_i \gets (w_{i0}, w_i)\\). \\(
$$Pr(C = i|x) = \frac{e^{\sum_{c \in \set{1, .. m-1}} w_{c}^{T}x I[c=i]}}{1 + \sum_{j \neq k} e^{\sum_c w_{c}^{T}x I[c=j]}}\\)$$

#### 2-class case
For 2 class case, these are logistic sigmoid functions, thence the name.

#### Risk factors interpretation
\\(Pr(C_{i}|x)\\) is modeled as a sigmoid function which \\(\to 0\\) as \\(w_{i}^{T}x \to -\infty\\) and \\(\to 1\\) as \\(w_{i}^{T}x \to \infty\\). So, can consider \\(w_{i}\\) as the vector of weights assigned to features \\(\set{x_{j}}\\). \\(Sgn(w_{i})\\) usually indicates type of correlation with \\(C_{i}\\), but could be reversed in order to compensate for weightage given to other features. Eg: \\(C_{i}\\) could be 'has heart disease', and features may be liquor, fat and tobacco consumption levels.

#### As a linear discriminant
Consider the binary classification case. Here, \\(\log \frac{Pr(C = 1|x)}{1 - Pr(C = 1|x)} = w_0 + w^{T}x\\). So, \\(w_0 + w^{T}x>0 \equiv (Pr(c=1|x) > Pr(c=0|x))\\)

### Estimating parameters
Given observations \\((x^{(i)}, c^{(i)})\\), find w to \\(\max_w Pr(c^{(i)}|x^{(i)}, w)\\): maximum likelihood estimation.

#### Sparsity of model parameters
Sometimes, want w to be sparse or group sparse. In this case, for learning the parameters, lasso or group lasso is used.

## Discrete L: Response probability: Generative models
### Latent variable model
Assume that the parameter \\(W = w\\) actually generates lower dimensional \\(L\\), and that observation set \\(X\\) is generated from \\(L\\) using some stochastic transformation which is independent of \\(w\\).

\\(L\\) is called the latent variable.

### Assume conditional independence of input variables
Aka Naive Bayes. \\(Pr(L|\ftr(X)) \propto Pr(L) Pr(\ftr(X)|L) = Pr(L) \prod_{i} Pr(\ftr_{i}(X)|L) \\). \\(Pr(\ftr(X)|L) = Pr(L) \prod_{i} Pr(\ftr_{i}(X)|L)\\) is the assumption. Model parameters \\(Pr(\ftr_{i}(X)|L)\\) and \\(Pr(L)\\) are estimated from the training set \\(\set{(X_{i}, L_{i})}\\).

Co-clustering in a way recovers things lost due to the 'independence of probability of occurrence of features' assumption.
\tbc

One can conceive of a version of this classifier for the case where \\(L, \ftr(X)\\) are continuous. \oprob

#### Linear separator in some feature space
The decision boundary can be specified by \\(\log Pr(l_1) + \sum_{i} \log Pr(\ftr_{i}(x)|l_1) =  \log Pr(l_2) + \sum_{i} \log Pr(\ftr_{i}(x)|l_2)\\).

Apply the following mapping for variables: \\(y_{i,d} = I[\ftr_i(x) = d]\\); and create a new set of parameters: \\(w_{i, d} = \log Pr(\ftr_{i}(X) = d|l_1) - \log Pr(\ftr_{i}(X) = d|l_2)\\), and \\(w_0 = \log Pr(l_1) - \log Pr(l_2)\\). Now, the decision boundary is just \\(w_0 + w^{T}y = 0\\), which is a linear separator.

#### Success in practice.
Often works well in practice. Eg: In document classification.

#### Discriminative counterpart
Its discriminative counterpart is the class of all linear classifiers in a certain feature space, which corresponds to logistic regression. That, in general works better given a lot of samples.

### Use exponential family models
#### Specification
For \\(ran(Y) = \pm1\\): Let \\(Pr(x|Y=i) \propto exp(\dprod{w_i, \ftr(x)})\\), and \\(Pr(Y=1) = p\\).

So, the corresponding discriminative classifier is: \\(Pr(y|x) = exp(\log(\frac{p}{1-p}) + \log(\frac{Z(w_0)}{Z(w_1)}) + \dprod{w_1 - w_0, \ftr(x)})\\), which is a linear classifier.

The corresponding discriminative classifier can be deduced directly using logistic regression.

#### Tree structure assumptions
In estimating, it is important to use the family of tree strucutred graphical models: We can't tractably compute \\(Z(w)\\) otherwise. \\(w_i\\) can be done efficiently by computing the spanning tree of a graph among nodes with edges weighted by mutual information (Chow Liu algorithm).

Otherwise, mixture of trees are also used.

## Latent variable models: Expectation Maximization (EM) alg
### Problem
We have an observation \\(X=x\\) and want to deduce the label \\(Y\\).

#### Tough to Optimize likelihood
We want to \\(\max_w \log L(w|X=x) = \max_w \log \sum_y f_{X, Y|w}(x, y)\\), but this expression often turns out to be hard to maximize due to non-convexity/ non-smoothness. Suppose that this is the case. Also suppose that \\(f_{W|X, Y}\\) is easy to maximize.

So, we resort to local optimization of a surrogate function starting from an initial guess of \\(w\\).

#### Examples
May be want to find parameter \\(w\\) giving weights to a set of fixed Gaussians. Here, \\(Y\\) can be vector of id's of Gaussians whence observed data X comes from.

A more common and important application is in estimating HMM parameters.

### Iterative algorithm
Suppose that you are given \\(w^{(i)}\\). We want to obtain \\(w^{(i+1)}\\) such that \\(L(w^{(i+1)}) \geq L(w^{i})\\).

#### Intuition
Basic idea is to do the following repeatedly: at point \\(w^{(i)}\\), to find a tractable and approximate surrogate \\(Q(w| w^{(i)})\\) for \\(L(w|X)\\), and maximize it to get a 'better' \\(w^{(i+1)}\\).

Consider \\(Q(w| w^{(i)})\\) from the E-step below. \\(Q(w|w^{(i)})\\) is the expectation wrt \\(w^{(i)}\\) over \\(Y\\) of the log likelihood of \\(w\\) given \\((X, Y)\\). This seems to be a reasonable substitute for \\(L(w|X)\\).

#### E-step
Take \\
\\(Q(w | w^{(i)}) = E_{y \distr w^{(i)}}[(\log f_{X, Y|w}(x, y))]\\) to measure goodness of \\(w\\) in producing X and the current belief about Y.

#### M-step
Set \\(w^{(i+1)} = argmax_w Q(w | w^{(i)})\\).

### Analysis
#### Maximizing an approximation of the likelihood
Instead, construct a function Q(w) which lower bounds \\(\log L(w|X)\\); then maximize it to get \\(w^{(i+1)}\\); repeat.

#### Q(w) is a lower bound
Q(w) a lower bound for \\(\log L(w|x)\\).
<div class="proof">Regardless of how \\(Y \distr w^{(i)}\\) is distributed, \\(Q(w) = E_y \log L(w|x, y) \leq \log L(w|x)\\) because \\(E_t \log t \leq \log \max_{t \in T} t \leq \log \sum_T t\\).</div>

#### Convergence
Q() lower bounds L(), but we cannot guarantee that the \\(\max_w Q()\\) does not lead us away from the local maximum. So, monotonic convergence is not guaranteed. \chk

