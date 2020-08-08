+++
title = "+Graphs"
+++

## Intro
Graph G=(V,E)  
E annotated with weights. If G unweighted, all weights are 1.

## Vertex properties
Degree of v: \\(deg(i) = \sum_{j} e_{i,j}\\). Neighbors of v: \\(\nbd(v)\\).

Measure size of \\(A \set V\\): \\(|A|\\) or \\(vol(A) = \sum_{i \in A} deg(i)\\).

## Associated objects
### Special vertex sets
Node cover of G=(V,E): subset of V which touches all e in E. 

Proper vertex coloring; chromatic number.

Independent set of verteces: don't share edge: a clique in \\(\bar{G}\\).

### Walks
A sequence of edges \\((e_i)\\) such that \\(e_i\\) shares an end-point with \\(e_{i+1}\\).

A walk may have a cycle. If it does not have a cycle, you have a path.

Also see random walks.

Alternating walks are defined and studied in combinatorial optimization problems over graphs; in these sequences even and odd edges are colored differently.


### Cut
k-way cut: \\(cut((V_{i}))\\) is a partitioning of V into k parts. Cutsets is a set of edges which, when removed from G, divides V into k partitions.

#### Weight of a cut
Weight of a cut is the sum of weights of edges in the cutset.

Minimum 2-way cut is a cut with the minimum weight. This is useful in partitioning nodes in a graph.

### Subgraphs
A general subgraph: G'=(V', E'). Subgraph induced by \\(A \set V\\). Connected components of a graph. Clique: a complete subgraph.

#### Spanning trees
Spannning tree. MST spanning a certain node set N: Aka Steiner tree.
MST spanning with support over node set N: Aka Group Steiner tree.

## Subtypes
Multigraphs: multiple edges allowed.

### Tree
G sans cycle. Forest F: set of trees.

### Biconnected graph
2 paths between any node pair.

### Based on degree
d-regular G: \\(\forall v: |N(v)| = d\\). Complete graph \\(K_{n}\\).

### Perfect graph G
Chromatic number = size of the largest clique in G.

A graph is perfect iff its complement is perfect.

#### Bipartite graph
E = cutset. Complete bipartite graph: All v in A has edge to all u in B. Complete bipartite graph \\(K_{i,j}\\). Can have A vs B adj matrix M. Thence get usual adj matrix for G: \\(\mat{0& M\\M^{T} & 0}\\).

#### Chordal graph G
Aka triangulated graph. Every cycle in G has a chord. G has a junction tree iff it is chordal.

### Planar graphs
(Kuratowski) G planar iff \\(K_{5}\\) and \\(K_{3,3}\\) are in G.



## Directred graph, networks
Digraph or directed graph. Networks: digraph with edge weights.

### Directed acyclic graphs (DAG)
Very useful in designing algorithms: can do recursion easily.

#### Topological numbering t of nodes
Number nodes so that if there is a path from u to v, then \\(p(u)< p(v)\\). Cyclic graphs don't have a topological numbering.

### Singly connected directed graph
Useful in probabilistic graphical models.

A tree underlies the graph: only 1 undirected path between any node pair.

## Generalizations
### Hypergraphs
Edges connect k-sets of verices, not just pairs.

## Properties
### Hop plot
For h, let g(h) be number of node pairs with path \\(\leq h\\). Hop plot plots this.

### Diameter
Diameter of G. q effective diameter: q fraction of \\(V\times V\\) have path length \\(\leq d\\).

### Single source (s) shortest paths
Consider a weighted graph with weight \\(e(a, b)\\) between two nodes. Suppose that you want to find the shortest path to every vertex \\(v \in V\\) from \\(s\\).

One can use a bottom-up programming approach. (Dijkstra) Start with current node \\(c = s\\). Initially set \\(d(s) = 0\\) and, \\( \forall v \neq s : d(v) = \infty\\).

Define \\(f(c)\\): For every \\(v \in \nbd(c)\\), do the update: \\(d_{t+1}(v) \dfn \min(d_{t}(c) + e(c, v), d_{t}(v))\\). Also, simultaneously update the 'backpointer' to point to \\(c\\) (representing  the optimal subsolution) if necessary.

Do \\(f(c) \forall v \neq s\\) .

Time: \\(O(n^{2})\\) in case of a complete graph.

## Associated matreces
Edge incidence matrix J (\\(m \times n\\)); for weighted G: edge \\(e_{i, j}\\) terminii (i, j) are marked \\( \pm \sqrt{e_{i,j}}\\).

Vertex incidence/ adjacency matrix W: presence of edge \\(e_{i,j}\\) indicated by weight at \\(W_{i,j}, W_{j,i}\\).

