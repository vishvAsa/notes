+++
title = "Linear operators"
+++

## Linear Transformation
### Definition and Linearity
#### Linearity
\\(A(ax+by) = aA(x)+bA(y)\\). \\(A\\) called operator, from viewing vector as functions.

#### Mapping between vector spaces
For any field \\(F\\), can consider linear transformations \\(A: F^{n} \to F^{m}\\).

### Applications, examples
Vector spaces can model many real world things (see vector spaces ref), even functions. In all of these, linear transformations have deep meanings.

Over function spaces: Differentiation, integration, multiplication by fixed polynomial in \\(P_n\\).

Geometric operations: \\(Ax\\). \\
Rotation, projection, reflection, stretching, shearing.

### As a matrix
#### Use action on basis vectors
Take the linear operation \\(A\\), take standard basis vectors \\(\set{e_i}\\) of dom(A). Take an input \\(x\\), which, as a combination of basis vectors, is \\(x = \sum_i x_i e_i\\). Now, by linearity, \\(A(x) = \sum_i x_i A(e_i)\\).

+++(So, \\(A(e_i)\\) is the basis of the range space range(A)!)+++

#### Matrix
Now, write a matrix \\(A\\), a 2-dim array of numbers such that the ith column, \\(a_i = A_{:,i} = A(e_i)\\). This will be a \\(m \times n\\) array. Reason for doing this: Ax now be defined to equal A(x).

#### Matrix * vector multiplication
Define \\(Ax = \sum_i a_i x_i\\). +++(Voila - linear operation represented by matrix vector multiplication!)+++

For other views of \\(Ax\\), see a later section.

##### Vector dot product
+++(This also defines row vector * column vector multiplication!)+++ This is also the standard inner product.

#### Row view: inner product with rows
Take the standard inner product. Then, Ax is the vector formed by \\((\dprod{A_{i,:}, x})\\).

### Changing basis vectors
Representation of the same geometric point can change with the choice of bases.

