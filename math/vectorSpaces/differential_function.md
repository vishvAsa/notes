+++
title = "Differential function"
+++

## Definition
### Fixed direction differential fn
Aka directional derivative.

Fixing the direction \\(v\\), \\(D_v(f)\\) can be taken to map \\(x\\) to \\(D_v(f)(x)\\). So, \\(D_v(f)(x): V \to F\\) is a constricted version of the differential function \\(D(f)(x)\\).

\\(df(x; h) = D_h(f)(x)= \lim_{\change t \to 0} \frac{f(x+\change th) - f(x)}{\change t} = \frac{d}{dt}|_{t=0}f(x + th)\\). Aka Gateaux differential.

Alternate notation: \\(\gradient_{h}(f(x)) \\) : not the gradient vector, but its applicaiton in a certain direction.

#### Affine approximation view
This definition of the directional derivative is equivalent to the defining \\(D_h(f)\\) as the function such that the following holds: \\(t \to 0\\), \\(f(x + th) = f(x) + tD_h(f)(x)\\).

#### R to R case
In this special case, there is just one direction: \\(1\\).

### Directional differentiability
If, at \\(x\\), the directional derivative exists in all directions, \\(f\\) is said to be Gateaux differentiable at \\(x\\).

The differential of \\(f\\) at the point \\(x\\) in the direction \\(v\\) is a function of two variables: \\(x, v\\). We regard \\(D(f)(x): V \to F\\), such that \\(D(f(x))[v] = \frac{df(x + tv)}{dt}\\) is the directional derivative of \\(f\\) at \\(x\\) along \\(v\\).

So, \\(D(f): V \to L(V, F)\\), where \\(L(V, F)\\) is the space of continuous linear functionals \\(l:V \to F\\). The fact that \\(D(f(x))\\) is a linear functional follows from the affine approximation view of the directional derivative.

But, this is unsatisfactory as directional differentiability does not imply continuity. \why

### Continuous differentiability
If at \\(x\\), \\(\exists a\\) such that \\(\forall c, \norm{f(x+c) - f(x) - a^{T}c} = o(\norm{c})\\), then \\(f\\) is differentiable at \\(x\\); and the derivative is \\(Df(x)[c] \dfn a^{T}c\\), which maps \\(V \to F\\). +++(A measure of goodness of affine approximation!)+++ The view \\(D(f): V \to L(V, F)\\) still holds.

Aka Frechet derivative, total derivative.

#### Connection to directional differentiability
In non pathological cases, both notions of differentiability are equivalent: This comes from applying the polynomial approximation theorem for \\(g: R \to R\\), \\(f(x + th) \to f(x) + t D_h(f)(x)\\).

In the case of continuous differentiability, this follows from definition. In the case of directional differential functions, this can be seen using the polynomial approximation theorem for \\(f:R \to R\\): \\(f(x + th) \to f(x) + t D_h(f)(x)\\) as \\(t \to 0\\).

### Matrix functionals
Similar definition for differential functions for functionals over the vector space of matrices. Eg: See \\(\gradient tr(f(X))\\) in linear algebra ref.

## Linearity
The differential operator \\(D:f \to D(f)\\) is linear: So \\(D(f+g) = D(f) + D(g)\\): This follows from the affine approximation view  of the differential function.

Note that this is separate from directional linearity.

## Connection to partial derivatives
We suppose that linearity is established (simple in case of Frechet derivatives).

From linearity, \\(D(f(x))[v] = \sum_i v_i D(f(x))[e_i]\\). This can be written as a vector product: \\(D(f(x))e_i\\), with D(f(x)) being a row vector. When written as a column vector, it is denoted by \\(\gradient(f(x)) \\), in which case, \\(\gradient_v f(x) = \gradient(f(x))^{T}v\\).

### Notation
\\(\gradient f(x) := \frac{df(x)}{dx} := (\frac{\partial f(x)}{\partial x_{1}}, \dots) = (\partder{f(x)}{x_{1}}, ..)\\).

#### Note about representation
Note that, as explained there, 'gradients' are defined wrt to vectors - without differentiating between their representation as row or column vectors. Such representations are secondary to the correctness of their values, and can be altered as necessary for convenience of expression.

### D(f) as a Vector field
Hence, the derivative operator \\(D(f)(x)\\) can be viewed as a vector field, such that \\(D(f)(x) = \gradient f(x)\\), a vector. However, often, following the convention used for vector to vector functions, \\(D(f)(x)\\) is denoted by the row vector \\(\gradient f(x)^{T}\\).

### C1 smoothness
\\(f \in C^{1}\\) if \\(\partder{f}{x_i}\\) exists. Similarly, \\(C^{n}\\), even \\(C^{\infty}\\) smoothness defined.

#### Differentiability vs smoothness
Gradient's existence does not guarantee differentiability; derivative must exist in all directions - in an open ball around \\(c\\).

