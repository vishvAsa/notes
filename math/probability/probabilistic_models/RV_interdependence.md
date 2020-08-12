+++
title = "RV interdependence"
+++
## Distribution models
### Discrete L: Response probability: Discriminative models
#### Boolean valued functions
One can use boolean valued functions to get deterministic models of the form $y = f(x)$. These functions are considered in the boolean functions survey and the computational learning theory survey.

#### Probability from regression models
Take any (continuous variable regression) model $f: X \to [0, 1]$. Such a model can be interpreted as modeling the probability distribution $f_L$.

##### Advantages of modeling probability
The classifier doesn't care whether $C_{1}$ is called class 1 or class 100. So, better than solving regression problem with y as the target.

#### Model numeric labels with regression models
One may use regression models together with an appropriate round-off function to model discrete numerical labels.

##### Dependence on choice of ran(Y)
For the same k-classification problem, different choices of Y corresponding to $\set{L_{i}}$ can yield different models classifiers. Ideally they should be independent of choice of labels. So, logistic regression preferred.

Eg: For binary classification problem, picking $L_{i} = \set{\pm 1}$ yields different model from picking $L_{i} = \set{\frac{N}{n_{1}}, - \frac{N}{n_{2}}}$, which yields fisher's linear discriminant!

##### y in 1 of k binary encoding format
Make matrix X with rows $[1 x_{i}^{T}]$. Make Y with rows $y_{i}^{T}$. Want to find parameters W such that $XW \approx Y$. Can try $\min_{W} \norm{XW-Y}_{F}^{2}$, get solution: $(XX^{T})\hat{W} = X^{T}Y$. But $X\hat{W}$ can have -ve numbers which approximate Y; so not very desirable technique

#### Logistic model
Got k-class classification problem. Want to model class probabilities or log odds and make classification decision.

##### Log linear model for class probabilities
$\forall i \in [1:k]: Pr(C = i|x) \propto e^{w_{i0} + w_i^{T}x}$. So, $Pr(C = i|x) = \frac{e^{w_{i0} + w_i^{T}x}}{\sum_j e^{w_{j0} + w_j^{T}x}}$.

\exclaim{But this is over parametrized}: The choice of w is constrained by the fact that specifying $Pr(C = i|x) \forall i=1:k-1$ completely specifies the probability distribution.

##### Equivalent form: model log odds
$\forall i\in [1:k-1]: \log\frac{Pr(C = i|x)}{Pr(C = k|x)} = w_{i0} + w_{i}^{T}x$.

Get: $Pr(C = i|x) = \frac{e^{w_{i0}+ w_{i}^{T}x}}{1 + \sum_{j \neq k} e^{w_{j0}+ w_{j}^{T}x}}, Pr(C = k|x) = \frac{1}{1 + \sum_{j\neq k} e^{w_{i0}+ w_{i}^{T}x}}$.

Same as the model described in previous subsubsection, with all $Pr(C = i)$ scaled to ensure that $Pr(C = i|x) \propto e^{w_{i0} + w_i^{T}x} Pr(C = k|x)$: done by ensuring that $w_k = 0$. Thus taking care of earlier overparametrization!

###### Symmetric notation
Let $x \gets (1, x), w_i \gets (w_{i0}, w_i)$. $$Pr(C = i|x) = \frac{e^{\sum_{c \in \set{1, .. m-1}} w_{c}^{T}x I[c=i]}}{1 + \sum_{j \neq k} e^{\sum_c w_{c}^{T}x I[c=j]}}$$

##### 2-class case
For 2 class case, these are logistic sigmoid functions, thence the name.

##### Risk factors interpretation
$Pr(C_{i}|x)$ is modeled as a sigmoid function which $\to 0$ as $w_{i}^{T}x \to -\infty$ and $\to 1$ as $w_{i}^{T}x \to \infty$. So, can consider $w_{i}$ as the vector of weights assigned to features $\set{x_{j}}$. $Sgn(w_{i})$ usually indicates type of correlation with $C_{i}$, but could be reversed in order to compensate for weightage given to other features. Eg: $C_{i}$ could be 'has heart disease', and features may be liquor, fat and tobacco consumption levels.

##### As a linear discriminant
Consider the binary classification case. Here, $\log \frac{Pr(C = 1|x)}{1 - Pr(C = 1|x)} = w_0 + w^{T}x$. So, $w_0 + w^{T}x>0 \equiv (Pr(c=1|x) > Pr(c=0|x))$

#### Estimating parameters
Given observations $(x^{(i)}, c^{(i)})$, find w to $\max_w Pr(c^{(i)}|x^{(i)}, w)$: maximum likelihood estimation.

##### Sparsity of model parameters
Sometimes, want w to be sparse or group sparse. In this case, for learning the parameters, lasso or group lasso is used.

### Discrete L: Response probability: Generative models
#### Latent variable model
Assume that the parameter $W = w$ actually generates lower dimensional $L$, and that observation set $X$ is generated from $L$ using some stochastic transformation which is independent of $w$.

$L$ is called the latent variable.

#### Assume conditional independence of input variables
Aka Naive Bayes. $Pr(L|\ftr(X)) \propto Pr(L) Pr(\ftr(X)|L) = Pr(L) \prod_{i} Pr(\ftr_{i}(X)|L) $. $Pr(\ftr(X)|L) = Pr(L) \prod_{i} Pr(\ftr_{i}(X)|L)$ is the assumption. Model parameters $Pr(\ftr_{i}(X)|L)$ and $Pr(L)$ are estimated from the training set $\set{(X_{i}, L_{i})}$.

Co-clustering in a way recovers things lost due to the 'independence of probability of occurrence of features' assumption.
\tbc

One can conceive of a version of this classifier for the case where $L, \ftr(X)$ are continuous. \oprob

##### Linear separator in some feature space
The decision boundary can be specified by $\log Pr(l_1) + \sum_{i} \log Pr(\ftr_{i}(x)|l_1) =  \log Pr(l_2) + \sum_{i} \log Pr(\ftr_{i}(x)|l_2)$.

Apply the following mapping for variables: $y_{i,d} = I[\ftr_i(x) = d]$; and create a new set of parameters: $w_{i, d} = \log Pr(\ftr_{i}(X) = d|l_1) - \log Pr(\ftr_{i}(X) = d|l_2)$, and $w_0 = \log Pr(l_1) - \log Pr(l_2)$. Now, the decision boundary is just $w_0 + w^{T}y = 0$, which is a linear separator.

##### Success in practice.
Often works well in practice. Eg: In document classification.

##### Discriminative counterpart
Its discriminative counterpart is the class of all linear classifiers in a certain feature space, which corresponds to logistic regression. That, in general works better given a lot of samples.

#### Use exponential family models
##### Specification
For $ran(Y) = \pm1$: Let $Pr(x|Y=i) \propto exp(\dprod{w_i, \ftr(x)})$, and $Pr(Y=1) = p$.

So, the corresponding discriminative classifier is: $Pr(y|x) = exp(\log(\frac{p}{1-p}) + \log(\frac{Z(w_0)}{Z(w_1)}) + \dprod{w_1 - w_0, \ftr(x)})$, which is a linear classifier.

The corresponding discriminative classifier can be deduced directly using logistic regression.

##### Tree structure assumptions
In estimating, it is important to use the family of tree strucutred graphical models: We can't tractably compute $Z(w)$ otherwise. $w_i$ can be done efficiently by computing the spanning tree of a graph among nodes with edges weighted by mutual information (Chow Liu algorithm).

Otherwise, mixture of trees are also used.

### Latent variable models: Expectation Maximization (EM) alg
#### Problem
We have an observation $X=x$ and want to deduce the label $Y$.

##### Tough to Optimize likelihood
We want to $\max_w \log L(w|X=x) = \max_w \log \sum_y f_{X, Y|w}(x, y)$, but this expression often turns out to be hard to maximize due to non-convexity/ non-smoothness. Suppose that this is the case. Also suppose that $f_{W|X, Y}$ is easy to maximize.

