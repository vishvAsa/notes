+++
title = "Misc decompositions"
+++

## Importance of decompositions
Very important in restating and understanding the behavior of a linear operator. Also, important in solving problems: get decomposition, use it repeatedly. For algebraic manipulation: Factor the matrix: QR, LU, Eigenvalue decomposition, SVD.

## EW revealing decompositions
See section on eigenvalues.

### Eigenvalue decomposition
Aka Spectral Decomp. Only if \\(A\\) diagonalizable.

Take \\(S\\): Eigenvectors-as-columns matrix, with independent columns; \\(\EW\\): Eigenvalue diagonal matrix. Then, AS = SL; So, \\(S^{-1}AS = L\\); \\(A=SLS^{-1}\\): a similarity transformation. Also, If AS=SL, S's columns must be eigenvectors.

A diagonalized into \\(\EW\\). \\(A\\) and \\(\EW\\) are similar.

#### Non-defectiveness connection
\\(\exists S^{-1}\EW S\\) iff \\(A\\) is non defective: If \\(\exists S^{-1}\EW S\\): \\(\EW\\) diagonal, non defective, so \\(A\\) non defective; if \\(A\\) non defective: can make non singular S; thence \\(S^{-1}\EW S\\).

#### Left ev
\\(S^{-1}AS = \EW\\), so \\(S^{-1}A = \EW S^{-1}\\). So, the rows of \\(S^{-1} = L\\) are the left ev.

#### Change of basis to ev
\\(x = SS^{-1}x = SLx = \sum_i \dprod{x, L_{i, :}} s_i\\). Thus, any x can be conveniently rewritten in terms of right ew, with magnitudes of components written in terms of left ew.

#### Unitary (Orth) diagonalizability
For \\(A=A^{*}\\), \\(A=-A^{*}\\), Q etc..

A unitarily diagonalizable iff it is normal: \\(A^{*}A = AA^{*}\\): From uniqueness of SVD, \\(US^{2}U^{*} = VS^{2}V^{*}\\); so, \\(|U| = |V|\\); U and V may only differ in sign. So, for some \\(|\EW| = |S|, \\)A\\( = ULU^{*}\\). Aka Spectral theorem.

### \htext{\\(A = QUQ^{*\\)}{Schur} factorization}
(Schur). \\(A\\) and upper traingular U similar; all ew on U's diagonal. If \\(A=A^{*}\\), \\(U=U^{*}\\), so U is diagonal.

