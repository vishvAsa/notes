+++
title = "02 Graphical models"

+++
## Graphical model G of distribution
### The modeling problem
Got RV's \\(X = (X_{i})\\), \\(f_X(x)\\): joint probability density. RV's as nodes. Edges representing dependencies.

#### Distribution structure/ sparsity
Seek to represent some factorization of the joint probability distribution concisely, thence conditional independence relationships too. In many cases, these factors involve small subsets of variables: sparsity in the dependency graph.

Eg: \\(f_X(x) = Z^{-1}\prod_{C \subseteq V} \gf_{C}(x_C)\\). Compare notation with exponential family distributions.

##### Graphical model family
A graph alone describes conditional independence relationships which is satisfied by many distributions.

#### Uses
Any distribution can be represented by a (maybe complete) graphical model, but it becomes interesting only when the graph/ model is sparse.

Useful in representing causal relationships.

The factorization of Pr(x) lets ye store the joint probability distribution very concisely: usually ye would need \\(ran(X_i)^{n}\\) space.

Can do fast inference using graph theoretic algs.

Can characterize running time and inference error bound in terms of properties of the underlying graph.

### Factor graphs
#### Factors of Pr(x)
Bipartite graph of shaded ovals (\\(\set{i}\\) for factors \\(f_{i}(\nbd(i))\\): any nonnegative fns) and ovals (RV's \\(\set{X_{i}}\\)). \\(f_X(x) = Z^{-1}\prod f_{i}(\nbd(i))\\). This is a 'hypergraph' among \\(\set{X_{i}}\\), with generalized edges connecting 2 sets of variables.

Also defines another graph, \\(\nbd\\) relationship amongst \\(\set{X_{i}}\\); and thence 'path' is defined.

##### Connection with exponential families
Same as in the undirected model case.

#### Conditional independence
If every path between RV's X, Y passes through Z, Z separates X, Y. If Z separates X, Y \\(X\perp Y|Z\\): Pf: See undirected model case.

So, can think of Z as an observed variable, Z blocks flow of information from X to Y. So, \\(\nbd(X)\\) is its Markov blanket.

#### Expressiveness
Can express any factorization. Eg: can design factor f(X, Y) to say that X and Y are \\(\eps\\) apart; so factors called compatibility functions.

### Undirected graphical models
Aka Markov random field.

#### Factorization
\\(f_X(x) = Z^{-1} \prod \gf_{C_j}(x_{C_{j}})\\), where \\(C_{j}\\) are cliques of various sizes in G.

##### As an exponential distribution family
See section on exponential families.

#### Conditional independence properties
Aka Markov properties. Conditional independence properties, markov blanket same as in Factor graphs.

##### Global Markov
Take any A, B, Z. If Z separates A and B, \\(A \perp B | Z\\).



<details><summary>Proof</summary>

Factorization implies this. Take A, B, Z; expand A and B to get A', B' which include all nodes reachable from A and B without crossing Z; So, \\(f_X(x) = f(x_{A'}, x_Z)f(x_{B'}, x_Z)\\); so \\(A' \perp B' |Z\\).
</details>



##### Local Markov
\\(X_i \perp X_{V - i - N(i)} | X_{N(i)}\\). Global markov implies this.

##### Pairwise Markov
If \\((i, j) \notin E\\), \\(X_i \perp X_j | X_{V-\set{i, j}} \\). Implied by Global Markov. Local Markov implies this.

##### Factorization from pairwise markov for many Pr(x)
(Hammersley Clifford) If \\(\forall x: f_X(x) > 0\\) pairwise markov implies factorization.

#### Tree structured case
##### Importance
It is easy to compute the partition function for this case. There exist efficient algorithms to do inference accurately on such models, and there are efficient algorithms to find the closest tree structred graphical model to any distribution.

##### Form and connections
\\(f_X(x) \propto \prod_{(i, j) \in T} \gf_{i,j}(x_i, x_j)\\).

##### As directed model
Now, consider any node, say \\(x_1\\), to be the root of the tree. \\(f_X(x_1, x_{\nbd(1)}) \propto \prod_{j \in \nbd(1)} \gf_{1, j}(x_1, x_j)\\). But, \\(f_X(x_1, x_{\nbd(1)}) = f_{X_1}(x_1) \prod_{j \in \nbd(1)} f_{X_j|X_1}(x_j|x_1)\\) from the conditional independence property of undirected graphical models. Applying this procedure recursively, one gets a directed graphical model.

##### In terms of marginals
Consider the corresponding directed model. \\
\\(f_{X_1,\nbd(1)}(x_1, x_{\nbd(1)}) = f_{X_1}(x_1) \prod_{j \in \nbd(1)} f_{X_j|X_1 = x_1}(x_j) \\= f_{X_1}(x_1) \prod_{j \in \nbd(1)} f_{X_j}(x_j) \prod_{j \in \nbd(1)} \frac{f_{X_j, X_1}(x_j x_1)}{f_{X_j}(x_j)f_{X_1}(x_1)}\\).

Applying this procedure repeatedly, we get: \\(f_X(x) = \prod f_{X_i}(x_i) \prod_{(i,j) \in E} \frac{f_{X_i, X_j}(x_i, x_j)}{f_{X_i}(x_i) f_{X_j}(x_j)}\\).

#### Pairwise graphical model
A subclass. \\(f_X(x) \propto \prod_i \gf_i(x_i)\prod_{(i,j) \in E} \gf_{i, j}(x_i, x_j)\\).

#### Hierarchical models
A factor \\(\gf_c(x_c)\\) exists only if, for all \\(s \subset c\\), a factor \\(\gf_s(x_s)\\) exists.

#### Discrete models
\\(\set{dom(X_i)}\\) are discrete.

##### Pairwise-ification of discrete models
Can add some extra variables, \\
rewrite with all \\(C_j\\) being pairwise: If cliques of size \\(p'>2\\) exist, collapse that clique into a single node, expand the state space.

Note that, just because you know how to learn pairwise graphical models, you cannot simply construct a general discrete model learning algorithm: you don't know which nodes to collapse.

##### The general form
Consider exponential family attached to discrete graphical model G of n vars. Let \\(|dom(X_i)| = |M| = m\\). Can assume G is pairwise.

We can completely specify \\(\ftr_{i,j}(x_i, x_j)\\) by parameter matrix \\(T_{i, j}\\) with \\
\\(T_{i,j, k, l} = \ftr_{i,j}(k, l)\\).
\\(
$$f_X(x) = \propto e^{\sum_{(i, j) \in E} T_{i,j, x_i, x_j} } = e^{\sum_{(i, j) \in V^{2}} \sum_{k, l \in M^{2}}T_{i,j, k, l} I[x_i = k] I[x_j = l]}\\)$$.
We can think of this as an exponential family distribution involving \\(|V|^{2}m^{2}\\) auxiliary features/ covariates \\(y_{ij} = I[x_i = k] I[x_j = l]\\). But this distribution \\(f_X(x)\\) is now overparametrized, as \\(y_{i,j}\\) are not linearly independent. [See section on minimal parametrization of exponential family distributions.]

Let \\(M' = M-\set{m}\\). Using a minimal parametrization, we get an exponential family distribution involving only features \\(y_{ij;kl \in (M')^{2}} = I[x_i = k] I[x_j = l]\\) and \\(y_{i;k \in (M')} = I[x_i = k]\\). So, \\(Pr(X = x \in M') \propto exp(\sum t_{i;k} y_{i;k} + \sum t_{ij;kl} y_{ij;kl})\\).

##### Ising model
\\(Pr(X = x|t) \propto e^{\sum_i t_i x_i + \sum_{(i, j) \in V^{2}} t_{i,j} x_i x_j}; dom(X_i) \in \pm 1\\). Any binary undirected graphical model involving variables \\(Y_i\\) with range \\(\set{1, 2}\\) can be expressed like this: just consider the minimal parametrization of such distribution using the auxiliary features described earlier.

For signed edge recovery for the class of Ising models given a few observations, see structure learning part in statistics ref. Originally used in physics to model electron spins' interactions in the case of magnetism.

### Junction tree model
Take an undirected graph G, find a junction tree T for it (see graph theory ref). Belief propagation algorithms work well over trees; hence this. Like a factor graph, there are 2 types of nodes: a set of nodes for cliques C in G. They are connected to each other through separators S.

#### Factorization
\\(f_X(x) = \frac{\prod_{c \in C}f_{X_c}(x_c)}{\prod_{s \in S} f_{X_s}(x_s)^{|\nbd(s)| -1}}\\).

### Directed
Aka Bayesian networks; but needn't be learned using Bayesian methods.

#### Extra notation
Shorthand for N nodes with identical parentage: a plate annotated by N, with a single node inside. Can represent deterministic variables with solid dots. Can represent observed variables as shaded nodes.

#### Factorization
Every \\(X_i\\) annotated with \\(f_{X_i|par(X_i)}\\) (aka factors).\\ \\(f_X = \prod_{i} f_{X_{i}|par(X_{i})} = \prod_{i} f(X_{i}, par(X_{i}))\\).

There are many bayesian networks to represent \\(f_X\\) based on different decompositions: eg: \\(X_1 = X_2 + X_3\\). Not all are equally concise. Concise when expressing causal relationships.

##### Undirected 'moralized' graph
Make all edges undirected, but 'marry off' all unmarried parents: make cliques involving child and parents. These graphs are equivalent in terms of conditional independence.

#### Marginal independence
If X, Y don't have a common ancestor: \\(X \perp Y\\). But, conditional independence, \\(X \perp Y |E\\) need not hold if E has a common child of X and Y; Eg: \\(X_1 = X_2 + X_3\\).

#### Dependency seperation of X, Y by Z
Aka d-separation. Every undirected path (X, Y) blocked by \\(W\in Z\\). 2 types of blocking: \\(\to W \gets\\): W not given;  \\(\to W \to\\) or \\(\gets W \to\\): W given.

d-separation is graph-independent: Even when multiple graphs model same distribution, the conditional independence relationship deduced from any of them hold.

##### Global Markov property
Let A, B, Z be sets of variables. \\(A \perp B |Z\\) for all d-separating Z. Thence, markov boundary of X is \\
\\(\set{par(A), chi(A), par(chi(A))}\\). Implied by factorization.

Also, if S separates A, B in moralized graph, \\(A \perp B | S\\). But, when S does not separate A, B: look at subgraph of A, B, S.

##### Check d-separation
Use breadth-first-search to find unblocked paths. Aka Bayes ball algorithm.

#### Other conditional independence properties
##### Local markov property
desc(i) \dfn descendents of i. \\(X_i \perp X_{j \notin desc(i)}| par(i)\\).

##### Pairwise markov property
\\(X_i \perp X_j | X_{\nbd(i) - j}\\).

##### Connections
Factorization \\(\equiv\\) Global Markov \\(\equiv\\) Local Markov \\(\implies\\) Pairwise markov. If \\(f_X(x)\\) has full support, pairwise markov \\(\implies\\) local markov.

#### Marginalized DAG
Let G = (V, E) be the DAG corresponding to Pr(x). The DAG corresponding to \\(f_{X_{V-A}}(x_{V-A})\\) is obtained as follows: Take subgraph S in G induced by (V - A). For every \\((u, v) \in (V-A)^{2}\\), add a new edge if \\(\exists\\) a directed path (u, s, v) in G, such that s is a sequence of vertices in A. Proof: Using factorization.

### Comparison
#### Expressiveness
Take rain, sprinkler, grass wet (R, S, G) causal model. \\(R \perp S\\) but \\(R \nvdash S|G\\): 'Explaining away' phenomenon. Can't express this with other models.

Take rectangle shaped undirected graph. Can't make equivalent directed graph.

Undirected graphical models are better at expressing non-causal, soft relationships amongst RV's. Directed models are usually very intuitive to construct.

Undirected models less expressive than factor graphs. \why

#### Structural equivalence
Tree structured undirected graphical model can be expressed as a directed graphical model with the same structure: this is detailed in the undirected graphical models section.

The reverse is not true: as seen from the rain, sprinkler, grass wet example. But if edges in the DAG do not meet, a tree structured directed graphical model can be expressed as an undirected graphical model.


#### Independence relationships amongst vars
Conditional independence easier to determine in undirected models compared with directed graphical models. But marginal independence easier to determine in the former.

## Inference, decoding using Graphical model
See statistics survey for the following: structure learning (learn graph from data); parameter learning (learn parameters given graph).

### Problems
Consider some \\(S \subseteq V\\).

#### Inference problems
Find marginals \\(f_{X_S}\\), or the partition function \\(Z\\), or find \\(E[g(x)]\\), when \\(g(x)\\) factors nicely according to the graphical model.

#### Decoding problem
Find component \\(\hat{x}_S\\) of the mode \\(\hat{x} = \argmax_x f_X\\).

##### Global maximum vs marginal maxima
Note that this is different from the marginal maximum \\(\argmax_{x_S} f_{X_{S}}\\) which may be found by solving the inference problem to find \\(f_{X_S}\\) and then taking its maximum.

One cannot simply find the local/ marginal maxima \\(\argmax_{x_S} f_{X_{S}}\\) and use it to find the global maximum.

#### Evidence
Maybe you want to solve these problems when values for some variables may be fixed: Eg: \\(X_T = x_T\\).

#### Solving for all variables
Another variation to the inference and decoding problems is to solve them for all sets of the form \\(S = \set{i \in V}\\).

### Factorization and graph-based computations
#### Benefit of factorization
Inference problems involve summation over a subset \\(ran(X)\\), while decoding problem involve finding the maximum over it.

Suppose that \\(f_X(x) = Z^{-1}\prod_{c \subseteq V} \gf_{c}(x_c)\\). Distributive law is the key to summing/ maxing this function efficiently. Eg: see elimination algorithm, junction tree algorithm.

##### Elimination ordering
Order the factors to get \\(f(x) = \gf_{c_1}(x) .. \\). Now, if you have variables \\(X_{T}\\) involved only in factors \\(\geq i\\), you get: \\(\sum_{x_{V-S}} f_X(x) = \sum_{x_{V-S - x_{T}}}\gf_{c_S}(x) .. \sum_{x_{T}}\gf_{c_i}(x)..\\). An identical ordering is useful if we were doing \\(\argmax_{x_{V-S}} f(x)\\) instead. 

This yields us the following reduction in dimensionality.

\subparagraph*{Reduction in dimensionality}
Suppose that \\(\max_i ran(X_i) = D\\). Without the elimination ordering, we would have had to consider a set of \\(D^{|V-S|}\\) values during summing/ maxing. As a result of using the elimination ordering, we now consider a set of \\(D^{|V-S-T|} + D^{|T|}\\) values to do the same.

Thus, using this trick repeatedly, suppose that we find the elimination ordering \\(f_X(x) = \prod_{c \in p(V)} \gf_c(x_c)\\) where \\(p(V)\\) is a partition of \\(V\\). Then, we will be only be summing/ maxing over \\(|p(V)|D^{\max_{c \in p(V)} |c|} = O(D^{\max_{c \in p(V)} |c|})\\) values.

##### Finding the right order
Not all orders are equally good. There is a natural way to get this ordering for trees: consider the elimination algorithm.

#### Graph traversal view
Try to model the problem as one of making special graph traversals. Try to use local computations to replace global computations. Can think of this as nodes passing messages to each other.

### Belief propagation
#### The Bottom-up idea
Exploit factorization and the elimination ordering we can solve the problem bottom-up.

If you are finding \\(\argmax_x f_X(x)\\), this is the max-product algorithm, if finding \\(f_{X_1}(x_1)\\), it is the sum product algorithm.

The idea: take local belief, take max or sum, propagate it to other nodes which need this to calculate their belief.

#### Node Elimination algorithm: Undirected Trees
Remove nodes to sum out/ max out one by one. Suppose want to find\\ \\(\argmax f_{X_{V-1}|X_1 = x_1}(x_{V-1})\\). Then, root the tree at \\(x_1\\), and do the following.

Message, a definition of a function, every node \\(X_j\\) tells its parent \\(X_i\\): \\
\\(m_{j \to i}(x_i) = \max_j \gf_{i,j}(x_i, x_j) \prod_{k \neq i, (j,k) \in E} m_{k \to j}(x_j)\\). This is the message passing implementation. Belief of \\(x_1\\): \\(b_1(x_1) = \prod_{(j,1) \in E} m_{k \to 1}(x_1)\\).

Can use similar algorithm to find marginal \\(f_{X_1}(x_1)\\).

##### Using known values
Suppose \\(X_2 = x_2\\) is fixed in the above process. Nothing changes in the algorithm itself - only \\(X_2\\) is thought of having only one value in its range while being summed over/ maxed over etc..

##### Finding conditional marginals
Suppose you want to find \\
\\(\argmax Pr(x_{V-1}|x_1, x_2)\\). Root the tree at say \\(x_1\\), execute the algorithm as usual; when you encounter factors involving \\(x_2\\), don't sum/ max over \\(x_2\\).

#### Reusing messages: Undirected Tree
Maybe you want to find \\(f_{X_i}(x_i) \forall i\\), and want to reuse messages (computations involving summing out). Then, simply use these update rules: \\(m_{j \to i}(x_i) = \max_j \gf_{i,j}(x_i, x_j) \prod_{k \neq i, (j,k) \in E} m_{k \to j}(x_j) \forall i, j\\).

The algorithm is naturally distributed - so scales well with number of nodes. Also, there is no need to compute an elimination ordering.

##### Feasibility
Each message depends on certain other messages, and it is computed when these messages are available. This is always possible for trees as there are no cyclical dependencies, and all messages are computed eventually.

#### Tree Factor graphs
Want to find \\(f_{X_i}(x_i) \forall i\\), given tree structured factor graph. Root it at \\(x_1\\), for every variable v and factor f, use the update rules: \\
\\(m_{v \to f}(x_v) = \prod_{f' \neq f}m_{f' \to v}(x_v),  m_{f \to v}(x_v) = \sum{v' \neq v} f(x) \prod_{v' \neq v} m_{v' \to v}(x_{v'})\\). Belief \\(b_v(x_v) = \prod_{f}m_{f \to v}(x_v)\\).