So, we resort to local optimization of a surrogate function starting from an initial guess of $w$.

##### Examples
May be want to find parameter $w$ giving weights to a set of fixed Gaussians. Here, $Y$ can be vector of id's of Gaussians whence observed data X comes from.

A more common and important application is in estimating HMM parameters.

#### Iterative algorithm
Suppose that you are given $w^{(i)}$. We want to obtain $w^{(i+1)}$ such that $L(w^{(i+1)}) \geq L(w^{i})$.

##### Intuition
Basic idea is to do the following repeatedly: at point $w^{(i)}$, to find a tractable and approximate surrogate $Q(w| w^{(i)})$ for $L(w|X)$, and maximize it to get a 'better' $w^{(i+1)}$.

Consider $Q(w| w^{(i)})$ from the E-step below. $Q(w|w^{(i)})$ is the expectation wrt $w^{(i)}$ over $Y$ of the log likelihood of $w$ given $(X, Y)$. This seems to be a reasonable substitute for $L(w|X)$.

##### E-step
Take \\
$Q(w | w^{(i)}) = E_{y \distr w^{(i)}}[(\log f_{X, Y|w}(x, y))]$ to measure goodness of $w$ in producing X and the current belief about Y.

##### M-step
Set $w^{(i+1)} = argmax_w Q(w | w^{(i)})$.

#### Analysis
##### Maximizing an approximation of the likelihood
Instead, construct a function Q(w) which lower bounds $\log L(w|X)$; then maximize it to get $w^{(i+1)}$; repeat.

##### Q(w) is a lower bound
Q(w) a lower bound for $\log L(w|x)$.
\pf{Regardless of how $Y \distr w^{(i)}$ is distributed, $Q(w) = E_y \log L(w|x, y) \leq \log L(w|x)$ because $E_t \log t \leq \log \max_{t \in T} t \leq \log \sum_T t$.}

##### Convergence
Q() lower bounds L(), but we cannot guarantee that the $\max_w Q()$ does not lead us away from the local maximum. So, monotonic convergence is not guaranteed. \chk


## Graphical models
### Graphical model G of distribution
#### The modeling problem
Got RV's $X = (X_{i})$, $f_X(x)$: joint probability density. RV's as nodes. Edges representing dependencies.

##### Distribution structure/ sparsity
Seek to represent some factorization of the joint probability distribution concisely, thence conditional independence relationships too. In many cases, these factors involve small subsets of variables: sparsity in the dependency graph.

Eg: $f_X(x) = Z^{-1}\prod_{C \subseteq V} \gf_{C}(x_C)$. Compare notation with exponential family distributions.

###### Graphical model family
A graph alone describes conditional independence relationships which is satisfied by many distributions.

##### Uses
Any distribution can be represented by a (maybe complete) graphical model, but it becomes interesting only when the graph/ model is sparse.

Useful in representing causal relationships.

The factorization of Pr(x) lets ye store the joint probability distribution very concisely: usually ye would need $ran(X_i)^{n}$ space.

Can do fast inference using graph theoretic algs.

Can characterize running time and inference error bound in terms of properties of the underlying graph.

