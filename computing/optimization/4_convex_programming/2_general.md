+++
title = "2 General"
+++

## The problem
### Importance, efficient solvability
Superset of LP. Many problems in nature are convex optimization problems. Many non-convex problems have convex equivalents : see section on modelling/ specifying optimization problems.

(Nesterov, Nemorinsky) For any convex optimization problem, there exists self concordant barrier functions; so interior point methods and barrier methods can be made applicable: This is a non constructive proof. So, there exists a polynomial time algorithm for every convex optimization problem, but you will find it with certainty only if you can find these self concordant barrier functions.

### Standard form
\\(\min f_0(x): f(x) \leq 0, Ax = b\\).

All \\(f_i(x)\\) are convex.

### Convexity of feasible region X
Optimization fn is convex, constraint sets are convex sets. So, X is convex.

#### Geometry
\\(\gradient f_0(x^{*})\\), if \\(\neq 0\\), defines supporting hyperplane for X at \\(x^{*}\\). Imagine contours of \\(f_0\\), with minimum outside X, colliding with X at some point \\(x^{*}\\).

### Identifying convex opt problems
#### Check Convexity of fesible regions
Maybe compare with known convex sets (see vector spaces survey).

##### Any equality constraints should be linear.
Eg: \\(x: h_i(x) = b\\) not a convex set when \\(h_i(x)\\) is a quadratic fn. These could be replaced by 2 inequality constraints in the standard form; both of which would need to represent convex sets.

### Properties
#### Local optimum is the global optimum
By contradiction: Take radius R local optimum x; suppose there were y more than R away from \\(x\\) with \\(f_0(y) < f_0(x)\\); then, can conjure a point z, a convex combination of y, \\(x\\) which is less than R away from \\(x\\) with \\(f_0(z) < f_0(x)\\).

#### Lagrangian dual functional
Can easily get the Lagrangian dual functional: \\(g(l, m) = \inf_x L(x, l, m)\\) by setting \\(\gradient_x L() = 0\\) and eliminating \\(x\\) from L(x, l, m).

