+++
title = "+Functionals"
+++


## Introduction
### Definition
Let \\(dim(V) = d\\). Any \\(f:V \to F\\) is called a functional.

If \\(V\\) is a Euclidian space, you have a scalar field: a scalar value attached with every value in the space.

Visualization, topological properties explored in another section.

Gradient of a scalar field is a vector field, obtained by taking derivative at all points.

### Restriction to a line
Take \\(f: R^{n} \to R\\), get \\(g: R \to R\\) defined by \\(g_{x,u}(t) = f(x + tu)\\). Thus the domain of \\(g\\) is dom(f) restricted to a single line in the vector space.

#### Importance
This is an important way of studying the properties of a functional. For example, the differential function corresponding to \\(f\\) can be defined by means of the differential function of \\(g\\).

## Properties
### Superclasses
Properties of the more general class of real valued functions is described in the complex analysis survey.

Properties of the more general class of functionals over vector spaces are described in another part of the vector spaces survey.

### Conjugate of f
\\(f'(y) = \sup_{x \in dom(f)} (y^{T}x - f(x))\\). How far below the hyperplane \\(y^{T}x\\) through 0 does f(x) go? Visualize for \\(f:R \to R\\) : \\(xy\\) is a line, take intercept of farthest line which is tangent to f(x) and is parallel to xy.

Easy to make mistakes while finding conjugate: errors in specifying values of \\(f\\) at every point in domain, difficulty in maintaining rigor while maximizing some functions.

Observe: This is affine in terms of y.

### Algebraic properties
#### Minimax vs maximin
Consider \\(\min_x \max_y f(x, y)\\). This is not always equal to \\(\max_y \min_x f(x, y)\\). Pf: Take binary x, \\(y\\), Consider: \\(f(x, y) = \mat{1 & 3\\ 4 & 1.5}\\).

#### Homogeneity with degree a
\\(f(tu) = |t|^{a}f(u)\\).

### Domain: Important domains
#### Sub-level set
\\(\set{x | f(x) \leq c}\\).

#### Stationary point
Local minima and maxima.

#### Critical points
Points of inflection, or maxima or minima: f'(x) = 0.


#### Equivalence
For finite dim V, take +ve definite, homogenous, continuous function \\(f_{1}, f_{2}\\), \\(\exists a, b: af_{1}(x) \leq f_{2}(x) \leq b f_{1}(x)\\). Pf: Take \\(\norm{}_{2}\\) unit sphere surface: compact set, \\(h = f_{2}/f_{1}\\); use Weierstrass, take min, max of h as a, b.

#### Associated sets: Epigraph and subgraph
Given \\(g: R^{D} \to (0,B)\\), can consider subgraph:\\ \\(\set{(x, t): \forall x \in R^{D}, t \in R:: g(x) \geq t}\\); visualize easily for \\(f:R \to R\\): area below curve of \\(f\\). Similar is epigraph.

## Topological properties of functionals
Consider the properties of the more general class of real valued functions in the complex analysis survey.

### Visualization
#### Plot in d+1 dim
Need d+1 dimensions. This is \\(\set{(x, f(x))}\\). Even there, can consider restriction to various lines: eg: \\(f(x) \forall x: x_i = c\\).

##### Tangent hyperplanes to epigraph
Take a C-1 smooth point \\(x_1\\). Then, the plot of the first order  \\
approximation of \\(f\\) at \\(x_1\\),
\\(\set{(x, y)| y = f(x_1) + \gradient f(x_1)^T(f(x) - f(x_1)}\\) is the tangent hyperplane to \\(\set{(x, f(x))}\\); and \\((\gradient f(x_1), -1)\\) is the normal to this hyperplane.

For convex \\(f\\), this becomes the supporting hyperplane, a universal lower bound to \\(f\\). This concept can even be extended to non-differentiable points: see section on supporting hyperplanes to convex functionals.

#### Contour surfaces in d dim
Else, to visualize in \\(d\\) dimensions, can use contour lines corresponding to level sets \\(f(x) = a\\): A 2 dim contour line for 2 dim functional. This is a \\(d\\) dimensional (possibly closed) surface: can view as a relation \\(x_{d}= h(x_{1}, .. x_{d-1})\\). This is the boundary of the sublevel set.

For high-dimensional objects, see topology ref.

Also see geometric properties of the gradient to observe connection between the gradient (and subdifferentials) and sublevel-sets.

### Bounding steepness
Take \\(f(x_1) - f(x_2) = \gradient f(x_3) (x_1 - x_2)\\) using MVT, upper bound \\(\gradient f(x_3)\\), and ye got a lipshcitz function (See toplogy ref).

### Measure flexibility
Aka Rademacher average. Take Rademacher RV \\(a_{i} \to \set{\pm 1}\\).\\
Given \\(\hat{R}_{\set{X_{i}}}(F) = E_{a}[\sup_{f\in F}n^{-1} \sum_{i} a_{i}f(X_{i})]\\). Sees how well functions in F can match sign of \\(\set{a_{i}}\\) on these points; thence measures complexity/ flexibility of F.


## Sequences, series of functionals on metric space X
Also see topology ref.

Series is just a sequence of partial sums.

### (Weierstrass) M test
Let \\(|f_{n}| \leq M_{n}\\). If \\((M_{n})\\) converges, \\(|\sum f_{n}|\\) converges: use Cauchy criterion: \\(\forall \eps, \exists N: m, n > N \implies \sum_{m}^{n} |f_{i}| \leq \sum_{m}^{n} M_{i} \leq \eps\\).

### Space C(X) of continuous bounded complex valued fns on X
Take \\(\norm{f} = \sum_{x \in X} |f(x)|\\): positive definiteness, \\(\triangle\\) ineq hold; so this defines a metric on C(X): \\(d(f, g) = \norm{f-g}\\). Like an \\(\leq |X|\\) dimensional vector space.

In context of C(X), \\(lt_{n\to \infty} f_{n} \to \\)f\\( \equiv f_{n} \to f\\) uniformly.

C(X) is a complete metric space. Pf: Take Cauchy sequence in C(X); so \\(\exists f: f_{n} \to f\\); so \\(f_{n} \to f\\) uniformly; thence see \\(f\\) is bounded, continuous; so \\(f\in C(X)\\).

### f as limit of uniformly convergent sequence of polynomials
(Stone, Weierstrass). \\(f\\) continuous. Polynomials \\(p_{n}\\). Express \\(f\\) in terms of the basis functions \\(p_n\\).