#### Factor graphs
##### Factors of Pr(x)
Bipartite graph of shaded ovals ($\set{i}$ for factors $f_{i}(\nbd(i))$: any nonnegative fns) and ovals (RV's $\set{X_{i}}$). $f_X(x) = Z^{-1}\prod f_{i}(\nbd(i))$. This is a 'hypergraph' among $\set{X_{i}}$, with generalized edges connecting 2 sets of variables.

Also defines another graph, $\nbd$ relationship amongst $\set{X_{i}}$; and thence 'path' is defined.

###### Connection with exponential families
Same as in the undirected model case.

##### Conditional independence
If every path between RV's X, Y passes through Z, Z separates X, Y. If Z separates X, Y $X\perp Y|Z$: Pf: See undirected model case.

So, can think of Z as an observed variable, Z blocks flow of information from X to Y. So, $\nbd(X)$ is its Markov blanket.

##### Expressiveness
Can express any factorization. Eg: can design factor f(X, Y) to say that X and Y are $\eps$ apart; so factors called compatibility functions.

#### Undirected graphical models
Aka Markov random field.

##### Factorization
$f_X(x) = Z^{-1} \prod \gf_{C_j}(x_{C_{j}})$, where $C_{j}$ are cliques of various sizes in G.

###### As an exponential distribution family
See section on exponential families.

##### Conditional independence properties
Aka Markov properties. Conditional independence properties, markov blanket same as in Factor graphs.

###### Global Markov
Take any A, B, Z. If Z separates A and B, $A \perp B | Z$.

\pf{Factorization implies this. Take A, B, Z; expand A and B to get A', B' which include all nodes reachable from A and B without crossing Z; So, $f_X(x) = f(x_{A'}, x_Z)f(x_{B'}, x_Z)$; so $A' \perp B' |Z$.}

###### Local Markov
$X_i \perp X_{V - i - N(i)} | X_{N(i)}$. Global markov implies this.

###### Pairwise Markov
If $(i, j) \notin E$, $X_i \perp X_j | X_{V-\set{i, j}} $. Implied by Global Markov. Local Markov implies this.

###### Factorization from pairwise markov for many Pr(x)
(Hammersley Clifford) If $\forall x: f_X(x) > 0$ pairwise markov implies factorization.

##### Tree structured case
###### Importance
It is easy to compute the partition function for this case. There exist efficient algorithms to do inference accurately on such models, and there are efficient algorithms to find the closest tree structred graphical model to any distribution.

###### Form and connections
$f_X(x) \propto \prod_{(i, j) \in T} \gf_{i,j}(x_i, x_j)$.

###### As directed model
Now, consider any node, say $x_1$, to be the root of the tree. \\$f_X(x_1, x_{\nbd(1)}) \propto \prod_{j \in \nbd(1)} \gf_{1, j}(x_1, x_j)$. But, \\$f_X(x_1, x_{\nbd(1)}) = f_{X_1}(x_1) \prod_{j \in \nbd(1)} f_{X_j|X_1}(x_j|x_1)$ from the conditional independence property of undirected graphical models. Applying this procedure recursively, one gets a directed graphical model.

###### In terms of marginals
Consider the corresponding directed model. \\
$f_{X_1,\nbd(1)}(x_1, x_{\nbd(1)}) = f_{X_1}(x_1) \prod_{j \in \nbd(1)} f_{X_j|X_1 = x_1}(x_j) \\= f_{X_1}(x_1) \prod_{j \in \nbd(1)} f_{X_j}(x_j) \prod_{j \in \nbd(1)} \frac{f_{X_j, X_1}(x_j x_1)}{f_{X_j}(x_j)f_{X_1}(x_1)}$.

Applying this procedure repeatedly, we get: \\$f_X(x) = \prod f_{X_i}(x_i) \prod_{(i,j) \in E} \frac{f_{X_i, X_j}(x_i, x_j)}{f_{X_i}(x_i) f_{X_j}(x_j)}$.

##### Pairwise graphical model
A subclass. $f_X(x) \propto \prod_i \gf_i(x_i)\prod_{(i,j) \in E} \gf_{i, j}(x_i, x_j)$.

##### Hierarchical models
A factor $\gf_c(x_c)$ exists only if, for all $s \subset c$, a factor $\gf_s(x_s)$ exists.

##### Discrete models
$\set{dom(X_i)}$ are discrete.

###### Pairwise-ification of discrete models
Can add some extra variables, \\
rewrite with all $C_j$ being pairwise: If cliques of size $p'>2$ exist, collapse that clique into a single node, expand the state space.

Note that, just because you know how to learn pairwise graphical models, you cannot simply construct a general discrete model learning algorithm: you don't know which nodes to collapse.

###### The general form
Consider exponential family attached to discrete graphical model G of n vars. Let $|dom(X_i)| = |M| = m$. Can assume G is pairwise.

We can completely specify $\ftr_{i,j}(x_i, x_j)$ by parameter matrix $T_{i, j}$ with \\
$T_{i,j, k, l} = \ftr_{i,j}(k, l)$.
$$f_X(x) = \propto e^{\sum_{(i, j) \in E} T_{i,j, x_i, x_j} } = e^{\sum_{(i, j) \in V^{2}} \sum_{k, l \in M^{2}}T_{i,j, k, l} I[x_i = k] I[x_j = l]}$$.
We can think of this as an exponential family distribution involving $|V|^{2}m^{2}$ auxiliary features/ covariates $y_{ij} = I[x_i = k] I[x_j = l]$. But this distribution $f_X(x)$ is now overparametrized, as $y_{i,j}$ are not linearly independent. [See section on minimal parametrization of exponential family distributions.]

Let $M' = M-\set{m}$. Using a minimal parametrization, we get an exponential family distribution involving only features $y_{ij;kl \in (M')^{2}} = I[x_i = k] I[x_j = l]$ and \\$y_{i;k \in (M')} = I[x_i = k]$. So, $Pr(X = x \in M') \propto exp(\sum t_{i;k} y_{i;k} + \sum t_{ij;kl} y_{ij;kl})$.

###### Ising model
$Pr(X = x|t) \propto e^{\sum_i t_i x_i + \sum_{(i, j) \in V^{2}} t_{i,j} x_i x_j}; dom(X_i) \in \pm 1$. Any binary undirected graphical model involving variables $Y_i$ with range $\set{1, 2}$ can be expressed like this: just consider the minimal parametrization of such distribution using the auxiliary features described earlier.

For signed edge recovery for the class of Ising models given a few observations, see structure learning part in statistics ref. Originally used in physics to model electron spins' interactions in the case of magnetism.

#### Junction tree model
Take an undirected graph G, find a junction tree T for it (see graph theory ref). Belief propagation algorithms work well over trees; hence this. Like a factor graph, there are 2 types of nodes: a set of nodes for cliques C in G. They are connected to each other through separators S.

##### Factorization
$f_X(x) = \frac{\prod_{c \in C}f_{X_c}(x_c)}{\prod_{s \in S} f_{X_s}(x_s)^{|\nbd(s)| -1}}$.

#### Directed
Aka Bayesian networks; but needn't be learned using Bayesian methods.

##### Extra notation
Shorthand for N nodes with identical parentage: a plate annotated by N, with a single node inside. Can represent deterministic variables with solid dots. Can represent observed variables as shaded nodes.

##### Factorization
Every $X_i$ annotated with $f_{X_i|par(X_i)}$ (aka factors).\\ $f_X = \prod_{i} f_{X_{i}|par(X_{i})} = \prod_{i} f(X_{i}, par(X_{i}))$.

There are many bayesian networks to represent $f_X$ based on different decompositions: eg: $X_1 = X_2 + X_3$. Not all are equally concise. Concise when expressing causal relationships.

###### Undirected 'moralized' graph
Make all edges undirected, but 'marry off' all unmarried parents: make cliques involving child and parents. These graphs are equivalent in terms of conditional independence.

##### Marginal independence
If X, Y don't have a common ancestor: $X \perp Y$. But, conditional independence, $X \perp Y |E$ need not hold if E has a common child of X and Y; Eg: $X_1 = X_2 + X_3$.

##### Dependency seperation of X, Y by Z
Aka d-separation. Every undirected path (X, Y) blocked by $W\in Z$. 2 types of blocking: $\to W \gets$: W not given;  $\to W \to$ or $\gets W \to$: W given.

d-separation is graph-independent: Even when multiple graphs model same distribution, the conditional independence relationship deduced from any of them hold.

###### Global Markov property
Let A, B, Z be sets of variables. $A \perp B |Z$ for all d-separating Z. Thence, markov boundary of X is \\
$\set{par(A), chi(A), par(chi(A))}$. Implied by factorization.

Also, if S separates A, B in moralized graph, $A \perp B | S$. But, when S does not separate A, B: look at subgraph of A, B, S.

###### Check d-separation
Use breadth-first-search to find unblocked paths. Aka Bayes ball algorithm.

##### Other conditional independence properties
###### Local markov property
desc(i) \dfn descendents of i. $X_i \perp X_{j \notin desc(i)}| par(i)$.

###### Pairwise markov property
$X_i \perp X_j | X_{\nbd(i) - j}$.

###### Connections
Factorization $\equiv$ Global Markov $\equiv$ Local Markov $\implies$ Pairwise markov. If $f_X(x)$ has full support, pairwise markov $\implies$ local markov.

##### Marginalized DAG
Let G = (V, E) be the DAG corresponding to Pr(x). The DAG corresponding to $f_{X_{V-A}}(x_{V-A})$ is obtained as follows: Take subgraph S in G induced by (V - A). For every $(u, v) \in (V-A)^{2}$, add a new edge if $\exists$ a directed path (u, s, v) in G, such that s is a sequence of vertices in A. Proof: Using factorization.

#### Comparison
##### Expressiveness
Take rain, sprinkler, grass wet (R, S, G) causal model. $R \perp S$ but $R \nvdash S|G$: 'Explaining away' phenomenon. Can't express this with other models.

Take rectangle shaped undirected graph. Can't make equivalent directed graph.

Undirected graphical models are better at expressing non-causal, soft relationships amongst RV's. Directed models are usually very intuitive to construct.

Undirected models less expressive than factor graphs. \why

##### Structural equivalence
Tree structured undirected graphical model can be expressed as a directed graphical model with the same structure: this is detailed in the undirected graphical models section.

The reverse is not true: as seen from the rain, sprinkler, grass wet example. But if edges in the DAG do not meet, a tree structured directed graphical model can be expressed as an undirected graphical model.


##### Independence relationships amongst vars
Conditional independence easier to determine in undirected models compared with directed graphical models. But marginal independence easier to determine in the former.

### Inference, decoding using Graphical model
See statistics survey for the following: structure learning (learn graph from data); parameter learning (learn parameters given graph).

#### Problems
Consider some $S \subseteq V$.

##### Inference problems
Find marginals $f_{X_S}$, or the partition function $Z$, or find $E[g(x)]$, when $g(x)$ factors nicely according to the graphical model.

##### Decoding problem
Find component $\hat{x}_S$ of the mode $\hat{x} = \argmax_x f_X$.

###### Global maximum vs marginal maxima
Note that this is different from the marginal maximum $\argmax_{x_S} f_{X_{S}}$ which may be found by solving the inference problem to find $f_{X_S}$ and then taking its maximum.

One cannot simply find the local/ marginal maxima $\argmax_{x_S} f_{X_{S}}$ and use it to find the global maximum.

##### Evidence
Maybe you want to solve these problems when values for some variables may be fixed: Eg: $X_T = x_T$.

##### Solving for all variables
Another variation to the inference and decoding problems is to solve them for all sets of the form $S = \set{i \in V}$.

#### Factorization and graph-based computations
##### Benefit of factorization
Inference problems involve summation over a subset $ran(X)$, while decoding problem involve finding the maximum over it.

Suppose that $f_X(x) = Z^{-1}\prod_{c \subseteq V} \gf_{c}(x_c)$. Distributive law is the key to summing/ maxing this function efficiently. Eg: see elimination algorithm, junction tree algorithm.

###### Elimination ordering
Order the factors to get $f(x) = \gf_{c_1}(x) .. $. Now, if you have variables $X_{T}$ involved only in factors $\geq i$, you get: $\sum_{x_{V-S}} f_X(x) = \sum_{x_{V-S - x_{T}}}\gf_{c_S}(x) .. \sum_{x_{T}}\gf_{c_i}(x)..$. An identical ordering is useful if we were doing $\argmax_{x_{V-S}} f(x)$ instead. 

This yields us the following reduction in dimensionality.

\subparagraph*{Reduction in dimensionality}
Suppose that $\max_i ran(X_i) = D$. Without the elimination ordering, we would have had to consider a set of $D^{|V-S|}$ values during summing/ maxing. As a result of using the elimination ordering, we now consider a set of $D^{|V-S-T|} + D^{|T|}$ values to do the same.

Thus, using this trick repeatedly, suppose that we find the elimination ordering $f_X(x) = \prod_{c \in p(V)} \gf_c(x_c)$ where $p(V)$ is a partition of $V$. Then, we will be only be summing/ maxing over $|p(V)|D^{\max_{c \in p(V)} |c|} = O(D^{\max_{c \in p(V)} |c|})$ values.

###### Finding the right order
Not all orders are equally good. There is a natural way to get this ordering for trees: consider the elimination algorithm.

##### Graph traversal view
Try to model the problem as one of making special graph traversals. Try to use local computations to replace global computations. Can think of this as nodes passing messages to each other.

#### Belief propagation
##### The Bottom-up idea
Exploit factorization and the elimination ordering we can solve the problem bottom-up.

If you are finding $\argmax_x f_X(x)$, this is the max-product algorithm, if finding $f_{X_1}(x_1)$, it is the sum product algorithm.

The idea: take local belief, take max or sum, propagate it to other nodes which need this to calculate their belief.

##### Node Elimination algorithm: Undirected Trees
Remove nodes to sum out/ max out one by one. Suppose want to find\\ $\argmax f_{X_{V-1}|X_1 = x_1}(x_{V-1})$. Then, root the tree at $x_1$, and do the following.

Message, a definition of a function, every node $X_j$ tells its parent $X_i$: \\
$m_{j \to i}(x_i) = \max_j \gf_{i,j}(x_i, x_j) \prod_{k \neq i, (j,k) \in E} m_{k \to j}(x_j)$. This is the message passing implementation. Belief of $x_1$: $b_1(x_1) = \prod_{(j,1) \in E} m_{k \to 1}(x_1)$.

Can use similar algorithm to find marginal $f_{X_1}(x_1)$.

###### Using known values
Suppose $X_2 = x_2$ is fixed in the above process. Nothing changes in the algorithm itself - only $X_2$ is thought of having only one value in its range while being summed over/ maxed over etc..

###### Finding conditional marginals
Suppose you want to find \\
$\argmax Pr(x_{V-1}|x_1, x_2)$. Root the tree at say $x_1$, execute the algorithm as usual; when you encounter factors involving $x_2$, don't sum/ max over $x_2$.

##### Reusing messages: Undirected Tree
Maybe you want to find $f_{X_i}(x_i) \forall i$, and want to reuse messages (computations involving summing out). Then, simply use these update rules: $m_{j \to i}(x_i) = \max_j \gf_{i,j}(x_i, x_j) \prod_{k \neq i, (j,k) \in E} m_{k \to j}(x_j) \forall i, j$.

The algorithm is naturally distributed - so scales well with number of nodes. Also, there is no need to compute an elimination ordering.

###### Feasibility
Each message depends on certain other messages, and it is computed when these messages are available. This is always possible for trees as there are no cyclical dependencies, and all messages are computed eventually.

##### Tree Factor graphs
Want to find $f_{X_i}(x_i) \forall i$, given tree structured factor graph. Root it at $x_1$, for every variable v and factor f, use the update rules: \\
$m_{v \to f}(x_v) = \prod_{f' \neq f}m_{f' \to v}(x_v),  m_{f \to v}(x_v) = \sum{v' \neq v} f(x) \prod_{v' \neq v} m_{v' \to v}(x_{v'})$. Belief $b_v(x_v) = \prod_{f}m_{f \to v}(x_v)$.


