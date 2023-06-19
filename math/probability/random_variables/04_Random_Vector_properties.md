+++
title = "04 Random Vector properties"

+++
## Mean
\\(E[X] \dfn (E[X_i])\\).

### Linearity
If \\(X\\) is a random matrix, A, B, C are constant matrices: \\(E[AXB + C] = AE[X]B + C\\). Proof: by using \\((AXB)_{i, j} = A_{i,:} X B_{:, j}\\), which is a linear combination of \\(X_{k,l}\\).

Also, if \\(X\\) is random vector, \\(E[a^{T}X] = a^{T}E[X]\\).

## Covariance
### Definition
How correlated are deviations of X, Y from their means?\\
\\(cov(X, Y) = E_{x, y}[(X - E[X])(Y - E[Y])]\\).

#### Extension to vectors
\\(cov(X, Y) = E_{x, y}[(X - E[X])^{T}(Y - E[Y])]\\):\\ corresponds to measuring \\(cov(X_i, Y_j)\\).

### Correlation
(Pearson) correlation coefficient: \\(corr(X, Y) = \frac{cov(X, Y)}{\stddev_{X}\stddev_{Y}}\\): normalized covariance.

#### Correlation vs Independence
If \\(X_{i}\perp X_{j}, Cov[X_{i},X_{j}] = 0\\): even if they are only pairwise independent. But, \\
\\(cov(X, X^{2}) = 0\\) even if \\((X, X^{2})\\) not \\(\perp\\).

If \\(Cov[X_{i},X_{j}] = 0\\) holds, then Xi and Xj are uncorrelated. If they are independent, they are uncorrelated; but not necessarily vice versa.

## Covariance matrix
\\(\covmatrix = var[X] = cov(X, X) = E[(X-\mean)(X-\mean)^{T}] = E[XX^{T}] - \mean \mean^{T}\\).

Diagonal has variances of \\((X_{i})\\). It is diagonal if \\((X_{i})\\) are independent.

### Effect of linear transformation
\\(Var[BX + a] = E[(BX - BE[X])(BX - BE[X])^{T}] = BVar[X]B^{T}\\). As in the scalar case, constant shifts have no effect.

Special case: \\(var[a^{T}X] = a^{T}var(X)a\\).

### Nonnegative definiteness
\\(\covmatrix \succeq 0\\) as \\(a^{T}E[(X-\mean)(X-\mean)^{T}]a \geq 0\\).

If \\(a^{T}\covmatrix a = 0\\), with probability 1, \\(a^{T}X - a^{T}\mean = 0\\), so some \\(\set{X_i}\\) are linearly dependent. So, \\(X\\) lies on the hyperplane/ subspace with normal a.

### Precision matrix
\\(V = \covmatrix^{-1}\\). Consider partial correlation deduced in case of multidimensional normal distribution.

### Moment generating function
\\(E[e^{t^{T}X}]\\) is the moment generating function.
