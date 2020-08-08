+++
title = "Matrix vector spaces"
+++

## Vector space of matrices over field F
\\(M_{m, n}(F), M_{n, n}(F) \equiv M_{n}(F)\\). \\(M_{m, n}(C) = C^{mn} \equiv C^{m \times n}\\).

## Matrix inner products
### Trace inner product
\\(\dprod{A,B} = tr(B^{*}A)\\) : same as taking vectorizing B and \\(A\\) and using vector \\(\dprod{.,.}\\); also see the elementwise multiplication before addition view. Aka standard inner product.

For symmetric matrices: \\(\dprod{A, B} = \sum_i \sum_j X_{ii} Y_{ij}\\)

## Matrix norms
Obeys all properties of vector norms,\\
plus sub-multiplicativity: \\(\norm{AB} \leq \norm{A} \norm{B}\\). Perhaps \\(\norm{A} = \norm{A^{*}}\\) too. Generalized matrix norms need not be submultiplicative.

### Unitary invariance
If \\(\norm{.}\\) unitary invariant, by SVD, \\(\norm{A} = \norm{\SW}\\).

#### Symmetric gauge fn g
\\(g:C^{q} \to R^{+}\\) is a vector norm on \\(C^{q}\\) which is also an absolute norm, and is permutation invariant: g(Px) = g(x): a fn on a set rather than a seq.

Every unitarily invariant matrix norm \\(\equiv\\) symmetric gauge fn on \\(\sw\\). Pf: Given \\(\norm{}: g(x) = \norm{X}: X = diag(x)\\) is symm gauge: permutation invariance from unitary invariance of \\(\norm{}\\). \\(\norm{X} = g(\sw)\\) is unitary invariant matrix norm: unitary invariance from invariance of \\(\SW\\); as g is vector norm, get +ve definiteness, non negativity, homogenousness. \\(\triangle\\) ineq: g is absolute, so monotone; \\(\sw(A + B)\\) weakly majorized by \\(\sw(A) + \sw(B)\\), so \\(\sw(A+B) \leq S[\sw(A) + \sw(B)]\\) for doubly stochastic S; so \\(g(\sw(A+B)) \leq g(S(\sw(A)+\sw(B))) \leq \sum \ga_{i}(g(P_{i}\sw(A)) + g(P_{i}\sw(B))) \leq g(\sw(A)) + g(\sw(B)) = \norm{A} + \norm{B}\\), by Birkhoff.

### Max norm
\\(\max |a_{i,j}|\\).

### Matrix p norms Induced by vector norms
\\(\norm{A} = \sup_{x} \frac{\norm{Ax}}{\norm{x}}\\). Obeys triangle ineq! So, get (p, q) norm, p norm.

\\(\norm{A}_{p} = \norm{U\SW V^{*}}_{p} = \norm{\SW}_{p}\\). 

\\(\norm{A}_{\infty}\\) is max row sum: use suitable \\(x = |1|^{n}\\); thence get \\(\norm{Ax}_{\infty}\\).

\\(\norm{A}_{1}\\) is max col sum.

#### Unitary invariance: 2 norm only
Change of orth basis. \\(\norm{QA}_{2}=\norm{A}_{2}\\) as \\(\norm{Qx}_{2}=\norm{x}_{2}\\).

But, \\(\norm{QA}_{p} \neq \norm{A}_{p}\\) as \\(\norm{Qx}_{p} \neq \norm{x}_{p}\\). By SVD, \\(\norm{A}_{2} = \norm{A^{*}}_{2}\\).

#### Comaprison of norms
\\(\norm{A}_{\infty} \leq \sqrt{n}\norm{A}_{2}\\): Take x with \\(\norm{x}_{2} = 1\\), for which \\(\norm{Ax}_{2} = \norm{A}_{2}\\); then \\(n\norm{Ax}_{2}^{2} = n\norm{A}_{2}^{2} = \sum_{j}(\sum_{i}nx_{i}A_{j,i})^{2}\\); \\(nx_{i}^{2} \geq 1\\), so this exceeds every row sum.

Similarly, \\(\frac{\norm{A}_{F}}{\sqrt{n}} \leq \norm{A}_{2}\\).

\\(\norm{A}_{2} \leq \sqrt{m}\norm{A}_{\infty}\\): For \\(\norm{x}_{2}=1, {Ax}_{i} \leq \\) max row sum of A.

Indicate matrix **energy**, consider sphere mapped to ellipse.

