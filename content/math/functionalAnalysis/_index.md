+++
title = "+Functional analysis"
+++

## Function space
### Notation
Consider a function class $C$ defined on the input space $X$. Let $p$ be a probability measure on $X$.

### Euclidean Vector spaces
The definition of standard inner product and $l_p$ norms can be extended to work with function spaces, when they are regarded as vector spaces with dimensionality equal to $|X|$; while also considering the $p$. These are described in the vector spaces survey.

### Metric space using Disagreement probability
One can define a metric space using the norm $d(f, g) = Pr_p(f(x) \neq g(x))$.

### Measuring size of function class C
If $C$ is finite, we can simply use $|C|$. If $C$ is not finite, we can consider the metric space defined using the 'probability of disagreement' metric. In this space, one can use covering and packing numbers to measure the size of $C$. These concepts are described in the topology ref.

If $dom(f), \forall f \in C$ is the boolean hypercube, we can use some other ways of measuring complexity of $C$, these are described in the boolean functions survey.

#### For smooth functions: just measure size of the input space
For functions which satisfy Holder continuity generalized to sth derivative: (see topology ref): $\norm{f^{(s)}(x) - f^{(s)}(y)} \leq c \norm{x-y}^{a}$: $\log (N(\eps, $C$, \norm{})) \approx (\frac{1}{\eps})^{\frac{D}{s+a}}$. \pf: Take $\norm{f(x) - f(y)} \leq c \norm{x-y}$; \exclaim{now in input space, rather than in the function space!}; thence any $\eps$ covering of parameter space will define corresponding cover in the fn space.

#### Relationship with vcd of related binary classifiers
Let $G = \set{g:R^{D} \to [0, B]}$. Take set $G_t$ of binary classifiers defined by supergraphs of g: see boolean fn ref; let $d(G_t)$ be its VCD. Let $M$ be the packing number. $M(\eps,G, \norm{.}_{L_p(v)}) \leq 3(2e (\frac{B}{\eps})^{p} \log(3e(\frac{B}{\eps})^{p}))^{d(G_t)}$. So, $M \approx O((\frac{1}{\eps})^{d(G_t)})$. \why

## Operators
### Operator
A function: functions $\to$ functions. All functions are operators. Transform: an operator which simplifies some operations. Adjoint of operator T: $T^{*} : \dprod{Tu,v} = \dprod{u, T^{*}v}$.

#### Eigenfunctions
ev of D is $e^{x}$.

### Differential operator
D or $D_{x} = \frac{d}{dx}$. A Linear operator.

Operators $T = \sum_{k} c_{k}D^{k}$. Any polynomial in D with function coefficients also a diff operator.

#### Vector and matrix calculus operators
See linear algebra ref.

#### Divergence operator
$div f := \gradient . f:= \sum_{i} \partder{f}{x_{i}}$.

#### Laplacian and Elliptic operators
(Laplace) $\lap = \partdern{}{x_{1}}{2} + \partdern{}{x_{2}}{2}$. Elliptic op: $L = div (a\gradient)$: a is scalar.

### Integral operator
Aka Integral transform. $Tf(u) = \int_{t_{1}}^{t_{2}} K(t, u)f(t)dt$: changing the domain of the fn. K is the Kernel function or the nucleus of the transform. A Linear operator.

Symmetric kernels are indifferent to permutation of (t,u).

#### Inverse Kernel
$K^{-1}(u, t)$ yields inverse transform:\\
$f(t) = \int_{u_{1}}^{u^{2}} K^{-1}(u, t) (Tf(u))du$.

#### Convolution
$(f.g)(t) = \int_{-\infty}^{\infty}f(t)g(x - t)dt =  \int_{-\infty}^{\infty}f(x-t)g(t)dt$. 

You take a $g$, reflect it about 0, translate it by $t$. So, it is convoluted!

Properties: commutative, associative, distributive.

#### K(t, u) as a basis function
Maybe $\int_{t_{1}}^{t_{2}} ab dt$ specifies an inner product in a function space. Maybe K(t, u) specifies the form of basis functions in that space: so for a fixed u, you get a fixed basis fn. Maybe you are trying to find the form of the component of f(t) along the basis fn K(t, u). The integral transform is the solution. Eg: Fourier transform.

Or maybe, you have the form of the component f(u) along a certain basis fn K(u, t), and ye want to reconstruct the fn form f(t) from it. Then the inverse integral operator is useful. Eg: Inverse Fourier transform.

### Some vector differential operators
#### Jacobian matrix
Generalizes f'(x) for Vector map F. \\
Matrix $J = J_{F}(x_{1} \dots) = \partder{(y_{1} \dots)}{(x_{1} \dots)}$: $J_{i,j} = \partder{y_{i}}{x_{j}}$.

#### Hessian matrix
Of scalar f(x) wrt vector x: $H_{i,j} = D_{i}D_{j}f(x)$: Always symmetric. Aka $\gradient^{2} f(x)$.

If $\gradient^{2} f(x) > 0$ or +ve definite: f(x) convex, $\exists$ unique global minimum.

## Analysis of functions
### Polynomial fitting for continuous f(x)
$L^{2}[-1,1]$: Find closest n degree polynomial to f(t) in interval [u,v]: Project f(t) on that function sub-space: Let $A=[1 x \dots x^{n}]$ (Continuous version of Vandermonde matrix), a [-1,1]*n matrix; $\perp$ in [-1,1]. Solve $A^{*}A\hat{y}=A^{*}f(t)$; $A^{*}A$ a n*n (Hilbert) matrix with elements $\dprod{x^{r}, x^{s}}$. Orthonormalize A to get $\hat{Q}$; Q is scalar multiple of Legendre polynomials: $1, x .. $); use $P = \hat{Q}\hat{Q}^{*}$, a $[-1, 1] \times [-1,1]$ matrix.

