+++
title = "Matrix approximation"
+++
## Approximating a matrix
### The problem
Take set of matrices S. Want \\(\argmin_{B \in S} \norm{A - B}\\) is minimized wrt some \\(\norm{}\\) and some set S.

#### The error metric
Also, often \\(\norm{.}\\) is an operator norm, as this ensures that \\(\norm{(A-B)x}\\) is low wrt the corresponding vector norm. Other times, as in the case of matrix completion problems, it may be desirable for \\(\norm{}\\) to be the Frobenius norm.

#### Low rank (k) factorization problem
In many problems, S is the set of rank k matrices, where k is small.

Often, we prefer \\(A \approx B = XY^{T}\\) rather than computing B, where rank(X), rank(Y) \\(\leq k\\): \\(A\\) may be sparse, but the best B may be dense, so we may run out of memory while storing, and out of time while computing Bx. You can always get \\(B = XY^{T}\\) from B just by taking SVD of B.

##### Restriction to subspace view
Similarly, may want restriction of \\(A\\) to a low rank subspace: \\(B = QQ^{T}A\\), Q is low rank, orthogonal; but it should be the best subspace which minimizes the error. \\(A\\) good Q tries to approximate the range space of A.

#### Sparse approximation
Maybe want \\(\min_B \norm{B-A}_2: \norm{B}_0 \leq k\\). This can be solved just by setting B = \\(A\\), and then dropping the k smallest \\(B_{i, j}\\) from B.

##### 1 norm regularized form
Even the optimization problem \\(\min_B \norm{B-A}_2^{2} + l\norm{B(:)}_1 \\) leads to sparse solutions.  This form is useful in some sparse matrix completion ideas. Solution: just take B=A, and then drom \\(B_{i,j} \leq l/2\\): +++(thresholding!)+++

Pf: \\(\min_B \sum_{i, j}(B_{i,j} - A_{i, j})^{2} + l\sum_{i, j} sgn(B_{i, j})B_{i, j} \\). Let B' be the solution to this. If \\(A_{i, j} \geq 0\\), so is \\(B_{i, j}\\); If \\(A_{i, j} \leq 0\\), so is \\(B_{i, j}\\): if they oppose in sign, setting \\(B_{i, j} = 0\\) definitely lowers the objective. So, get equivalent problem: \\(\min_B \sum_{i, j}(B_{i,j} - A_{i, j})^{2} + l\sum_{i, j} sgn(A_{i, j})B_{i, j}\\) subject to \\(sgn(A) = sgn(B)\\). The new objective is differentiable. Its optimality condition: \\(B_{i, j} = A_{i, j} - l/2\\); but the feasible set only includes \\(sgn(B) = sgn(A)\\). So if \\(A_{i, j} - l/2 \leq 0\\), the feasible B closest to the minimum of \\(\min_B \sum_{i, j}(B_{i,j} - A_{i, j})^{2} + l\sum_{i, j} sgn(A_{i, j})B_{i, j}\\) has the corresponding \\(B_{i, j} = 0\\).

### Best rank t approximation of A from SVD
#### The approximation
Let \\(A_{t} = \sum_{j=1}^{t} \SW_{j}u_{j}v_{j}^{*}\\) be the approximation. \\(A_{t}\\) is the best rank t approx to \\(A\\) (wrt \\(\norm{.}_{2}\\), \\(\norm{.}_{F}\\)), captures max energy of \\(A\\) possible: \\(\norm{A-A_{t}} = \inf_{B} \norm{A-B}\\).

#### Approximation error
Then, approximation error is \\(A-A_{t} = \sum_{i=t+1}^{r}\sw_{i}u_{i}v_{i}^{*}\\). As \\(\norm{X} = \sw_1(X)\\): \\(\norm{A-A_{t}}_{2} = \sw_{t+1}\\), \\(\norm{A-A_{t}}_{F} = \sqrt{\sum_{i=t+1}^{r} \sw_{i}^{2}}\\).

#### Geometric interpretation
Approximate hyperellipse by line, 2-dim ellipse etc... 

##### Approximating domain and range spaces
Using SVD for example, \\(A\\) can be viewed as a combination of rotation and diagonal matrices. So, getting a low rank approximation of \\(A\\) can be viewed as first getting low rank approximations of the range and domain spaces with orthogonal basis matrices \\(U_t\\) and \\(V_t\\) respectively, and then finding a square \\(S = U_t^{T}AV_t^{T}\\) such that \\(A \approx U_t S V_t\\).

#### Proof
Proof by \\(\contra\\): dim(N(B))= r-t, Let \\(\forall w \in N(B), \norm{Aw} = \norm{(A-B)w} < \SW_{t+1}\norm{w}\\); but \\(\exists\\) t+1 subspace \\(\set{v: \norm{Av}\geq \SW_{t+1}}\\); \\(dim(\set{w})+\dim(\set{v}) = r+1\\): absurd.

So, $\sw_{k} = \min_{S \subset C^{n}, dim(S) = n-k+1} \max_{x \in S} \norm{Ax}_{2} \\
= \max_{S \subset C^{n}, dim(S) = k} \min_{x \in S} \norm{Ax}_{2}$.

#### Randomized Approach
Take the \\(A \approx B = QQ^{T}A\\) view. \\(A\\) good Q must span \\(U_k\\). Can use something akin to the power method of finding ev. Take random m*k matrix W. \\(Y = (AA^{T})^{q}AW = U\SW^{q+1}VW\\), and get \\(Y = QR\\) to get Q. q = 4 or 5 is sufficient to get good approximation of \\(U_k\\). (Tropp etal) if you aim to get k+p approximation, you get low expected error.
  
### With few observations in A only
Same as the missing value estimation problem.

## Missing value estimation
### The problem
May be you have the matrix \\(A\\), and you have observed only a few entries \\(O\\). If there were no other conditions, there would be infinite solutions. But, maybe you also know that \\(A\\) has some special structure: low rank, or block structure or smoothness etc..

Can also view as getting an approximation \\(B \in S\\) for \\(A\\), where S is the set of matrices having the specified structure.

### Smoothness constraint
Sovle \\(\min \sum_{i,j} d(B_{i, j}, B_{i-1,j}) + d(B_{i, j}, B_{i,j-1})\\) such that \\(B_{i,j} = A_{i,j} \forall (i,j) \in O\\). If we use l2 or l1 metrics for d(), this can be solved with convex optimization.

### Low rank constraint
\\(rank(B) \leq k\\): this is not a convex constraint.

#### Singular value projection (SVP)
(Jain, Meka, Dhillon) Set \\(B^{(0)}_{i,j} = A_{i,j} \forall (i,j) \in O\\), set remaining values in \\(B^{(0)}\\) arbitrarily. Then, in iteration i, do SVD of \\(B^{(i)}\\) to get rank k approximation \\(B^{(i+1)}\\), set \\(B^{(i+1)}_{i,j} = A_{i,j} \forall (i,j) \in O\\).

##### Projection viewpoint
Take $S_1 = \set{B:B_{i,j} = A_{i,j} \forall (i,j) \in O},\\
 S_2 = \set{B:rank(B)\leq k}\\(. You start with \\)B_0 \in S_1\\(, project it to the closest \\)C \in S_2\\(, project C to the closest \\)B_1 \in S_1$ etc..


### Applications
The netflix problem.

