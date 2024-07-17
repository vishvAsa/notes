+++
title = "Embed graph in euclidean space"
+++

Want the minimum dimensional embedding.

## Formulation as matrix factorization
(Shconberg). Take weighted adj matrix W. \\(W_{i,j} = \norm{x_{i}-x_{j}}^{2} = x_{i}^{T}x_{i} + x_{j}^{T}x_{j} - 2x_{i}^{T}x_{j}\\). Take \\(X = (x_{i})\\); Gram matrix \\(G = X^{T}X\\) normalized to have \\(g_{i,i} = 1\\); then \\(W = 2.11^{T}-2G\\). Then solve for G; then solve \\(G = X^{T}X\\) for X with min number of columns.

## Energy minimization techniques
See section on incomplete graphs with similarity measures for intro to notation.

Use energy fn: \\(U = \sum_{(i,j)} (f(d_{i,j}) - g(d_{i,j}))\\). Minimize over \\(R^{D}\\).

### Clustering postulate and constraint
Require \\(d_{min} = w(1/C)^{\gl}\\) in attempting to place clusters \\(c_{1}, c_{2}\\) with coupling C at distance w; so we want \\(\frac{1}{C} = (\frac{d}{w})^{1/\gl}\\). Then, \\(U = f(d) - \frac{1}{C}g(d)\\). Set derivative to 0, get constraint: \\(f'(d) = (\frac{d}{w})^{1/\gl}g'(d)\\).

### Box Cox family of energy fn
\\(U = \sum_{i,j} BC_{\gm + \frac{1}{\gl}}(d_{i,j}) + D_{i,j}^{1/\gl}BC_{\gm}(d)\\).

Encompasses energy fn used in multidimensional scaling.

## Applications
If nodes represent sample-points, can infer the dimensionality of the sample space. Then can measure distance distance between arbitrary sample points. Eg: Maybe can sample some hyenas, observe their interactions, conclude that Hyenas are 5 dimensional.

## Embedding Incomplete Graph G
Can view this as matrix completion problem; perhaps with additional constraints enforcing symmetry and traingle inequality for the distance metric.

## Energy minimization techniques for G with similarity wts
Put attractive forces f() between verteces connected by edges, and repulsive forces g() between all vertex pairs, define energy: \\(U = \sum_{(i,j) \in E} f(d_{i,j}) - \sum_{i,j}g(d_{i,j})\\) then find minimum energy configuration in \\(R^{D}\\).

### Clustering postulate and constraint
Constrain range of choices for these forces with clustering postulates.

Take graph with 2 clusters \\(c_{1}, c_{2}\\) with coupling \\(C = \frac{E(c_{1}, c_{2})}{E(c_{1})E(c_{2})}\\). Require \\(d_{min} = \frac{1}{C}^{\gl}\\) be minimum energy configuration; \\(\gl\\) is clustering power.

Setting \\(U'(c_{1}, c_{2}) \approx f'(d_{min}) - (1/C)g'(d_{min}) = 0\\), yields the clustering constraint: \\(f'(d) = d^{1/\gl}g'(d)\\).

### Box Cox family of energy functions
Want to allow cases where \\(f(d) = d, g(d) = \log d\\); so use Box-Cox transformations for f, g: \\(d>0: BC_{p}(d) = \frac{d^{p}-1}{p}\\) if \\(p\neq 0\\), else \\(\log d\\); with \\(BC_{p}'(d) = d^{p-1}\\). So, use \\(g(d) = BC_{\gm}(d)\\), get \\( f(d) = BC_{\gm + \gl^{-1}}\\).

## Eigenmap
Take laplacian L of the graph G, and take its ev corresponding to bottom few ew, which are functions over V which are smooth over E.

## G with distance wts D
This can be reduced to a complete graph: calculate distance for all pairs by finding shortest paths.
