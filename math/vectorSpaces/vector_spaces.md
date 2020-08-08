+++
title = "Vector spaces"
+++

## Vector space V over field F
Vector space is closed under linear combination of a set of 'basis' vectors: A commutative group wrt +. Linear dependence of vectors: Any of the vectors expressible as a linear combo of the others.

Basis sets of n-degree polynomials (\\(P_n\\)) and matrices also define vector spaces.

## Inner product space
A vector space V with an inner product \\(\dprod{.}:V\times V \to F\\).

## Normed vector space
Space with a norm. Also a metric space. Thence inherit notion of completeness.

### Lebesgue space
Aka \\(L^{p}\\) or \\(l^{p}\\) space. Infinite dimensional space with the p norm. (Minkowski) Triangle inequality still holds.

## Banach space
Complete, normed, vector space.

## Hilbert space
Hilbert noticed common theme: complete, normed, inner-product vector space.

## Complex vector space
C is a field; so multiplication is defined for complex numbers. So, a complex vector space \\(C^{n}\\) is not equivalent to thinking about real vector space \\(R^{2n}\\).

## Functional space V
### f() as dom(f) dim vector
Look upon f(x) as a vector whose dimensions = domain size d. A dimension for each value of \\(x\\) in a certain interval: \\(f(x_{1})\\) is the projection of f(x) along the \\(x_{1}\\) direction.

##### Infinite dimensions
Dimension of the function space could be \\(\infty\\) or it could be finite depending on domain of f: see boolean functions ref.

### Standard basis functionals
Let basis function/ direction along \\(x_{i}\\) be \\(e_{i}\\): then by usual notion of inner product, \\(e_{i} \perp e_{j}\\).

By geometric intuition, tringle inequality, cosine inequality hold. So, have a inner product vector space!

### Restriction to finite length
Consider functionals f(x) which are of finite length, even if you are in an \\(\infty\\) dimensional vector space : Eg: \\(f(x) = \sin x\\) in \\([0,2\pi]\\), not \\(x^{-1}\\) in \\([0,2\pi]\\). Otherwise, hard to make sense of triangle inequality.

### Other representations
The space of all polynomials can be represented both as a functional space described above, and as a vector space, where each polynomial is represented by the vector formed by its coefficients.

## Euclidian space
\\(R^{n}\\) with the Euclidian structure (metric, inner product): \\(\dprod{a, b} = \sum a_{i}b_{i}\\).

### Geometric properties
For geometric properties of various objects in 3-d euclidian space, see topology ref.

Orthant: a generalization of quadrant.

### Box measure
Aka Lebesgue measure. This is the minimum cover measure described in the algebra survey.

There exist sets which are not box-measurable!\why

#### Definition
For boxes, this is just the product measure: \\(m([a, b]) = \prod_{i=1}^{n}(b_i- a_i)\\).

Let \\(B_i(S)\\) be a set of disjoint boxes which cover \\(S\\). In general, \\(m(S) = \inf \set{B_i(S)}\\).

#### Properties
It has all properties of a measure. In addition, observe that \\(m([a, a])=0\\). So, the measure of any countable set of points is \\(0\\). So, measure of rationals \\(m(Q) = 0\\), whereas \\(m(R-Q) = 1\\).

## Dual vector space \\(V^{*}\\)
Vector space over F of all continuous linear (not affine) functionals: \\(V\to F\\), with addition op: \\((f+g)(x) = f(x) + g(x)\\).

Linear functionals \\(f(x)\\) can always be specified as \\(f^{T}x\\).

If V has inner product, \\(V^{*}\\) has inner product.

Dual of a dual space includes the original space \chk.

This concept finds important applicaitons: Eg: Dual cone, dual norms.

### Basis: \\(\set{e^{i}\\)
\\(\set{e^{i}: e^{i}(e_j) = 1 \texttt{iff j = i}}\\). For the finite dimensional case, this is simply another finite dimensional vector space.
