+++
title = "02 Vector sets"
+++

## Properties
### Linear independence
A set of vectors \\(\set{t_i}\\) is linearly independent if, for all i, \\(t_i\\) can't be written as a linear combination of \\(\set{t_{j}: j \neq i}\\).

### Associated hyperplanes
Supporting hyperplane to C at boundary pt p: All C must lie on one side of the hyperplane.

Separating hyperplanes between sets.

## Span of vectors in S
Contains all linear combos of vectors in S. Any linear subspace expressible as Ax = 0. Eg: \\(a^{T}x = 0\\)

\\(\linspan{a..b}\\) represents space spanned by vectors \\(a .. b\\).

## Affine set X
X closed under affine combination. Eg: A line parallel to 1-d vector space, solution to Ax = b. Contains the line through any two points in X.

\exclaim{If it included the origin, it would be a linear subspace!} Any affine set expressible as \\(\set{x: Ax + b = 0}\\). Is convex.

### Affine hull of S
aff(S): Smallest affine set which contains S.

##### Relative interior of S
\\(relint(S) = \set{x \in S: \exists \eps>0: N_\eps(x) \inters aff(S) \in S}\\). A straight line segment and a plane in 3-d space have no interior, but have a relative interior.

## Convex cone C
If \\(x, y \in C\\), \\(\forall t_1, t_2 \geq 0: t_1 \\)x\\( + t_2 y \in C\\): encompasses all non-negative/ conic combinations of points. Is convex.

Thence, conic hull of S is defined.

Eg: Set of symmetric +ve semidefinite matrices.

### Pointed cone C
If \\(p\in C\\), \\(-p \notin C\\). Smaller than halfspaces. Can delete 0 from them and still preserve convexity.

### Proper cone C
\\(C\\) is closed, pointed, solid. Eg: non-ve orthant, \\(S^n_+\\). Dual cones \\(C'\\) of proper cones are proper.

##### Generalized inequalities wrt C
\\(x \leq_C y \equiv y-x \in C; \\)x\\( <_C y \equiv y-x \in int(C)\\). For multiplication by scalar a, this behaves like inequalities on R.

\exclaim{\\(x \geq_C 0\\) is a fancy way of saying that \\(x \in C\\)}. Similarly, \\(x >_C 0\\) means \\(x \in int(C)\\).

##### Minima
In general, not a complete ordering; so minimal and minimum elements defined as in ordered sets and partially ordered sets.

##### Minima and dual cone
Minimum of C \\( = \argmin_{x \in C} v^{T}x \forall v \in int(C')\\).

Minimal element of C \\( = \argmin_{x \in C} v^{T}x\\) for some \\(v \in C'\\): think of a dual as set of normals to supporting hyperplanes.

### Norm cones
\\(\set{(x, t): \norm{x} \leq t}\\): Epigraph of the norm. For euclidian norm, get 'ice cream cone': aka 2nd order cone.

### Dual \\(C^{*}\\) of cone C
\\(C^{*} = \set{y|y^{T}x \geq 0 \forall x}\\). This is the dual subspace of linear, nonnegative functionals. This is a cone too! \\(C^{*}\\) is set of normals to supporting hyperplanes of C.

Eg: \\(R_+^{n}, S_{+}^{n}\\) are self dual.

Dual of a dual cone includes the primal cone.

##### Set of normals
So, dual cone is actually the set of normal vectors defining all supporting hyperplanes of C, at its boundaries facing 0 in the first quadrant.

