+++
title = "Dense algebra"
+++

## Decompositional approach
Easy to analyze stability. Can reuse decomposition to solve multiple instances of the problem: eg consider A = LU.

## Condition number of a matrix
### Condition number of Ax when x perturbed
\\(k = \sup_{\change x} \frac{\norm{A\change x}}{\norm{\change x}}\frac{\norm{x}}{\norm{Ax}} = \norm{A}\frac{\norm{x}}{\norm{Ax}} \leq \norm{A}\norm{A^{-1}}\\) or \\(\leq \norm{A}\norm{A^{+}}\\) if A not square.

So, condition of \\(A^{-1}b\\) when b perturbed, \\(k = \norm{A^{-1}}\frac{\norm{Ax}}{\norm{x}} \leq \norm{A}\norm{A^{-1}}\\).

### Condition number of matrix wrt norm
\\(k(A) = \norm{A}\norm{A^{-1}}\\).

2 norm condition number: \\(\frac{\sw_{1}}{\sw_{n}}\\). So, here, \\(k(A) = k(A^{T})\\).

Ill conditioned matreces. Loose \\(\log k(A)\\) digits of accuracy: change 1 bit in \\(\frac{\norm{\change x}}{\norm{x}}\\), change in \\(\frac{\norm{A\change x}}{\norm{Ax}}\\) is worth \\(\log k(A)\\) bits.

### Condition of \htext{\\(x=A^{-1b\\)}{inverse problem} when A perturbed}
\\((A+\change A)(x+\change x) = b\\). So, ignoring \\(\change A \change x\\), \\(\change x = -A^{-1}(\change A)x\\). By Cauchy Schwartz, \\(\norm{\change x} = \norm{A^{-1}}\norm{(\change A)}\norm{x}\\). So, \\(k = sup_{\change A}\frac{\norm{\change x }\norm{A}}{\norm{\change A}\norm{x}} \leq \norm{A}\norm{A^{-1}}\\).



## Solving Ax=b for x
### Assumption
\\(b \in range(A)\\).

### Stability and expense
Using SVD is most reliable, but expensive. LU is cheapest, QR is more expensive, but more reliable. Usually, look at condition number k(A) and decide method.

### Triangularization by row elimination
#### Using PA=LU
Make augmented matrix \\(X = \mat{ A & b}\\) corresponding to problem Ax = b; Use row operations to reduce X to \\(\mat{ U & L^{-1}b}\\): thence get the problem \\(U x = L^{-1}b\\); do back substitution: to get : \\(\mat{ I & UL^{-1}b}\\) corresponding to problem \\(Ix = UL^{-1}b\\). Thus got \\(x_r \in range(A^{T})\\).

Then, to get set of all solutions: \\(\set{x_r + x_n: x_n \in N(A)}\\).

#### Cost
If you have L,U: Solve LUx = b by solving Ly = b: forward substitution: \\(O(m^{2} flops)\\); then solving Ux=y :back substitution: \\(O(m^{2} flops)\\).

#### Stability
Back substitution is stable.

### With A=QR
#### Using Householder reflections
Get A=QR; get \\(y = Q^{*}b\\); get \\(x = R^{-1}y\\). For stability, householder reflections used to get A=QR.

Note: \\(y = Q^{*}b\\) implicitly found as part of using householder reflections to get \\(R = Q^{*}A\\) by instead doing \\(\mat{R & y} = Q^{*}\mat{A & b}\\).

#### Backward stability
For \\(\frac{\norm{\Del A}}{\norm{A}} = O(\eps)\\), \\((A+ \Del A)\hat{x} = b\\): use \\(A + \del A= \tilde{Q}\tilde{R}\\) from backward stability of Householder; \\((\tilde{Q}+\del Q)y = b\\); \\((\tilde{R} + \del R)\hat{x} = y\\); set \\(\Del A = \del A + \del Q\tilde{R} + \tilde{Q}\del R\\).

So accuracy: \\(\frac{\norm{\del x}}{\norm{x}}=k(A)\eps\\).

### Use SVD
Take \\(Ax = U\SW V^{*} x = b\\), each of these is easy to invert. Costly, but very accurate: \\(\SW\\) reveals numerical rank, in case of very small \\(sw_{i}\\), drop the corresponding \\(u_{i}\\) or \\(v_{i}\\) and get a well conditioned problem.

### Use determinants (Impractical)
(Cramer) Let C be cofactor matrix : \\(C_{i,j}\\) multiple of \\(A_{i,j}\\) in \\(|A|\\) formula; \\(C^{T}Ax = C^{T}b\\); so \\(x = \frac{C^{T}b}{det(A)}\\); so for \\(x_{j}\\), find jth row of \\(C^{T}\\) (= cofactors of jth col of A) times b = det (A where b replaces jth col).

### Find the inverse
Find \\(A^{-1}b\\): A change of basis operation, saying b in terms of C(A) rather than \\(e_{i}\\)'s.

### For Hermitian +ve semidefinite \htext{\\(X=A^{*A\\)}{..}}
#### Use LU/ Cholesky
Use \\(X = R^{*}R\\). Time needed to solve two triangular systems: \\(O(m^{2})\\); time needed to make R: \\(O(m^{3}/3)\\).

##### Stability
Diagonal heavy if \\(X \succ 0\\): so no pivoting required. \why Cholesky alg to make R backward stable. So, \\((A+\del A) \tilde{x} = b\\) for relatively small \\(\del A\\).