#### General undirected graphs
##### Use junction trees
Maybe you don't have a tree, but a graph for which you can get a junction tree. If the graph does not have one, can always convert it to a chordal graph by adding edges: but finding the minimal chordal supergraph is NP hard.

Belief propagation proceeds as in tree factor graphs, except the clique nodes play the role of variables, and the separators/ nodes representing variables shared between cliques play the role of factors.

Belief for each clique C is thus easily calculated; by induction over number of cliques in the clique tree, \\(b_c(x_c) = \sum_{V - c} f_X(x)\\), as expected.

Finding the belief for each variable depends exponentially on tree width: must consider \\(dom(X_i)^{|C|}\\) values while summing/ maxing.

##### Tree reweighted max product
Take \\(p(x) \propto g_1(x)g_2(x)\\), such that every clique involved in p(x) is either in \\(g_1\\) or in \\(g_2\\). Then, if \\(x^{*} \in \argmax g_1(x) \land x^{*} \in \argmax g_2(x), x \in \argmax p(x)\\). So, can find smart ways of splitting p; then maximize each g; if the intersection of the maximal points is not empty, then done; otherwise, move around edge-mass.

#### Approximate inference: Loopy belief propagation
##### Trouble because of loops
Suppose there were loops, you can try initializing all incoming messages at all nodes with 1, applying update rule at each node repeatedly. Each node calculates \\(m_{i \to j}^{(t+1)} = \gf_{i,j}(x_i, x_j)\prod_{k \neq j}m_{k \to i})^{(t)}\\).
Also, as messages (a function output vector \\(m(x_i)\\)) may keep growing bigger; may need to normalize each message at each iteration.

