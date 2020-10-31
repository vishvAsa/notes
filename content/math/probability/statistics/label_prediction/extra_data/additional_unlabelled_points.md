+++
title = "With extra unlabelled points"
+++

Assume points belonging to the same class cluster together, using unlabeled data with labeled data, you can draw better decision boundaries around clusters belonging to various class: probability density is important in classification.

## Generative approaches
\tbc

## Label propagation on graphs
Make the similarity graph G=(V, E) of the n points, \\(\set{X_i}\\). Some nodes \\(X_T\\) have labels, others don't have labels; let \\(k\\) be the indicator vector with \\(k_i = [i \in T]\\); take K = diag(k). 

### Quadratic criterion
#### Binary labels
Denote proposed labels of the n points as bits in a binary vector f. Let y be the label vector, with \\(y_T = c(X_T)\\) and \\(y_{V - T}\\) having arbitrary values.

\\(\min_{f \in \set{0, 1}^{n}} \sum_{(i, j) \in E}W_{i, j}(f_i - f_j)^{2} + l(f-y)^{T}K(f-y)\\). This finds an f which is smooth in that \\(f_i\\) and \\(f_j\\) are similar if they are connected by an edge in G, but also which agrees with \\(y_T\\) as much as possible.

#### Discrete labels
Denote the \\(L\\) possible labellings thus: \\(\set{e_i}\\): as L-dim indicator vectors. Denote labels of the n points as columns in the binary matrix F, where \\(\forall i : F_{:,i} \in \set{e_j}\\). Let Y be the label matrix of similar dimensions, with columns \\(Y_{:, T} = c(X_T)\\).

\\(\min_{F_{:, i} \in \set{0, 1}^{n}} \sum_{(i, j) \in E}W_{i, j}(F_{:,i} - F_{:,j})^{2} + l\sum_i (F_{:,i}-Y_{:,i})^{T}K(F_{:,i}-Y_{:,i})\\). This is akin to solving \\(L\\) binary label propogation problems simultaneously: propogating 1 label bit at a time. +++(Note that the binary case is a special case of this.)+++

+++(Combinatorial hardness in both cases!)+++

### Rewriting using Graph Laplacians
The objectives are equivalent to \\(\min f^{T}Lf + l (f-y)^{T}K(f-y)\\) and \\
\\(\min tr(F^{T}LF) + l tr((F-Y)^{T}K(F-Y))\\). \\(\sum_{(i, j) \in E}W_{i, j}(f_i - f_j)^{2} = f^{T}Lf\\) is shown in graph theory ref; and the latter equivalence is easily obtained by using this as a component.

Using the normalized graph laplacian \\(N\\), get the objective \\(\min tr(F^{T}NF) + l tr((F-Y)^{T}K(F-Y))\\). In graph theory ref, see that \\(f^{T}Nf\\) is a normalized smoothness measure.

### Real relaxation: solve linear system of eqns
In both the binary and the general discrete case, drop the constraints \\(f \in \set{0, 1}^{n}, F_{:, i} \in \set{0, 1}^{n}\\). Allow any real value; solve this relaxed problem to get f or F, and get to the closest binary f' and F'.

From optimality conditions, the solution is \\((L+K)F = KY\\).

### Low rank approximation for fast solution
(L+K) is \\(n \times n\\), and solving this system of equations is \\(O(n^{3})\\) naively. Instead, can use low rank factorization \\(TT^{*}\\) where \\(T \in R^{n \times k}\\) to solve this in \\(O(nk^{2})\\).

But, finding low rank approximation requires finding sv (same as finding ev for symmetric matrices), which is \\(O(kn^{2})\\). Can surpass this using eigenfunctions. \why

