+++
title = "Decision procedure selection"
+++

## Overview, motivation
Some discipline is necessary in order to avoid common errors which consume effort and resources. The below describes steps common to many problems including density estimation and classification.

Formulate the problem in decision theoretic terms properly - pick an appropriate 'risk/ loss function' (possibly incorporating prior belief), a candidate feature set. Then fix a model family (possibly after a literature survey) and develop a model selection procedure. Then use empirical risk estimation using cross validation in order to avoid overfitting to training data. Repeat.

## Picking the right hypothesis space H
### Hypothesis space H
Often we constrain ourselves to picking a decision procedure from a certain limited set, the hypothesis space \\(H\\).

\\(H\\) is usually specified by imposing a structure which must be satisfied by all decision procedures in it; so it may also be called a model family.

\\(H\\) can be further restricted by specifying the loss function appropriately: this is described elsewhere.

### Motivation, Factors to consider
Picking a limited hypothesis space \\(H\\) is often necessary because considering all possible hypotheses may be computationally infeasible. Also, we may want \\(H\\) to be convex, so that we can then efficiently minimize empirical risk over it.

Prior beliefs/ requirements about the ideal decision procedure also influence the choice of \\(H\\).

Constraining \\(H\\) just for the sake of avoiding overfitting is considered elsewhere.

#### Approximation vs estimation error tradeoff
\\(\hat{\gth} = \argmin_{t\in H_n} R(t)\\). If \\(H_n\\) large, we can reduce approximation error \\(|R(\param) - R(\hat{\gth})|\\), but the decision procedure learning process will find it tougher to get to \\(\hat{\gth}\\) in terms of time, memory or number of samples required. In other words, estimation error \\(|R(\hat{\gth}) - R(d)|\\) high. +++(Larger hypothesis classes generally outperform smaller ones - if given enough data.)+++

If \\(H_n\\) too small, approximation error is high, estimation error low. +++(When training data is limited, smaller hypothesis class is better. But, Misleading if assumption about the best decision procedure is false.)+++

### Parameters
A decision procedure may be concisely specified using a small number of parameters \\(\param\\) - perhaps as a function over sufficient statistics extracted from observations (\\(S =s\\)). Other decision procedures require \\(O(|s|)\\) of parameters to be specified.

Hypothesis classes are called non-parametric or parametric based on the decision procedures which constitute them. Decision procedure learning methods may similarly be parametric or non-parametric, based on the hypothesis class used.

Non-parametric hypothesis classes are usually bigger and more flexible.

Many of the advantages and disadvantages associated with using parametric and non-parametric classes therefore follow from comparison of the use of large and small \\(H\\) described earlier.

#### Common structural assumptions
Sparsity. Low matrix rank. Block structure: Eg: zeros appear in blocks/ entire rows/ columns; row sparsity.

## Loss function choice
Choosing a risk or loss function enables us to compare decision procedures.

Constraining \\(L\\) in order to avoid overfitting during empirical risk minimization is considered elsewhere.

### Evaluation
When ultimately evaluating a decision procedure, one should use the loss function without prior belief biases (unlike the one possibly used in empirical risk minimization). This actual risk of the decision procedure chosen is called the generalization error.

In research reporting: Final evaluation/ test data must never be used in fitting (hyper)parameters for this results in overfitting to the test/training set combination.