Every \\(A\\) has \\(QUQ^{*}\\): by induction: assume true for m; take any \\(\ew\\) and corresponding eigenspace \\(V_{\ew} \perp V_{\ew}^{\perp}\\); use orth vectors from these spaces as bases; in this basis, operator represented by \\(A\\) has matrix representation \\(A'=\mat{\ew I_{\ew} & B\\ O & C} = Q^{*}AQ\\); can then repeat the process for C.


## Singular Value Decomposition (SVD)

### Reduced (Thin) SVD
If \\(m\times n\\) \\(A\\) with \\(m>n\\), rank r = n, unitary \\(n\times n\\) \\(V = [v_{i}]\\), unitary \\(m\times n: \hat{U}=[u_{i}], n\times n: \hat{\SW} = \\) diagonal matrix with \\({\sw_{i} \geq 0}\\) in descending order, \\(AV=\hat{U}\hat{\SW}\\); then \\(A=\hat{U}\hat{\SW}V^{*}\\). If \\(r<n\\); still get reduced SVD by padding V with \\(\perp\\) vectors, \\(\hat{U}\\) with appropriate \\(\perp\\) vectors, \\(\SW\\) with 0 diagonalled columns.

### Full SVD
Pad \\(\hat{U}\\) with m-r \\(\perp\\) vectors, \\(\hat{\SW}\\) with 0's to make U \\(m \times m\\), invertible; V stays same; \\(A=U\SW V^{*}\\). So, SVD for \\(m<n\\): \\(A^{*}=V\SW U^{*}\\). So, \\(A^{*}U=V\SW\\). Also, \\(Av_{i} = u_{i}\sw_{i}\\). So, \\(range(A)=u_{1} \dots u_{r}\\), \\(range(A^{*})=v_{1} \dots v_{r}\\), \\(N(A)=v_{r+1} \dots v_{m}\\) (\\(Av_{r+1}=0\\)), \\(N(A^{*})=u_{r+1} \dots u_{n}\\).

### Geometric view
Take \\(Ax = U\SW V^{*}x\\): \\(V^{*}\\) rotates the unit ball to unit ball: \\(v_{i} \to e_{i}\\), \\(\SW\\) stretches unit ball along axes to make it hyperellipse, U rotates it. Every \\(A\\) with SVD maps unit ball to hyperellipse (Eqn: \\(\sum \frac{x_{i}^{2}}{\sw_{i}^{2}} = 1\\)): Orthonormal \\(\{v_{i}\}\\) (left singular vectors) mapped to orthogonal \\(\{u_{i}\sw_{i}\}\\) (Principle semiaxes, orthonormal right singular vectors \\(\times\\) singular values). So \\(\sw_{1} = \norm{A}_{2}\\), \\(\sw_{n} = \norm{A^{-1}}_{2}\\).

From geometric action of \\(U\SW V^{*}x\\), every \\(A\\) with SVD is a diagonal matrix when domain and range bases are altered (See \\(Ax=b\\) as \\(AVx'=Ub'\\), then \\(\SW x'=b'\\)). 'If ye want to understand \\(A\\), take its SVD.'

### Existance
Every \\(A\\) has a SVD: by induction; prove 1*1 case; assume (m-1)*(n-1) case  \\(B=U_{2}\SW_{2}V_{2}^{*}\\); take m*n A; \\(\sw_{1} = \norm{A}_{2} = \sup \|Av\|_{2}\\); so \\(\exists v_{1}\\) in the unit ball with \\(Av_{1} = u_{1}\sw_{1}\\); So extend \\(v_{1}\\) and \\(u_{1}\\) to orthonormal \\(V_{1}\\) and \\(U_{1}\\), make \\(\SW_{1}\\) solving \\(U_{1}^{*}AV_{1}=\SW_{1}\\); 1st col is \\(\sw_{1}\\); as \\(\norm{A}=\norm{\SW} = \sw_{1}\\), non-diag elements of 1st row gotto be 0; let rest of \\(\sw_{1}=B\\).

### Conditional uniqueness up to a sign
SVD is unique if \\(\set{\sw_{i}}\\) unique ('up to sign'): write Hyperellipse ellipse semiaxes in descending order; but can reverse sign of \\(u_{i}\\), \\(v_{i}\\) or can multiply them with any suitable pair of complex roots of 1.

### Singular value properties
See another section.

### Finding SVD using EVD
Use eigenvalue decompositions: \\(AA^{*} = U \SW^{2}U^{*}\\), and \\(A^{*}A = V \SW^{2}V^{*}\\). Otherwise, find eigenvalue decomposition of \\(B = \mat{0 & A\\ A^{T} & 0}\\): then ew(A) are composed of zeros and sw(A) repeated with different signs. ev of B is \\((\sqrt{2})^{-1}\mat{U_n & V\\ \sqrt{2}U_{m-n} & 0}\\).

### Polar decomposition
\\(m \leq n\\): take SVD 
$$A = U [\SW\ 0] [V_{1}\ V_{2}]^{*} = U \SW V_{1}^{*},\\
 P^{2} = AA^{*} = U \SW^{2}U^{*}\\(: +ve semidefinite; take \\)P = U \SW U^{*}\\(: Hermitian +ve semidefinite. So, \\)A = U \SW V_{1}^{*} = PUV_{1}^{*} = PY$$, where Y has orthonormal rows.

So, if \\(m \geq n\\): \\(A = YQ\\) for Hermitian +ve semidefinite Q, Y with orth columns: apply thm to \\(A^{*}\\).

## PA = LU
Here unit lower triangular L, upper triangular U.

Can also make: PA = LDU: For , unit upper triangular U, diagonal D.

### Existance and uniqueness
#### Existance
See triangularization by row elimination algorithm in numerical analysis ref. That this runs to completion proves existance.

#### Uniqueness if P=I
A = LU unique: Else if \\(LU = L'U'\\), \\(L'^{-1}L = U'U^{-1}\\): absurd. So A=LDU unique.

### For hermitian positive definite matrices
As \\(A \succeq 0\\), P = I.

As \\(A = LDU = A^{*}\\), can take \\(A = RR^{*}\\), where R = \\(LD^{1/2}\\) (Cholesky). It is also unique: \\(r_{j,j} = \sqrt{d_{j,j}} >0\\) fixed by definition; it inturn fixes rest of R.

### Importance
Very useful in solving linear equations invloving the same matrix A: can store L, U for repeated reuse.


## A = QR = LQ'
Express columns of \\(A\\) as linear combinations of orthogonal \\(\set{q_i}\\). For proof of existance, see triangular orthonormalization algorithm in numerical analysis ref.

Taking the QR factorization of \\(A^{T}\\), you also get \\(A = LQ^{T}\\), where \\(L\\) is lower triangular.

### Importance
Often, we need to get an orthogonal basis for range(A).

### Column Rank deficient A
If \\(A\\) were rank deficient, multiple columns would be linear combinations of same set of \\(q_i\\)'s.  As Q is square, we would have 0 rows .

#### Rank revealing QR
In such cases, we can always assume that the 0 rows appear at the bottom, revealing the rank.

## Factorization of Hermitian matrices
### Unitary diagonalizability, SVD
From Schur factorization: Can write \\(A=Q \EW Q^{*}\\). So, has full set of orthogonal eigenvectors. So, can write: \\(A = \sum_i \ew_i q_i q_i^{*}\\).

Also, singular values \\(s_{i}= |\ew_{i}|\\), but can't write \\(A = U \SW V^{*} = U \SW U^{*}\\): there may be sign difference between U and V's columns due to \\(\ew_i < 0\\).

### Symmetric LDU factorization
(Cholesky). \\(A = R^{*}R\\). As \\(A = LDU^{*}=UDL^{*}\\), \\(L=U^{*}\\). So, \\(A = LDL^{*} = LD^{1/2}D^{1/2}L^{*} = R^{*}R\\); \\(d_{j,j} > 0\\) as \\(a_{j,j}>0\\); \\(r_{j,j} = \sqrt{d_{j,j}} >0\\) chosen.

By SVD, \\(\norm{R}^{2} = \norm{A}\\).

### Square root of semidefinite A
\\(A = (A^{1/2})^{*}A^{1/2}\\). Diagonalize, get \\(A = QLQ^{*}\\), \\(A^{1/2} = QL^{1/2}Q^{*}\\) : the unique +ve semidefinite solution.

\chapter{Special linear operators}
## Orthogonal (Unitary) m*n matrix
Columns orthonormal: \\(Q^{*}Q=I\\); and \\(m \leq n\\).

### Change of basis operation
Qx=b: \\(x=Q^{*}b\\): so, x has magnitudes of projections of b on q's: Change of basis op.

Alternative view: \\(Q^{*}(\sum a_{i}q_{i}) = \sum a_{i}e_{i}\\).

#### Preservation of angles and 2 norms
So, \\(\dprod{Qa, Qb} = b^{*}Q^{*}Qa = \dprod{a,b}\\). Also, \\(\norm{Qx} = \norm{x}\\): So, length, angle preserved; analogous to \\(z \in C\\), with \\(|z| = 1\\). If \\(\norm{Qx} = \norm{x}\\), \\(Q^{*}Q = I\\).

### Square Unitary matrix
#### Orthogonality of rows
If Q square, even rows orthogonal: \\(Q^{*}Q=I \implies QQ^{*}=I\\): \\(q_{i}^{*}q_{j} = \change_{i,j}\\) (Kronecker \\(\change\\) = 1 iff i=j, else 0.).

#### Rotation + reflection
Because of its being a change of basis operation, by geometry, \\(Q\\) is rotation or reflection or a combination thereof. 

The distinction between orthogonal matrices constructed purely out of rotation matrices (proper rotation), and those involving orthogonal matrices which involve reflections (improper rotation) is important in geometric computations: in applications such as robotics, computational biology etc..

#### Determinant
\\(det(Q) = \pm1 : det(Q^{*}Q) = det(I) = 1\\).

\\(Q\\) is a rotation if \\(|Q|=1\\) or a reflection if \\(|Q|=-1\\): True for m=2; For \\(m >2\\), see that determinant is multiplicative.

#### Permutation matrix P
A permuted I. Permutes rows (PA) or columns (AP). Partial permutation matrix: every row or column has \\(\leq 1\\) (maybe 0) nz value.

#### Rotation matrix
To make a rotation matrix, take new orthogonal basis \\((u_i)\\): the coordinate system is rotated, \\(e_i \to u_i\\), get matrix U. \\((U^{*}x)_i = u_i^{*}x\\): x rotated. Note: \\(U^{*}u_i  = e_i\\).

#### Reflection matrix
Take reflection accross some basis vector (not any axis). This is just I with -1 instead of some 1.

## Linear Projector P to a subspace S
### Using General projection definition
See definition of the generalized projection operation in vector spaces ref. Here, we consider the case where projection happens to be a linear operator: that is, it corresponds to the minimization of a convex quadratic vector functional, where the feasible set is a vector space, the range space of the projector \\(P\\).

### Definition for the linear case
P such that \\(P^{2}=P\\): so, a vector already in S is not affected.

(I-P) projects to N(P): If Pv=0, (I-P)v=v; vice versa. Rank r projectors project to r dimension space.

Oblique projectors project along non orthogonal basis.

### Orthogonal projector
Here, \\((I-P)x \perp Px\\): Eg: projectors which arise from solving the least squares problem. Ortho-projectors \\(\neq\\) orthogonal matrices.

If P=P*, P orth projector: If P=P*, \\(\dprod{(I-P)x, Px} = 0\\). If P orth proj; make orthonormal basis for range(P), N(P); get Q; now \\(PQ= Q\SW\\), with \\(\sw_{i}\\) 1 or 0 suitably: SVD! So, if P orth proj, P=P*.

Ergo, (I-P) also orth proj. Also, \\(P = \hat{Q}\hat{Q}^{*}\\) (As \\(A = \hat{Q}\hat{R}\\)): Also from \\(v = r + \sum (q_{i}q_{i}^{*})v\\). All \\(\hat{Q}\hat{Q}^{*}\\) orth proj: satisfy props.

\\(\norm{P} = 1\\). \why

## Hermitian matrix
Aka Self Adjoint Operator. Symmetric matrix: \\(A=A^{T}\\). It generalizes to Hermitian matrix \\(A=A^{*}\\); analogous to \\(R \subseteq C\\). Not all symmetric matrices are Hermitian.

Notation: Symmetric matrices in \\(R^{n \times n}: S^{n}\\); +ve definite among them: \\(S^{n}_{++}\\).

Skew/ anti symmetric matrix: \\(A= -A^{T}\\), generalizes to skew Hermitian.

\\(\dprod{Ax, y} = y^{*}Ax = \dprod{x, A^{*}y}\\).

### Importance
Appears often in analysis: Any \\(B = \frac{B+B^{*}}{2} + \frac{B-B^{*}}{2}\\): Hermitian + Skew Hermitian. Also in projector.

Many applications: Eg: Covariance matrix, adjascency matrix, kernel matrix.

### Self adjointness under M
For SPD \\(A\\), M, \\(M^{-1}A\\) self adjoint under M as \\(\dprod{x, M^{-1}Ay}_{M} = y^{*}Ax = \dprod{M^{-1}Ax, y}_{M}\\).

### Eigenvalues (ew)
All eigenvalues real: \\
\\(\conj{l}x^{*}x = (lx)^{*}x = (Ax)^{*}x = x^{*}(Ax) = lx^{*}x\\), so \\(\conj{l}=l\\).

ev of Distinct ew are orthogonal: \\(x_{2}^{*}Ax_{1} = l_{1}x_{2}^{*}x_{1} = l_{2}x_{2}^{*}x_{1}, \therefore x_{2}^{*}x_{1}(l_{1}-l_{2}) = 0\\).

#### sw and norm
Unitary diagonalizability possible for A: see section on factorization of hermitian matrices. Thence, \\(|\ew(A)| = \sw(A)\\); so \\(|\ew_max(A)| = \norm{A}\\).


### Factorizations
For details, see section on factorization of hermitian matrices.

### Skewed inner prod \htext{\\(x^{*Ax\\)}{..}}
\\(x^{*}Ay = (y^{*}Ax)^{*}\\). So, \\(x^{*}Ax = \conj{x^{*}Ax}\\); so \\(x^{*}Ax\\) real.

## +ve definiteness
### Definition
If \\(\forall 0 \neq x \in C^{n}: x^{*}Ax \in R; x^{*}Ax \geq 0\\), \\(A\\) +ve semi-definite, or non-negative definitene.

If \\(x^{*}Ax > 0\\), +ve definite: \\(A \succ 0\\).

Similarly, -ve (semi-)definite defined.

#### Importance
Important because Hessians of convex quadratic functionals are +ve semidefinite. Also, it is importance because of its connections with ew(A).

### +ve semidefinite cone
The set of +ve semidefinite matrices, is a proper cone. If restricted to symmetric matrices, get \\(S_+^{n}\\).

#### Matrix inequalities
Hence, inequalities wrt the cone defined. +++(Can write \\(A \succeq 0\\) to say \\(A\\) is +ve def.)+++ This is what is usually assumed by \\(\succeq\\) when dealing with +ve semidefinite matrices - not elementwise inequalities.

##### Linear matrix inequality (LMI)
\\(A_0 + \sum x_i A_i \preceq 0\\). Note that this is equivalent to having \\(A \preceq 0\\) with \\(A_{i,j} = a_{ij}^{T}x + b_{ij}\\) form. Used in defining semidefinite programming.

#### Analogy with reals
Hermitians analogous to R, +ve semidef like \\(\set{0} \union R^{+}\\), +ve def like \\(R^{+}\\) in \\(\mathbb{C}\\).

#### Support number of a pencil
\\(s(A, B) = \argmin t: tB - \\)A\\( \succeq 0\\).

### Non hermitian examples
Need not be hermitian always. \\
Then, as \\(x^{*}Bx = x^{*}B^{*}x\\), anti symmetric part in \\(B = \frac{B+B^{*}}{2} + \frac{B-B^{*}}{2}\\) has no effect.

### Diagonal elements, blocks
\\(e_{i}^{*}Ae_{i} = a_{i,i}\\). So, \\(a_{i,i}\\) real. \\(a_{i,i} \geq 0\\) if \\(A\\) +ve semidefinite; \\(a_{i,i}> 0\\) if \\(A\\) +ve definite; but converse untrue.

Similarly, for \\(X \in C^{m\times n}\\) invertible: \\(X^{*}AX\\) has same +ve definiteness as A. Taking X composed of \\(e_{i}\\), any principle submatrix \\(A_{i,i}\\) can be writ as \\(X^{*}AX\\); so \\(A_{i,i}\\) has same positive definiteness as A.

#### Off-diagonal block signs invertible
Off-diagonal block signs are invertible without loosing +ve semidefiniteness. Pf: If \\(\mat{x^{T} & y^{T}}\mat{A & B \\ C & D}\mat{x \\ y} \geq 0 \forall \mat{x \\ y}\\), then \\(\mat{x^{T} & y^{T}}\mat{A & -B \\ -C & D}\mat{x \\ y} \geq 0 \forall \mat{x \\ y}\\).



### Eigenvalues: Real, +ve?
\\(\forall i: \ew_i \in R\\): take ev \\(x\\), must be able to compare \\(x^{T}Ax = \gl x^{*}x\\) with 0.

If \\(A \succeq 0\\), ew \\(\ew_i \geq 0\\): \\(\ew_i x^{*}x = x^{*}Ax \geq 0\\). Also, if \\(A \succ 0\\), \\(\ew_i > 0\\).

#### Determinant
\\(det(A) = \prod \gl_i \geq 0\\).

### +ve inner products
For +ve definite matrices, get +ve inner products: Take eigenvalue decompositions: \\(A = \sum_i \ew_i q_i q_i^{T}, B = \sum_i l_i p_i p_i^{T}\\).

So, the +ve definite cone is self dual.

### Invertibility
If \\(A\\) +ve def., \\(A\\) is invertible: \\(\forall x\neq 0: x^{*}Ax \neq 0\\), so \\(Ax \neq 0\\); so \\(A\\) has no nullspace. If \\(A\\) +ve semi-def, can't say this.

## Hermitian +ve definiteness
Also, see properties of not-necessarily symmetric +ve semidefinite matrices.

### From general matrices
Any \\(B^{*}B\\) or \\(BB^{*}\\) hermitian, +ve semidefinite: \\(x^{*}B^{*}Bx = \norm{Bx}\\). So, if B invertible, \\(B^{*}B\\) is +ve definite. So, if B is long and thin, \\(B^{*}B\\) is +ve definite, but if B is short and fat: so singular, \\(B^{*}B\\) is +ve semi-definite, also singular.

### Connection to ew
If \\(A = A^{*}\\), all eigenvalues \\(l>0\\), then \\(A\\) is +ve definite: \\(x^{*}Ax \in R\\), \\(x^{*}Ax = x^{*}U\EW U^{*}x = \sum \ew_{i}x_{i}^{2}\\).

Magnitudes of ew same as that of sw: as you can easily derive SVD from eigenvalue decomposition. So, singular value properties carry over.

### Connection to the diagonal
#### Diagonal dominance
If \\(A = A^{*}\\), diagonal dominance and non-negativity of \\(A_{i,i}\\) also holds, then \\(A\\) is +ve semidefinite. See diagonal dominant matrices section for proof.

#### Diagonal heaviness
The biggest element of \\(A\\) is the biggest diagonal element. For some k : \\(a_{k,k} \geq a_{i,j} \forall i,j\\). Pf: Suppose \\(a_{i,j} > a_{k,k}\\); then consider submatrix \\(B = \mat{a_{i,i} & a_{i, j}\\ a_{i, j} & a_{j,j}}\\); \\(B \succeq 0\\), but due to assumption \\(|B| \leq 0\\), hence \\(\contra\\).

### Check for +ve (semi) definiteness
Do Gaussian elimination, see if pivots \\(\geq 0\\). \\(x^{*}Ax = x^{*}LDL^{*}x\\), if pivots good, can say \\(= \norm{D^{1/2}L^{*}x} \geq 0\\).

### Block matrices: Schur complement connection
Take \\(X = \mat{A & B \\ B^{T} & C}\\), \\(S  = C - B^{T}A^{-1}B\\). Then, if \\(A \succ 0\\), \\(X \succeq 0 \equiv S \succeq 0\\). Also, \\(X \succeq 0 \equiv (A \succ 0 \land S \succ 0)\\).

#### Proof: rewrite as optimization problem
Take \\(f(u, v) = u^{T}Au + 2v^{T}B^{T}u + v^{T}Cv = \mat{u^{T} & v^{T}}X \mat{u \\ v}\\). Solve \\(\min_u f(u, v)\\). By setting \\(\gradient_u f(u, v) = 0\\), get minimizer \\(u' = -A^{-1}Bv\\), \\(f(u', v) = v^{T}Sv\\).

