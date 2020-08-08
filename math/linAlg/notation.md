+++
title = "Notation"
+++

Vectors are small letters. Matrices are capital letters.

## Matrix notation
### Dimensions
\\(A = [a_{ij}]\\) is mn matrix: \\(\in C^{m \times n}\\). \\(q = \min \set{m,n}\\). Square A: \\(m \times m\\). \\(\hat{A}\\) is rectangular.

### Matrices related to A
\\((v_{1}, v_{2} \dots)\\) is a column vector v.

\\(a_{i}\\): ith element of vector a or ith column of A. \\(a_{i}^{*}\\): by context: ith row of \\(A\\) or transpose of \\(a_{i}\\). \\(A_{k+1:m,k:f}\\): a submatrix; other unambiguous matlab notations \\(A_{i,:}\\) for ith row etc.. \\(a_{i,j}\\) an element of A. \\(A_{i,j}\\): by context: an element of \\(A\\) or a submatrix of A. 

Conjugate matrix \\(\conj{A}\\). Adjoint (Hermitian conjugate) of A: \\(A^{*}=\conj{A^{T}}\\). \\(\tilde{A}\\): \\(A\\) as stored on computer; or as calculated by alg.

Dilation of matrix A: add rows and cols to A.

### Special matrices
Permutation matrix, P. Lower triangular matrix L. Upper triangular matrix U. Diagonal matrix \\(D = diag(d_{i}) = diag(d)\\). Orthogonal (or Orthonormal) matrix Q, \\(\hat{Q}\\). Identity I.

### Special vectors
ith col of I: \\(e_{i}\\) (Canonical unit vector). e or 1: col vector of 1's. \\(P_{\perp q}\\): projector to space \\(\perp q\\).

## Abused notation
\\(y = O(\eps) \implies  \exists c = f(m,n), \forall x \lim_{\eps_{M} \to 0} y \leq c\eps_{M}\\). Extra Defn: If \\(y = \frac{a(x)}{b(x)}\\), at \\(b(x) = 0\\), \\(y = O(\eps)\\) means \\(a(x) = O(\eps b(x))\\).
