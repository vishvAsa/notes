+++
title = "Misc functionals"
+++

## Functionals over square matrices
Also see functionals over +ve definite A.

### Determinant of square A
#### Definitions
Det(A) or \\(|A|\\) : The recursive defn. **Cofactor** of \\(A_{1,1}\\): \\(C_{1,1}\\) = det of submatrix (minor) of A. Defn by properties: 1: det I = 1. 2: If 2 rows are equal, det(A) = 0. 3: det \\(A\\) depends linearly on first row.

#### Properties
So, there is sign change in Det(A) with row exchanges. Also, Det(A) is unchanged with \\(row_{1} += k row_{2}\\). So, 0 row means det \\(A\\) = 0. Also, for L or U, just multiply diagonal. Also, det \\(A\\) = 0 iff \\(A\\) singular.

##### Multiplicativity and consequences
\\(|A||B|=|AB|\\): See that \\(\frac{|AB|}{|B|}\\) has the 3 properties \\(|A|\\) should have.

So, \\(|A^{-1}| = \frac{1}{|A|}\\). So, \\(|Q|= \pm 1\\). So, considering \\(|PA| = |LU|\\) and \\(|A^{T}P^{T}| = |U^{T}L^{T}|\\), \\(Det(A^{T}) = Det(A)\\). So, column operations don't alter det \\(A\\), there is sign change with col exchanges, write det \\(A\\) with column cofactors etc..

#### Connection with ew, sw
Take characteristic polynomial \\(p_A\\). \\(det(A) = p_{A}(0) = \prod_{i} (l_{i}-l)]_{l=0}\\): also by considering \\(A = QTQ^{*}\\). Also, \\(|det(A)| = \prod \sw_i(A)\\).

##### Connection with rank and semidefiniteness
Thence, det(A) = 0 \\(\equiv\\) \\(A\\) is rank deficient. \\(det(A) < 0 \implies \\)A\\( \nsucceq 0\\): implication is one directional.

#### Find Det(A)
Reduce \\(A\\) to U, find det U. For each of the n! diagonals, multiply elements; add after accounting for permutation sign: From linearity property, get row exchanged diagonal matrices, consider relation between determinant sign and row exchanges; Hence note equivalence of definitions. Use eigenvalue decomposition: \\(|A|=|S\EW S^{-1}|=|S||\EW||S|^{-1} = |\EW|\\).

Det(A) = volume spanned by row (or col) vectors: orthogonalize (parallelopiped changed to cube of equal volume): \\(|A|\\) unchanged; now \\(AA^{T}\\) is diagonal matrix; \\(|AA^{T}| = |A|^{2} = vol^{2}\\). **Perm(A)**: Same as Det(A), ignore sign.

##### Block matrices
Leibnitz: \\
\\(X = \mat{A & B \\ C & D } = \mat{A & 0 \\ C & I } * \mat{I & A^{-1}B \\ 0 & D-CA^{-1}B }\\). Use this if \\(A\\) square, invertible, thence find determinant.

If X symmetric, ie if \\(B = C^{T}\\): \\(D-CA^{-1}B\\) is the Schur complement of A.

### Trace of A
\\(tr(A) = \sum_{i} a_{i,i}\\).

A linear map: tr(kA + lB) = k tr(A) + l tr(B): so convex.

#### Trace of AB
Trace is an inner product on matrices. It is same as vectorizing \\(A\\) and B and applying the standard inner product.

\\(tr(AB) =  \sum_{i} \sw_{i} \sw_{\pi(i)}\\) for some permutation \\(\pi\\): from \\(|A||B|=|AB|\\).

(Von Neumann): \\(tr(AB) \leq \prod_{i} \sw_{i}(A)\sw_{i}(B)\\) \why.

#### Cyclicity and similarity invariance
\\(tr(AB) = tr(BA) = \sum_{i} \sum_{j} a_{i,j}b_{j,i}\\); but \\(tr(ABC) = tr(BCA) \neq tr(ACB)\\).

Similarity invariant: \\(tr(P^{-1}AP) = tr(APP^{-1}) = tr(A)\\).

#### Trace of outer products
\\(tr(ab^{T}) = b^{T}a\\) by algebra.

