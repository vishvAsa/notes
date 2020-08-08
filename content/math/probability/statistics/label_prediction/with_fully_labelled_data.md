+++
title = "With fully labelled data"
+++

Goals and formulations are presented elsewhere.

## Binary classification
See the many hypothesis classes/ parametrized model families in the colt ref, boolean functions ref.

## Non parametric methods
### k nearest neighbors
A discriminative, non parametric approach. Number of examples: N. Samples: \\(S = (x_{1}, .. x_{N})\\). There are \\(k\\) classes. To classify \\(x\\),  find \\(k\\) nearest neighbors in S; take their majority vote.

So, can't ever throw away data points.

## Linear models for discrete classification
Linear separability of data sets or feature space: Decision surfaces are (p-1) dim hyperplanes in feature space.

\\(h(x, w) = f(w^{T}x + w_{0}) = f(v^{T}x')\\) with \\(x' = (x, 1)\\): \\(f\\) is activation function or link function; \\(w\\) is the weight vector; \\(w_{0}\\) is the bias. So without loss of generality, we can restrict ourselves to considering only hyperplanes passing through the origin.

Decision surfaces are h(x, v) = constant or \\(v^{T}x'\\) = constant, so linear in \\(x\\); Not linear in terms of \\(w\\) due to possible non linearity of \\(f\\): so called generalized linear model.

For binary classification, this becomes a halfspace: see boolean function ref and colt ref.

For geometric properties of separating hyperplane, see boolean function ref.

### Arbitrary separator from fully separable training set
When the training set is fully separable, one can pick one of the many separating hyperplane easily, for example, using linear programming. For other such algorithms, see computational learning theory ref.

To select the best among the candidate hyperplanes, one can use some sort of regularization, as in maximum margin classifiers.

### Winnow: multiplicative update
Let weight of \\(c\\) be \\(W\\). Set weights \\(a_{i} = 1\\). Multiplicative update rule: if \\(x_{i}\\) agrees with c(x), set \\(a_{i} = a_{i}(1+\del)\\); set \\(a_{i} = a_{i}/(1+\del)\\) for others. \\(mb = O(W^{2} \log n)\\). \why Sometimes better than additive update rule used in the perceptron algorithm.

This is very similar to the 'panel of experts' algorithm. Also see note in the section on perceptron algorithm comparing this with the 'panel of experts' algorithm.

### Perceptron learning alg for halfspaces
#### The problem
The classifier: A hyperplane c through origin perfectly classifies labeled data; unit vector \\(u \perp c\\) defines c; \\(c(x_i) = sgn(\dprod{u, x_i})\\).

The data: \\(x \in R^{n}\\); \\(\norm{x_i} = 1\\); \\(S = \set{x_i}\\). Geometric margin of X wrt u: \\(g = \min_{x \in S} |\dprod{u, x}|\\); or \\(sgn(\dprod{u, x_i})\dprod{u,x_{i}} \geq g\\). Note: g = function(S).

Want to find \\(c\\).

#### The algorithm
\\(u_{0} = 0\\). Additive update rule: If mistake on \\(x_i\\): \\(u_{i+1} = u_{i} + sgn(\dprod{u, x_i})x_i\\): hyperplane orientation tilted towards correcting the mistake.

#### Convergence to u
\\(mb = O(g^{-2})\\). In general, if \\(\norm{x_i} \leq R\\); \\(mb = O((\frac{R}{g})^{2})\\).

By induction, using update rule expression for \\(u_t\\): \\(\norm{u_t} = \norm{u_t}\norm{u} \geq \dprod{u, u_t} \geq tg\\). So, if the length of \\(u_t\\) is not increasing too much, may be perceptron is getting closer to u as more mistakes made.

Also, by induction, the update rule and the fact that \\(u_{t-1}\\) misclassified \\(x_{t-1}\\), causing the update: \\(\norm{u_{t}}^{2} \leq t\\).

So, \\((tg)^{2} \leq t\\); and \\(t\leq g^{-2}\\).

#### Comparison
Perceptron Algorithm is usually faster than than LP. Is exponential when \\(g \leq 2^{-c}\\): this is rare.

For a given \\(g\\), we can find good enough halfspace with mb \\(O((\frac{R+D}{g})^{2})\\). \chk Perhaps the winnow algorithm, which uses multiplicative update is more efficient.

Has connection to halfspace learning with noise. \why

Assumes that the data is perfectly separable. So, often less preferable than soft margin SVM's. But, a soft margin variant of perceptron algorithm is known.

##### With panel of experts algorithm
Compare the perceptron algorithm \\(B\\) with the algorithm \\(A\\) described in the learning theory survey, which for any given sequence of inputs, using a panel of experts achieves a mistake bound comparable with the mistake bound achieved by the best expert. In the case of halfspaces, every input bit \\(x_i\\) can be viewed as an 'expert'.

Upon making a mistake, \\(A\\) updates the weight of only the experts which made a mistake, whereas \\(B\\) updates weight assigned to every expert.

The weights used in \\(A\\) were all positive, whereas weights used in \\(B\\) can be negative: but this distinction is minor, as it can perhaps be accounted for in the 'experts algorithm' by introducing experts corresponding to \\(-x_i\\).

## Maximum margin classifier
### The problem
A discriminative, parametric approach. Number of examples: N. Samples: \\((x_{1}, .. x_{N})\\), label function \\(c:X \to \set{\pm 1}\\).

Suppose \\(y(x) = w^{T} \ftr(x) + w_0\\) with \\(y(x)c(x) > 0 \forall x\\), for some \\(w, w_0, \ftr\\). So finding a separating hyperplane (see halfspaces in boolean function ref) in some feature space.

### Hard margin
#### Primal
To maximize margin, solve: \\(\max_{w,w_0}[\frac{\min_{n}[y(x_{n})c(x_{n})]}{\norm{w}}]\\). Scale w, \\(w_0\\) so that \\(\min_{n}[y(x_{n})c(x_{n})] = 1\\); thence get \\(\equiv\\) problem \\(\min_{w,w_0}\frac{\norm{w}^{2}}{2}\\): \\(y(x_{n})c(x_{n}) \geq 1\\). Prediction: sgn(y(x)).

Can solve using Quadratic programming (QP).

#### Dual
Get Lagrangian \\(L(w, w_0, a) = \frac{\norm{w}^{2}}{2} + \sum a_{n}[1-(w^{T} \ftr(x_n) + w_0)c(x_{n})]\\); \\(a_{n} \geq 0\\). Get dual: \\(g(a) = \inf_{w, w_0} L(w, w_0, a)\\); Set \\(\gradient_{w, w_0} L(w, w_0, a) = 0\\): \\(w = \sum_{n}a_{n}c(x_{n}) \ftr(x_{n}); 0 = \sum a_{n}c(x_{n})\\). So, dual problem: \\(\max_a g(a) = \max \sum a_{n} - 2^{-1}\sum_{n}\sum_{m} a_{n}a_{m}c(x_{n})c(x_{m})k(x_{n}, x_{m})\\): \\(a_{n} \geq 0; \sum a_{n}c(x_{n}) = 0\\).

Can solve using QP too. This form is useful where \\(dim(\ftr(x)) >>N\\).

##### KKT conditions
Primal feasible: \\(y(x_{n})c(x_{n}) \geq 1\\). Dual feasible: \\(a_{n} \geq 0; \sum a_{n}c(x_{n}) = 0\\). Complementary slackness: \\(a_{n}[1 - c(x_{n}) y(x_{n})] = 0\\).

So, \\(\forall n: a_{n} = 0 \lor c(x_{n})y(x_{n})= 1\\): in latter case, you have support vectors. So, aka Support Vector Machine (SVM). Take S: number of support vectors.

##### Predictor
Substituting for w, get: \\(y(x) = \sum_{n}a_{n}c(x_{n})k(x_{n}, x) + w_0\\): only S terms actually appear with \\(a_{n} \neq 0\\): so SVM is fast to evaluate. So, \\(w_0 = \frac{\sum_{m} [c(x_{m})y(x_m) - \sum_n a_{n}k(x_{n}, x_{m})]}{N}\\).

### Soft margins
Allow some points to be misclassified or to be below the margin, but linearly penalize such outliers.

#### Primal
So, use slack variables: \\(\gx_{n} \geq 0\\); Instead of \\(y(x_{n})c(x_{n}) \geq 1\\), use constraint \\(y(x_{n})c(x_{n}) + \gx_{n} \geq 1\\).

\\(\min C\sum_{n=1}^{N} \gx_{n} + \frac{\norm{w}^{2}}{2}\\): \\(C\\) is tradeoff between penalty on \\(\gx\\) and margin; saying \\(\sum \gx_i \leq G\\); so controls model complexity. As \\(C \to \infty\\), get hard margin SVM.

#### Dual
Lagrangian: \\(L(w, w_0, \gx, a, m) = \frac{\norm{w}^{2}}{2} + C\sum_{n=1}^{N} \gx_{n} + \sum a_{n}(1 - c(x_{n})y(x_{n}) - \gx_{n}) + \sum \gm_{n}\gx_{n}\\): \\(a \geq 0, \gm \geq 0\\). Set \\(\gradient_{w, w_0, \gx} \\)L\\( = 0\\): \\(w = \sum a_{n}c(x_{n})\ftr(x_{n}), \sum a_{n}c(x_{n}) = 0, a_{n} = \\)C\\( - \gm_{n}\\). Thence get dual g(a), with objective function same as hard-margin case with constraints: \\(0 \leq a_{n} \leq C\\): as \\(\gm_{n} \geq 0; \sum a_{n}c(x_{n}) = 0\\).

##### KKT conditions
Primal feasible: \\(1- c(x_{n})y(x_{n}) - \gx_{n} \leq 0\\). Dual feasible: \\(a_{n} \geq 0, \gm_{n} \geq 0\\). Complimentary slackness: \\(a_{n}(1 - c(x_{n})y(x_{n}) - \gx_{n}) = 0, \gm_{n}\gx_{n} = 0\\).

So, support vectors now are points on or within certain margin from hyperplane. Predictor same as hard margin case.