##### General undirected graphs
###### Use junction trees
Maybe you don't have a tree, but a graph for which you can get a junction tree. If the graph does not have one, can always convert it to a chordal graph by adding edges: but finding the minimal chordal supergraph is NP hard.

Belief propagation proceeds as in tree factor graphs, except the clique nodes play the role of variables, and the separators/ nodes representing variables shared between cliques play the role of factors.

Belief for each clique C is thus easily calculated; by induction over number of cliques in the clique tree, $b_c(x_c) = \sum_{V - c} f_X(x)$, as expected.

Finding the belief for each variable depends exponentially on tree width: must consider $dom(X_i)^{|C|}$ values while summing/ maxing.

###### Tree reweighted max product
Take $p(x) \propto g_1(x)g_2(x)$, such that every clique involved in p(x) is either in $g_1$ or in $g_2$. Then, if $x^{*} \in \argmax g_1(x) \land x^{*} \in \argmax g_2(x), x \in \argmax p(x)$. So, can find smart ways of splitting p; then maximize each g; if the intersection of the maximal points is not empty, then done; otherwise, move around edge-mass.

##### Approximate inference: Loopy belief propagation
###### Trouble because of loops
Suppose there were loops, you can try initializing all incoming messages at all nodes with 1, applying update rule at each node repeatedly. Each node calculates $m_{i \to j}^{(t+1)} = \gf_{i,j}(x_i, x_j)\prod_{k \neq j}m_{k \to i})^{(t)}$.
Also, as messages (a function output vector $m(x_i)$) may keep growing bigger; may need to normalize each message at each iteration.

###### Applicability
There are almost no theoretical guarantees of convergence or correctness; but widely applied in practice. But, when applied to trees, it is consistent with usual belief propagation, and yields the right answer.

An example in case of the inference problem involved in decoding binary linear codes is given in the information/ coding theory survey.

###### Computation tree at iteration j wrt node i
A way to visualize the undirected graph, as it looks to node i at iteration j, while it calculates the belief $b_i^{(j)}(x_i)$ during loopy belief propagation. For j=0, the tree is just the single node i. For every j, you add a level to the tree, indicating new messages which are considered in $b_i^{(j)}(x_i)$ - the new leaves attached to a node k are $\nbd(k) - par(i)$. Each tree is a valid graphical model in itself.

Eg: consider triangle 1, 2, 3. Initially, tree is 1. Then new level (2, 3) is added. Then children 3', 1' are added to 2; and 1', 2' are added to 3. These copies of nodes are conceptually different from the original: the messages they send are different.

###### 'Correctness in case of steady state' results
This is useful because: maybe loopy belief propagation will be in a steady state, before there is a loop in the computation tree - so highly dependent on the initialization!

\subparagraph*{Damped max product}
Use control theory idea to force oscillating system towards a steady state. Each node actually uses message \\
$m_{i \to j}'^{(t+1)} = m_{i \to j}^{(t)l}m_{i \to j}^{(t+1)(1-l)}$.