#### Connection with ew
Take characteristic polynomial \\(p_A\\). tr(A) = coefficient of \\(l^{m-1}\\) in \\(p_{A}\\) = \\(\sum_{i} l_{i}\\).

#### Gradient to tr
By considering \\(tr(f(X + \change X)) - tr(f(X))\\), get: \\(\gradient_X tr(X) = I, \gradient_X tr(XA) = \gradient_X tr(AX) = A^{T}, \gradient_X tr(BXA) = \gradient_X tr(ABX) = B^{T}A^{T}\\).

By considering \\(tr(f(X + \change X)g(X + \change X))- tr(f(X)g(X))\\), \\
\\(\gradient_X tr(AXBX) = B^{T}X^{T}A^{T} + A^{T}X^{T}B^{T}\\).

## Functionals over +ve definite matrices
### Log det divergence
\\(f(A) = \log det(A) = \sum_i \log \ew_i(A) = tr(\log(A))\\);\\
 often used because it is convex. \\(\gradient \log det(A) = A^{-1}\\) \why.

## Singular values (sw)
See SVD section.

### Unitary invariance
\\(\SW \in R^{mn}\\) always, so \\(\SW = \SW^{*}\\). \\(\SW = U^{*}AV\\): so, \\(\SW\\) is unitary invariant: \\(\sw_{i}(A) = \sw_{i}(Q_{1}AQ_{2})\\).

Let \\(a = (a_{i,i}), \sw = (\sw_{i})\\): By direct computation using \\(U\SW V^{*}\\), \\(a = Z\sw\\), where \\(Z = [u_{ij}v_{ij}] = (U.\bar{V})_{1:q, 1:q}\\); take \\(Q = |Z|\\); get \\(|a| \leq Q \sw\\). \\(\norm{q_{i}^{*}}_{1}^{2} = (\sum_{j} |u_{ij}v_{ij}|)^{2} \leq \sum_{j} |u_{ij}|^{2}\sum_{j} |v_{ij}|^{2} \leq 1\\), by induction; also \\(\norm{q_{i}}_{1} \leq 1\\); so Q is substochastic.

### Effect of row or column deletion
\\(A_{r}\\): \\(A\\) with r rows or cols deleted; \\(\sw_{k}(A) \geq \sw_{k}(A_{r}) \geq \sw_{k+r}(A)\\). Prove for r=1, get general case thence. Pf where sth col is deleted: For upper bound, use \\(\sw_{k}(A_{1}) = \max_{S \subset C^{n}, dim(S) = k} \min_{x \in S} \norm{Ax}_{2}\\) with extra cond: \\(x \perp e_{s}\\); for lower bound use \\
\\(\sw_{k}(A_{1}) = \min_{S \subset C^{n}, dim(S) = n-k} \max_{x \in S} \norm{Ax}_{2}\\) with extra cond. For row deletion, consider \\(A^{*}\\).

#### Sum, product of sw of square A
##### ew sw sum comparison
By block multiplicity, for any arbit sq orth \\(x\\), Y: \\(S_{k} = X_{k}^{*}AY_{k}^{*}\\): upper left submatrix of \\(S = X^{*}AY\\); So, \\(\sw_{i}(X_{k}^{*}AY_{k}^{*}) \leq \sw_{i}(X^{*}AY) = \sw_{i}(A)\\). So, \\(|det(X_{k}^{*}AY_{k})| = \prod_{i=1}^{k} \sw_{i}(X_{k}^{*}AY_{k}) \leq \prod_{i=1}^{k} \sw_{i}(A)\\).

For square \\(A\\), take \\(A = QTQ^{*}\\), \\(T = Q^{*}AQ\\), \\((\ew_{i}) \downarrow\\); so take k-principle submatrix, use block multiplicity to get: \\(T_{k} = Q_{k}^{*}AQ_{k}\\)\\
So, \\(|det(T_{k})| = \prod_{i=1}^{k}|\ew_{i}(A)| = |det(Q_{k}^{*}AQ_{k})| \leq \prod_{i=1}^{k} \sw_{i}(A)\\): = for k=m.

