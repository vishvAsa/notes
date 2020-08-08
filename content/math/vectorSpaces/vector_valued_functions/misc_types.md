+++
title = "Misc types"
+++


## Functions over N: Sequences of vectors
Many properties carry over from sequences on R or C. See analysis of functions over fields ref.

### Convergence
The limit corresponds to the limit of projection sequence in each dimension. Sums, inner products, scalar multiples of convergent sequences converge.

(Bolzano, Weierstrass): Every bounded sequence has a subsequence which converges.

## Curve
Continuous \\(f:R \to X\\), where X is a topological space.

### Plane curves
A curve in the Euclidian plane.

Affine plane over field \\(F_{q}\\): A 2 D affine space.

#### Elliptic curve
A plane curve with the equation \\(y^{2} = x^{3} + ax + b\\). The set of points on this curve, with the point at \\(\infty\\) form a commutative additive group. \\(\infty\\) point is 0.

#### \htext{\\((E(F_{p), +)\\)}{..}}
If defined over an affine plane over field \\(F_p\\), it is a finite group. 0 is not in affine plane. (Hasse) Number of points in the group is close to the size of \\(F_p\\). \why

For use in cryptography, see cryptography ref.

## Other V to V functions
### Linear function
\\(f(ax + by) = af(x) + bf(y)\\). Aka linear maps/ transformations. Preserves linear combinations of \\(x, y\\). Note that linear functions do not include affine functions.

Equivalent to matrix multiplication \\(Ax\\): see other section. See linear algebra ref.


### Generalized projection operation
Take \\(A \subseteq V\\), some norm: \\(\norm{.}\\). \\(P_A(u) = argmin_{v \in A} \norm{u-v}\\).

### Perspective function
\\(P:R^{n+1} \to  R^n : P(x, t) = x/t\\), \\(dom(P) = \set{(x, t): t>0}\\): note domain. Preserves convexity in images, inverse images.

### Linear fractional fn
\\(f(x) = \frac{Ax+b}{c^{T}x +d}\\), \\(dom(x) = \set{x: c^{T}x +d>0}\\): composition of affine and persepctive functions..

### Affine functions between vector spaces
Aka affine \\
transformation/ map. \exclaim{Linear transformation followed by translations.} Writeable as \\( y= Ax + b\\); or as \\(y' = \mat{y \\ 1} = \mat{A & b\\ 0  & 1} \mat{x \\ 1} = Mx'\\), a linear transformation in a higher dimension space.

Somewhat preserves all affine combinations: \\(M(ax + (1-a) x') = aMx+(1-a)Mx' = y\\) with last component in y being 1.

Invertible if A is invertible.

### Soft-thresholding operator
Aka Winsorization. \\(f(v, l)_i = [v-l_i]_+\\). This operator is often used in describing solutions to \\(l_\infty\\) regularized regression problems.
