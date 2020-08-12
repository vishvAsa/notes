+++
title = "02 Operators"

+++
## Operator
A function: functions $\to$ functions. All functions are operators. Transform: an operator which simplifies some operations. Adjoint of operator T: $T^{*} : \dprod{Tu,v} = \dprod{u, T^{*}v}$.

### Eigenfunctions
ev of D is $e^{x}$.

## Differential operator
D or $D_{x} = \frac{d}{dx}$. A Linear operator.

Operators $T = \sum_{k} c_{k}D^{k}$. Any polynomial in D with function coefficients also a diff operator.

### Vector and matrix calculus operators
See linear algebra ref.

### Divergence operator
$div f := \gradient . f:= \sum_{i} \partder{f}{x_{i}}$.

### Laplacian and Elliptic operators
(Laplace) $\lap = \partdern{}{x_{1}}{2} + \partdern{}{x_{2}}{2}$. Elliptic op: $L = div (a\gradient)$: a is scalar.

## Integral operator
Aka Integral transform. $Tf(u) = \int_{t_{1}}^{t_{2}} K(t, u)f(t)dt$: changing the domain of the fn. K is the Kernel function or the nucleus of the transform. A Linear operator.

Symmetric kernels are indifferent to permutation of (t,u).

### Inverse Kernel
$K^{-1}(u, t)$ yields inverse transform:\\
$f(t) = \int_{u_{1}}^{u^{2}} K^{-1}(u, t) (Tf(u))du$.

### Convolution
$(f.g)(t) = \int_{-\infty}^{\infty}f(t)g(x - t)dt =  \int_{-\infty}^{\infty}f(x-t)g(t)dt$. 

You take a $g$, reflect it about 0, translate it by $t$. So, it is convoluted!

Properties: commutative, associative, distributive.

### K(t, u) as a basis function
Maybe $\int_{t_{1}}^{t_{2}} ab dt$ specifies an inner product in a function space. Maybe K(t, u) specifies the form of basis functions in that space: so for a fixed u, you get a fixed basis fn. Maybe you are trying to find the form of the component of f(t) along the basis fn K(t, u). The integral transform is the solution. Eg: Fourier transform.

Or maybe, you have the form of the component f(u) along a certain basis fn K(u, t), and ye want to reconstruct the fn form f(t) from it. Then the inverse integral operator is useful. Eg: Inverse Fourier transform.

## Some vector differential operators
### Jacobian matrix
Generalizes f'(x) for Vector map F. \\
Matrix $J = J_{F}(x_{1} \dots) = \partder{(y_{1} \dots)}{(x_{1} \dots)}$: $J_{i,j} = \partder{y_{i}}{x_{j}}$.

### Hessian matrix
Of scalar f(x) wrt vector x: $H_{i,j} = D_{i}D_{j}f(x)$: Always symmetric. Aka $\gradient^{2} f(x)$.

If $\gradient^{2} f(x) > 0$ or +ve definite: f(x) convex, $\exists$ unique global minimum.