### In contour graph
#### Perpendicular to contours
\\(\gradient f\\) is \\(d\\) dimensional vector. Always \\(\perp\\) to every tangent to the contour of \\(f\\) in \\(d\\) dimensional space: else could move short distance along contour and increase value of f; or take \\(x\\) and \\(x + \eps\\) on contour, take Taylor expansion: \\(f(x + \eps) = f(x) + x^{T}\gradient f(x)\\); thence get \\(x^{T}\gradient f(x) = 0\\).

#### Sublevel sets and gradient direction
Consider level-sets \\(f(x) = 0, f(x) = 0.1, f(x) = 0.2\\). \\(\gradient f(x)\\) will be oriented towards increasing \\(f(x)\\), that is, away from the interior of the sublevel set \\(\set{x: f_i(x) \leq 0}\\). So, points outwards if convex.

### In the plot
Take the plot \\((x, f(x))\\). Then \\(\gradient f(x)\\), if it exists, is sufficient to specify the tangent hyperplane to the plot at x: see subsection on tangent hyperplanes.

## Subgradients at convex points
Extension of the gradient to non-differentiable functional f(x). See convex functional section.

## Differential operator
Its general properties, including linearity, product rule and the chain rule, are considered under vector functions.

### Derivatives of important functionals
For simplicity in remembering the rules it is easier to think in terms of the Differential operator, rather than the gradient (which is just \\(Df(x)^{T}\\)).

#### Linear functionals
\\(DAx = A : \gradient Ax = A^{T}, \gradient b^{T}x = b\\) from Df(x) rules.

