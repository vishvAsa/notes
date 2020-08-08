+++
title = "Node partitioning"
+++

## Number of partitions, k
See statistics ref for further info.

## Minimum cut objectives
Maybe find \\(argmin_{(V_{i})} cut((V_{i}))\\): but \\(V_{1} = V\\) minimizes it. So, to balance the partitions, associate each vertex with a weight w(v), get W = diag(w(v)); define \\(w(V_{i}) = \sum_{v \in V_{i}} w(v)\\); minimize \\(Q((V_{i})) = \sum \frac{cut(V_{i})}{w(V_{i})}\\).

### Ratio, normalized cuts
If \\(w(v) = 1\\), get ratio cut objective fn. So, ratio cut is trying to minimize the weight of cross-cut edges, averaged over the nodes.

If \\(w(v) = \sum E_{v,w}\\), get normalized cut objective fn: \\(N((V_{i})) = \sum \frac{cut(V_{i})}{w(V_{i})} = 2 - \sum \frac{within(V_{i})}{w(V_{i})}\\): so minimizing N is same as maximizing wt of edges lying within each partition. Normalized cut is trying to minimize the weight of cross-cut edges, averaged over the nodes but normalized to allow high-degree vertex-sets to have more cross-cut edges.

These are discrete optimization problems: NP complete \why. Effective heuristics exist.

## Modularity of partition C
(Newman) Amount by which number of edges in C exceed Chung's degree distribution preserving random graph model.

## Spectral clustering
\core A relaxation of normalized cut objective \\(\equiv\\) finding a solution to the generalized eigenvector problem over the graph laplacian L, then partitioning points derived from the top k ev.

### The objective
Represent cut by partition vector \\(p \in \set{\pm 1}^{n}\\). Then Rayleigh quotient: \\(\frac{p^{T}Lp}{p^{T}p}= n^{-1}4 cut(V_{1}, V_{2})\\): \\(p^{T}p=n; p^{T}Lp = \sum_{e_{i,j} \in E} e_{i,j}(p_{i}-p_{j})^{2}\\).

Use partition vector q with \\(q_{i} = \sqrt{\frac{w(V_{2})}{w(V_{1})}}\\) for \\(i \in V_{1}\\); else \\(-\sqrt{\frac{w(V_{1})}{w(V_{2})}}\\). Then \\(q^{T}W1 = \sqrt{\frac{w(V_{2})}{w(V_{1})}} w(V_{1}) - \sqrt{\frac{w(V_{1})}{w(V_{2})}} w(V_{2})= 0\\); \\(q^{T}Wq = w(V)\\).

As \\(q = \frac{w(V_{1})+w(V_{2})}{2\sqrt{w(V_{1})w(V_{2})}} p + \frac{-w(V_{1})+w(V_{2})}{2\sqrt{w(V_{1})w(V_{2})}}e\\); so \\(q^{T}Lq = \frac{[w(V_{1})+w(V_{2})]^{2}}{4 w(V_{1})w(V_{2})}p^{T}Lp\\). As \\(p^{T}Lp = cut(V_{1}, V_{2})\\); \\(\frac{q^{T}Lq}{q^{T}Wq} = Q(V_{1}, V_{2})\\).

Minimizing this subject to suitable q's is still NP complete; so use real relaxation. So, solve \\(\min_{q} \frac{q^{T}Lq}{q^{T}Wq}\\) subject to \\(q^{T}We=0\\), deduce partition vector from solution. Opt problem solved when q is ev corresponding to \\(\ew_{2}\\) for generalized ev problem: \\(Lz = \ew Wz\\). \why

To find k custers, do this recursively, or pick \\(m \geq \log k\\) ev and partition points formed by putting various components of these ev together, maybe using k-means.

Requires \\(O(n^{2})\\) time: to find ev; \\(O(kn^{2})\\) to find k clusters among graph nodes.

### Coclustering nodes in bipartite graph G=(A, B, E)
\core \\
(Dhillon). Finding the second ev of L \\(\equiv\\): take \\(|A|*|B|\\) adjacency matrix M, and find its 2nd left and right sv: as M is smaller than L, ye save on computation.

## Graclus
Does kernel-k-means among nodes. Equivalent to solving a relaxation of the normalized cuts objective.

