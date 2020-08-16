+++
title = "3 Linear programming"
+++

## The problem
Minimize linear/ affine function over a polyhedron: ie subject to affine/ linear constraint functions.

### Canonical form
\\(\vec{x} \in R^{d}\\). \\(\min c^{T}x: Ax \leq b\\).

#### Nonnegative optimization form
\\(\min c^{T}x': Ax' \leq b\\), with \\(x' = \mat{x^{+}\\ x^{-}}\\); new constraints: \\(x' \geq 0\\), \\(x^{+} - x^{-} = 0\\).

#### Equality constrained form
Writable as \\(\min c^{T}x: Ax = b; \\)x\\( \geq 0\\), using slack variables.

### Constraints and the polyhedron
Every constraint is a halfspace. Intersection of halfspaces is a polyhedron; this is the \textbf{feasable region}.

### The solution
Want to find a point in the feasible region making the least angle/ inner product with \\(f\\).

#### Vertex in feasible region
Consider minimizing \\(f^{T}x\\) over a line segment (a, b): for any point in this segment, you have: \\(f^{T}(ta + (1-t)b) \leq \min \set{f^{T}a, f^{T}b}\\); so sufficient to consider end points while trying to minimize \\(f^{T}x\\) over any line segment in the feasible region. By induction, sufficient to consider vertices of the feasible polyhedron.


#### Pathological cases
\\(\min x\\), A is empty; and \\(\min \\)x\\(: x\geq 50\\): often ruled out by added resource constraints: \\(x\\) allowed to be only so small.

## Related problems
### Linear fractional program
Minimize linear fractional function over a polyhedron. Actually quasi-convex programming, but reducible to LP. Can rewrite \\(\min t: \frac{a^{T}x + b}{c^{T}x + d} \leq t\\) using linear constraints.

Similar is the case with generalized linear fractional program:\\ \\(\min t: (\max_i \frac{a_i^{T}x + b_i}{c_i^{T}x + d_i}) \leq t\\).

### 1, infty norm approximations
\\(\min_x \norm{Ax - b}_\infty \equiv \min c: Ax - b \leq c1, Ax - b \geq -c1\\).

\\(\min_x \norm{Ax - b}_1 \equiv \min c : Ax - b = t_+ + t_-; t_- \leq 0; t_+ \geq 0; 1^{T} t_+ - 1^{T}t_- \leq c\\). This tends to yield sparse solutions: consider the functioning of least angles regression to see why.

Similarly, can replace 1, \\(\infty\\) norm constraints in any LP.

### Robust linear programming
Often, there is uncertainty in constraints like \\(a_i^{T}x \leq b_i\\).

#### Deterministic model
x must be feasible \\(\forall a_i \in S\\). If S is an ellipse, this can be handled using SOCP.

#### Stochastic model
Feasible \\(x\\) must satisfy \\(Pr(a_i^{T}x \leq b_i) \geq t\\). If distribution is Gaussian, this can be handled using SOCP.

## LP Algorithms
### Exhaustive search alg
Find intersection of every set of d hyperplanes (constraints); see if it satisfies other constraints: \\(O(\binom{n}{d})\\).

### Simplex method
(Dantzig). Theoretically exponential, highly efficient in practice.

### Interior point projective method
(Karmarkar) LP solvable in time \\
\\(poly(n, d)\\).