Connectivity matrix \\(A^{\infty}\\).

Degree matrix: D = diag(deg(i)).

### Graph Laplacian of no-self-loop undirected graph
L = (D-W). \\(L = JJ^{T}\\). As L is \\(|V|*|V|\\), it is an operator on the functions with domain V.

#### +ve semidefiniteness
L is symmetric, +ve semidefinite: \\(x^{T}Lx = x^{T}JJ^{T}x\\). So \\(\ew \geq 0\\).

#### Smoothness of vectors from quadratic form
\\(x^{T}Lx = x^{T}Dx - x^{T}Wx = \sum_{i,j} W_{i,j} (x_i^{2} - x_j x_i) =  2^{-1}\sum_{i,j} W_{i,j} (x_{i} - x_{j})^{2} = \sum_{e_{i,j} \in E} e_{i,j} (x_{i} - x_{j})^{2}\\). This is a measure of the degree of oscillations/ smoothness among x, where edges occur.

#### Eigenvectors
\\(L1 = 01, \therefore \ew_{1}(L)=0\\); so L singular.

If G has c connected components: \\(\ew_{1}= .. \ew_{c} = 0\\): construct ev with 1 in the appropriate spots!

#### Smoothness of ev
Take ev x. Then \\(x^{T}Lx = \sum_{e_{i,j} \in E} e_{i,j} (x_{i} - x_{j})^{2}\\) measures smoothness of x where edges occur in the graph. But, ew are stationary points of \\(R(x) = x^{T}Lx/ (x^{T}x)\\). So, ev corresponding to lower ew tend to be smoother.

##### Smoothening functions
Consider the subspace spanned by the p bottom (smooth) ev. Any function on V, ie a \\(|V|\\)-dim vector can be projected on to this subspace in order to smoothen it according to the graph structure. Labelling of nodes is an example of such a function.

##### Applications
This property is useful when using ev x for classification of nodes - one doesn't want neighboring nodes to have disparate values in x. This is useful in both spectral clustering and label propogation in semisupervised learning.

### Normalized graph Laplacian
Take \\(N = I-D^{-1/2}WD^{-1/2}\\) : this is the normalized version, \\(D^{-1/2}LD^{-1/2}\\) of L, using the normalized adjacency matrix \\(D^{-1/2}WD^{-1/2}\\).

\\(N \succeq 0\\) as \\(L \succeq 0\\), ie \\(x^{T}Dx-x^{T}Wx \geq 0 \forall x\\): taking \\(D^{1/2}x = y\\), see that \\(\forall y: y^{T}Ny \geq 0\\).

#### Normalized adjacency matrix has norm 1.
As $y^{T}y - y^{T}D^{-1/2}WD^{-1/2}y \\
\geq 0\\(, see that \\)1 \geq \norm{D^{-1/2}WD^{-1/2}}_2\\(; Also, using \\)y = D^{1/2}1$, get \\
\\(\norm{D^{-1/2}WD^{-1/2}}_2 = 1\\).

Another way to see this: \\(D^{-1/2}WD^{-1/2}\\) is obtained by a similarity transformation to \\(D^{-1}W\\), which has ew in the range [-1, 1] due to Gerschgorin thm, and which has \\(\sw_max = |\ew_max| = 1\\) using the ev 1.

#### Quadratic form: Normalized smoothness measure
$y^{T}Ny = y^{T}D^{-1/2}LD^{-1/2}y = \\
\sum_{(i, j)\in E}W_{ij}(\frac{y_i}{\sqrt{d_{ii}}} - \frac{y_j}{\sqrt{d_{jj}}})^2\\(: from the form \\)x^{T}Lx\\( being a smoothness measure. Punishes deviation between \\)\set{y_i}$ corresponding to edges emanating from high degree vertices less.

## Expanders
A sparse graph with high connectivity properties. Connectivity quantified as edge expansion or vertex expansion. Let \\(E'(S)\\): edges with exactly one end point in S.

### Edge expansion of G
Aka isoparametric number. \\
\\(h(G) = \min_{1\leq |S| \leq n/2} \frac{|E'(S)|}{|S|}\\).

### \\(\ga\\) vertex expansion of G
\\(g_{\ga}(G) = \min_{1 \leq |S| \leq n \ga} \frac{|\nbd(S)|}{|S|}\\).

### Other Examples
Most graphs are expanders. \\(K_{n}\\) has good expansion properties, but it is not sparse.



## Random graphs
Common Varieties: \\(G_{n,p}, G_{n,|E|}\\)

### G(n,p)
A static model: every edge is present or absent independent of other edges. p controls edge density. As \\(n \to \infty diam(G) \to 2\\). Size of the largest cluster is \\(O(\log n)\\).