### Fourier basis in the function space
#### Fourier basis for 2 pi periodic functions
##### Inner product
$\dprod{f, g} = (2\pi)^{-1}\int_{X} f(x)\bar{g(x)}dx$.

##### Orthogonal basis
For f having an interval or period $2 \pi$ : $X = [0,2\pi]$ or $X = [-\pi,\pi]$ or $X = [-\infty, \infty]$, for distinct $n, m \in Z^{+}$: $\cos nx \perp \cos mx \perp \sin nx \perp \sin mx$.

Also, for distinct $n, m \in Z: e^{inx} \perp e^{imx}$.

#### Fourier basis for 2L periodic functions
##### Inner product
$\dprod{f, g} = (2L)^{-1}\int_{X} f(x)\bar{g(x)}dx$. If this were not scaled, f(x) series could've been scaled.

##### Orthogonal basis
In general, if f has a period $X = [-L, L]$, for distinct $n, m \in Z: e^{inx\frac{\pi}{L}} \perp e^{imx\frac{\pi}{L}}$. Frequency spectrum: $\frac{n\pi}{L} \forall n \in Z$.

#### Fourier basis for N dimensional space
##### Inner product
Same inner product as in the case of 2L periodic functions. For different inner product space see boolean functions ref.

##### Orthogonal basis
f defined on $Z_{N}$. In general, if f has a period $X = [0, N-1]$, for distinct $n, m \in Z_{N}: e^{inx\frac{2\pi}{N}} \perp e^{imx\frac{2\pi}{N}}$.

#### Fourier Series
Project f(x) on $1, \sin nx, \cos nx$: $f(x) = a + s_{1} \sin x + c_{1} \cos x + s_{2} \sin 2x \dots$. $s_{n}=\frac{\dprod{f(x), \sin nx}}{\|\sin nx\|}$.

Also, $f(x) = \sum_{n = -\infty}^{\infty} \hat{f}(n)e^{inx}$. $\hat{f}(n) = \dprod{f, e^{inx}}$.

#### Fourier basis for non periodic functions
Use $X = [-\infty, \infty]$; compare with $X = [-L, L]$ case. Frequency spectrum becomes R. In this limiting case, coefficients F(w) correspond to Fourier transform. \why Inverse Fourier transform: $f(x) = \int_{x = -\infty}^{\infty} F(w) e^{iwx} dx$. \why

### Fourier transforms
#### Fourier Transform (FT)
Use $X = [-\infty, \infty]$; Let $\int_{X}|f(x)|dx <M$. Fourier transform of f(x) is $F(w) = \frac{1}{2 \pi} \int_{X} f(x)e^{-iwx} dx$. Similarly inverse FT.

A transformation from time domain fn to frequency domain fn. DFT used for practical purposes.

Fourier series of fn is the evaluation of Inverse FT for a particular fn.

#### Discrete Fourier Transform (DFT)
Use $X = [0, N-1]$ as a period of length N. See analysis for Fourier basis for 2L periodic fn. x measured at N points, so deal with N dim space: find the N Fourier components.  Or see this as approximating f by taking only n frequencies.

$F(n) = \sum_{x=0}^{N-1} f(x)e^{\frac{-2\pi}{N}inx}$. Inverse DFT: $f(x) = N^{-1}\sum_{n=0}^{N-1} F(n)e^{inx}$: an avg over many frequencies.

Use in frequency analysis and synthesis of signals.

Let $w_{n}=e^{-i\frac{2\pi}{n}} = 1^{-1/n}$; make Fourier matrix elements $F_{j,k}=w^{jk}$. F is a Vandermonde type matrix. Get N long sample vector c of f(x) in the interval X. Then, do Fc=y to find coefficients y.

Inverse DFT accomplished similarly with matrix $\bar{F}$.

$F\conj{F}=nI$: $w_{n}^{jk}w_{n}^{-jk} = 1$, $\sum_{l} w_{n}^{(j-k)l} = 0$.

#### Fast Fourier Transform (FFT) alg
Find $F_{n}c=y$ when $n=2^{l}$ (Naively $n^{2}$ mults).

##### Butterfly diagram
Important in understanding FFT. Input: n numbers c, Output n numbers y. Compute all these in $l$ steps, parallelly. 2 point FFT butterfly diagram. Combine them to get 4 point FFT diagram etc. : see top down view for decomposition.

##### Top down view
For $m=n/2$, $c' = c_{i}$ for even i, $c'' = c_{i}$ for odd i, Find $Fc'=y'$ and $Fc''=y''$, $y_{j} = \sum_{k}w_{n}^{2kj}c_{2k} + \sum_{k}w_{n}^{(2k+1)j}c_{2k+1} = y'_{j} + w_{n}^{j}y''_{j}$; . Do recursively until you hit the 2 point fourier transform.

FFT is a l-time factorization of Fc.

Extend to other prime factors of highly composite n. Divide and conquer! Opcount: $O(n \log n)$.

Inverse FFT is similar.

### Fourier analysis of Boolean fns
See Boolean fns ref.

### Approximation of functions, interpolation
See Approximation theory ref.