#### Quadratic functionals
\\(\gradient x^{T}Ax = (A^{T} + A )x\\): <div class="proof">expanding \\((x+\del x_{i})^{T}A(x+\del x_{i})\\).} Alternate \pf{\\(D(x^{T}Ax) = x^{T}A + D(x^{T}A) x\\) (product rule) \\( = x^{T}A + x^{T} D(A^{T}x) = x^{T}(A + A^{T})\\)</div>

If \\(A = A^{T}\\): \\(D(x^{T}Ax) = x^{T}(2A)\\).

## Higher order differential functions
### Definition
#### Linear map from V
Take the differential functional \\(D(f)(x):V \to L(V, F)\\). \\(L(V, F)\\) is itself a vector space, and the space of continuous linear maps \\(L(V, L(V, F))\\) is well defined. So, we can consider the differential function of \\(D(f)\\). It is \\(D^2(f)(x): V \to L(V, L(V, F))\\).

Similarly, kth order differential function \\(D^{k}(f)(x)\\) can be defined in general.

Differential operators, of which \\(D^{k}f(x)\\) are special cases, for general functions between vector spaces are described elsewhere.

#### Directional higher order differential fn
With \\(u\\) fixed, \\(D_u(f)(x) = D(f)(x)[u]\\) can be viewed as a  functional: \\(D(f):V \to F\\). Once can consider the differential function of \\(D_u(f)\\). Applying the definition, will be \\(D(D_u(f)):V \to L(V, F)\\) such that \\(D(D_u(f))(x)\\) is specified by 
$$D(D_u(f))(x)[v] = lt_{\change t_v \to 0} \frac{D_u(f)(x + \change t_v v) - D_u(f)(x)}{\change t_v} = \\
lt_{\change t_v, \change t_u \to 0} \frac{f(x + \change t_v v + \change t_u u) - f(x + \change t_u u)- f(x + \change t_v v ) + f(x)}{\change t_u \change t_v} \\
= \frac{\partial^{2} }{\partial^{2} t_u t_v}|_{t_u, t_v = 0} f(x + t_u u + t_v v)$$.

#### Multi-Linear map from \htext{\\(V^k\\){V-k}}
Note that, as defined here, \\(D^2(f)(x)[u]\\) is a continuous linear functional, which when provided another argument \\(D^2(f)(x)[u][v]\\) maps to a scalar.

So, using an isomorphism, it is convenient to view \\(D^2(f)(x): V^{2} \to F\\).

Hence, \\(D^2(f): V \to L^{2}(V, F)\\), where \\(L^{k}(V, F)\\) is the space spanned by k-linear maps \\(g:V^{k} \to F\\). So, \\(D^2(f)\\) maps each point \\(x\\) to a bilinear map.

Similarly, kth order differential functions can be defined in general.

### Properties
#### Symmetry
\\(D^{k}f(x)\\) is symmetric, except in pathological cases which can be eliminated by a good definition. This may follow by looking at the form of \\(D^{2}f(x)[u, v]\\) described earlier: \\(lt_{t_i \to 0} \frac{f(x + \sum t_i v_i)}{t_1 t_2}\\).

#### Wrt basis vectors
The notation \\(D^{2}f(x)[e_i][e_j] = D_{ij}f(x)\\) is used.

### Tensor representation
\\(D^{2}f(x)[u][v] = \sum_{i, j} u_i v_j D_{i, j}^{2}f(x)\\). <div class="proof">By the distributive property of multilinear functions. This can also be proved by applying the chain rule, the directional linearity of the differential function and the linearity of the differential operator.</div>

Similarly \\(D^{k}f(x)\\) can be completely specified using kth order derivatives along the basis vectors.

#### 2nd order case
In the 2nd order case, this is aka Hessian matrix. \\(H_{i,j} = D_{i}D_{j}f(x)\\): Always symmetric. Aka \\(\gradient^{2} f(x) = \frac{\partial^{2} f(x)}{\partial x \partial x^{T}} = D \gradient f(x)\\), using the notation for derivatives of general vector to vector functions.

This matrix is important in tests for convexity at a critical point.

## Polynomial approximation
See the 1-D case in complex analysis ref.

Restrict \\(f\\) to a line \\(g(t) = f(a + t(x-a))\\). The polynomial approximation of this function leads us to: 
\\(f(a+v) = f(a) + \sum_{k \in ..n-1}\frac{1}{k!}D^{k}f(x)[v]^{k} + \frac{D^{n}f(c)[v]^{n}}{n!}\\) for some \\(c \in hull(a, a+v)\\) in the line segment.

\\(D^{k}f(a)[v]^{k}\\) is often written using the product of k vectors with a k-th order tensor.

### Polynomial approximation series
Aka Taylor series. Similarly, in the limit get: \\(f(x) = \sum_{|a|} D_a f(a)\\). Here we have used the multi-index notation described below.

#### Multi-index notation
Take \\(b \in Z_+^{n},\ x \in V\\). Then, \\(b! \dfn \prod b_i !,\ D_{b} \dfn D_{1}^{b_1}.., x^{b} = \prod x_i^{b_i}\\).

### Connection with extreme values
See optimization ref.


## Derivative matrix
### Motivation using directional derivatives
For every functional \\(f_i(x)\\), we have \\(D(f_i)(x)[v] = \dprod{\gradient f_i(x), v}\\). So, this single functional \\(D(f_i)(x)\\) is the row vector from the functional case.

### Arrangement as rows
So, due to the definition of the differential function of vector valued functions, \\(D(f)(x)[v] = Jv\\), where \\(J_{i, :} = D(f_i)(x)\\). So, \\(D(f)(x)\\) is completely specified by \\(J\\), which may remind one of the fact that every linear operator can be represented by a matrix vector product.

This is aka Jacobian matrix. Notation: \\(J_f(x) = Df(x) = \partder{(y_{1} \dots)}{(x_{1} \dots)}\\): \\(J_{i,j} = \partder{y_{i}}{x_{j}}\\).

### Note about dimensions
As explained in the case of derivatives of functionals, representations are secondary to the correctness of their values, and can be altered as necessary for convenience of expression. One must however pay attention to them to be consistent with other entities in the same algebraic expression.

## Differential operator
Linearity follows from linearity of functional derivatives.

### Row-valued functions
Sometimes, one encounters a function whose component functionals are arranged as a row vector \\((f(x))^{T}\\), rather than as a column vector \\(f(x)\\). Though the actual derivative is the same, for the sake of consistency (eg: when it one wants to apply the product rule: \\((x^{T}A)x\\) and consider \\(D(x^{T}A)\\)), one can simply compute \\([D_x(f(x))]^{T}\\).

### Product of functions
From scalar functional derivative product rule: \\(D_x f(x)^{T}g(x) = (D_x f(x))^{T} g(x) + f(x)D_x g(x)\\). Note that this results in a column vector.

### Composition of functions: chain rule
#### Directional differential functions
Take \\(h(x) = g(f(x))\\). Then \\(Dh(x)[v] = D(g)[f(x)]D(f)[v]\\).

<div class="proof">We want \\(Dh(x)\\) such that \\(lt_{t \to 0} g(f(x+tv)) = g(f(x)) + tDh(x)[v]\\). We get the result using similar definitions for small \\(t\\): \\(g(f(x+tv)) = g(f(x) + tD(f)(x)[v]) = g(f(x)) + tD(g)[f(x)]D(f)(x)[v]\\)</div>

#### In matrix representation
In terms of derivative matrices, this is a matrix product: \\(D(g)[D(f)(x)[v]] = J_g(f(x)) J_f(x) v\\)! Note that order matters: first differentiate wrt outer function, then wrt inner function.

+++(Observe how the dimensions match perfectly: for functional (function) compositions!)+++

### Linear and constant functions
\\(D(Ax)[v] = Av\\), and \\(D(Ax) = A\\): from the affine approximation definition of a derivative. \\(D(k) = 0\\).

## Non-triviality of inversion
COnsider \\(f(x) = Mx\\).

If J is square and M is invertible: \\(J_{M^{-1}} = \partder{(x_{1} \dots)}{(y_{1} \dots)} = J_{M}^{-1}\\): From inverse function thm \why. So, in general, \\(\partder{y_{j}}{x_{i}} = J_{j, i} \neq \frac{1}{\partder{x_{i}}{y_{j}}} = 1/J^{-1}_{i, j}\\) unlike 1-D eqn \\(\frac{dx}{dy} = \frac{1}{\frac{dy}{dx}}\\).