## Theoretically find the best d
### Best d for fixed \htext{\\(\theta\\){ground truth}}
Use geometry of \\(R\\) described earlier. If \\(\gth\\) were fixed, then the best \\(d\\) would correspond to the point of the convex hull \\(R(S')\\) with least \\(R(\gth, d)\\): This will always be a corner.

### Minimum expected (Bayesian) risk
Pick \\(d\\) with min expected risk.

#### Geometry
Let dim(T) be finite.\\ If \\(\pi(\gth)\\) is the prior, then risk is \\(\sum_i \pi(\gth_i)R(\gth_i,d) = c\\) where \\(d\\) is the best response for a certain \\(\gth\\). So, this is a certain point in the 'base' of the convex hull \\(R(S')\\). So set of risks of such decision procedures are represented in the 'base' faces of the convex polyhedron.

Visualize this in 2D.

Comparing geometries: Every bayesian risk minimizing decision procedure with full support is also admissible.

### Choose an admissible procedure
d is admissible if \\(\nexists d': [\forall \gth R(\gth, d') \leq R(\gth, d)]\\), \\(\exists \gth: [\forall d': R(\gth, d') < R(\gth, d)]\\).

#### Geometry
Take convex hull \\(R(S')\\). Given \\(d\\), to find a d' which 'dominates' \\(d\\) for some fixed \\(\gth_i\\), while being as good as \\(d\\) for all other \\(\gth\\): drop a line through \\(d\\) which is \\(\perp\\) axis corresponding to \\(\gth_i\\). The lowest point in the hull along this line dominates every other point in the hull.

So, possible admissible procedures correspond to base of the convex hull, except faces which are perpendicular.

So, every admissible procedure is a min Bayes risk procedure for some prior.

### The adversarial setting: minimax procedure
See game theory. Ye assume that the adversary knows what you pick, assume that adversary is rational, and choose the \\(\hat{d} = \inf_d \sup_{\gth} R(\gth, d)\\).

#### Geometry
Take convex hull \\(R(S')\\). Find the 'lowest' point in the hull which meets the ball \\(\norm{\gth}_\infty = c\\) (max norm: looks like a square).

### Compare risk profiles of d over range of \htext{\\(\gth\\){ground truth}}
\\(R(\gth, d)\\) can change for different values of \\(\gth\\). So, can plot \\(R(\gth, d)\\) vs \\(\gth\\) curves for various \\(d\\) and compare.

## Empirical risk minimization
Aka model selection, training the model, learning the parameters (if the hypothesis class is parametric).

Solve: \\(\hat{t} = argmin_t \hat{R}(t, D)\\). So, you try to get best fit to training data from \\(H\\).

If both \\(H\\) and \\(\hat{R}(t, D)\\) are convex, you have a convex optimization problem.

### Fit to D vs generalization ability
A problem with empirical risk minimization is the limited amount of data available. This means that minimizing \\(\hat{R}(t, D)\\) may be quite different from minimizing \\(R\\).

#### Training error
\\(\hat{R}(t, D)\\), derived only from a loss function, not incorporating any bias about the decision procedure, is aka the training error. It is useful in diagnozing underfitting and overfitting.

#### Overfitting
Sometimes, an algorithm may pick a decision procedure which minimizes empirical risk on the training data/ training error (ie maximizes fit to \\(D\\)), but has high risk \\(R\\) (low generalization ability).

As in this case, the decision procedure varies highly with the training data \\(D\\), it is called the 'high variance' case.

#### Underfitting
The decision procedure chosen by the algorithm may have a high generalization error and high training error. This could be due to the non-convexity of the empirical risk function.

This case is aka the 'high bias case'.


### Overfitting and model complexity
#### Model complexity
Complex model classifies training data excellently but performs poorly on test data. So, the complex model is unstable.

So, look for simple hypothesis, in Occam's razor style; minimize description length. Keep low model complexity/ level of specialization while still fitting the training set well.

#### Limiting number of parameters
As number of data points \\(N\\) increases, this problem becomes less. Rough heuristic: \\(N \geq 5\\) or 10 times the number of adaptive parameters in model.

#### Polynomial regression example
Eg: Fitting a polynomial with parameters \\(w\\) to a sine curve: what should the degree \\(d\\) be?

For a given \\(N\\), generalization ability increases (error on test set decreases) with \\(d\\), then levels off until \\(d\\) = N-1 when it sharply drops (error increases): overfitting: simple interpolation occurs there, and magnitude of coefficients \\((w_{i})\\) sharply increases there. So use regularization, with \\(w_{0}\\) omitted in regularization term.

### Avoiding overfitting
#### Altered risk function
When we have prior belief about the best decision procedure, it can be incorporated into the expression for the risk function to be used for empirical risk minimization.

Take \\(t_n = argmin_t \hat{R}(t,(X_i)) + \gl r(t)\\), where \\(\hat{R}\\) is the original risk function, \\(r()\\) is regularizer and \\(\gl\\) is the regularization parameter.

#### Altered loss function
The altered risk function can be interpreted as arising from an altered loss function constructed especially for empirical risk minimization - one incorporating the prior belief.

#### Other derivations
This alternate objective function may also be derived by other means: for example using the Bayesian/ Schwartz or Akaiki Information Criteria (BIC or AIC) in case of parametric density estimation.

#### Hyper-parameters
Hyper-parameters such as the regularization parameter represent the prior belief about the decision procedure. They could include choice between model families.

### Statistical efficiency analysis
If \\(L\\) is convex, differentiable, strongly convex around t' wrt certain \\(C\\) (see vector spaces ref). Then take \\(A = H_n\\) as the hypothesis space and B a certain space outside it, so that decomposability holds wrt r(): \\(\forall a\in A, b\in B: r(a + b) = r(a) + r(b)\\). Then, pradeep etal bound distance \\(d(t', t_n)\\).


#### Accuracy of empirical risk estimate
\core  If the \\(H\\) is small and if \\(\hat{t}\\) is learned using many samples, the empirical risk is close to actual risk.

If \\(G\\) finite, can bound \\(Pr(\sum_i(L(t, x_i) - E[L(t, x)]) \geq \eps)\\) using martingale concentration bound (Hoeffding). Can then apply union bound to get bound on \\(Pr(\sup_t \sum_i(L(t, x_i) - E[L(t, x)]) \geq \eps)\\). [The union bound is very intuitive when probability is viewed as a measure.]

If \\(G\\) infinite, take \\(\eps\\) covering wrt \\(\norm{.}_\infty\\) to get \\(G_\eps\\), take union bound over that. Thence bound: \\(N(\eps, G, \norm{.}_\infty) exp(\frac{-2n\eps^{2}}{9 B^{2}})\\).

These same principles are used in 'Occam razor' and the 'VCD Occam razor' in computational learning theory.

#### Bound deviation from optimum h: bound empirical risk error
\core  If the \\(H\\) is small and if \\(\hat{t}\\) is learned using many samples, the risk due to \\(\hat{t}\\) is close to that of \\(\gth\\).

Thence, \\(R(\hat{t}) - R(\gth)= R(\hat{t}) - \hat{R}(\hat{t}) + \hat{R}(\hat{t}) - \hat{R}(\gth) + \hat{R}(\gth) - R(\gth) \leq 2 \sup_t (R(t) - \hat{R}(t))\\): as \\(\hat{R}(\hat{t}) - \hat{R}(\gth) \leq 0\\) from empirical loss minimization.

Thence, \\($R(\hat{t}) - R(\gth) \leq 2n^{-1}\sup_t \sum_i(L(t, x_i) - E[L(t, x)]).\\)\\( So, want to bound \\)Pr(\sup_t \sum_i(L(t, x_i) - E[L(t, x)]) \geq \eps)\\(. Take function space \\)G = \set{L(t,.) \forall t}$.

### Check generalization ability
Aka validation.

#### Motivation
Given limited data and having picked a decision procedure \\(\hat{t}\\), one is often motivated to approximate the generalization ability. Then, one can judge whether over-fitting or under-fitting has happened.

#### General procedure
One partitions the limited data in some way into training data and validation data, which is aka 'hold out set', a stand-in for the data the decision procedure will ultimately be evaluated on.

Then, learn parameters of different models on first part of training data and test for generalization ability by measuring the empirical loss (without any regularization for prior biases about the decision procedure) on the hold-out set.

#### Multiple rounds for robustness
For the sake of robustness, this can be repeated many times, and the empirical risk associated with a given model is taken to be the average of empirical risks measured during these runs. The model with the least average empirical risk is considered the best.

#### Cross validation
A particular variant is k-fold cross validation. Here, the data is divided into \\(k\\) equal sets. There are \\(k\\) different validation rounds. In each round, one of these \\(k\\) sets is designated the 'hold-out' set, while the union of the remaining sets is designated the training set.

Cross-Validation is better than simple validation because the latter could involve picking parameters overfitted to a particular training/ test set combination.

### Tuning risk minimization
#### Diagnosis
High generalization error is often due to overfitting or underfitting. It is easy to distinguish the two by comparing the training error (t) with the cross validation error (v) (both of which should not include the prior belief/ regularization component). In the former (high bias case), \\(t \approx v\\) and both are high. In the latter (high variance) case, \\(v >> t\\).

According to the diagnosis, one can determine whether more suitable hypothesis spaces and feature sets should be tried, or whether one can achieve better results using just the currently available data.

#### Picking hyperparameters
Theoretically, these would come from the risk function where some weight is given to the prior belief.

In practice, we often do not know what weight should be assigned to penalty for violation of prior belief. So, \\(\gl\\) is often learned (ie: the strength of the belief is calculated) using validation.

## Combining Decision procedures
Rather than picking \\(d \in H\\) with the minimum risk, it is sometimes possible to combine multiple decision procedures in \\(H\\) to produce a randomized decision procedure with lower risk. This combination may be based on a 'bestness' probability distribution over \\(H\\). Eg: combination of several classifiers or rankers to produce superior classifiers/ rankers.

## Offline vs online learning
If new information is provided one at a time, the agent may want to keep improving its decision rule after each new observation. This is online learning.

## Interpreting the decision procedure selected
This is important if the decision procedure is being learnt in order to figure out the laws of nature: what genes are triggered in a certain situation? Models learnt from training data is often very hard to interpret/ match with intuition.

Sparse solutions are often easier/ more rational to interpret.

