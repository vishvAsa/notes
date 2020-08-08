+++
title = "Find dense subgraphs"
+++

## (a, b) cluster C
(Tarjan etal.) E(v, C): edges between v and C. External sparsity vs internal density of edges: \\(\forall v \in C: |E(v, C)|\geq b|C|\\), \\(\forall u \notin C: |E(u, C)|\leq a|C|\\). Cliques are (a, 1) clusters.

Bound on cluster overlap known. For certain (a, b) it is possible for one cluster to be contained in another, but not if size of largest : smallest cluster size \\(\leq \frac{1-a}{1-b}\\). \\(b>1/2\\) ensures cluster connectedness: condition may be too strong in practice.

r-champion v of C: v has \\(\leq r|C|\\) neighbors outside C. Gives a stronger argument for C being a good cluster.

Good clusters have small r and a, large b.

### Finding (a, b) clusters
If there is a large gap between a/2 and \\(b > 1/2 + (r+a)/2 > 1/2\\), then there are \\(\leq n\\) (a, b) clusters with r-champions of size s, can find them deterministically  in \\(O(mn^{1.2}+n^{2+o(1)})\\). Experimentally shown to find 90\% of maximal cliques size 5 or higher.

Alg: Take \\(t(c) = \nbd(c) \union \nbd(\nbd(c))\\). For each \\(c \in V\\): start with \\(C=\nullSet\\); for each \\(v\in t(c)\\): add v to C if \\(|\nbd(v)\inters \nbd(c)| \geq (2b-1)s\\) \footnote{Reminiscent of most new edges closing triangles in graph evolution}; if C is an (a, b) cluster, output it.

\oprob extend to weighted graphs.

