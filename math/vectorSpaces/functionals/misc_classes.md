+++
title = "Misc classes"
+++

Misc R to R functions are described [elsewhere](/notes/math/complexAnalysis/R_valued_functions/R_to_R). 

## Important functionals
### Radial basis functionals
\\(f_{c}(x) = g(\norm{x - c})\\). Gaussian radial basis function is used to define the Gaussian kernel.

### Barrier functional
\\(f(x) \to \infty\\) as \\(x \to bnd(dom(f))\\). Eg: \\(\log (1-x)\\).

Used to charactarize feasible region in optimization problems. Any set in \\(R^{n}\\) is the domain as a barrier function.

## Kernel function k
Implicitly (perhaps non-linearly) map \\(x\\) to \\(\ftr(x)\\) and give \\(\dprod{x, x'}\\) in that space.

### Importance
See kernel trick in statistics ref.

### Kernel fn
\\(k(x, x') = \ftr(x')^{T} \ftr(x)\\): This can be -ve, but \\(k(x, x) \geq 0\\) for norm notion in ftr space: k must be +ve semi-definite. So its Gram matrix K whose elements are \\(k(x_{n}, x_{m})\\) must be +ve semidefinite for all choices of \\(\set{x_{n}}\\).

#### Association with kernels of integral transforms
See functional analysis ref. Integral transform: \\(T_{K}f(s) = \int_{x_{1}}^{x_{2}}K(x,s)f(x)dx\\). Inner product \\(\int f(x)g(x)dx = \sum_{s,t} f(s)g(t)\int K(x,s)K(x,t)dx\\): akin to inner product defined by gram matrix, which describes inner products between various basis vectors in the kernel space.

### Kernel properties
Linear kernel: \\(k(x, x') = x^{T}x'\\). Stationary kernel: \\(k(x, x') = k(x-x')\\); Homogenous kernel: \\(k(x, x') = k(\norm{x - x'})\\).

### Some kernels
Polynomial kernel (inhomogenous): \\((\dprod{x, x'}+1)^{d}\\); homogenous: \\((\dprod{x, x'})^{d}\\).

Hyperbolic tangent: \\(tanh(\dprod{kx,x'}+c)\\) for some \\(k>0, c<0\\).

#### Gaussian kernel
Using gaussian radial basis function:\\
 \\(k(x,x') = e^{-\norm{x - x'}^{2}/c}\\). Everything mapped to the same quadrant in the associated feature space, as \\(k(x, x') \geq 0\\).

## Self concordance
### Definition
#### R to R functions
\\(|D^{3}f(x)| \leq 2 D^{2}f(x)^{3/2}\\). This condition arises out of the need to bound the error term in the quadratic approximation to the functional \\(f\\).

#### Functionals: restriction to a line
Functional \\(f\\) is self concordant if \\(f\\) restricted to every line is self concordant.

### Examples in R
Linear, quadratic functions, -log \\(x\\).

### Invariance to operations
Let \\(f\\) be self concordant (sc).

If \\(a>1, af(x)\\) also sc. \\(f(Ax +b)\\) also sc.

### Importance
Any convex set is the domain of a self concordant barrier functional.