#### Avoiding \htext{\\(X=A^{*A\\)}{..} if A known}
In doing \\(A^{*}A\\), you square the condition number. So, if A is ill conditioned, you get an even more ill conditioned problem.

So, don't do this. Instead, replace A with LU or QR or \\(U\SW V^{*}\\) and solve.

#### Use A=QR, if A known
Get \\(A=\hat{Q}\hat{R}\\) (\\(2mn^{2} - \frac{2}{3}n^{3}\\) flops), solve \\(Rx=\hat{Q}^{*}b\\). More numerically stable than Cholesky \why.

Get \\(A=\hat{Q}\hat{R}\\), so \\(A^{*}A = \hat{R}^{*}\hat{R}\\) (Cholesky: LU for \\(A^{*}A\\)); get \\(\hat{R}^{*}\hat{R}x = A^{*}b\\). Implementation: solve \\(\hat{R}^{*}w=A^{*}b\\), then \\(Rx=w\\). Finding \\(A^{*}A\\) + Cholesky = \\(mn^{2} + \frac{n^{3}}{3}\\) flops.

#### Diagonalize and solve
Find thin SVD (\\(2mn^{2} + 11n^{3}\\) flops): \\(A=\hat{U}\hat{\SW}V^{*}\\): \\(P=A(A^{*}A)^{-1} A^{*} = \hat{U}\hat{U}^{*}\\); so \\(\hat{U}\hat{\SW}x = \hat{U}\hat{U}^{*}b\\), \\(\hat{\SW}V^{*}x = \hat{U}^{*}b\\); very dependable.

## Iteratively solve Ax=b
### Get x one component at a time
Take A = D + L + U, with D diagonal, L/ U strictly lower/ upper triangular.

#### Using updated components immediately
Aka Gauss Siedel.

Take \\(x^{(k)}\\), get \\(x^{(k+1)}\\) by this:\\
 find \\(x^{(k+1)}_{j}\\) using \\(A, b, x^{(k+1)}_{1:j-1}, x^{(k)}_{j+1:n}\\). So, \\(Dx^{k+1} = b - Lx^{k+1} - Ux^{k}\\); \\((D+L)x^{k+1} = b - Ux^{k}\\).
 
Not guaranteed to converge.

#### Use only old guesses of x
Aka Jacobi iteration.

Take \\(x^{(k)}\\), get \\(x^{(k+1)}\\) by doing this: find \\(x^{(k+1)}_{j}\\) using \\(A, b, x^{(k)}_{i\neq j}\\) : so using old iterates of x uniformally rather than some old and some new iterates in finding \\(x^{(k+1)}_{j}\\). So, \\(Dx^{k+1} = b - Lx^{k} - Ux^{k}\\).

Guaranteed to converge.

### Using \htext{\\((I-A)^{-1\\)}{Neumann} series for square A}
(Neumann) See linear algebra ref. Can be used in solving \\(A'x = b\\) where \\(A' = (I-A)\\).

## Overdetermined system of equations: Least squares solution
### Problem
Solve \\(\min_x \norm{Ax-b}\\), given \\(m>n\\), b not in C(A). Error vector \\(e=A\hat{x}-b\\). We want to \\(\min_x \norm{e}^{2}\\).

For versions with regularizers, weights etc.. see optimization ref.

#### Importance
Solving this for the case where 2 norm is used in the problem specification \\(\equiv\\) orthogonal projection.

Useful also in linear regression; in that context also the maximum likelihood solution for data generated by a linear fn in the presense of Gaussian noise: see statistics, optimization ref.

### Solution
#### Projection + inverse operation
Two steps: First, project \\(b\\) to \\(range(A)\\); that is, find \\\\(b' = \argmin_{v \in ran(A)} \norm{b-v}\\). Then, solve \\(Ax = b'\\).

When error magnitude is measured wrt some other norms, other, perhaps oblique projections may be needed.

### Solution form: 2-norm minimization
\\(\norm{Ax-b}^{2} = (Ax-b)^{*}(Ax-b)\\), set \\(\gradient f(x) = 0\\) to find minimum. This is equivalent to solving \\
\\(A^{*}(b-A\hat{x})=0\\) or \\(A^{*}A\hat{x}=A^{*}b\\) (Normal equations).

#### As orthogonal projection + inverse
Note that the condition \\(A^{*}(b-A\hat{x}) = 0\\) matches the condition from geometric intuition that the error vector \\(e \perp ran(A)\\).

#### Solution algorithm
The projection and inversion can either be done together or separately. In the former case, projection can be accomplished by finding an orthogonal basis for \\(ran(A)\\) using either QR or SVD.

##### Non-singular A
\\((A^{*}A)^{-1}\\) invertible. \\(\hat{x}=(A^{*}A)^{-1}A^{*}b, p = A\hat{x}\\).

\\(P=A(A^{*}A)^{-1} A^{*}\\). \\((A^{*}A)^{-1}=A^{-1}(A^{*})^{-1}\\) iff A is square and both exist.

###### Pseudoinverse for non-singular A
See linear algebra ref.

##### Rank deficient A
\\((A^{*}A)^{-1}\\) not invertible, rank deficient. \pf \\(N(A^{*}A) = N(A)\\): \\(A^{*}Ax = 0 \implies x^{*}A^{*}Ax = \norm{Ax} = 0\\). I-P projects to \\(N(A^{T}\\)) (not N(A)): \\((I-P)b=e\\).