#### Certificate of optimality with strong duality
Aka KKT certificate. If feasible \\((x', l', m')\\) satisfy KKT conditions, they are optimal. THis is a good way of solving convex optimization problem.

Pf: From complimentary slackness: \\(f_0(x') = L(x', l', m')\\); from the optimality condition and convexity of \\(f\\), \\(f_0\\): \\
\\(g(l', m') = \inf_x L(x, l', m') = L(x', l', m') = f_0(x')\\). So, \\(x'\\) is optimal.

#### Bound norm of solution
All sublevelsets of \\(f_0\\) are convex. So, find a ball \\(\set{x: f_0(x) \leq B > p^{*}}\\) which includes \\(0\\); then we can say that \\(\norm{x} \leq 2B\\).

Eg: This technique was used in bounding the deviation of the solution of a l1 regularized logistic regression problem from the actual parameters defining an ising model by pradeep etal.

### Dual problem
Strong Duality usually holds. 'Constraint qualifications' can tell you whether strong duality holds.

#### Strict feasibility Constraint qualification
(Slater) If there exists  some strictly (primal) feasible \\(x\\), strong duality holds. \exclaim{This is very general: some strictly feasible \\(x\\) should exist!} Generalizable to convex programs specificed using conic inequalities.

Actually, can relax constraint qualification to: \\(\exists x: \\)x\\( \in relint(D)\\) wrt affine plain \\(Ax - b = 0\\).

\exclaim{Applies to convex conic inequality constraints too!} Also, this is a way to get strong duality without using the global optimality criteria perspective.

##### From supporting hyperplanes view
Consider the supporting hyperplanes view of the dual problem (see dual problem section). For convex optimization problems, convexity of \\(f\\), \\(f_0\\) ensures that  \\(G = \set{(u, t)| f_0(x) \leq t, f(x) \leq u}\\) is convex. So, supporting hyperplane at \\((0, p^{*})\\) for both G and \\\\(G'=\set{(u, t)| f_0(x) \leq t, f(x) \leq 0}\\) are the same. 

When the primal is strictly feasible, the supporting hyperplane at \\((0, p^{*})\\) is non vertical; so intercept with \\(f_0\\) axis is well defined; and the dual problem is feasible. Thence, slater's condition.

## Unconstrained problems: algorithms
### Problem, algorithm framework
#### Problem, Assumptions
Problem: \\(min_x f(x)\\), f convex.

#### Algorithm framework
Produce sequence \\(x^{(k)} \in dom(f), k\in Z_+\\): \\(f(x^{k}) \to p^{*}\\). Input to algorithm: starting point \\(x^{(0)}\\).

Alternate notation: \\(x^{+}\\) for current iterate.

##### As Iteratively solving gradient eqns
Can be interpreted as iterative methods\\
 for solving optimality condition \\(\gradient f(x) = 0\\): a set of non-linear equations.

#### Common assumptions
##### Assumptions about f
f is twice continuously differentiable, so dom(f) is open.

\\(p^{*}\\) is attained.

###### Strong convexity
If f is strongly convex, \\(f(x) - p^{*} \leq (2m)^{-1}\norm{f(x)}_2^{2}\\); so RHS can be used as a stopping criterion.

Also guarantees that sublevelsets are bounded: \\(f(y)\geq f(x) + \gradient f(x)^{T}(y-x) + \frac{m}{2}\norm{x-y}_2^{2}\\); this ensures faster convergence.

##### Initial point: Assumptions
\\(x^{(0)} \in dom(f)\\).

Sublevel set \\(S = \set{x: f(x) \leq f(x^{(0)})}\\) is closed. This is hard to verify usually, except when all sublevel sets are closed \\(\equiv\\) epigraph of f is closed. This is needed, because some methods try to draw secants in the epigraph of f(x).

### Descent methods
#### Algorithm
\\(x^{(k+1)} = x^{(k)}+ t^{(k)}\change x^{(k)}\\) with \\(f(x^{(k+1)}) < f(x^{(k)})\\); do this repeatedly until stopping criterion is met, in each iteration: finding step or search direction \\(\change x\\), the step size/ length t.

This is guaranteed to eventually come arbitrarily close to the minimum.

##### Descent direction
\\(\change x\\) is a descent direction if \\(\gradient f(x)^{T}\change x < 0\\).

#### Find search direction
\label{descent:Search Direction}
See later sections.

##### Search direction from optimality conditions of approximation
Aka Newton equations in some cases.

Maybe model f(x) with \\(\hat{f}(x)\\), to find a search direction: find the optimality conditions for minimizing \\(\hat{f}(x)\\) or f(x) and find \\(\change x\\) which does this exactly or approximately.

For examples, see section on 2nd order approximation descent.

#### Line search for t
##### Restriction to a slice
\\(g(t) = f(x+ t \change x)\\) is f restricted to a slice along \\(\change x\\). This is convex as f is convex.

###### Visualization
Plot \\(g(t)\\) vs t, try to find \\(t\\) which minimizes this.

##### Exact line search
\\(t = \argmin_{t>0} g(t)\\). This is usually expensive.

##### Backtracking
Parameters: \\(a \in (0, 1/2), b \in (0, 1)\\); b is the shrinkage parameter.

Start with t=1 (or small enough \\(t\\) to guarantee that \\(x + t\change \\)x\\( \in dom(f)\\)), repeat \\(t \dfn bt\\) until stopping criterion is met:
\\(f(x + t \change x) < f(x) + at\gradient f(x)^{T} \change x\\). With shrinkage of t, the RHS reduces. This is aka Armijo's rule.

Can be rewritten as \\(f(x + t \change x)- f(x) < ah(t)\\), where h(t) is the change in f for t, according to a linear approximation of \\(f\\). This form is useful when f() is composed of differentiable and non-differentiable parts.

###### Guaranteed reduction in objective
As \\(\change x\\) is a descent direction, \\
\\(\gradient f(x)^{T} \change x < 0\\).

So, when \\(f(x + t \change x) < f(x) + at\gradient f(x)^{T} \change x\\), we have \\(f(x + t \change x) < f(x)\\), so it is a step size which definitely reduces f().

Such a \\(t\\) will always exist: you keep decreasing \\(t\\) until that happens.

###### As secant in epigraph of g(t)
Take \\(g(t):R \to R\\): one dim fn. Consider \\(\gradient_t g(t)\\) at t=0. 
\\(\gradient_t g(0) = \gradient_x f(x) \change \\)x\\( \leq 0\\). \\(g(0) + at\gradient_t g(0) = f(x) + at\gradient f(x)^{T} \change x\\), when a=1, is the tangent to g(t) at t=0, and therefore to f(x). \\(f(x) + at\gradient f(x)^{T} \change x\\), for \\(a<1\\) is such a secant: you are making the slope less negative.

x changes along the search direction only, but you change \\(t \in [0, t_{0}]\\), to get \\(t\\) which is close (from below) to the intersection of a secant in the epigraph of g(t) with g(t).

As \\(f(x) + at\gradient f(x)^{T} \change x\\) is a secant, for the stopping condition should be met for some \\(t\\) if \\(\change x\\) is indeed a descent direction. This ensures that \\(t\\) is such that \\(f(x + t \change x) - f(x) \approx  at\gradient f(x)^{T} \change x\\), the improvement achieved by using a secant.

###### Variants
Rather than ensure that \\(t\\) is such that \\
\\(f(x + t \change x) - f(x) \approx  ah(t)\\), the improvement achieved by using a secant; one can use second order approximations instead to define h, rather than a linear approximation: this perspective is different from the 'secant view'.

##### Arbitrary choice
Using backtracking rule or doing exact search during line search guarantee reduction in the objective (and therefore convergence), but they can be expensive. An alternative can be to just use 1 as the step length.

The cost of doing so is that convergence is no longer guaranteed: it is possible for example that, taking the step 1 repeatedly, one cycles between the same pair of points between which lies the optimal point. However, in practice, convergence is usually observed.

This technique is used, for example, in \\
'iterateively reweighted least squares', where each step involves solving a least squares problems (which may correspond to the local 2nd order approximation).

### Steepest descent
Aka Gradient descent.

#### As 1st order approximation minimization
As \\(f(x + v) = f(x) + \dprod{\gradient f(x), v}\\), minimize \\(\dprod{\gradient f(x), v}\\) - Also see geometric view section.

#### Descent direction
For a given \\(\norm{.}\\), \\(\change x = \argmax_{v: \norm{v} = 1} \dprod{-\gradient f(x), v}\\).

\\(\dprod{\gradient f(x), v}= -\dprod{\gradient f(x), -v} = -\norm{\gradient f(x)}_*\\). \exclaim{So this is a descent direction!}

#### Stopping criterion
Use \\(\norm{\gradient x} \leq \eps\\) as stopping criterion.

#### Convergence
\\(f(x^{(k)}) - p^{*} \leq c^{k}(f(x^{(0)}) - p^{*})\\). \why

#### Geometric view
##### 2-dim functional example
Consider contours/ level sets of \\(f:R^{2} \to R\\). The level set \\(\set{x:f(x) = t}\\) surrounds \\(\set{x:f(x) = t-1}\\); etc.. At \\(x: f(x) = t\\), the \\(\gradient f(x)\\) is perpendicular to level set \\(\set{x:f(x) = t}\\), pointing away from \\(\set{x:f(x) = t-1}\\); and so is the gradient descent direction; but it points towards \\(\set{x:f(x) = t-1}\\).

##### Goodness for circular level set case
If the level set contours are circular, then \\(-\gradient f(x)\\) points straight towards the minimum level set. But, consider an ellipsoid. Then, \\(-\gradient f(x)\\) is passes through a few level sets \\(\set{x:f(x) = t' < t}\\), but it misses many smaller level sets. Eg: imagine level sets which are shaped like concentric rounded triangles.

##### Zig-zagness of path towards optimum
In this case, despite finding the best step size, the sequence of points produced is not a direct line towards \\(x^{*}\\), but forms a zig-zag path.

##### Implications of choice of norm
If you choose a good \\(\norm{.}\\), the shape of whose unit ball approximates the shape of the level sets/ contours, \\(\change x\\) will be such that it points towards the minimal contour of \\(f\\), while still having a large enough inner product with \\(-\gradient f(x)\\) to guarantee that it is a descent direction. So, you can get to \\(x^{*}\\) more directly.

But, if you pick a bad norm, Eg: \exclaim{\\(\norm{}_2\\) which results in a reduction to gradient descent}, the path to \\(x^{*}\\) is longer.

### 2nd order approximation descent
Aka Newton method (reason described below), but not Gauss-Newton method, which is a further approximation and is specific to least squares problem.

#### General search direction
Take \\(f_0(x+d) \approx f_0(x) + x^{T}\gradient f(x) + x^{T}Hx\\) for some \\(H \succeq 0\\). If \\(H\\) is the 2nd order derivative, this is the Newton method described later. Often \\(H\\) is an easily computed approximation of \\(\gradient^{2}f_0(x)\\).

#### Search direction from Hessian
\\(\change x = -\gradient^{2}f(x)^{-1} \gradient f(x) \\). Minimized 2nd order approximation: \\(\hat{f}(x + v) = f(x) + \dprod{\gradient f(x), v} + 2^{-1} v^{T}\gradient^{2}f(x)v\\). So, \\(f(x)\\) approximated with a quadratic curve!

This is Aka Newton's method, as it corresponds to solving for the root of the optimality condition \\(\gradient f(x) = 0\\).

##### Solving Newton equations fast
Solving the linear system of equations: \\(\change x = -\gradient^{2}f(x)^{-1} \gradient f(x) \\) can be expensive in general: \\(O(n^{3})\\). But, in practice, one can often exploit structure  in the \\(\gradient^{2}f(x)^{-1}\\) matrix to find the (possibly approximate) search direction fast - this is very important. Can often use iterative methods to solve this.

##### Correctly computing gradient and Hessian
See comments from the gradient descent case.

#### Geometric view
Consider the 2-dimensional example described in the 'geometric view of steepest descent' section.

##### Local approximation by ellipses
Note: picking \\(\norm{x} = (\dprod{x^{T} Px})^{1/2}\\) for \\(P \succeq 0\\) yields ellipsoid unit balls. This can be thought of taking: \\(\hat{f}(x + v) = f(x) + \dprod{\gradient f(x), v} + 2^{-1} v^{T}Pv\\) and using \\(\inf_v \hat{f}(x + v)\\) as the search direction. 

##### 2nd order approximation ellipses
Choosing \\(\norm{x} = (\dprod{x^{T} \gradient^{2}f(x)x})^{1/2}\\), the local Hessian norm, results in reduction to 2nd order approximation descent. To see this, consider the 'constraints in the objective' form of \\(\change x = \argmax_{v: \norm{v} = 1} \dprod{-\gradient f(x), v}\\).


#### Affine invariance
The newton method is supposed to be invariant to affine transformation of the input: can confirm by computing \\(\gradient\\) and \\(\gradient^2\\) for \\(f(Ax' + b)\\) and \\(f(x)\\), where \\(Ax' + b = x\\). 

#### Stopping criterion: Affine invariant 
Take \\(\gl(x) = (\gradient f(x)^{T} \gradient^{2}f(x)^{-1}\gradient f(x))^{1/2} = (-\gradient f(x)^{T}\change x)\\), use \\(\gl(x) \leq \eps\\).

Estimates proximity to \\(x^{*}\\): \\(f(x) - \inf_y \hat{f}(y) = 2^{-1}\gl(x)^{2}\\): from simple substitution.

Equals length of \\(\change x\\) in the local Hessian norm : see steepest descent connection.

Also measures the \\(\change x\\) directional derivative, \\(\gradient f(x)^{T} \change x = -\gl(x)^{2}\\). So, it measures how close \\(\gradient f(x)\\) is to being 0, as it is at \\(x^{*}\\).

This is also affine invariant, unlike \\(\norm{x}\\). Pf: Consider x = Ax' +b. Consider \\(D_{x'}f(Ax'+b) = D_{Ax'+b}f(Ax'+b)A = D_{x}f(x)A\\); thence get \\(\gradient_{x'} f(Ax'+b)\\), and thence \\(\gradient_{x'}^2 f(Ax'+b) = D_{x'} \gradient_{x'} f(Ax'+b)\\).

#### Speed: comparison with 1st order methods
Computing the search direction makes 2nd order methods slow in general; but if some structure in \\(\gradient^{2}f(x)\\) is exploited to make this faster, it becomes very fast.

Each iteration of 1st order methods are usually much faster, but many more iterations are required.

#### Convergence: classical bounds
##### Assumptions
f strongly convex with constant m.

\\(\gradient^{2} f\\) is Lipschitz continuous. This measures how well f(y) can be approximated by the quadratic functional \\(f(x) + \gradient f(x) (y-x) + 2^{-1}(y-x)^{T} \gradient^{2}f(x) (y-x)\\).

\\(\exists \gh \in [0, m^{2}/L], \gamma > 0\\).

##### Linear decrease phase
Aka Damped Newton Phase. \\(\norm{\gradient f(x)} \geq \gh \implies f(x^{(k+1)}) - f(x^{(k)}) \leq -\gamma\\). Linear decrease in objective value.

This phase ends after atmost \\(\frac{f(x^{(0)} - p^{*})}{\gamma}\\) iterations.

Most iterations require backtracking search.

##### Quadratically convergent phase
\\(\norm{\gradient f(x)^{(k)}} \leq \gh \implies \frac{L}{2m^{2}}\norm{\gradient f(x^{(k+1)})} \leq (\frac{L}{2m^{2}}\norm{\gradient f(x^{(k)}})^{2}\\). Quadratic decrease in gradient size.

So, for \\(l>k\\): \\(\frac{L}{2m^{2}}\norm{\gradient f(x^{(l)})} \leq 2^{-2^{(l-k)}}\\).

All iterations use step size \\(t=1\\)! \why 

\exclaim{Observing these on a (maybe log) residue vs iteration and step size vs iteration plots is a good way of verifying correct implementation of gradients etc..!}

##### Overall bounds, defects
To achieve \\(f(x) - p^{*} \leq \eps\\): \\(\frac{f(x^{(0)} - p^{*})}{\gamma} + \log \log (\eps_0/ \eps)\\) iterations needed, where \\(\eps_0 = f(m, L)\\) too.

Provides qualitative insight into behaviour of 2nd order approx descent.

But, constants m, L are usually unknown: so cannot say beforehand when convergence will happen.

Bounds are not affine invariant, even though the 2nd order approx descent method is.

#### Convergence for self concordant functions
(Nesterov, Nemorinsky) Get better bounds, which don't suffer from the defects of classical analysis.

### Alternating minimization
Consider f(x, y); repeat these steps: \\
\\(x \assign \argmin_x f_0(x, y), y \assign \argmin_y f_0(x, y)\\). Guarantees that the objective is reduced in each iteration.

When minimization is done one coordinate at a time, it is called coordinate descent; if it done one coordinate-set at a time, it is called block-coordinate descent.

### Diagnosing error in code
#### Incorrect gradient computation: symptoms
Often algebraic mistakes happen while computing the gradient.

To detect such a case, compare with the numerically computed gradient: See numerical analysis survey.

Or, observe that the step size found in the direction of the gradient is very small.



## Equality constrained problems
### Problem, assumptions
\\(\min f(x): Ax = b\\). So, optimality conditions: \\(\gradient f(x^{*}) + A^{T}v^{*} = 0\\).

#### Common Assumptions
f is twice differentiable, A has full row rank: can always get an equivalent problem which satisfies this.

Optimum \\(p^*\\) is attained.

### Solution strategies
#### Reduction to unconstrained optimization
\\(\min f(x): Ax = b \equiv \min f(Hv + x')\\), where \\(Ax' = b\\), H spans null(A).

#### Search direction from optimality conditions of approximation
See \ref{descent:Search Direction}.

For examples, see section on 2nd order approximation descent.

#### Local approximation by ellipsoid
Minimize \\(f(x + \change x) \approx \hat{f}(x + \change x) = f(x) + \gradient f(x)^{T}v + 0.5 \change x^{T} P\change x\\) subject to \\(A(x + \change x)= b\\), for \\(P \succ 0\\). From optimality conditions for minimum of this approximation, get search direction: \\(\mat{P & A^{T}\\ A & 0} \mat{\change \\)x\\( \\ w} = \mat{-\change f(x) \\ 0}\\).

#### 2nd order approximation descent
Aka Newton method. Minimize \\(f(x + \change x) \approx \hat{f}(x + \change x) = f(x) + \gradient f(x)^{T}v + 0.5 \change x^{T} \gradient^{2}f(x) \change x\\) subject to \\(A(x + \change x)= b\\). 

##### Search direction
From optimality conditions for minimum of this approximation, get search direction: \\(\mat{\gradient^{2}f(x) & A^{T}\\ A & 0} \mat{\change \\)x\\( \\ w} = \mat{-\change f(x) \\ 0}\\).

###### Solving linear equation fast
Solving this linear equation can be slow in general: \\(O(n^{3})\\); but as in the unconstrained case, if you can exploit some special structure in the LHS matrix - maybe to find approximate search direction, search direction can be found fast : see unconstrained case for details.

##### Line search maintains feasibility
\\(\change \\)x\\( \in null(A)\\), so \\(t\change x\\) found during line search remains feasible. \exclaim{Feasibility always maintained!}

##### Affine invariant stopping criterion
Use \\(\gl(x) = (\change x^{T} \gradient^{2}f(x) \change x)^{1/2} = (-\gradient f(x)^{T}\change x)^{1/2}\\). Use last term to compare with stopping criterion for unconstrained minimization case. In general, it is not same as \\(\change x^{T} \gradient^{2}f(x) \change x\\).

Justification for use of \\(\gl(x)^{2}/2\\) as stopping criterion: Just as in the unconstrained case, \\(f(x) - p^{*} \approx f(x) - \inf_{Ax = b}\hat{f} = 2^{-1}\gl(x)^{2}\\); and \\(-\gl(x)^{2}\\) is also the directional derivative along \\(\change x\\).

##### Analysis: Use Newton method on equiv unconstrained problem
Take \\(\min f(x): Ax = b \equiv \min f(Hv + x')\\) form. \\(x^{(t)} = Hv^{(t)}+x'\\). So, analysis of convergence of unconstrained problem applies here too!

##### Using infeasible start
###### Primal, dual variable update view
Take residue \\(r(x, m) = (\gradient f(x) + A^{T}m, Ax-b)\\), solve the vector optimization problem: \\(\min_{x, m} r(x, m)\\): so, minimizing the objective while maintaining constraint, but also getting close to feasibility. Try to get \\(r(y + \change y) \approx r(y) + Dr(y)\change y = 0\\). So, use search direction from solving: \\
\\(\mat{\gradient^{2}f(x) & A^{T}\\ A & 0} \mat{\change \\)x\\( \\ w} = -\mat{\change f(x) \\ Ax - b}\\), with \\(w = \\)m\\( + \change m\\), the new guess for the dual variable.

Compare with search direction in feasible start case, note the change in last element of RHS.

\exclaim{Not a descent alg: \\(f(x^{+}) \leq f(x)\\) possible!}

###### Line search
Backtracking line search is conducted on \\(\norm{r(y)}\\). Stopping condition for line search: \\(\norm{r(y + \change y)} \leq (1 - \ga t)\norm{r(y)}\\), for a certain \\(\ga\\). So, stopping criterion becomes stricter as \\(t\\) increases.

###### Stopping criterion
Ax = b and \\(\norm{r(y)} \leq \eps\\).

###### Switch to feasible start alg
As soon as you get \\(x^{(k)}: Ax^{(k)} = b\\), switch to feasible start version of the algorithm: often ensures faster descent.

## Inequality constrained problems
### Barrier methods
#### Make inequality constraints implicit
Consider constraint \\(f_i(x) \leq 0\\). Can make this constraint implicit by including barrier functional \\(-\gf(x)\\) in the objective \\(f_0'(x)\\): now, the constraint is enforced by thus constraining the \\(dom(f_0(x))\\).

##### Motivation using indicator fn
The best log barrier to use is actually an indicatior function \\(\gf(x) = I_{f_i(x)\leq 0}\\) which is 0 if \\(f_i(x)\leq 0\\), \\(\infty\\) otherwise.

##### Logarithmic barriers
As \\(t \to \infty\\), get \\(-t^{-1}\sum_i \log -f_i(x) \approx I_{f_i(x)\leq 0}\\). So, \\(\gf(x) = \sum_i \log f_i(x)\\). This is a good barrier functional, as it is convex, twice continuously differentiable.



#### Optimize both distance to log barrier and f0
Take problem in standard form. Solve the vector optimization problem: \\
\\(\min (f_0(x), -\gf(x)) : Ax = b\\), where \\(\gf(x) = \sum \log(-f_i(x))\\) is the log barrier, which is convex from composition rules.

##### Tradeoff: minimizing f0 and repulsion from barrier
Scalarize this to get the objective \\(\min g(t) = \min \\)t\\( f_0(x) - \gf(x)\\): aka the centering problem. This is an equality constrained convex optimization problem. Bigger \\(t\\) tends to favor minimizing \\(f_0(x)\\), while allowing \\(x\\) to get closer to the barrier \\(f(x) = 0\\).

For \\(t\\) large enough, letting \\(x\\) get closer to the barrier does not affect the minimization of \\(f_0(x)\\) : maybe minimum is acheived at a point where some constraints are inactive.

##### Barrier algorithm
Start with some t. Solve the centering problem specified by t. Grow \\(t\\) by \\(\gm \approx 20\\). Repeat until stopping criterion is satisfied.

##### Interpretation using Lagrangian
Take the optimality condition : \\
\\(\gradient f_0(x^{*}) +t^{-1}\sum_i (-f_i(x^{*}))^{-1}\gradient f_i(x^{*}) + t^{-1}A^{T}m^{*}\\).

This can be seen as the minimum of a Lagrangian-like function: \\(L(x, l, m) = f_0(x) + \sum_i l_i f_i(x) +  m^{T}Ax\\), with \\(l \geq 0\\). The optimal values are: \\
\\(l_i^{*} =  t^{-1}(-f_i(x^{*}))^{-1} \geq 0, A^{T}m^{*} = 0\\).

So, \\(p^{*} \geq g(l^{*}(t), m^{*}(t)) = L(x^{*}(t),l^{*}(t), m^{*}(t)) = f_0(x^{*}(t)) - m/t\\). m/t is the duality gap, goes to 0 as \\(t \to \infty\\). So, \\(x^{*}(t) \to x^{*}\\) as \\(t \to \infty\\). \exclaim{Can use m/t as stopping criterion!}

##### Primal, dual points on the central path
\\((x^{*}(t))\\) are primal points on the central path. \\((l^{*}(t), m^{*}(t))\\) are dual points on the central path. 

## Ideas for faster solution
To reduce the time taken to solve the convex optimization problem, you reduce : a] the time taken per iteration b] the number of iterations by using a clever initialization point.

### Solving using the dual function
Take primal \\(\min f_{0}(x): \set{f_{i}(x) \leq 0}, \set{h_{i}(x) = 0} \\); Get Lagrangian: \\(L(x, l, m)\\); get \\(g(x) = \inf_x L(x, l, m)\\); Solve \\(\max_{l, m} g(l, m)\\); derive \\(x^{*}\\) from \\(l^{*}, m^{*}\\).

Make extra inferences using KKT conditions.

### Warm start
Can use the solution of a closely related optimization problem to solve the current problem. This idea is used in barrier method!

Sometimes this gives a better solution as using a bad initialization point would have returned a relatively worse solution due to the number of iterations exceeeding the limit specified in the maxiter parameter passed to the solver.


\part{Classes solved with convex programming}
## Quasiconvex optimization problem
\\(f_0\\) is quasi-convex, \\(f_i(x)\\) are convex. Epigraph form: \\(\min t: f_0(x) \leq t; f(x) \leq 0, Ax = b\\).

This can have locally optimal points which are not globally optimal: there can be plateaus: from properties of quasiconvex fn.

### Generality of constraints
Can replace all quasi-convex sublevel sets, which are convex sets, with sublevel sets of convex functions. Eg: Consider the case of the linear fractional programs.

### Solution using bisection
Take the epigraph form, fix t. Can solve this using bisection (see another section), with each optimization problem being solved using convex programming.

## Second order cone program (SOCP)
Minimize a linear functional : \\(f^{T}x\\) subject to Fx = g and second order cone constraints.

Eg: used in robust linear programming.

### Second order cone constraints
\\(\norm{A_i x - b_i}_2 -(c_i^{T} x + d_i)\leq 0: A_i \in R^{n_i \times n}\\). This is obviously a convex constraint as the LHS is a sum of a convex function and a linear function. But squaring both sides is not a good way of showing convexity of the feasible set.

\\((A_i \\)x\\( - b_i, c_i^{T} \\)x\\( + d_i)\\) distinguishes part of a second order cone in \\(R^{n_i + 1}\\).

### Generality
Generalizes LP:  Take \\(n_i = 0\\).

When \\(c_i = 0\\), becomes QCQP. Does it generalize all QCQP? \chk

## Conic inequalities convex program
Consider proper cones \\(K_i\\). Then, let objective \\(f_0\\) remain convex, have equality constraints \\(Ax = b\\), but specify constraints using generalized convex functions: \\(f_i(x) \preceq_{K_i} 0\\). This is still a convex program as suvblevelsets of the above continue to be convex.

Strong duality holds if Slater's constraint qualification holds.

### Conic form problem
Extends LP using conic inequalities: \\(Fx + g \preceq_K 0\\).

### Semidefinite programming (SDP)
Minimize linear fn \\(c^{T}x\\) subject to linear matrix inequalities (LMI) involving symmetric matrices (see matrix algebra survey). Can collapse n LMI's into a single LMI \\(A_0 + \sum x_iA_i \preceq 0\\) by increasing the matrix size n times.

LMI's define convex sets. Can also be viewed as a convex optimization problem specified using conic inequalities.

#### Generality
SOCP, which includes LP, can be reduced to SDP. Can replace second order cone constraint with $\mat{(c_i^{T}x + d_i) & A_ix + b_i\\
(A_ix + b_i)^{T} & (c_i^{T}x + d_i)} \succeq 0$. \why

So, can flexibly specify SDP with semidefinite cone, quadratic cone, linear inequalities' constraints; so called SQLP.

#### Recognizing SDP's
First, can try manipulating objective to be a linear functional, perhaps by taking the epigraph form. Then, \\(A \preceq 0\\) with \\(A_{i,j} = a_{ij}^{T}x + b_{ij}\\) form of LMI's are common. Also, Schur's complement is often useful in forming the constraint.

#### Examples
ew minimization, matrix norm minimization.


#### Dual SDP
Lagrangian \\(L(x, Z) = c^{T}x + \dprod{A_0 + \sum x_iA_i, Z} = c^{T}x + \dprod{A_0, Z} + \sum x_i\dprod{A_i, Z}\\) with \\(Z \succeq 0\\).

\\(g(Z) = \inf_x L(x, Z) = \dprod{A_0, Z}\\) if \\(\sum x_i\dprod{A_i, Z} + c_ix_i = 0 \forall x\\), else \\(g(Z) = -\infty\\). So, dual problem: \\(\max \dprod{A_0, Z}: Z \succeq 0, \dprod{A_i, Z} + c_i = 0 \forall i\\). (Note: used self-duality of \\(S_{++}^{n}\\) in writing \\(Z \succeq 0\\).) \exclaim{Also an SDP!}

Dual of dual is the primal!: Use \\(L(Z, m, L) = \dprod{G, Z} + \sum_i m_i  \dprod{F_i, Z} + \dprod{L, -Z} + c^{T}m\\).

## Geometric programming
\\(\min_x f_{0}(x): \set{f_{i}(x) \leq 0}, \set{h_{i}(x) = 0} \\), with all \\(f_i\\) posynomials and \\(h_i\\) monomials (see vector functionals survey).

Conversion to convex form: use \\(y_i = \log x_i\\) and restate problem.

Eg: used in finding perron-frobenius ew: \\(|\ew_{max}(A)|\\).

\part{Non convex optimization}
## Discrete optimization problems
### Difficulty
The difficulty here arises from the fact that a huge (often exponentially large in the number of variables due to combinatorial explosion) number of assignments to the discrete variables should be considered in order to find the optimum.

### General Strategies
Use exhaustive search.

#### Relaxation to allow continuous values
Constraints in an Integer program can be relaxed to allow variables to take on real values.

### Graph based problems
Max flow, min cut problem. See graph theory survey.

#### Resource allocation
Often modelled with graphs. Edges indicate resource constraints or conflicts.

##### Maximum weight matching
Find the heaviest set of disjoint edges.

For bipartite graphs: if \\(\exists\\) a unique matching, loopy belief propogation will find it.

## Continuous variables: general strategies
The main difficulty here arises from the presence of a large number of local optima.

Or use local optimization attempts with random choices of initial points.

Or use a relaxation. 

### Convexification/ smoothing
Turn it into a convex optimization problem: eg change objective fn to \\(e^{x}\\), or maybe strong duality holds: so can solve dual problem: see section on modelling/ formulating problems too.

#### Dual of the dual
Dual of the dual is sometimes a convex relaxation to the original problem, besides being a lower bound to it.

#### Local approximation
Or approximate \\(f_0\\) (maybe locally) by a convex function or atleast a smoother function. Eg: Trust region methods.

#### Smoothing
Smoothing reduces irregularity of the function output - ie it reduces the depth of local minima.

Gaussian smoothing is frequently used: \\(g(x_0) = \int_{x \in [-\infty, \infty] } e^{-\gl (x-x_0)^{2}} f(x) dx\\).

### As sampling
Global optimization can be seen as sampling from the feasible set, using anything monotonic with \\(f_0(w) = E(w)\\) as a measure of energy/ improbability - albeit with the intention of finding the minimum. 

In exploring the feasible set with special attention towards finding an optimum, one would want most updates to improve the objective, while the remaining updates help get out of local minima.

#### Stochastic gradient descent
Often the objective function can be decomposed as follows: \\(E(w) = \sum_{i=1:n} E_i(w)\\) - for example, in terms of various data-points in the case of maximum likelihood esitation.

Here, for each iteration, one chooses a data-point \\(E_i(w)\\) at random or in a sequence, and uses \\(-\gradient E_i(w)\\) as a descent direction. 

##### Comparison with stochastic gradient descent
Unlike gradient descent, which, using \\(\gradient E(w)\\) as a direction, can consistently reduce E(w) if the step size is appropriately chosen, stochastic gradient descent does not make such a guarantee. The advantage of stochastic gradient descent is in not being stuck at local optima, and in the greater speed with which \\(\gradient E_i(w)\\) can be evaluated.

#### Damping jitters
Sampling techniques may sometimes result in excessive oscillations in the value of \\(E(w)\\) after each variable update: \\(w_i = w_{i-1} + \change w_{i-1}\\), where \\(\change w_{i-1} = \ga t_{i-1}\\) using step size \\(\ga\\) and direction \\(t_{i-1}\\).

One may use a momentum parameter to dampen the abrupt changes in direction: \\(\change w_{i-1} =  \change w_{i-2} + \ga t_{i-1}\\).

This is beneficial because in exploring the feasible set with special attention towards finding an optimum, one would want most updates to improve the objective, while the remaining updates help get out of local minima.

#### Using distribution sampling techniques
See section on sampling from a distribution in randomized algorithms survey. Note that in sampling for optimization, algorithms may pay attention towards finding optima.

## Local optimization
### Result
The result is often highly sensitive to the initial value of \\(x\\). Also, one cannot guarantee that one will reach the minimum closest to the initial point: For example, when gradient descent is used, the angle of the gradient may lead one to a point which then leads a different well.

### Techniques
Can use any convex optimization technique, like gradient descent or alternating minimization.

\part{Discrete and Combinatorial optimization}
## Integer programming (IP)
LP problem where variables can only take integer valued solutions. It is NP hard to find a solution: you have combinatorial hardness.

Approximate with LP; solve it; round the solutions. \tbc

### Randomized rounding
Round \\(x\\) to \\(\floor{x}\\) with prob \\(x - \floor{x}\\).

## Optimal substructure problems
Aka Dynamic programming.

### Applicability: Decision tree view
The problem can be cast as one of taking a sequence of decisions, and one wants to find the optimal sequence of decisions. So, essentially, one tries to find the optimal path through a decision tree. The number of decisions one needs to take is bounded by \\(N\\).

Problems exhibit the 'optimal substructure' property, and also often the 'overlapping subproblems' property.

#### Optimal substructure
Optimal solutions of simpler subproblems can be compared in some way to find the overall optimal solution.

A problem corresponds to a decision tree \\(D_l\\) at level \\(l\\). Each subproblem corresponds to finding optimal path \\(p_i\\) through a different decision subtree \\(D_i\\) one would arrive at by fixing the first decision to be \\(e_i\\). One constructs the optimal decision path \\(p= \min_i f(p_i + e_i)\\).

Eg: In case of shortest path problem: \\(d(s, e) = \min_{v \in \nbd(s)}[d(s, v) + d(v, e)]\\).

##### Remembering subproblems used
\\(p\\) is a sequence of decisions \\(d_{l, i}\\) - each corresponding to making decision \\(i\\) at level \\(l\\) of the decision tree. One needs to remember the decision taken at level \\(l\\) - the optimal subpath augmented. Eg: in the example above, in order to reconstruct the shortest path from s to e, one needs to remember which \\(v \in \nbd(s)\\) was used. 

#### Overlapping subproblems
The subproblems solved are repeated. This corresponds to the case where decision sub-paths to various leaves are actually identical. So it is profitable to remember solutions to subproblems.

### Top down vs Bottom up
#### Top down solution
A top down solution can be easily expressed in terms of a recursive function \\(f(D)\\) which acts on a certain decision tree and returns a] the optimal decision path \\(p\\) and b] its cost.

In doing this, if the 'overlapping subproblem' property holds, the algorithm memoizes : ie remembers optimal solutions to these subproblems whenever they are solved.

#### Bottom up
This solution is only applicable when the 'overlapping subproblem' property holds.

The algorithm solves decision trees of the smallest depth, records their results and builds solutions to progressively larger decision trees. So, one goes from level \\(N\\) and works one's way up to level \\(1\\).

##### Tabular view
Suppose that any node in the decision tree has at most \\(N\\) children. This process can be viewed by means of a \\(N \times M\\) table or a list of \\(N\\) lists.

First, one constructs a list or column corresponding to the consequences of \\(M\\) different decisions at level \\(N\\).

Then, one constructs a list corresponding to the consequences of \\(M\\) decisions at level \\(N-1\\), and also a list of 'backpointers' specifying the ideal decision at level \\(N\\) if one were to fix decision \\(d\\) at level \\(N-1\\).

One does this unductively until one covers all decisions up to level \\(1\\).

#### Time complexity
From description of the bottom up solution, it is clear that time/ space required is \\(M*N\\) - unlike \\(M^N\\) in case all paths in the entire decision tree are to be considered (true in case 'overlapping subproblems' property does not hold).

### Examples
Shortest path algorithm can be formulated as dynamic program - see graph theory survey.

FFT: See functional analysis ref.

Determining the most likely state sequence in the case of a HMM.

## Branch and bound
Systematic enumeration of all candidate solutions, where large subsets of fruitless candidates are discarded en masse, by using upper and lower estimated bounds of the quantity being optimized.

## With belief propogation
Rewrite as a problem of finding the mode of a distribution: \\(\max_x Pr(x): Pr(x) \propto 1_{f(x) \leq 0, h(x) = 0} e^{f_0(x)}\\): the exponentiation is to ensure non-negativity.

This is useful when \\(f_0, \\)f\\(, h\\) are decomposable into functionals over cliques: then can take advantage of factorization.

Used in combinatorial optimization.
