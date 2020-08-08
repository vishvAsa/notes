+++
title = "Inner products"
+++

## Properties
Obeys Conjugate symmetry, bilinearity, homogeniety, non negativity, positive definiteness.

Bilinearity: linear in a and b separately: \\((\ga a)^{*}(\beta b) = \conj{\ga}\beta a^{*}b\\). \exclaim{Range of \\(\dprod{}\\) need not be \\(\Re\\).}

\\(\dprod{Ax + x, y} = \dprod{x, A^{*}y + y}\\).

### Orthogonality
If \\(\dprod{x, y} = 0\\), \\(x\\) orthogonal to y.

### Associated norm
Defines norm \\(\norm{x}^{2} = \dprod{x,x}\\).

\\(\triangle\\) ineq holds: Take \\(\norm{x- y}^{2} = \dprod{x - \\)y\\(, x-y}\\), expand it, use cauchy schwartz.

### 2-norm Bound on size
(Cauchy, Schwarz). \\(|\dprod{a,b}| \leq \norm{a}\norm{b}\\).

#### Proof
\\(0 \leq f(d) = \norm{u + dv}^{2} = \dprod{u, u} - 2d \dprod{u, v} + \dprod{v, v}\\).

Minimize f(d) wrt \\(d\\) to get: \\(d = \dprod{u, v}\dprod{v, v}^{-1}\\).\\ So, \\(0 \leq \dprod{u, u} - |\dprod{u, v}|\dprod{v, v}^{-1}\\).

#### Tightness
\\(|\dprod{a,b}| = \norm{a}\norm{b}\\) when \\(\dprod{a, b} = 0\\).

### General norm-bound on size
(Aka Holder's inequality) For \\(p, q \geq 1\\), \\(p^{-1} + q^{-1} =1\\): \\(p, q\\) are Holder conjugates; then \\(|\dprod{a,b}| \leq \norm{a}_{p}\norm{b}_{q}\\) : a tight bound.

\pf{For \\(p, q > 1\\), By Young's ineq, \\\\(|a_{i}b_{i}|\leq \frac{|a_{i}|^{p}}{p} + \frac{|b_{i}|^{q}}{q}\\); \\\\(\frac{1}{\norm{a}_{p}\norm{b}_{q}}|\dprod{a,b}| \leq p^{-1} + q^{-1} =1\\).}

Taking the limiting case as \\(p \to 1\\), we also have the \\(p=1, q = \infty\\) case.

## Standard inner product
\\(\dprod{a, b} = b^{T}a\\). Can be generalized to \\(a, b \in C^{m}: b^{*}a\\).

### Geometric interpretation
\\(\dprod{a,b} = b^{T}a = \norm{a}\norm{b} \cos \gth\\).

So, orthogonality = perpendicularity.

#### Proof
Prove for 2 dimensions by seeing: \\(\mat{a_1\\a_2} = \mat{\norm{a} \cos \gth \\ \norm{a} \sin \gth}\\), using \\(cos(A-B) = \cos A \cos B + \sin A \sin B\\).

Consider plane formed by a, b. Get new orthonormal basis Q [\\(QQ^{*} = I\\)], so that \\(q_1, q_2\\) span this plane; so \\(Qe_i = q_i\\). The representations of the points a, b wrt this new basis is Qa, Qb; their norm remains same. By the 2 dimensional case, \\(\dprod{Qa, Qb} = \norm{a}\norm{b}\cos \gth\\). But, \\(\dprod{Qa, Qb} = \dprod{a, b}\\) as \\(QQ^{*}=I\\)!

## In function spaces
Consider functions with domain \\(X = [a,b]\\), and let \\(p\\) be a probability measure on \\(X\\): \\(\int_X \conj{f(x)}g(x)dx= \int_{a}^{b}\conj{f(x)}g(x)p(x)dx\\) for complex valued \\(f(x)\\); can include weight function \\(W\\) too. This defines norm too. Often scaled to make length of certain basis function vectors to be 1.

## Orthogonality
Orthogonality of k vectors \\(\implies\\) mutual independence - else contradiction. Orthogonal vector spaces. Orthogonality among bases \\(\implies\\) orthogonality of vector spaces.

## Weighted Inner product
Invertible matrix W, \\(A=W^{*}W\\), A +ve semidefinite. Skew vectors before dot product: \\(\dprod{a,b}_{W} = \dprod{Wa, Wb} = b^{T}W^{*}Wa = b^{T}Aa\\). Sometimes writ as \\(\dprod{a,b}_{A}\\). a and b are A conjugate if \\(\dprod{a,b}_{A}=0\\).

## Specify inner product using Gram matrix G
Aka Gramian matrix. Take symmetric +ve semidefinite G. \\(G_{i,j} = \dprod{x_{i}, x_{j}}\\) for some \\(\set{x_{i}}\\); so \\(G = X^{T}X\\) for \\(X = (x_{i})\\). Then, for any \\(u = \sum c_{i}x_{i}, v = \sum b_{i}x_{i}\\), can rewrite in \\(\set{x_{i}}\\) basis as \\(c\\), b and find \\(\dprod{.,.}\\) using \\(\dprod{c,b} = c^{T}Gb\\). As G +ve semi-def, \\(c^{T}Gc \geq 0\\); \\(c^{T}Gc = 0\\) iff \\(c^{T}X^{T}Xc = 0\\) or Xc=0: meaning of normness preserved.

G often normalized to make \\(G_{i,i} = 1\\).

Extension to \\(\infty\\) dimensions: Mercer's theorem.