By majorization lore, \\(|tr(A)| \leq \sum_{i=1}^{q} |\ew_{i}(A)| \leq \sum_{i=1}^{q} \sw_{i}(A)\\). Also, for any \\(p>0, \sum_{i=1}^{q} |\ew_{i}(A)|^{p} \leq \sum_{i=1}^{q} \sw_{i}(A)^{p}\\).

##### Sum of sw of matrix products
\\(A \in C^{mp}, B \in C^{pn}\\).

Take \\(AB = U\SW V^{*}\\); \\(U_{k}^{*}ABV_k = \SW_{k}\\); polar decomposition of $BV_{k} = X_{k}Q; \\
Q^{2} = V_{k}^{*}B^{*}BV_{k};\ det(Q^{2}) \leq \prod_{i=1}^{k} \sw_{i}(B^{*}B) = \prod_{i=1}^{k}\sw_{i}(B)^{2}$.

So, $\prod_{i=1}^{k} \sw_{i}(AB) = |det(U_{k}^{*}ABV_{k})| = |det(U_{k}^{*}AX_{k})det(Q)| \\
\leq \prod_{i=1}^{k}\sw_{i}(A) \sw_{i}(B)$.

By majorization lore, for \\(p>0, \sum_{i=1}^{q} \sw_{i}(AB)^{p} \leq \sum_{i=1}^{q} \sw_{i}(A)^{p}\sw_{i}(B)^{p}\\).

##### Sum of sw as trace maximizer of SVD-like decompositions
.\\$\sum_{i=1}^{k}\sw_{i}(A) 
= \max \set{|tr(X^{*}AY)|: X^{*}X = Y^{*}Y = I, X \in C^{mk}, Y \in C^{nk}}\\
 = \max \set{|tr(AC)| C \in C^{nm}\texttt{ is rank k partial isometry}}$.

Pf: Can get C from Y, X: \\(C = YX^{*}, \sw_{i}(C^{*}C) = \sw_{i}(XX^{*})= \sw_{i}(X^{*}X) = 1\\); Can get Y, X from C: use SVD: \\(C = U\SW V^{*} = U_{k}V^{*}_{k}\\). \\(|tr(AC)| = |\sum \ew_{i}(AC)| \leq \sum_{i=1}^{q} \sw_{i}(AC) \leq \sum_{i=1}^{q}\sw_{i}(A) \sw_{i}(C) = \sum_{i=1}^{k}\sw_{i}(A)\\). Take \\(A = U\SW V^{*}\\), then for rank k isometry \\(C = V\hat{I}_{k}U^{*}\\), \\(tr(AC) = tr(U\SW\hat{I}_{k}U^{*}) = \sum_{i=1}^{k}\sw_{i}(A)\\).

##### Triangle inequality
All \\(\sw_{i}\\) in descending order; then: \\
\\(\sum_{i=1}^{k}\sw_{i}(A+B) \leq \sum_{i=1}^{k}\sw_{i}(A) + \sum_{i=1}^{k}\sw_{i}(B)\\).

Pf: Let C be some rank k partial isometry:\\ $\sum_{i=1}^{k}\sw_{i}(A+B) = \max \set{|tr((A+B)C)|} \leq \max \set{|tr(AC)| + |tr(BC)|} \\
\leq \max \set{|tr(AC)|} + \max \set{|tr(BC)|} = RHS$.

### Convexity, concavity
\\(\sw_1(X)\\) is convex, but \\(\sw_n(X)\\) is concave: \\( \sw_1(tA + (1-t)B) = \sup_{\norm{x}=1} tAx + (1-t)Bx \leq \sw_1(A)x + \sw_1(B)x\\).


### Properties of A discerned from SVD
Rank(A) = num +ve singular values: By geometric action, or by algebra U, V unitary, \\(\SW\\) diagonal: \\(|A|=|U\SW V^{*}|=|U||\SW| |V^{*}| =|\SW|\\). Similarly, numerical Rank of \\(A\\) = num +ve not-close-to-0 \\(\sw\\). Good way to find rank.

SVD is most accurate method for finding orthonormal basis for N(A) and range(A).

\\(A=\sum \sw_{i}u_{i}v_{i}^{*}\\): \\(\sum\\) rank 1 matrices.