### +ve semidefinite cone
Denoted by \\(S_{++}^{n}\\) and \\(S_{+}^{n}\\).

#### Self duality
If \\(A, B \succeq 0\\), \\(\dprod{A, B} = \dprod{\sum_i \ew_i q_i q_i^{*}, \sum_j \ew'_i q_j q_j^{*}} \geq 0\\). So, dual of \\(S_{++}^{n}\\) is itself.

When you consider the dual of a semidefinite program, this is important.

## Speciality of the diagonal
### Diagonally dominant matrix
\\(|A_{i,j}| \geq \sum_{j \neq i} A_{i,j}\\).

#### Hermitian-ness and +ve semidefiniteness
A hermitian diagonally dominant matrix with non-negative diagonal elements is +ve semi-definite. Pf: Take \\(x^{T}Ax = \sum_{i,j} A_{i,j}x_i x_j \geq \sum |A_{i,j}|(x_i - x_j)^{2}\\). The decomposition reminds one of properties of the graph laplacian. Alternate pf: take ev u, taking \\(Au = \ew u\\), show \\(\ew \geq 0\\).

If symmetry condition is dropped, +ve semidefiniteness need not hold.


## Other Matrices of note
### Interesting matrix types
Block matrix; Block tridiagonal matrix.

### Triangular matrix
Inverse of L, L' is easy to find: \\(L'_{i,i} = L_{i,i}^{-1}; L'_{i, j} = -L_{i,j}^{-1}\\).

ew are on diagonal.

### Polynomial matrix
\\(P = \sum A(n)x^{n}\\): Also a matrix of polynomials.

### Normal matrix
\\(A^{*}A= AA^{*}\\). By spectral thm, \\(A = Q \EW Q^{*}\\). Exactly the class of orthogonally diagonalizable matrix.

Let \\(a = (a_{i,i}), \ew = (ew_{i})\\): By direct computation, \\(a = S\ew\\), where \\(S = [|q_{ij}|^{2}] = Q.\bar{Q}\\) is stochastic.

### Rank 1 perturbation of I
\\(A=I+uv^{*}\\). Easily invertible: \\(A^{-1} = I + auv^{*}\\) for some scalar a.

### k partial isometry
\\(A = U \SW V^{*}\\) with \\(\SW = \mat{I_{k} & 0 \\ 0 & 0}\\).

## Positive matrix A
### Get Doubly stochastic matrix
This is important in some applications: like making a composite matrix from the social and affiliation networks.

If \\(A = A'\\), This can be done by first dividing by the largest entry, and then adding appropriate entries to the diagonal.

Can do Sinkhorn balancing: iteratively a] do row normalization, b] column normalization.

## Stochastic matrices
### Definition
If \\(A\\) is stochastic, A1 = 1, \\(A\geq 0\\).

### Eigenspectrum and norm: Square A
#### 1 is an ev
If \\(A\\) is stochastic, A1 = 1. So, 1 is an ew, and 1 is the correspondingn ev.

By Gerschgorin thm, \\(\ew(A) \in [-1, 1]\\), so, \\(\ew_max = 1\\).

If \\(A\\) is also real and symmetric, can get SVD from eigenvalue decomposition, and \\(\sw_max = \norm{A}_2 = 1\\).

### Product of stochastic matrices
So, if \\(A\\), B stochastic, AB1 = 1, \\(1^{*}AB = 1^{*}\\): AB also stochastic.

### Doubly Stochastic matrix S
S is bistochastic if \\(S \geq 0, S1 = 1, 1^{*}S = 1^{*}\\).

(Birkhoff): \\(\set{S}\\) = set of finite convex combos of permutation matrices \\(P_{i}\\). Pf of \\(\to\\): If convex combo of \\(\set{P_{i}}\\), S stochastic. Every \\(P_{i}\\) is extreme point of \\(\set{S}\\). Every non permutation stochastic matrix \\(A\\) is convex combo of stochastic matrices X = \\(A\\) + aB and Y = \\(A\\) - aB; where B and a are found thus: pick nz \\(a_{ij}\\) in row with \\(\geq 2\\) nz entries, then pick nz \\(a_{kj}\\), then pick nz \\(a_{k,l}\\) etc.. till you hit \\(a_{i',j'}\\) seen before; take this sequence T, set \\(a = \min T\\); make \\(\pm 1, 0\\) matrix B by setting entries corresponding to alternate elements in T 1 or -1. \\(\set{S}\\) is compact and convex set with \\(\set{P_{i}}\\) as extreme points.

### Doubly Substochastic matrix Q
\\(equiv\\) \\(Q1 \leq 1, 1^{*}Q \leq 1\\).

For permutation matrix P, PQ or QP also substochastic.

Q is dbl substochastic iff B has dbl stochastic dilation S: make deficiency vectors \\(d_{r}, d_{c}\\); get difference matrix \\(D_{r}  = diag(d_{r}), D_{c}  = diag(d_{c})\\); get \\(S = \mat{Q & D_{r}\\ D_{c}^{T} & Q^{T}}\\).

\\(\set{Q}\\) equivalent to set of convex combos of partial permutation matrices: Dilate Q to S, get finite convex combo of \\(P_{i}\\), take the convex combo of principle submatrices.

\\(Q \in C^{nn}\\) is dbl substochastic iff \\(\exists\\) dbl stochastic \\(S\in C^{nn}\\) with \\(A \geq B\\): Take any Q, get finite convex combo of partial permutation matrices; alter each to get permutation matrix; their convex combo is S.

## Large matrices
Often an approximation to \\(\infty\\) size matrices; so have structure or regularity.

### Sparsity
Not density. Very few non zero entries per row: \\(\nu\\). Can find Ax in \\(O(\nu m)\\), not \\(O(m^{2})\\) flops. Can find AB in \\(O(mn \nu)\\).

### Iterative algorithms
See numerical analysis ref.