##### Applicability
There are almost no theoretical guarantees of convergence or correctness; but widely applied in practice. But, when applied to trees, it is consistent with usual belief propagation, and yields the right answer.

An example in case of the inference problem involved in decoding binary linear codes is given in the information/ coding theory survey.

##### Computation tree at iteration j wrt node i
A way to visualize the undirected graph, as it looks to node i at iteration j, while it calculates the belief \\(b_i^{(j)}(x_i)\\) during loopy belief propagation. For j=0, the tree is just the single node i. For every j, you add a level to the tree, indicating new messages which are considered in \\(b_i^{(j)}(x_i)\\) - the new leaves attached to a node k are \\(\nbd(k) - par(i)\\). Each tree is a valid graphical model in itself.

Eg: consider triangle 1, 2, 3. Initially, tree is 1. Then new level (2, 3) is added. Then children 3', 1' are added to 2; and 1', 2' are added to 3. These copies of nodes are conceptually different from the original: the messages they send are different.

##### 'Correctness in case of steady state' results
This is useful because: maybe loopy belief propagation will be in a steady state, before there is a loop in the computation tree - so highly dependent on the initialization!

\subparagraph*{Damped max product}
Use control theory idea to force oscillating system towards a steady state. Each node actually uses message \\
\\(m_{i \to j}'^{(t+1)} = m_{i \to j}^{(t)l}m_{i \to j}^{(t+1)(1-l)}\\).

##### Max-product on single cycle
But, if you are doing max-product on a graph which is a single cycle, and if you hit a steady state for all messages, then the computation yields the right answer to \\(\argmax_x f_{|X_1 = x_1}(x\\). This also holds for graphs which are trees, single cycles or single cycled trees.

Proof idea: Consider the computation tree T wrt \\(x_1\\) at the steady state. Then, belief computed at \\(x_1\\) corresponds to \\(\argmax_x f_{X \distr T}(x_{V-1}|x_1)\\), the max product belief correct for this tree. But, see that \\
\\(Pr_{T}(x_{V-1}|x_1) =  t Pr(x_{V-1}|x_1)^{k}\\) for some k, t. Thence relate argmax \\(Pr_{T}\\) with argmax \\(Pr\\).

### For Gaussian graphical models
Maybe given normal distribution of in the form \\(f_X(x) \propto e^{-2^{-1}x^{T}Px + hx}\\) by specifying P and \\(h = P \mean\\), where P is the precision matrix. For every \\(P_{i,j} \neq 0\\), there is an edge in the model graph G.

Max product finds the mean; sum product finds the marginal: either case reduces to finding the mean \\(\mean\\); so they correspond to executing the same algorithm. Marginalizing or maxing over a gaussian distribution yields another gaussian \\(e^{-2^{-1}x^{T}P'x + h'x}\\), so the messages passed during message passing algorithm correspond to the parameters of this expression.

#### Connection with solving Ax = b
Essentially solving \\(P\mean = h\\) for \\(\mean\\); perhaps loopy belief propagation can be used to solve Ax = b for very large \\(A \succeq 0\\). Convergence happens only if P is diagonally dominant.

If G is a tree, then this corresponds to Gaussian elimination.

### Directed graphical models
One can simply convert directed graphical models to equivalent undirected models and use inference algorithms described for them.