###### Solution
\\(A^{*}A\hat{x}=A^{*}b\\) has many solutions for \\(x\\). This is equivalent to the solution obtained by projecting \\(b\\) to \\(ran(A)\\) to get \\(b'\\) and then solving  \\(Ax = b'\\).

## Triangularization by row elimination
Aka Gaussian elimination. Get PA=LDU where L is unit lower triangular, D is diagonal, U is unit upper triangular. This is unique: see linear algebra ref.

### Algorithm
In step i, subtract multiples of row \\(A_{i,:}\\) from rows \\(A_{i+1:m,:}\\) so as to make \\(A_{i+1:m, i}\\) subcolumn 0. These row operations correspond to doing \\(L^{-1}A = U\\) to get U from A.

#### Pivoting
But, maybe \\(A_{i,i} = 0\\). In this case, we need to bring row k with \\(A{k,i} \neq0\\) in place of row i for the algorithm to proceed.

Pivoting is also needed for stability of the algorithm.

#### Cost
Find L, U (\\(\frac{2m^{3}}{3}\\) flops).

#### Various Formulations
Reordering the loops: ijk version puts 0's column-wise. ikj version puts 0's row-wise, has good storage properties \why.

##### Reducing memory usage
Overwrite A with L and U.

##### Outer product formulation
\\(A_{2:m,2:m}-\frac{A_{2:m,1}A_{1,2:m}^{*}}{a_{1,1}}\\).

##### Reducing memory access
Let \\(l_{k} = 0+A_{k+1:m,k}\\) after k-1 steps of triangularization; then k+1th step of traing is to make \\(L^{-1}_{k} = I-l_{k}e_{k}^{*}; A=L^{-1}_{k}A\\). Reducing A to U is to reduce it to \\(\mat{U_{1,1} & U_{1,2}\\ 0 & U_{2,2}}\\); can do this repeatedly. So make yer alg use this decomposition, and block \\(\times\\) as basic ops, to avoid having to get each col to cache.

### Instablity when no pivoting
\\(A=\mat{10^{-20} & 1\\ 1 & 1}\\) yields \\(\tilde{L}=\mat{1 & 0\\ 10^{20} & 1}\\) and \\(\tilde{U}=\mat{10^{-20} & 1\\ 0 & -10^{20}}\\) with \\(A-\tilde{L}\tilde{U}\\) big: so stable, but not backward stable (considering functions of m or A in error bound).

Instability when, resulting from pivot very small wrt other elements in A, element t in \\(\tilde{L}\\) or \\(\tilde{U}\\) huge: relative error \\(O(\eps)\\) but abs error \\(O(\eps t)\\).

\\(|\Del A| \leq 3n\eps|L||U|\\). \why \\(\tilde{L}\tilde{U} = A + \Del A =LU + \Del A, \frac{\norm{\Del A}}{\norm{L}\norm{U}} = O(\eps)\\).

### Partial pivoting (GEPP)
At step k, pivot selected as biggest element in \\(A_{k:m,k}\\). Take \\(\prod L_{i}P_{i}A = U\\) where \\(L_{i}\\) are atomic unit lower triangular, use \\(PLP^{*} = L'\\) (row exchange in L = col exchange in L'), get PA = LU.

#### Stability of GEPP
\\(L_{i,j} \leq 1; \norm{L} =O(1)\\); let Growth Factor \\(\rho = \frac{\max |U_{i,j}|}{\max |A_{i,j}|}\\); \\(\norm{U} = O(\rho \norm{A})\\); so \\(\tilde{L}\tilde{U} = \tilde{P}A + \Del A, \frac{\norm{\Del A}}{\norm{A}} = O(\rho \eps)\\).

Maximal instability: \\(\rho = 2^{m-1}\\): Eg: \\(A=\mat{1 & 1\\ -1 & 1}\\); m-1 digits of accuracy lost. Unstability occurs very rarely; usually \\(\rho \leq m^{-0.5}\\). Used in Matlab \\ op.