###### Max-product on single cycle
But, if you are doing max-product on a graph which is a single cycle, and if you hit a steady state for all messages, then the computation yields the right answer to $\argmax_x f_{|X_1 = x_1}(x$. This also holds for graphs which are trees, single cycles or single cycled trees.

Proof idea: Consider the computation tree T wrt $x_1$ at the steady state. Then, belief computed at $x_1$ corresponds to $\argmax_x f_{X \distr T}(x_{V-1}|x_1)$, the max product belief correct for this tree. But, see that \\
$Pr_{T}(x_{V-1}|x_1) =  t Pr(x_{V-1}|x_1)^{k}$ for some k, t. Thence relate argmax $Pr_{T}$ with argmax $Pr$.

#### For Gaussian graphical models
Maybe given normal distribution of in the form $f_X(x) \propto e^{-2^{-1}x^{T}Px + hx}$ by specifying P and $h = P \mean$, where P is the precision matrix. For every $P_{i,j} \neq 0$, there is an edge in the model graph G.

Max product finds the mean; sum product finds the marginal: either case reduces to finding the mean $\mean$; so they correspond to executing the same algorithm. Marginalizing or maxing over a gaussian distribution yields another gaussian $e^{-2^{-1}x^{T}P'x + h'x}$, so the messages passed during message passing algorithm correspond to the parameters of this expression.

##### Connection with solving Ax = b
Essentially solving $P\mean = h$ for $\mean$; perhaps loopy belief propagation can be used to solve Ax = b for very large $A \succeq 0$. Convergence happens only if P is diagonally dominant.

If G is a tree, then this corresponds to Gaussian elimination.

#### Directed graphical models
One can simply convert directed graphical models to equivalent undirected models and use inference algorithms described for them.

## Sparse signal detection
### Scale mixture models
\tbc

## Affinity modeling
### Problem
One wants to probabilitically model 'affinities' (joint, conditional probabilities) of entities of two or more types. Entity types are modeled by discrete random variables (say $W$ and $D$). 

#### Motivation
Besides common motivations for modeling joint distributions of random variables, one may want to model affinities probabilistically in order to get low dimensional representations of one or both of these entities (motivations for which are described in the dimensionality reduction chapter of the statistics survey).

### Non probabilistic ways
These are considered in the latent factor analysis section in the dimensionality reduction chapter of the statistics survey.

Eg: Latent Semantic Analysis (LSA), aka Latent Semantic Indexing (LSI): Use SVD to get factors for documents and words.

### pLSA
Probabilistic LSA.

#### Aspect model
Each document is a convex combination/ mixture of topics, each topic defines a distribution over words; each word is drawn from this mixture of distributions. $Pr(w|d) = \sum_t Pr(t|d)Pr(w|t)$. So, $Pr(w, d) = Pr(d)\sum_t Pr(t|d)Pr(w|t) = Pr(t)\sum_t Pr(d|t)Pr(w|t)$ : observe 2 factorizations.

\begin{figure}[!htb]
\tikzstyle{surround} = [thick,draw=black,rounded corners=2mm]
\begin{tikzpicture}[node distance=1cm,>=stealth',bend angle=15,auto]
\node (D)[gm-var-hidden]{D};
\node (T)[gm-var-hidden, right of = D]{T};
\node (W)[gm-var-seen, right of = T]{W};
\path [->] (D)  edge (T) (T)  edge (W);
\node[gm-plate] (background) [fit = (T) (W)] {};
\end{tikzpicture}
\end{figure}

#### Modeling assumptions
Bag of words assumption: given topic, words are chosen independently. Conditional independence: Given a mixture of topics (d), $w_1|t \perp w_2|t$.

#### Dimensionality reduction
Each document, which was earlier a vector in the vocabulary space, is now a vector in the topic space.

#### Defects
Unclear how to assign probability to unseen item.

### Latent Dirichlet Allocation (LDA)
Attempt to model observed bags of words at the corpus level. Look upon documents in corpus as having been generated by a process parametrized by corpus-level constant a. Also, add corpus level constant parameter b as extra parameter for generating words, given a topic.

\begin{figure}[!htb]
\begin{tikzpicture}[node distance=1cm,>=stealth',bend angle=15,auto]
\node (a)[gm-var-constant]{a};
\node (D)[gm-var-hidden, right of = a]{D};
\node (T)[gm-var-hidden, right of = D]{T};
\node (W)[gm-var-seen, right of = T]{W};
\node (b)[gm-var-constant, right of = W]{b} edge [->] (W);
\path [->] (a) edge (D)
(D)  edge (T)
(T)  edge (W);

\node[gm-plate] (words) [fit = (T) (W)] {};

\node[gm-plate] (documents) [fit = (words) (D)] {};

\end{tikzpicture}
\end{figure}


## Modeling stochastic processes
### Stochastic process with state space T
Aka random process. T-valued random variable/ state sequence indexed by $r\in R$ (often time): visualize as a time-series - a directed graph which is a straight line.

#### Multiple coin toss processes
Consider a sequence of coin tosses. Let $X_i$ model the outcome of the i-th toss.

Bernoulli process: iid bernoulli trials: the same coin is tossed multiple times, that is $\forall i: X_i \distr p$. Resulting from such a process is the Binomial distribution for $\sum_i X_i$.

Poisson trials: independent but not necessarily identically distributed trials, that is $X_i \distr p_i$.

#### Continuous time
Aka flow. \tbc

### State transitions
Many models often propose that behind the production of a sequence of observations, there are (possibly hidden/ latent) changes in internal state. They allow transition from one state to another to be stochastic.

Let the state at time t be $X_{t}$. Let $V$ be the set of possible states.

#### Assumptions about state transitions
##### Dependence solely on prior state
A model which assumes the Markov property described below is often convenient to represent states.

###### Sequence distribution: chain structure
Markov property/ assumption: Future states are independent of past states: $f_{X_{t+1}|X_{t} .. X_{0}} = f_{X_{t+1}|X_{t}}$.

A state transition model with this property is called a Markov chain/ bigram state chain, considering the chain-like graphical model of the distribution of the variables $\set{X_t}$.

So, the set of distributions $\set{f_{X_t|X_{t-1} = t} \forall t \in T}$ completely describes the state transition model.

##### Dependence on prior k states
Suppose that the concept of a bigram state chain is generalized to a k+1-gram state chain. So, $f_{X_t|X_{t-1} .. X_0} = f_{X_t | X_{t-1} .. X_{t-k}}$: a weaker independence property holds.

##### Reduction to bigram state chain
Consider a bigram state chain with the state sequence being $(Y_t)$, and $ran(Y_t) = T^{k}$. Then, we will have the bigram Makrov property: $f_{Y_t | Y_{t-1} .. Y_0} = f_{Y_t|Y_{t-1}}$.

Since it is easy to translate between $(Y_t)$ and $(X_t)$, we have a way to do learn k-gram model using corresponding algorithms for the bigram model.

#### Describing bigram model
##### State transition matrix
Thence get a $|V| \times |V|$ transition matrix P with \\$P_{x,y} = f_{X_{t+1}| X_{t} = x}(y)$; also see stochastic matrices in linear algebra ref.

Probability distribution vector over states at r: $p_t$. $p_{t} = P p_{t-1} = P^{t}p_{t-1}$.

##### State transition graph
Consider state graph G = (V, E) with transition probabilities on edges, labeled with transition probabilities independent of time (time homogenous). This labeled graph is a diagrammatic way of accurately representing a markov chain.

##### Types of states and chains
Recurrent state: $Pr(revisit) \rightarrow 1$. Aperiodic state: $GCD \set{t: P^{t}_{x,x} >0} = 1$.

Irreducible: No unreachable state. If finite and irreducible, +ve recurrent. If +ve recurrent et aperiodic: ergodic.

###### Detailed balance property
Reversible chain: $\exists \pi: \forall x, y: \pi_{x}P_{x,y} = \pi_{y}P_{y,x}$.

##### Learning transition probabilities
Given a sufficiently long sequence $X_i$, one can estimate various transition probabilities $P_{x, y}$ by $\frac{\sum_t I(X_t = y| X_{t-1} = x)}{\sum_t I(X_{t-1}=x)}$.

#### Unique Stationary distribution \htext{$\pi$}{..} of ergodic chains
$\forall x, y: \\
lt_{t\to \infty}P^{t}_{x,y} = \pi_{y}$. Find $\pi$: $P\pi =\pi$, $\sum \pi_{i}=1$; or inflow = outflow. If time-reversible, $\pi$ uniform.

#### Mixing time of Ergodic chain
##### Purpose, definition
Suppose that given the state transition graph of a markov chain, one wishes to sample a state from the stationary distribution.

One way to do this would be to do a long random walk (see randomized algorithms survey) on the state transition graph.

The mixing time of a Markov chain is the time taken for this sampling process to lead to a distribution close to the stationary distribution.

Mixing time also determines number of transitions to make before you can take a sample roughly independent from previous sample.

##### Coupling lemma
Start 2 identical copies of markov chain starting from arbitrary states. States at time T: $X_{T}, Y_{T}$. $Pr(X_{T} \neq Y_{T}|X_{0}\neq Y_{0}) \leq \epsilon \Rightarrow t(\epsilon) \leq T$. Variation distance is non-increasing.

Let $\sum$ smallest column entries = m. Then, $||p_{x}^{t}-\pi|| \leq (1-m)^{t}$. $t(\epsilon)\leq t(c)(\ln \epsilon/\ln c)$.

##### Mixing time bound
Select clever coupling, maybe define distance function $d_{t}$ and show that $Pr(d_{t} \geq 1) = E[d_{t+1}|d_{t}] \leq b d_{t}$ for $b<1$, bound prob that chains haven't converged, use coupling lemma. Maybe take 2-step chain, use geometric coupling. 

#### Straight line state transitions
##### Gambler's winnings
Suppose that two gamblers start with seed money: $l_{1}, l_{2}$. They toss a fair coin and bet a dollar until one of them is bankrupt.

From the perspective of player 1, this can be modeled as a markov chain with the state space representing the amount of money player 1 has: ranging $\set{0, .. l_1 + l_2}$. The initial state of the player is $l_1$, and transition probabilities are defined thus: $Pr(X_t = l_k +1 |X_{t-1}= l_k) = Pr(X_{t}= l_k -1 |X_{t-1}= l_k) = 1/2$ for $k \in {2 .. l_1 + l_2 -1}$, with $0$ and $l_1 + l_2$ being terminal states.

###### Analysis using martingale property
$E[X_t]=X_{t-1}$; and so $E[X_{\infty}] = l_1$. So $Pr(X_{\infty} = l_2 + l_1) (l_2 + l_1) = l_1$. So, Pr(1 wins)=$\frac{l_{1}}{(l_{1}+l_{2})}$.

##### Queue
Arrival rate $a$, departure rate $m$. $\pi_{i}=(\frac{a}{m})^{i}(1-\frac{a}{m})$. $h_{u,v}$ = E[Steps from u to v]. $\pi_{i} = 1/h_{i,i}$.

### Martingale \htext{$\seq{Z_{n}}$}{..} wrt filtration
#### Problem
Suppose that one observed RV $\seq{Z_n}$ and a filtration or a series of events $\seq{F_n}$, with the property that $F_n \supseteq F_{n-1}$.

Suppose further that: \\$E[|Z_{n}|] < f(n) < \infty$, that $Z_n$ is fully determined when $F_n$ is observed, and $E[Z_{n}|F_{n-1}] = Z_{n-1}$ (or $E[Z_{n}|F_{n-1}] - Z_{n-1} = 0$).

This process is the martingale $\seq{Z_n}$ wrt filtration $\seq{F_n}$.

##### Example
The filtration can correspond to the observation of a sequence of random variables $\seq(X_n)$.

Note that this defines martingale $\seq{X_{n}}$ wrt itself. Eg: Wealth after 100 fair-coin-toss bets, Brownian motion.

#### Properties
Note that this implies that  $E[Z_n] = E[Z_0]$.

#### Stopping time T
One can stop the stochastic process based on past (not future) bets/ Observations of $X_i$; the corresponding time is called the stopping time.

\textbf{Stopping theorem}: If $E[T] < \infty$ or $T$ bounded or $|Z_{i}|<c$, then $E[Z_{T}]=E[Z_{0}]$. Wald: If $X_{i}$ iid, $T$ stopping time: $E[\sum_{i=0}^{T}X_{i}] =E[T]E[X]$.


#### Doob martingale
Anything like $Z_{i}=E_{X_{i+1 .. X_{n}}}[f(X_{1}..X_{n})|X_{1}..X_{i}]$ fits defn of Martingale: \\
Eg: \\
$E_{X_{2} .. }[Z_{2}|X_{1}] = E_{X_{2} ..}[E_{X_{3} ..}[f(X_{i})| X_{1}, X_{2}]| X_{1}] = \\
\sum_{x_{2}} E_{X_{3} ..}[f(X_{i})| X_{1}, X_{2} = x_{2}] Pr_{X_{2}}(X_{2} = x_{2}|X_{1})= E_{X_{2} ..}[f(X_{i})| X_{1}] = Z_{1}$.

#### Find expected running time of a game
Make a martingale, use Wald's equation.

#### Concentration around starting value
(Azuma) For martingale $\set{X_{i}}$: \\
$|X_{k}-X_{k-1}|<c_{k}$ : $Pr(X_{t}-X_{0} \geq l) \leq e^{-\frac{l^{2}}{2\sum c_{k}^{2}}}$.

Eg: If you make small bets then you stay near mean.

\pf{Define new RV: $Y = X_{t}-X_{0} = \sum Y_{i}, Pr(e^{aY} \geq e^{al}) \leq \frac{E[e^{aY}]}{e^{al}} = \frac{E[\prod e^{aY_{i}}]}{e^{al}} = \frac{\prod E[e^{aY_{i}}]}{e^{al}}$ (from independence of $\set{Y_i}$). Take $a>0$.

As $e^{aY_{i}}$ is convex and $Y_i \in [-c_i, c_i]$, so $e^{aY_{i}} \leq \frac{e^{ac_{i}} (1 - \frac{Y_{i}}{c_{i}}) + e^{-ac_{i}}(1 + \frac{Y_{i}}{c_{i}})}{2} \leq \frac{e^{ac_{i}} + e^{-ac_{i}}}{2}$ as $e^{ac_{i}} > e^{-ac_{i}}$. So $E[e^{aY_{i}}|X_{1} .. X_{i}] \leq \frac{e^{ac_{i}} + e^{-ac_{i}}}{2} \leq e^{(ac_{i})^{2}/2}$ from $e^{x}$ series.

So, $Pr(e^{aY} \geq e^{al}) \leq e^{-al}e^{\sum_i (ac_{i})^{2}/2}$. Setting $a=\frac{l}{\sum c_i^{2}}$, we get the result.}

\core{In the foregoing proof, the crucial idea was considering the exponentiated event, which could then be decomposed and bounded due to independence. The algebraic trickery in selecting the right value for $a$ and in coming up with the bounds were interesting.}

Applying to martingale $\set{-X_{i}}$: $Pr(X_{t}-X_{0} \leq -l) \leq e^{-\frac{l^{2}}{2\sum c_{k}^{2}}}$.

##### Applied to Doob Martingale
$Z_{i}=E[f(X_{1}..X_{n})|X_{1}..X_{i}]$. If f satisfies Lipschitz condition with bound c (max change c in $f(X_{1}..X_{n})$ when $X_{i}$ changes): $Pr(|E[f(X_{1}..X_{n})] - f(X_{1}..X_{n})| \geq l) \leq 2e^{-\frac{l^{2}}{2nc^{2}}}$. Aka method of bounded differences (MOBD).

Note: No independence needed till here.

##### Additive Bound for deviation from mean
(Azuma Hoeffding) So, let independent, not necessarily identically distributed $X_{i} \in [b, c]$, $f(X_{1}..X_{n}) = X = \sum X_{i}$. $Pr(|\sum X_i - \sum \mu_i| \geq na)\leq e^{-\frac{n^{2}a^{2}}{2nc^{2}}}$.

###### Application in estimating mean
If $\set{X_i}$ also identically distributed:\\
 $Pr(|X - n\mu| \geq na)\leq e^{-\frac{n^{2}a^{2}}{2nc^{2}}}$.

##### Additive deviation bound for sum of Poisson trial RV's
If $\frac{X}{n} = \hat{p}, Pr(|\hat{p} - \mu| \geq \epsilon) \leq 2e^{-\frac{n\epsilon^{2}}{2}}$. $1-\epsilon$ confidence interval for parameter p.

### n-gram model
#### Model
##### Subsequence/ prefix probabilities: notation
First, one models the probability $Pr(w_n|w_{1:n-1})$ of a word $w_n$ coming after $n-1$ words $w_{1:n-1}$.

###### Occurrence near sentence terminals
We want to use the notation $w_n|w_{1:n-1}$, with $n$ fixed, for considering the event where $w_n$ appears after the string $w_{k+1:n-1}$ appearing at the beginning of a sentence - distinct from the case where $w_{1:k}$ is some specific string. We accomplish this by setting $w_{1:k} = @^k$, where $@$ represents a special 'sentence terminal' word. This will allow us to write $Pr(w_n|w_{1:n-1})$ without being wrong.

Similarly, if $w_{n} = @$, $Pr(w_n|w_{1:n-1})$ denotes the probability of $w_{1:n-1}$ appearing at the end of a sentence.

Note that $Pr(w_1|@^m)$ actually represents the probability of $w_1$ appearing first in a sentence, and $Pr(w_2|@^{m-1}w_1)$ is the probability of $w_2$ appearing 2nd in a sentence after $w_1$. They are distinct from probabilities of occurrence of $w_1$ or $w_2$ after $w_1$ irrespective of position in the sentence.

##### Actual probability
As a sort of necessary preprocessing, ensure that $w_m$, the last word in the string is $@$, and $w_{1:n-1} = @^{n-1}$.

Then, the probability of generating a given $m$ word string is exactly \\$Pr(w_{1:m}) = \prod_{k=n:m} Pr(w_k|w_{1:k-1})$.

##### Markov assumption
If one makes a simplifying nth order Markov assumption, which says that any word depends only on the previous $k<=n-1$ words, we get the approximation: $Pr(w_{1:m}) \approx \prod_{k=n:m} Pr(w_k|w_{k-n+1:k-1})$.

#### Estimation
$Pr(w_n|w_{1:n-1})$ are estimated by counting the number of occurrences of strings $w_{1:n}$ and $w_{1:n-1}$.

##### n and corpus size
Even in a large sized corpus, for large $n$, n-string sequences $w_{max(k-m+1, 1): k}$ may be very rare; so it becomes difficult to estimate the necessary probabilities accurately.

One way of dealing with probabilities $Pr(w_n|w_{1:n-1})$ for which there is inadequate data is to replace them with $Pr(w_n|w_{2:n-1})$. In doing this, we have locally simplified the n-gram model into an $n-1$ gram model. One can even recursively reduce the model complexity until the data we have suffices to accurately estimate the simplified model. Thus, there is a tradeoff between accuracy/ complexity and estimability.

Also, storage space required to store model parameters grows exponentially with $n$.

##### Rare words
With rare words, one again encounters the problem of being able to estimate $Pr(w_n|w_{1:n-1})$ accurately with limited data. To deal with this, one often replaces rare word occurances with a special word UNK during preprocessing.

#### Smoothing
\tbc

### Partially observed states
#### Observations, states
$(X_i)$ are called features/ covariates/ predictor/ input/ observed variables. $\seq{L_i}$ is the unobserved response/ state variable sequence. $X_i$, being a partially dependent of $L_i$, can be viewed as a partial observation of the state $L_i$.

The state space is $ran(L_i)$, while the observation space is $ran(X_i)$.

##### Use
These models are not only used for deriving models for $f_X$, but also for determining the state sequence $L$ given $X$.

##### Applications
Spelling corrector, where X stands for the observed typed word and L stands for unobserved dictionary word. 

Predicting part of speech is a classic application of HMM's.

#### Model classes
##### Generative model of Pr(X, L)
As in the case of general models of response variables, one may use these models to derive models for $f_{L|X}$ if needed.

This class of models includes HMM's.

##### Model L given X
Aka Conditional random field (CRF). Here, one uses a discriminative model $f_{L|X}$; so no effort is wasted in modeling $f_X$. The most common CRF is just a chain among $L_i$.

###### Ignoring sequentiality
One can model $f_{L|X}(l |x) = \prod_i f_{L'|X'} (l_i|x_i)$. This model works surprisingly very well: Eg: In part of speech tagging, it yields around .95 correctness, while HMM may yield perhaps .02 more accuracy.

Note that this is not entirely same as Naive Bayes because $ran(X_i)$ may be multidimensional, and the  model $f_{L'|X'}$ need not assume that these features are independent. So, any of the wide variety of classifiers may be used.

#### Partially observed state chain
Aka Bigram Hidden Markov Model (HMM).

##### Graphical model
The graphical model of the observation and label sequences has the following structure for $i = 2:N$ :

\begin{figure}[!htb]
\tikzstyle{surround} = [thick,draw=black,rounded corners=2mm]
\begin{tikzpicture}[node distance=1.3cm,>=stealth',bend angle=15,auto]
\node (Xi-1)[gm-var-hidden]{$L_{i-1}$};
\node (Xi)[gm-var-hidden, right of = Xi-1]{$L_i$};
\node (Li-1)[gm-var-seen, below of = Xi-1]{$X_{i-1}$};
\node (Li)[gm-var-seen, right of = Li-1]{$X_i$};
\path [->] (Xi-1)  edge (Xi)
(Xi-1)  edge (Li-1)
(Xi)  edge (Li);
\end{tikzpicture}
\end{figure}

##### Representations
Parameters of a bigram HMM are the state transition probabilities $f_{L_t|L_{t-1}}$ and observation generation probabilities: $f_{X_t|L_t}$. As in the case of fully observed state chains, the state transition probabilities can be represented using a transition matrix or as labels of edges in a state transition graph which could now be expanded to include vertices corresponding to various observations.

##### Decoding/ filtering
###### Problem
We want to find the most likely state sequence $X_1:X_N$.

###### Message passing algorithm
Viewing the state-chain as an equivalent undirected tree-structured graphical model, we can solve the problem using the divide and conquer max-product algorithm. When the messages passed during this computation are done in an order similar to that described in case of the forward-backward algorithm for finding marginal state distributions, we have the Viterbi algorithm.

##### Online label distribution inference
###### Problem
Unlike the decoding problem, one is not satisfied with finding the most likely state sequence, the task is to find $f_{L_N|X_{1:N} = x_{1:N}}$ at time $N$.

###### Forward algorithm
One can use a node elimination/ message passing \\
algorithm applied to find the marginal probability distribution in the equivalent undirected tree structured graphical model. The node elimination ordering is: $1 .. N$. So, this is aka 'forward' algorithm.

This algorithm can be described inductively. At step $t$, suppose that one has determined $f_{L_{t-1}, x_{1:t-1}}$, one simply does: 

$$f_{L_t, x_{1:t}}(l_t) = \sum_{l_{t-1}} f_{L_{t-1}, x_{1:t-1}}(l_{t-1}) f_{L_{t}|L_{t-1}}(l_t|l_{t-1}) f_{X_t|L = l_t}(x_t)$$.

The base case is when $t = 1$, and $f_{L_1|x_1} = f_{X|L_1}(x_1)f_{L_1 = l}$ can be easily determined. So, by induction it follows that we are able to determine $f_{L_N, X_{1:N} = x_{1:N}} \propto f_{L_N| X_{1:N} = x_{1:N}}$.

###### Analysis
This is an $O(|T|^{2})$ operation at each time step, where $T$ is the state space.

If there are $N$ time steps, the algorithm yields the correct result for $f_{L_N|x_{1:N}}$. But for $k < N$, $f_{L_k|x_{1:k}} \neq f_{L_k|x}$. This can be remedied by using the forward backward algorithm described below.

##### Past Label Distribution inference
###### Problem
Aka Smoothing. One wants to find the sequence of distributions $(f_{L_k})$. This is a particular type of inference.

###### Algorithm
One simply uses the node-elimination/ message passing sum-product dynamic programming algorithm to find marginal probabilities $f_{L_k}$ of tree structured graphical models.

This is aka the forward backward algorithm when done for all $k$, and when computation is done in the following order: upchain 'messages' ($m_{t-1 \to t}$) are passed first (in the forward step) and then down-chain 'messages' ($m_{t+1 \to t}$) are passed (in the backward step).

###### Analysis
The first step corresponds to the forward step described earlier, so $f_{L_i, x_{1:i}}$ is computed, at each node $i \in 1:N$.

In the backward step, at each node $i \in N:1$, $f_{x_{i+1:N}|L_i}$ is calculated. This can be described iteratively: suppose that $f_{x_{i+1:N}|L_i}$ is available, then one can find: $f_{x_{i:N}|L_{i-1}}(l_{i-1}) = \sum_{l_i} f_{x_{i+1:N}|L_i}(l_i) f_{L_i|L_{i-1}}(l_i|l_{i-1})$. So, it is in a way symmetric to the forward step.

Then, $f_{L_i, x} \propto f_{L_i| x}$ can be found by multiplying these.

##### Learning given (X, L) examples
Aka Supervised HMM learning. The basic idea is to use the empirical transition/ observation generation probabilities in order to estimate the HMM parameters.

###### Smoothing
Especially in the case of observation generation probabilities, some smoothing is required: otherwise the distribution model would assign a probability of 0 to every state sequence $l$ which might generate the observation sequence $x$ containing a word not seen among the labeled examples. Also, it may be desirable to ensure that the observation generation probability $f_{X'|L'}(x'|l') > 0$ for any pair $(x', l')$.

###### Reestimation using observation sequences
Suppose that one also has access to samples of $X$, one can improve the parameter estimates by applying the EM algorithm described elsewhere for the case where only samples of $X$ are provided.

##### Learning given observation samples X only
To do this, starting with an initial guess about the parameters $\param^{(0)}$, one can iteratively produce parameters $\param^{(i)}$ with greater likelihood values $f_{X|\param}(x)$ from $\param^{(i-1)}$ using the EM local optimization algorithm.

Two steps of the algorithm: 1] For each sample $x$: using $\param^{(i-1)}$ with the forward-backward algorithm, infer distributions $f_{L_i| x}$; 2] Use this distribution to update maximum likelihood estimates [ie expectations] of the number of occurrences of $k \in ran(L_i)$, $(k_1, k_2) \in ran(L_i)^2$, $(k, x)$; using which $\param^{(i)}$ is computed as in the supervised case (: empirical emission and transition probabilities, possibly smoothed).

#### k-gram HMM
One can extend the notion of bigram HMM's to allow the current state to depend on previous $k-1$ states. Analogous the case of k-gram Markov chains, these can be reduced to bigram HMM's by expanding the state space to $ran(L_i)^{k-1}$. Thus, inference and learning algorithms for bigram HMM's can be adapted to work on k-gram HMM's.

### Decision process
Stochastic processes where state sequence partially depends on a sequence of actions taken by an agent are described in the Machine intelligence survey.

## Continuous response variables' prediction
Aka regression.

For overview, see Statistics survey. Here one models a (set of ) response random variable $Y$ in terms of input variables $X$.

### Data preparation and assumptions
Saling, centering, addition of bias variables is assumed below. That, along with motivation, is described in the statistics survey.

### Generalized linear model
#### Linear models
Here, we suppose that $L|X \distr XW + N$, where $N$ is a 0-mean noise RV. Then, $E[L] = XW$, which is linear in parameters $w$.

Correpsonding to the constant variable $X_0 = 1$, we have bias parameters $W_{0,:}$.

#### Generalization
One can extend the family of linear models so that $E_{L|X}[L] = g^{-1}(XW)$ and $var[L] = f(E_{L|X}[L])$. Note that the variance is then a function of the predicted value.

A distribution from the exponential family must be used.

##### Log linear model
Aka poisson regression. $\log(E[L]) = XW$.

##### Logistic model
Aka logit model, logistic regression. A generalized linear model. See 'discriminative models of response' section.

##### Perceptron: step function
Here $E_{L|X}[X] = I[XW > 0]$.

### Multi-layer generalized linear model
Aka Artificial Neural Network, multi-layer perceptron (a misnomer given that the activation function described below is not the non-differentiable step function). 

#### Model
Suppose one wants to predict $Y=y$ using the input $X^{(0)}=x^{(0)}$ (aka input layer). The model $Y = h(X^{(0)})$ is hierarchical.

One can obtain layer upon layer of intermediary random variables $X^{(j)} = \set{X_i^{(j)}}$, where $X_i^{(j)} = f(\dprod{w_i^{(j)}, X_i^{(j-1)}} + w_{i, 0}^{(j)})$. Suppose one has $k$ such intermediary layers. One finally models $X_j^{(k+1)} = h(\dprod{w_j^{(k+1)}, X^{(k)}})$ (aka the output layer).

##### Component names
The intermediary layers are called hidden layers. Neurons in the hidden/ 'skip' layers are called hidden units. Neurons in the output layer are called output units.

$a_i^{(j)} = \dprod{w_i^{(j)}, X_i^{j-1}} + w_{i, 0}^{(j)}$ is called the activation.

##### Activation function
$f$ is usually a non-linear function - the logistic step function with the range [-1, 1] and the tanh function are commonly used in case of classification problems being solved by relaxation to regression problem. In case of regression problems or in case of 'skip' layer variables, the final $f$ is just the identity function - or a sigmoid function which approximates it. 

##### Visualization as a network
There is the input layer, hidden layers and the output layer. Directed arrows go from one layer to the next. This is a Directed Graphical Model except that the intermediary dependencies are deterministic, not stochastic.

##### Nomenclature
Depending on preference, a model with $K$ layers of non-input (intermediary + output ) variables is called a $K+1$ or $K$ layer neural network. We prefer the latter.

2 layer networks are most common.

#### Connection to other models
\tbc

#### Model training
One can write $Y = h(X)$ where $h$ is a differentiable, yet non-convex function. One can fit model parameters to training data $((x_i, l_i))$ by minimizing (possibly regularized) empirical loss.

##### Gradient finding
Given an error fn $E(y)$ for a given data point $(x, t)$, various optimization techniques require one to find $\gradient_{w} E(y)$. This gradient can be found efficiently using the error back-propagation algorithm.

The idea is that the parameter $w_{k, j}^{(f)}$ only affects $E(y)$ through the output : $X_k^{(f)}$, so one can apply the chain rule for partial derivatives.

For output unit, $\frac{dE(X_1^{(t)})}{dw_{1, j}^{(t)}} = \frac{dE(X_1^{(t)})}{dX_1^{(t)}} f'(a_1^{(t)}) X_j^{(t-1)}$. Denote $d_1^{t} \dfn \frac{dE(X_1^{(t)})}{dX_1^{(t)}} f'(a_1^{(t)})$ - the quantity multiplied with $X_j^{(t-1)}$ in the expression. This is aka 'error'.

Assume that $\frac{dE(X_1^{(t)})}{dw_{i, j}^{(f)}} = d_i^{(f)} X_j^{(f-1)}$ holds for neurons in the levels $f:t$. We can see that a similar expression holds for level $f-1$ too.

For symbol manipulation convenience, set $i$th input to $k$th neuron in layer $f$: $Z_{k, i}^{f} = X_i^{f-1}$. Using chain rule for partial derivatives:

$\frac{dE(X_1^{(t)})}{dw_{i, j}^{(f-1)}} = \sum_k \frac{dE(X_1^{(t)})}{dZ_{k, i}^{f}} \frac{d X_{i}^{(f-1)}}{dw_{i, j}^{(f-1)}}= \sum_k d_k^{f} f'(a_i^{(f-1)})X_{j}^{(f-2)}$ .

Setting $d^{(f-1)}_i = \sum_k d_k^{f} f'(a_i^{(f-1)})$, we see from mathematical induction that $\frac{dE(X_1^{(t)})}{dw_{i, j}^{(f-1)}}$ can be calculated for all neurons given the 'error' for the layer ahead.

So, the back propagation algorithm to find the gradient is: First run the neural network with input $x$ and record all outputs $X_j^{k}$. Starting with the output layer, determine the error $d^{(f-1)}_i$ and thence the appropriate gradient components.

##### Weight initialization
Starting point for (stochastic) gradient descent is done as follows. Weights can be initialized randomly with mean 0 and standard deviation $1/m^2$, where $m$ is the fan-in of a unit.



#### Flexibility
There are theorems which show that a two layer network can approximate any continuous function to arbitrary accuracy - provided a sufficient number of intermediary variables are allowed!

The flexibility of the multi-layer generalized linear model derives from the non-linearity in the activation functions.

#### Disadvantages
Objective function minimized during training is non-convex.

Large diversity in training examples required. The model learned is not accessible for use in modeling the process producing the data realistically, though it may be effective.

It can be inefficient in terms of storage space and computational resources required.

The brain by contrast solves all these problems because: its hardware is tuned to the neural network architecture; its training examples have suffiencient variety.

### Deep belief network
Extending the idea of neural networks, adding structure to it and using a sort of L1 regularization to make the network sparse, one gets deep belief networks. These have proved to be very successful in many applications since 2007.

\tbc


