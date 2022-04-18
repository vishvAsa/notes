+++
title = "Common problems"
+++

## Interpolation
See approximation theory ref.

## Root finding
Find \\(x: f(x) = 0\\).

### Newton's method
Find the root iteratively. Take a local linear approximation \\(g(x) = f(x_n) + \gradient f(x_n)^{T}(x-x_n)\\) for \\(f\\), find its root; and use it as the next guess for the root.

\\(x_{n+1} = x_{n} + \frac{f(x_{n})}{f'(x_{n})}\\). For vector function \\(f\\): \\(x_{n+1} = x_{n} + (\gradient(f(x_{n})))^{-1}f(x_{n})\\).

This becomes the Newton's method in optimization, when applied to solving for the optimality condition \\(\gradient f(x) = 0\\).

## Find numerical gradients
If f is a functional, do \\(\frac{(f(x + \change x_i e_i) - f(x - \change x_i e_i))}{2 \change x_i}\\). Useful in optimization program design to verify algebra used in gradient calculation.

## Partial differential equations
Strategy: discretize it: approximate it by equations with finite unknowns. A source of large and sparse matrix problems.

### Elliptic operator problems
Take bounded open set O in \\(R^{2}\\): visualize. (Poisson) \\(\lap u = f\\) for x in O. Special case: (Laplace) \\(f = 0 = \lap u\\) with harmonica functions as solutions.

Could model steady state heat distribution in O from constant heat source f.

#### Boundary conditions
Satisfied on boundary of O: \\
(Dirichlet) \\(u(x) = \phi(x)\\). Cauchy: \\(\partder{u}{n}(x) + a(x)u(x) = g(x)\\). Mixed: different conditions at diff boundaries.

Could model heat loss at boundary.

### Finite Difference method
Approximate f at discretized points by low order Taylor series expansions. n: number of discretization points. Fast solvers solve it in \\(O(n \log n)\\).

#### Fibonacci sequence: A difference equation
$u_{k+1} = \mat{F_{k+2}\\ F_{k+1}} \\
= \mat{ 1 & 1 \\ 0 & 1} \mat{F_{k+1}\\ F_{k}} =  Au_{k}\\(. So, \\)u_{k} = A^{k}u_{0} = SL^{k}S^{-1}u_{0} = SL^{k}c$.

### Initial value problem
Dynamical system, time t, position vector fn v(t): \\(\frac{dv_{1}(t)}{dt} = 4v_{1}(t) +4v_{2}(t), \frac{dv_{2}}{dt} = 12v_{1}(t)+4v_{2}(t)\\) , \\(v_{1}(0)= 8, v_{2}(0) =4\\); find v(t) for larger t's: find solutions of form \\(v(t) = e^{lt}y\\); use in orig eqns to get eigenvalue problem \\(4y_{1}+4y_{2} = ly_{1}\\), \\(12y_{1}+4y_{2} = ly_{2}\\) to find l's, y's and thence \\(v(t) = c_{1}e^{lt}y + c_{2}e^{l't}y'\\), solve c using v(0).

### Finite element method
Original fn replaced by fn which is globally smooth, but locally piecewise polynomial in cells such as triangles/ rectangles.

## Non negative matrix factorization
\\(A \approx BC; A: m \times n B: m \times k, C: k \times n\\), with \\(k< n, B \geq 0 , C \geq 0\\). Aka +ve matrix factorization. So, write each \\(a_{i}\\) as conic combination \\(a_{i} \approx \sum b_{k}c_{k,i}\\). Approximation measured by various metrics/ distortions.

Least squares NNMA: \\(\min_{B, C \geq 0} \norm{A - BC}_{F}^{2}/2\\); can add regularization parameters \\(\gl \norm{B}_{F}^{2} + \gm \norm{C}_{F}^{2}\\). \\(\norm{A - BC}_{F}^{2} = tr((A-BC)^{T}(A-BC))\\) convex in B individually as tr() is increasing and \\((A-BC)^{T}(A-BC)\\) is linear fn of B + quadratic fn of B; similarly convex in C. Not convex in BC \why.

\tbc

## n-body motion problem
Got n planets affected by each others' gravity, or n molecules affected by electrostatic forces. Want to compute new position after some time step.

Naively requires \\(O(n^{2})\\) ops: must consider all pairs of interactions.

### Fast multipole algorithms
Need only O(N) ops. Uses multipole expansions, like net charge etc to approximate effects of distant clusters over a body. A hierarchical decomposition of space is used.