Take the point \\(x = \sum_i x_i e_i\\), written according to the old standard basis \\(\set{e_i}\\). Express \\(\set{e_i}\\) in terms of the new basis \\(\set{e'_i}\\):, \\(e_i = \sum_i a_i e'_i\\); write it as the vector \\(u_i\\). Thence, construct the matrix U. Then, \\(Ux = y\\) is the representation of the point in terms of the new basis \\(\set{e'_i}\\).

### Representation wrt i/p and o/p bases
Similarly, representation of a linear transformation can also change with choice of bases.

When the right input and output basis is chosen, every matrix is actually diagonal : mere scaling: see SVD.

## Forward operation: Ax
### Spaces related to range(A)
#### Range space
As \\(A\\) is linear, \\(range(A) = \set{Ax : \forall x \in dom(A)}\\) is the vector (sub)space \\(\linspan{a_i}\\) by definition of matrix-vector multiplication. So, aka the column space.

By linearity, \\(A\\) maps \\(x = x_{r}+x_{n} \in C^{n}, x_n \in N(A), x_r \perp N(A) \\) to \\(Ax_r \in C^{m}\\).

#### Left null space
Also, **orthogonal complement** of \\(range(A)^\perp =N(A^{T})\\), the Left Null space; both in \\(C^{m}\\).

### Subspaces of the domain
#### Null space (Kernel)
N(A): \\(\set{x: Ax = 0}\\). By linearity of \\(A\\), this is a vector space. N(A) dimension = degrees of freedom = free vars' number.

Left null space is \\(N(A^{T})\\).

##### Find null-space
Ax=0; Reduce \\(A\\) to U; identify pivot and free vars; find values of pivot vars in terms of f free vars; rewrite as combination of f vectors (basis of null space). If \\(N(A)=C^{0}\\), every b is unique combo of range(A).

Similarly, Find **left null-space** \\(N(A^{T})\\) basis.

#### Row space
This is the space spanned by rows of \\(A\\), so it is \\(range(A^{*})\\). \\(S \perp N(A)\\) wrt standard inner product, \\(range(A) + N(A) = F^{n}\\).

Every x: \\(Ax \neq 0\\) has a component in the row space.

#### SVD view
See elsewhere.

### Rank of A
#### Row and column ranks
The number of linearly independent rows in \\(A\\) is row rank. Similarly column rank is defined. So, column rank = dim(range(A)).

#### Row rank = column rank
Do triangular row elimination to get PA = LU. Then, row rank = number of non-zero rows/ pivots in A.

But, every column \\(a_i\\) of \\(A\\), corresponding to a 0 pivot, is a linear combination of the non-0 pivot columns: construct the matrix A' with only such columns, and solve \\(A'x = a_i\\) using triangular row elimination. So, column rank = number of non-zero pivots.

#### SVD view
Take SVD: \\(A = U \SW V^{*}\\). Rank r of \\(A\\) corresponds to number of non 0 \\(\sw_i\\); Can take reduced SVD: \\(A = U_r \SW_r V_r^{*}\\). \\(A\\) actually acts between r-dim subspaces.

#### Invertability
Both row space and range(A) must have dimension r. Every \\(x_{r}\\) in \\(range(A^{T})\\) mapped to unique \\(Ax_{r}\\). Invertability, I. Every \\(Ax_{r}\\) in range(A) mapped to unique \\(x_{r}\\): Else, if \\(Ax_{r'} - Ax_{r}= 0\\), \\(x_{r'} - x_{r}\\) is both in row space and N(A). Also, \\(A \in C^{m \times n}\\) (\\(m \geq n\\)) full column rank iff no \\(x_{r}\\) mapped to same \\(Ax_{r}\\). So, \\(A\\) invertible (both as a function and group theoretically) iff r=m=n. So unique decomposition into basis vectors.

Else, use pseudoinverse to get left inverse if \\(m>n\\), right inverse if \\(n>m\\). To invert Ax=b for \\(n>m\\), identify n-m linearly dependent columns in \\(A\\), set corresponding \\(x_{i} = 0\\), drop those columns to get A', solve for x' is \\(A'x' = b\\).

### Identity operation
\\(Ix = x\\).

## Matrix multiplication: AB
### Composition of transformations
AB is defined to conform to transformation ABx. So, ABCx is associative.

#### As sum of rank 1 matrices
\\(u\otimes v = uv^{T}\\) makes Rank 1 matrix. \\(AB = a_{1}b_{1}^{*} + .. + a_{p}b_{p}^{*}\\), where \\(b_{i}^{*} = B_{i,:}\\). This ensures that \\(ABx = \sum_i (B_{i,:}x) a_i\\), as intended! +++(Remarkable!)+++

Similarly, for diagonal matrix D: \\(ADB = \sum_{i} a_{i}d_{i,i}b_{i}^{*}\\). So, for symmetric \\(S = U \SW U^{T}\\), \\(A^{T}SB = A^{T}U\SW U^{T}B = \sum \sw_i (U^{T}a_i)^{T}(U^{T}b_i) = \sum \sw_i a_i^{T}b_i\\).

### Elementwise description
From sum of rank 1 matrices form: \\((AB)_{i,j} = A_{i,:}B_{:,j}\\).

#### Columns of the result
A acts on B's rows; B acts on A's columns. Every col of C=AB is a linear combination of A's cols according to some col of B: \\(c_i = Ab_i\\).

#### Form of ABC
Consider expansion of quadratic functional (see vector spaces ref). Similarly, in D = ABC has \\(D_{i,j} = A_{i,:}(BC_{:,j})\\).

So, \\(D_{i,j}\\) is a linear combination of \\(B_{i,j}\\).

### Computation
Needs \\(O(n^{3})\\) naively. Else needs \\(O(n^{2.7})\\) by Strassen alg. If sparse need \\((n^{2}\nu)\\).

### Rank
rank(AB) \\(\leq\\) min (rank(A), rank(B)): Take A=LU factorization, as AB = LUB, rank(AB) \\(\leq\\) rank(B).

### Inverse and transpose
\\((AB)^{-1}=B^{-1}A^{-1}\\) (Take ABx to x.). \\((AB)^{*}=B^{*}A^{*}\\) from defn.

So, as \\(I = (AA^{-1})^{*} = (A^{-1})^{*}A^{*}\\), \\((A^{-1})^{*} = (A^{*})^{-1}\\) (aka \\(A^{-*}\\)). Also, \\((AA^{*})^{*} = AA^{*}\\) and \\(A^{*}A\\) Hermitian.

### Block matrices
Block multiplication works.

## Other matrix products
### Entrywise product
Aka Hadamard product, Schur product. \\(A.A\\).

### Kronecker product
Aka outer product. \\(A\\) \\(m\times n\\), B \\(p \times q\\); \\(C = \\)A\\( \kron B\\) is \\(mp \times nq\\) block matrix with \\(C_{i,j} = A_{i,j}B\\).

From defn, \\(\exists A, B: A \kron B \neq B \kron \\)A\\( ; (A \kron B)^{T} = B^{T} \kron C^{T}; A \kron (B+C) = \\)A\\( \kron B + A \kron C; aA \kron bB = ab A\kron B\\). \\((A \kron B)(C \kron D) = AC \kron BD\\) by block multiplicity. So, \\((A \kron B)^{-1} = A^{-1} \kron B^{-1}\\). Also, using \\(QA = LDU: rank(A \kron B) = rank(A)rank(B)\\).

\\(\ew\\) vector: \\(\ew(A \kron B) = \ew(A)\kron \ew(B)\\): take eigenpairs of \\(A\\) and B: \\((\ew_{i}, v_{i}), (\mu_{j}, u_{j})\\); 
\\((A \kron B)(v_{i} \kron u_{j}) = Av_{i} \kron Bu_{j} = \ew_{i}\mu_{j}(v_{i} \kron u_{j})\\).

## Inverse operation: Solve Ax = b for x
### Solvability Assumption
\\(b \in range(A)\\).

### Left and right inverses
Right inverse: \\(I=AA^{-1}\\). Similarly, left inverse is defined.

#### Existance conditions
The left inverse exists exactly when you can solve Ax = b for all \\(b\in range(A)\\). Right inverse exists when you can solve \\(x^{T}A = b^{T}  \forall b \in range(A^{T})\\).

#### Equivalence if both exist
If both left and right inverses exist, they're the same: \\(B_{l}^{-1}BB_{r}^{-1} = B_{l}^{-1} = B_{r}^{-1}\\).

### Solutions
#### Full column rank
If \\(A\\) has full column rank, you have a unique solution, left inverse exists, \\(x = A_l^{-1}b\\). Proof: Triangularization by row elimination goes through.

#### Rank Defective matrix
If \\(A\\) is column-rank deficient, eg: short and fat, you have an overdetermined set of linear equations: many 'equally good' solutions exist, but you may want one with certain properties (like sparsity). See numerical analysis ref for details.

#### Finding solutions
See numerical analysis reference for various techniques.

#### Finding inverses
Find right inverse: Gauss-Jordan: Make augmented matrix A:I; use row operations to reduce it to \\(I:A^{-1}\\). So, \\(\exists A^{-1}\\) (right) iff r=m. Similar trick for left inverse.

Or make cofactor matrix C, use \\(A^{-1} = \frac{C^{T}}{det(A)}\\).

### Block matrices
#### Block Gaussian elimination
Take \\(X = \mat{A & B \\ C & D }\\), solve \\(X \mat{x \\ y} = \mat{u\\ v}\\) for \\(\mat{x \\ y}\\), thence derive \\(X^{-1}\\). Solving for x in the top equation and substituting it in the bottom, you will have reduced the problem to:

\\(\mat{I & A^{-1}B \\ 0 & S = D-CA^{-1}B } \mat{x \\ y} = \mat{A^{-1} & 0 \\ -CA^{-1} & I } \mat{u\\ v}\\).

#### Block LU
Thence, get block LU, Aka Leibnitz factoriazation: \\
\\(X = \mat{A & 0 \\ C & I } * \mat{I & A^{-1}B \\ 0 & S = D-CA^{-1}B }\\).

#### Schur complement
S is called the Schur complement of \\(A\\) in X.

#### Inverse of X
Do block back substitution to get \\(X^{-1}\\).

### Pseudoinverse for long thin A
Projector + inverse. For rectangular, non column rank deficient matrices: \\(m\geq n\\). Takes \\(b = A(x_{r}+x_{n})\\) to \\(x_{r}\\) in row space, cannot revert \\(Ax_{n}=0\\) (\\(x_{n} \in N(A)\\)).

\\(A^{+} = (A^{*}A)^{-1}A^{*} = \hat{R}^{-1}\hat{Q}^{*}\\) (as \\(A=\hat{R}\hat{Q}\\)) \\(= V\hat{\SW}^{-1}\hat{U}^{*}\\) (from SVD).

## Restriction to a subspace S
Let Q be the orthogonal matrix formed by an orthonormal basis of S.  Then, projection of \\(a_i\\) in S is \\(QQ^{T}a_i\\). So, \\(Ax = \sum_i x_i a_i\\), when restricted to S, becomes \\(Ax = \sum_i x_i QQ^{T}a_i\\). So, \\(QQ^{T}A\\) is the operator \\(A\\) restricted to the subspace S.

## Submatrices
Principle submatrices: \\(A_{1:k, 1:k} \forall k\\). For each principle submatrix, schur complement is defined: see determinant section.

## Random matrices
### Random projections
(Johnson Lindenstrauss) See randomized algorithms survey.