#### Connection with spectral radius
\\(\norm{A} \geq |\gl_{max}(A)|\\) as \\(\sup_x \frac{\norm{Ax}}{\norm{x}} \geq |\gl_{max}(A)|\\). +++(Wonderful!)+++

#### Find p norm of A
For \\(\norm{A}_{2}\\) use SVD; aka spectral norm if \\(A\\) square.

Take x with \\(\norm{x}_{p}\\) = 1, maximize \\(\norm{Ax}_{p}\\). Use Triangle inequality: \\(\norm{Ax}_{1} = \norm{\sum x_{i}a_{i}}\\ \leq \sum \|x_{i}a_{i}\|\\), so \\(\norm{Ax}_{1} = max \norm{x_{i}}\\).

Similarly use Cauchy Schwartz ineq. By \\(\norm{A} \geq \frac{\norm{Ax}}{\norm{x}}\\), \\
\\(\norm{ABx} \leq \norm{A}\norm{Bx} \leq \norm{A}\norm{B} \norm{x}\\); so \\(\norm{AB} \leq \norm{A}\norm{B}\\) (in general a loose bound).

### Matrix (p, q) induced norm
Aka operator norm. \\(\max_{\norm{q} = 1} \norm{Ax}_{p}\\). Check \\(\triangle\\) ineq.

### Ky Fan (p,k) norms
Take \\(\sw_{i}\\) in descending order. \\(\norm{A}_{p,k} = (\sum_{i=1}^{k}\sw_{i}^{p})^{1/p}\\) for \\(p\geq 1\\): p norm to top k \\(\sw\\).

\\(\triangle\\) ineq for (1, k) norm from \\(\SW\\) inequalities. Vector normness for \\(\norm{A}_{p,k}\\): \\(\norm{x}_{p,k}\\) a symmetric gauge fn: \\(\triangle\\) ineq: take \\(A\\), b in descending order to get \\(a' = (a_{[i]}), b' = (b_{[i]})\\); \\(\sum_{i}^{k} (a_{[i]} + b_{[i]}) \geq \sum_{i}^{k}(a+b)_{[i]}\\); so by weak majorization lore, for \\(p \geq 1\\): \\(\sum_{i}^{k} (a_{[i]} + b_{[i]})^{p} \geq \sum_{i}^{k}(a+b)_{[i]}^{p}\\); thence see: \\(\norm{a' + b'}_{p,k} \leq \norm{a'}_{p,k} + \norm{b'}_{p,k}\\) from p-norm properties.

Matrix normness:\\
\\(\sum_{i=1}^{k}\sw_{i}(AB)^{p} \leq \sum_{i=1}^{k}\sw_{i}(A)^{p}\sw_{i}(B)^{p}\leq \sum_{i=1}^{k}\sw_{i}(A)^{p}\sum_{i=1}^{k}\sw_{i}(B)^{p}\\).

\\(\norm{A}_{1,1} = \norm{A}_{2}\\).

### Schatten p norms
Apply p norm to singular values. Special case of Ky Fan norm: \\(\norm{A}_{p,q}  = \norm{A}_{Sp} = (\sum \sw_{i}^{p})^{1/p}\\). Vector normness from seeing that this is a symmetric gauge fn.

#### Frobenius (Hilbert-Schmidt, Euclidian) norm
\\(\norm{A}_{S2} = \norm{A}_{F}\\).

\\((\sum a_{i,j}^{2})^{\frac{1}{2}} = (\sum \norm{a_{j}}^{2})^{\frac{1}{2}} = (tr A^{*}A)^{\frac{1}{2}} = (tr AA^{*})^{\frac{1}{2}} = (tr \SW^{*}\SW)^{1/2} = A_{F}\\). So, based on matrix inner product: \\(\dprod{A,B} = tr(B^{*}A)\\).

So, \\(\norm{QA}_{F}=\norm{A}_{F}\\). By Cauchy Schwartz, $\norm{C}_{F}^{2} = \norm{AB}_{F}^{2} = \\
\sum_{i}\sum_{j} (a_{i}^{*}b_{j})^{2} \leq \sum_{i}\sum_{j} \norm{a_{i}}_{2}^{2}\norm{b_{j}}_{2}^{2} =\norm{A}_{F}\norm{B}_{F}$.

#### Trace (Nuclear) norm
\\(\norm{A}_{S1} = \norm{A}_{tr} = \sum \sw_{i} = tr((A^{*}A)^{1/2})\\). Corresponds to the trace inner product.

In finding \\(C,D: \min \norm{A - CD}_{tr}\\), using trace norm often yields low rank solutions. \chk

