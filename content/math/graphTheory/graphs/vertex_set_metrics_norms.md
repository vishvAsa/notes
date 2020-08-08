+++
title = "Vertex set: metrics, norms"
+++


Similarity measures between u and v are inverses of distance metrics.

## Based on paths and random walks
- (shortest path).

### Katz measure
 \\(sim(u,v) = \sum_{l=1}^{\infty} \gb^{l}|paths_{u,v}(l)|\\). Matrix of scores, \\(K = \sum_{i=1}^{\infty} \gb^{i}A^{i}\\).

#### The damping parameter
\\(K = (I - \gb A)^{-1} - I\\) if the sum converges. Use \\(A = U\EW U^{*}\\): EW decomposition, with \\(\ew_{i}\\) ordered in descending order. \\(\sum_{i=1}^{\infty} \gb^{i}A^{i} = U(\sum_{i=1}^{\infty} \gb^{i}\EW^{i})U^{*}\\) does not converge \\(\forall \gb \geq 0\\) and multiplication by \\(\infty\\) is not well defined. Condition for convergence: \\(\gb \ew_{1} < 1\\).

But, for \\(\gb > 1\\) the intuition of weighting longer paths less does not hold.

### Variants of Katz
Similarly can use \\(e^{-\gb A}\\).

Truncated Katz usually used: \\(\sum_{l=1}^{k} \gb^{l}A^{l}\\): \\(O(ln^{2}nz(A))\\) op instead of \\(O(n^{3})\\) inverse finding.

### Hitting time
\\(-h_{u,v}\\); normed by stationary distribution: \\(-h_{u,v} \pi_{v}\\): to take care of skewing of hitting time due to large \\(\pi_{v}\\). - Commute time: \\(-h_{u,v} - h_{v, u}\\); stationary distr normed: \\(-h_{u,v}\pi_{v} - h_{v, u}\pi_{u}\\).

### Rooted PageRank
Random walk can get lost in parts of graph away from u and v; so do random resets and return to u with probability a at each step.

### SimRank
A recursive definition: 2 nodes are similar to the extant that they are joined to similar nodes. \\(sim(x, x) = 1; sim (x, y) = \frac{\sum_{a \in \nbd(x)}\sum_{b \in \nbd(y)} sim(a, b)}{|\nbd(x)||\nbd(y)|}\\).

## Common neighbor based
Common neighbors: \\(|\nbd(u) \inters \nbd(v)|\\): same as taking inner product of rows in adj matrix M corresponding to u and v. (Jaccard): \\(\frac{\nbd(u) \inters \nbd(v)}{\nbd(u) \union \nbd(v)}\\): pick a feature at random, see probability that it is a feature of both u and v. (Adamic/ Adar): \\(\sum_{z \in \nbd(u) \inters \nbd(v)} \frac{1}{\log |\nbd(z)|}\\): greater wt to rare features present in both.