### Complete pivoting
At step k, pivot selected as biggest element in \\
\\(A_{k:m,k:m}\\). \\(O(m^{3}) = \sum i^{2}\\) flops: expensive. \\(PAP' = LU\\). Stable.

### Avoidance of pivoting
If X is +ve definite, no pivoting required: As all principle submatrices are +ve definite - so non-singular, X = LU exists.

Also, if X is diagonally dominant, diagonal dominance is preserved during triangularization. So, it does not require pivoting.

### Formula for pivots
Let \\(A_{k}\\) be submatrix of first k*k elements; then from block multiplication, \\(P_{k}A_{k} = L_{k}D_{k}U_{k}\\) holds; so pivots can also be found by \\(\frac{|D_{k}|}{|D_{k-1}|} = \frac{|A_{k}|}{|A_{k-1}|}\\).

### Symmetric Elimination Algorithm for spd A
Do Gaussian elimination + extra column ops to diagonalize/ maintain symmetry at each step.

$A = 
\mat{a_{1,1} & A_{2,1}^{*}\\
A_{2,1} & A_{2,2}}
= \mat{1 & 0\\
\frac{A_{2,1}}{a_{1,1}} & I}
\mat{a_{1,1} & 0\\
0 & A_{2,2}-\frac{A_{2,1}A_{2,1}^{*}}{a_{1,1}}}
\mat{1 & \frac{A_{2,1}}{a_{1,1}}\\
0 & I}
=LDL^{*}
\\(. Get \\)R^{*}R\\( by doing \\)LD^{1/2}$ at each step.


#### Code and Opcount
R=A; Repeat: do symmetric elimination on submatrix \\(R_{i+1,i+1}\\); do \\(R_{i}^{*}/\sqrt{r_{i,i}}\\). Only Upper part of R stored.

Opcount: \\(\sum_{k=1}^{m} \sum_{j=k+1}^{m} 2(m-j) \approx \frac{m^{3}}{3}\\) flops.

#### Stability
By SVD: \\(\norm{R}_{2} = \norm{R^{*}}_{2} = \norm{A}_{2}^{1/2}\\); \\(so \norm{R} \leq \sqrt{m}\norm{A}\\) \chk. So, R never grows large. So, backward stable : get \\(\hat{R}*\hat{R}\\) for perturbed A. Forward error in R large; but R and \\(R^{*}\\) diabolically correlated.

## A=QR
### Triangular orthonormalization
Take the m*n matrix A; arrive at the matrix \\(Q_n = A\hat{R}\\). At step j, you have \\(Q_{:,1:j-1} = Q_{j-1}\\) find the direction of \\(q_j\\) by removing the component of \\(a_j\\) in the subspace spanned by \\(Q_{j-1}\\).

Thence, you arrive at reduced QR: \\(A=Q_n\hat{R}\\), where \\(Q_n\\) is a m*n matrix. Can extend Q thence to be a square matrix: this is full QR.

So, QR \\(\exists \forall A\\). If sign(\\(R_{i,i}\\)) is fixed to be +ve, QR unique. 

#### Gram-Schmidt classical
At step j: Take \\(a_j-\hat{Q}_{j-1}\hat{Q^{*}}_{j-1}a_j\\) and normalize it to get \\(q_j\\), with \\(\hat{Q}_{j-1} = [q_1 .. q_j]\\).

\\(2mn^{2}\\) flops.

##### Instability
Even by the time it calculates \\(q_{20}\\), error becomes unbearable.

##### Double gram-schmidt
Get A = QR, then do Q = Q'R' to re-orthogonalize Q. A surer way of getting orthogonal basis for range(A).

#### Gram-Schmidt Modified (MGS)
At step j: Remove the component of \\(a_j\\) first in the subspace \\(\linspan{q_1}\\), then remove the component of the residue from \\(\linspan{q_2}\\) and so on. Algebraically same as classical version: \\(Q_{j-1} = \sum_1^{j-1}q_iq_i^{*}\\). Computational cost same as classical version.

##### Round off error
very small angle twixt \\(q_{1}, a_{2}\\); so \\(q'_{2}=a_{2}-q_{1}q_{1}*a_{2}\\) very small, with smaller error (maybe \\(10^{-15}\\) in \\(q'_{2,j}\\) wrt \\(q'_{2,k}\\)); err amplified maybe \\(10^{10}\\) times when \\(q_{2}\\) made after normalization. MGS has lesser roundoff error: \why.

### Orthogonal triangularization
(Householder) Do \\(Q^{*}A = \hat{R}\\), not \\(A\hat{R}^{-1} = \hat{Q}\\). Init: R=A; \\(Q^{*} = Q_{n} .. Q_{1}\\); \\(Q_{k} = \mat{I_{k-1} & 0 \\ 0 & F}\\) leaves \\(r_{1} .. r_{k-1}\\) and \\(r_{1}^{*} .. r_{k-1}^{*}\\) alone, Householder reflector F reflects x (last m-k+1 entries in \\(r_{k}\\)) to \\(\norm{x}e_{1}\\); last entries in \\(r_{k+1} .. r_{n}\\) elsewhere. F reflects accross plane \\(\perp v = x - \norm{x}e_{1}\\) or \\(\perp v' = -x - \norm{x}e_{1}\\); so by geometry, \\(\frac{vv^{*}}{\norm{v}}x\\) is projection on v; \\(\norm{x}e_{1} = Fx = (I - 2\frac{vv^{*}}{\norm{v}})x\\).

To avoid catastrophic cancellation when \\(x - \norm{x}e_{1}\\) very small, choose \\(v = -sign(x_{1})x - \norm{x}e_{1}\\). \\(F^{*} = F, so Q_{k}^{*}=Q\\). Needs: \\(2mn^{2} - \frac{2}{3}n^{3}\\) flops.

#### Stability of finding Q, R
Calculated \\(\hat{Q}\\) and \\(\hat{R}\\) can have large forward errors; but they're diabolically correlated; backward error or residual \\(A -\hat{Q}\hat{R}\\) very small. \\(A + \Del A = \hat{Q}\hat{R}\\) for \\(\frac{\norm{\Del A}}{\norm{A}} = O(\eps)\\). So, backward error analysis best way to proceed.



## Find eigenvalues
### Hardness
Can't get directly for \\(m\geq 5\\): thm from Galois theory that roots can't be expressed as radicals etc.. So, iterative part necessary in alg. 2 phases: Preliminary reduction to structured form; then iterative part.

#### Usual approach
Easily reduce to almost-triangular form using similarity transformations. Then, use more similarity transformations to iteratively get close to triangular form.

#### Finding a single ew
(Dhillon) If you have an idea about the approximate size of the ew, you can find it in \\(O(n^{2})\\). Else, if ye need kth ew, it takes \\(O(kn^{2})\\) time.

For sparse A, it is much cheaper. \tbc

### Use characteristic polynomial
Find roots using rootfinder. So, every ew has one non 0 ev. Ill conditioned. Eg: If coefficients in \\(x^{2}+2x-1\\) change by \\(\eps\\), x changes by \\(O(\sqrt{\eps})\\).

### Reduction to Upper Hessenberg matrix H
0's below first sub diagonal. If \\(A=A^{*}\\), get Tridiagonal matrix. Use Householder reflections: \\
\\(H = (\prod_{i} Q_{m-1-i}^{*})A (\prod^{m-2}_{i=1} Q_{i})\\).

These are similarity transformations, so \\(\ew(H) = \ew(A)\\).

For large sparse matreces: Use Arnoldi iteration.

#### Op count
Row ops, at 4 flops per num: \\(\frac{4 m^{3}}{3}\\); Col ops, at 4 flops per num: \\(2 m^{3}\\); total: \\(\frac{10 m^{3}}{3}\\). Reduced work if \\(A=A^{*}\\): \\(\frac{4 m^{3}}{3}\\).

#### Stability
\\(\tilde{Q}\tilde{H}\tilde{Q}^{*} = A + \del A\\) for relatively small \\(\del A\\).

### Approach Eigenvalue revealing factorizations
$A = QUQ^{*}; \\
U = ..Q_{2}^{*}Q_{1}^{*}AQ_{1}Q_{2}..\\(. If \\)A=A^{*}$, this leads to unitary diagonalization.

### Power iteration for real symmetric A
The series \\(v^{(i)} = \frac{A^{i}x}{\norm{A^{i}x}}\\) and \\(l^{(i)} = r(v^{(i)})\\) converge to eigenpair corresponding to largest ew \\(\ew_{1}, q_{1}\\): as \\(x = \sum a_{i}q_{i}\\).

So, Applying A repeatedly takes x to dominant ev.

#### Convergence
Linear convergence of ev. $\norm{v^{(i)} - \pm q_{1}} = O(|\frac{\ew_{2}}{\ew_{1}}|^{i}),\\
 \norm{\ew^{(i)} - \pm \ew_{1}} = \norm{v^{(i)} - \pm q_{1}}^{2}$.

### Inverse iteration
ev of A and \\((A-pI)^{-1}\\) same, ew \\(\ew_{i}\\) shifted and inverted to get ew \\((\ew_{i} - p)^{-1}\\). If p near \\(\ew_{j}\\), using power iteration on \\((A-pI)^{-1}\\) gives fast convergence.

Good for finding ev if ew already known.

#### Convergence
Linear convergence of ev. \\
\\(\norm{v^{(i)} - \pm q_{j}} = O(|\frac{p-\ew_{j}}{p-\ew_{k}}|^{i}),\ \norm{\ew^{(i)} - \pm \ew_{1}} = \norm{v^{(i)} - \pm q_{j}}^{2}\\).

#### Alg
Solve \\((A-pI)w = v^{(k-1)}\\); normalize to get \\(v^{(k)}\\).

### Rayleigh quotient iteration
Inverse iteration, where \\(\ew^{(i)} = R(v^{(i)})\\) used as p (ew estimate).

#### Convergence
Cubic convergence of ev and ew. If \\(\norm{v^{(k)} - q_{j}} \leq eps\\) when \\(|\ew^{(k)} - \ew_{j}| \leq O(\eps^{2})\\). So \\(\norm{v^{(k+1)} - q_{j}} = O(|\ew^{(k)} - \ew_{j}|\norm{v^{(k)} - q_{j}}) =\\ O(\norm{v^{(k)} - (\pm q_{j})}^{3})\\). \\(|\ew^{(k+1)} - (\ew_{j})| = O(\norm{v^{(k+1)} - q_{j}}^{2}) = O(|\ew^{(k)} - (\pm q_{j})|^{3})\\).

Gain 3 digits of accuracy in each iteration.

### Simultaneous iteration for real symmetric A
Aka Block power itern. \\(\tuple{v_{i}}\\) linearly independent; their matrix \\(V^{(0)}\\). \\(\tuple{q_{i}}\\) orth ev of A; cols of \\(\tilde{Q}\\).

Unstable. \why

#### Convergence
If \\(|\ew_{1}| > .. > |\ew_{n}| \geq |\ew_{n+1}|..\\), Orth basis of \\(\linspan{A^{k}v_{1}^{(0)}, .. A^{k}v_{n}^{(0)}}\\) converges to \\(\linspan{q_{1}, .. q_{n}}\\): take \\(v_{i} = \sum_{j}a_{j}q_{j}\\), do power iteration.

#### Alg
Take some \\(Q^{0} = I\\) or other orth cols, get \\(Z = AQ^{(k-1)}\\); get \\(Q^{(k)}R^{(k)} = Z\\). Defn: \\(A^{(k)} = (Q^{(k)})^{T}AQ^{(k)}\\), \\(R'^{(k)} = \prod R^{(k)}\\).

\\(A^{k} = Q^{(k)}R'^{(k)}\\): By induction: \\(A^{k} = AQ^{(k-1)}R'^{(k-1)} = Q^{(k)}R'^{(k)}\\).

### QR iteration
Not QR factorization. Get \\(Q^{(k)}R^{(k)} = A^{(k-1)}\\);\\
 \\(A^{(k)}=R^{(k)}Q^{(k)} = (Q^{(k)})^{T}A^{(k-1)}Q^{(k)}\\): Similarity transformation. Works for all A with distinct \\(|\ew_{i}|\\); easy analysis for \\(A=A^{T}\\).

Defn: \\(R'^{(k)} = \prod R^{(k)}\\), \\(Q'^{(k)} = \prod_{k} Q^{(k)}\\): same as \\(Q^{(k)}\\) in Simult itern alg.

\exclaim{Stable - finding \\(\ew\\) now routine!}

#### Convergence for real symmetric A
Same as Simultaneous iteration starting with I. \\
\\(A^{k} = Q^{(k)}R'^{(k)}\\): So, finds orth bases for \\(A^{k}\\).

\\(A^{(k)} = (Q'^{(k)})^{T}AQ'^{(k)}\\); \\(A^{(k)}_{i,i}\\) are \\(R(Q'^{(k)}_{i})\\); as \\(Q'^{(k)}_{i}\\) converges, \\(A^{(k)}_{i,i} \to \ew_{i}\\), off diagonal entries tend to 0; so approaches Schur factorization.

Linear convergence rate: \\(max_{j}\frac{\ew_{j+1}}{\ew_{j}}\\).

### Modified QR alg
Tridiagonalize: \\((Q^{(0)})^{T}A^{(0)}Q^{(0)} = A\\). Pick shift \\(p^{(k)}\\); get \\(Q^{(k)}R^{(k)}=A^{(k-1)} - p^{(k)}I\\); get \\(A^{(k)} = R^{(k)}Q^{(k)} + p^{(k)}I\\); if any off diagonal element is close to 0, take \\(\mat{A_{1} & 0 \\ 0 & A_{2} }\\), deflate and apply QR.

Needs O(m) iterations costing \\(O(m^{2})\\) iterations each. \why

### Stability
Aka Eigenvalue perturbation theory.

\part{Sparse, large matrix algebra}
## Iterative Linear algebra methods
Unlike direct methods. To solve Ax=b and Ax=lx. Eg: Conjugate gradient, Lanczos, Arnoldi.

### Exploiting sparsity: Use only Ax
Use black box access to methods which find Ax and \\(A^{*}x\\); minimize these calls. Thus, take advantage of sparsity.

#### Flops
Dense computations: O(m) steps, \\(O(m^{2})\\) ops per step, total flops \\(O(m^{3})\\): Also worst case for Iterative methods. But generally O(m) or \\(O(m^{2})\\).

#### Accuracy
Converge geometrically to \\(\eps_{mach}\\); direct methods make no progress until all \\(O(m^{3})\\) are completed.

### Krylov sequences and subspaces of A and b
\\(b, Ab, A^{2}b ..\\). Krylov subspaces \\(K_{r}(A, b)\\) are spanned by successively larger groups of these. Can also form Krylov matrix. Orthogonalization (perhaps Gram Schmidt style) used between iterations in order to avoid erroneous linear dependence.

Convergence rate depends on spectral properties of A.

Analysis closely related to approximation of f(x) by polynomials of on subsets of the complex plane. \why

### Projection of A to Krylov subspaces
Reduces the problem to problems in \\(1, 2 ..\\) dimensions. Look at the action of A in \\(Ax=b\\) or \\(Ax = lx\\), restricted to Krylov subspace. Approximation gets closer as number of iterations \\(n \to m\\).

### Iteratively find ortho-basis of K(A, b)
#### Triangular orthogonalization
(Arnoldi).
Direct method used Orthogonal triangularization (Householder); Now use Triangular Orthogonalization (Gram Schmidt) : Can be stopped in middle for partial solution \\(Q_n\\). Also, use a trick: Take current orthogonal basis Q, set next column \\(q_{i+1}\\) = the normalized component of \\(Aq_i \perp (q_1 .. q_i)\\). Thus, \\(q_{i+1} \perp [q_0\ Aq_0\ ..\ A^{i - 1}q_0]\\) also.

#### Description using H
Start with arbit b; normalize to get \\(q_{1}\\); for any n, for \\(j \leq n\\) get: \\(h_{j,n} = \dprod{q_{j},Aq_{n}}\\); get: \\(h_{n+1,n} = \norm{v} = \norm{Aq_{n} - \sum_{j=1}^{n}h_{j,n}q_{j}}\\): Do the subtraction mgs style when each \\(h_{j,n}\\) is found; find \\(q_{n+1} = \frac{v}{h_{n+1,n}}\\). \\(Aq_{n} = Q_{n+1}h_{n} = \sum_{i=1}^{n+1} q_{i}h_{i, n}\\).

So, you have almost upper triangular/ upper hessenberg \\((n+1)\times n: \hat{H}_n\\). Get \\(AQ_{n} = Q_{n+1}\hat{H}_{n}\\).

#### Square H
Take \\(\hat{H}\\) cut to \\(n\times n: H_{n}\\), the Ritz matrix; get \\(H_{n} = Q_{n}^{*}AQ_{n}\\);  Also: \\(H_{n} = Q_{n}^{*}Q_{n+1}\hat{H}_{n}\\).

\exclaim{As if going towards Similarity transformation of A to \htext{\\(H = QAQ^{*}\\)}{..}!} Maybe \\(m \to \infty\\): So maybe only solving for first \\(n<m\\) cols of Q in \\(Q^{*}AQ=H\\).

##### \htext{\\(H_{n\\)}{..} as Projection of A to Krylov subspaces}
Representation in basis \\(\set{q_{1} .. q_{n}}\\) of the orthogonal projection of operator A onto \\(K_{n}\\): The shadow of operation of A in \\(K_{n}\\). Consider operator \\(K_{n} \to K_{n}\\): Take \\(v = Q_{n}x \in K_{n}\\): so x in basis \\(Q_n\\); apply A: \\(A Q_n x\\); project Av back to \\(K_{n}\\): \\(Q_n^{*} A Q_n x = H_n x\\).

Can't get operator A back from \\(H_{n}\\).

#### Hermitian case: tridiagonal form
(Lanczos): Arnoldi iteration for \\(A = A^{*}\\). \\(H_{n}\\) becomes tridiagonal \\(T_{n}\\) with \\(\set{a_{i}}\\) in diagonal and \\(\set{b_{i}}\\) in 1st super and sub diagonals. 3 term recurrance: \\(Aq_{n} = b_{n-1}q_{n-1} + a_{n}q_{n}+ b_{n}q_{n+1}\\).

#### Reduction of arbit A to tridiagonal form
If A symmetric, \\(A = QTQ^{*}\\) for tridiagonal T; if A assymetric gotto give up orthogonality or tridiagnoalness: so find \\(A = VTV^{-1} = VTW^{T}\\) for tridiagonal but non symmetric T with diagonals \\(\set{d_{2}, ..}, \set{a_{1}, ..}, \set{b_{2}, ..}\\). Solve AV = VT and \\(W^{T}A = TW^{T}\\): 3 term recurrances.

## Eigenvalue estimation
Aka Rayleigh Ritz procedure. \\((H_{n})_{i,j} = q_{i}^{*}Aq_{j}\\). As \\(Aq_{j} \in K_{j+1}\\), for \\(i>j+1\\), \\((H_{n})_{i,j} = 0\\). \\((H_{n})_{j,j} = r(q_{j}) = q_{j}^{*}Aq_{j}\\).

ew of \\(H_{n}\\) called Arnoldi ew estimates of A, Ritz values wrt \\(K_{n}\\) of A.  ev of \\(H_{n}\\) are the stationary points of r(x) restricted to \\(K_{n}\\): \\(r(x) = r(Q_{n}y) = \frac{y^{T}Q_{n}^{T}AQ_{n}y}{y^{T}y} = \frac{y^{T}H_{n}y}{y^{T}y}\\). \\(\gradient r(Q_{n}y) = r'(y) = 0\\) iff y is ev and \\(r'(y)\\) is ew of \\(H_{n}\\).

## Directly solve Ax = b
Can use triangular triangularization: but sparsity could be spoilt due to row operations: so try to order elimination steps to minimize the number of non zeros added.

### For symmetric +ve definite A
A can be interpreted to be the precision matrix of a gaussian distribution \\(Pr(x) \propto e^{-2^{-1}x^{T}Ax - \mean^{T}Ax}\\), whose graphical model G is sparse. Then, solving \\(A\mean = b\\) is same as finding the mode of Pr(x). Can use loopy belief propogation to solve Ax = b. This is exact when G is a tree; the updates correspond to triangular triangularization.


## Iteratively solve Ax=b
### The optimization view
Error \\(e_{n} = \norm{x-x_{n}}\\) vs residual \\(r_{n} = \norm{Ax_{n}-b}\\).

View solving Ax=b as an optimization problem: minimize something like this at every iteration.

### For dense A
See linear algebra ref.

### For SPD A
See later section.

### Generalized minimum residuals (GMRES)
#### Residue minimization in a subspace
At step n, approximate x by \\(x_{n} \in K_{n}(A, r_{0})\\) which minimizes residual \\(\norm{.}_{2}\\) of \\(r_{n} = b - Ax_{n}\\): minimize \\(AQ_{n}y - b = Q_{n+1}\hat{H}_{n}y-b\\): \\(\norm{Q_{n+1}\hat{H}_{n}y-b}_{2} = \norm{\hat{H}_{n}y-Q_{n+1}^{*}b}_{2} = \norm{\hat{H}_{n}y-\norm{b}e_{1}}\\). So oblique projection of problem.

#### Alg
At each step of Arnoldi itern to find orthobasis of \\(K_{n}(A, r_{0})\\): Find \\(y_{n} = \argmin_{y} \norm{\hat{H}_{n}y-\norm{b}e_{1}}\\), \\(x_{n}= Q_{n}y\\).

### CGNR
Conjugate Gradients for minimizing residue using Normal eqns. Take Ax = b, get \\(A^{*}Ax = A^{*}b\\); then apply CG. Relationship with old r: \\(\hat{r} = A^{*}r\\). Ortho projection of problem under normal matrix.

But \\(k(A^{*}A) = k(A)^{2}\\): Slower convergence.

### CGNE
Take \\(A^{T}u = x\\), get \\(AA^{T}u = b\\). \\(AA^{T}\\) is SPD; now apply CG. Residue r same; new direction vector \\(\hat{p} = A^{-T}p\\). Get monotonic decay in error vector. Ortho projection of problem under normal matrix.

## Ax=b, SPD A
Many practical applications.

### Reduction to quadratic programming
Consider \\(A \succeq 0\\). Then, any \\(q(x) = (0.5) x^{T}Ax - b^{T}x + c\\) is convex, has minimum when \\(\gradient q(x) = Ax - b = 0\\).

So, can now use ideas from quadratic programming to solve Ax = b! Can try to minimize q(x) iteratively! Move in the direction of \\(\gradient q(x)\\).

### Conjugate gradients (CG) for SPD A
#### Error minimization in a subspace
Consider iteration n: restricted to subspace \\(K_n\\). For \\(x_n \in K_n\\): Take \\(e_{n} = x - x_{n}\\); solve optimization problem: minimize \\(\norm{e_{n}}_{A} = x_{n}^{T}Ax_{n} - 2x_{n}^{T}b + b^{T}b = 2f(x_{n}) + k\\): note definition of f().

Find \\(x_{n} = argmin_{x_{n} \in K_{n}} f(x_{n})\\): so minimizing only the shadow of f in \\(K_{n}\\). f is convex, so is \\(K_n\\), so it has a unique minimum.

Actual problem was to minimize q(x). Here, solving the ortho projection of problem under A.

#### Iteration
\\(x_{0} = 0, p_{0} = r_{0} = b\\). \\(x_{n} = x_{n-1} + a_{n}p_{n-1}\\).

Step size \\(a_{n} = \frac{r_{n-1}^{T}r_{n-1}}{p_{n-1}^{T}Ap_{n-1}}\\): \\(f(x_{n})\\) minimum when \\(\gradient f(x_{n}) = Ax_{n} -b = A(x_{n-1} + a_{n}p_{n-1}) - b  = a_{n}Ap_{n-1} - r_{n-1}= 0\\).

Residual \\(r_{n} = b - Ax_{n} = r_{n-1} - a_{n}Ap_{n-1}\\); direction \\(p_{n} = r_{n} + c_{n}p_{n-1}\\); improvement in current step \\(c_{n} = \frac{(r_{n}^{T}r_{n})}{(r_{n-1}^{T}r_{n-1})}\\).


From iteration: \\(K_{n} = \linspan{x_{1}, .. x_{n}} = \linspan{p_{0}, .. p_{n-1}}\\).

\\(\norm{e_{n-1}}_{A} \geq \norm{e_{n}}_{A}\\). \why

Search directions are A conjugate: \\(p_{n}^{T}Ap_{j} = 0\\). \why \\(r_{n}^{T}r_{j}=0\\). \why

### Conjugate residues (CR) for symmetric A
Minimize \\(\norm{Ax-b}_{A}\\): \\
oblique projection of the problem under A.

\tbc

### Biconjugate gradients (BCG) method for non singular A
Do CG on 2 systems together: Ax = b and \\(A^{*}x^{*} = b^{*}\\). If A is near-symmetric, get good convergence.

\tbc

### Preconditioning
#### Uses
Maybe k(A) very high in \\(Ax = b\\); so, get an equivalent, better conditioned problem. Or, maybe want to turn it into an equivalent problem which is easier to solve.

#### Left preconditioning
Take \\(M \in S_{++}\\); \\(M^{-1}Ax = M^{-1}b\\). \\
If \\(M^{-1} \approx A^{-1}, k(M^{-1}A) \approx 1\\).

#### Right preconditioning
Take \\(AM^{-1}Mx = AM^{-1}u = b\\).

#### Shift preconditioning
Take $M_{L}^{-1}AM_{R}^{-1}M_{R}x = \\
M_{L}^{-1}b\\(. Want \\)\norm{M_{L}^{-1}AM_{R}^{-1}}$ small.

#### Traits of good preconditioners
Work involved is actually in solving \\(My = b\\), so usually want M very sparse. But, at the same time, want M to be close to A, which may be quite dense.

##### Joint Condition Number of M and A
k(A,M)

### Finding left preconditioning matrix M
#### Using A=LU
Get \\(A \approx LU\\), get \\(A^{-1} \approx M = U^{-1}L^{-1}\\).

Use Incomplete LU factorization (ILU) with 0 pattern P: \\(A^{-1} = U^{-1}L^{-1}\\) can kill sparsity, so sacrifice accuracy for sparsity. Alter LU alg to keep sparsity.

ILU(0): P same as 0's in A.

ILU(p): Keep level of fill \\(l_{ij}: k: |a_{ij}| \approx \eps_{k}<1\\), drop items with \\(l_{ij}>k'\\). Heuristic which doesn't need finding log: init value: \\(l_{ij} = 0\\) if \\(a_{ib}\neq 0\\), else \\(\infty\\); updates while putting 0: \\(l_{i,j} := \min (l_{ij}, l_{ik}+ l_{kj} + 1)\\): \\(l_{ik}+ l_{kj} \\) corresponds to change in level. Same run for every matrix with same pattern.

ILU (Thresholding): No row op when wt is near 0, keep only p pre and post diagonal entries.

#### Use support graph theory
M is symmetric and +ve semidefinite.

\tbc

#### Find sparse M to min \htext{\\(\norm{MA-I_{F}\\)}{..}}
Start with random M, do gradient descent. Let \\(F(M) = \norm{MA-I}_{F}\\); Use Frechet derivative: \\(\frac{F(M+E) - F(M)}{\norm{E}}\\).

\tbc

### Using preconditioners
#### Preconditioned conjugate gradient (PCG) for SPD A
Left preconditioning: \\(M^{-1}A\\) is SPD under \\(\dprod{.,.}_{M}\\). Can adapt CG to this: always use \\(\dprod{.,.}_{M}\\), residue \\(z = M^{-1}r\\). Replace new vars with old vars to get PCG alg.

Use \\(M=LL^{T}\\), \\(\hat{p}_{j} = p_{j}\\) etc.. to see that split PCG is equivalent to PCG.

Right preconditioning: \\(AM^{-1}\\) is SPD under \\(\dprod{.,.}_{M^{-1}}\\). Get alg equivalent to PCG.

Similarly, can apply PCG on CGNR and CGNE.

#### Preconditioning GMRES
Simply solve the preconditioned form of the eqn using GMRES.

Left and right preconditioning not equivalent. Right preconditioning minimizes actual, unskewed residue.
