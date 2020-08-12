+++
title = "Convexity and functionals"
+++

## Convex functional f
Aka concave upwards, concave up or convex cup.

### Domain, definitions
dom(f) always a convex set. Visualize as a cup. Epigraph of \\(f\\) (see analysis of functions over fields ref) is a convex set.

+++(When they say 'convex function', they mean 'convex functional'.)+++

#### Smoothness along line segment in the domain
Equivalent definition (easy pf): Convex function: \\(f(tx + (1-t)y) \leq tf(x) + (1-t)f(y)\\): comparing f(some pt on segment [x, y]) with similar pt on secant between f(x) and f(y).

##### Many points extension
By induction, can extend this to any convex combintation of n points. Jensen's inequality (see probability ref): simple extension of defn.

##### Convex sublevelsets
The level set \\(\set{x: f(x) \leq \ga}\\) is a convex set: take \\(f(x), f(y) \leq \ga\\); take convex combo z, see \\(f(z) \leq \ga\\). This is important in convex optimization!


#### Extension of domain
For \\(x \notin dom(x): \hat{f}(x) \dfn +\infty\\). Preserves \\(f(tx + (1-t)y) \leq tf(x) + (1-t)f(y)\\), Simplifies notation. Similar extension for concave functions.

### Strict and strong convexity
#### Strict convexity
A cup, not a hyperplane: imposing curvature. \\(f(ax + (1-a)x) < af(x) + (1-a)f(x) \forall a \in [0, 1]\\).

#### Strong convexity with constant m
\\(\gradient^{2} f(x) \succeq mI\\). Implies strict convexity: consdier 2nd order approximation of convex function \\(f\\).

Restricted strong convexity at t wrt C when \\(d\\) restricted to \\(d \in C\\).

### f restricted to a line
Take \\(f:R^{n} \to R\\). \\(f\\) convex iff \\(\forall t: g(t) = f(x + tv)\\) is convex. \\(x + tv\\) is a line in the domain. Good for showing convexity!

### Gradient tests
#### First order condition
If \\(f:R \to R\\) differentiable, \\(f\\) convex iff f'(x) non decreasing: \\(f(y) \geq f(x) + f'(x)(y-x)\\). Aka first order condition.

Pf: If \\(f\\) convex, taking the convex combination of y and x: \\(\forall t: f(x + t(y-x)) \leq (1-t)f(x) + tf(y)\\). So consider \\(f(y) \geq f(x) + \frac{f(x + t(y-x)) - f(x)}{t}\\)as \\(t\to 0\\).

Extend to \\(f:R^{n} \to R\\) by considering \\(f\\) restricted to a line: \\(f(y) \geq f(x) + \dprod{\gradient f(x),(y-x)}\\). The RHS is the supporting hyperplane to the epigraph of \\(f\\).

#### First order condition for non-smooth f
The subdifferential set \\(\subdifferential f(x) \neq \emptyset\\) for any \\(x\\).

#### Second order condition
So, if \\(f(x)\\) twice differentiable, \\(f\\) convex iff \\(f''(x) \geq 0\\) ie: \\(f'\\) non decreasing. By techniques similar to first order condition, \\(f\\) convex if \\(\gradient^{2}f(x) \preceq 0\\). Aka second order condition.

### Supporting hyperplane to the epigraph
#### Differntiable f
See description of tangent hyperplanes to epigraphs in the 'topological properties of functionals' subsection. For differentiable \\(f\\), the tangent hyperplane at \\((x_1, f(x_1))\\) is specified by \\((\gradient f(x_1), -1)\\). **Pf**: From first order condition: \\(f(y) \geq f(x) + f'(x)(y-x)\\).

So, \\(f(x) + f'(x)(y-x)\\) is a global lower bound on \\(f\\).

#### Non differentiable convex f: subdifferentials!
Can extend the idea of a gradient to non-differentiable convex \\(f\\). The **subdifferential set** \\(\subdifferential f(x) = \set{z: \forall x, f(y) \geq f(x) + \dprod{z,(y-x)}}\\).

Each \\(z \in \subdifferential f(x)\\) is a **subgradient**, a **generalization** of the concept of gradient. \\((z, -1)\\) is a supporting hyperplane to the epigraph of \\(f\\) at \\((x, f(x))\\). Also, \\(f(x) + \dprod{z,(y-x)}\\) is a global lower bound on \\(f\\).

\\(\subdifferential f(x)\\) is a closed, convex set.

If \\(x \in int(dom(f))\\), \\(\subdifferential f(x)\\) is non-empty and bounded.

##### Non subdifferentiable functionals
Eg: \\(-\sqrt{x}\\): supporting hyperplane at (0, 0) is vertical.

### Supporting hyperplanes to sublevel sets
See the description of the connection between contour graphs and the gradient in the section on derivatives of functionals. At differentiable points, gradients define tangent hyperplanes to the contour; for convex functionals, these are also supporting hyperplanes to the sublevel set.

At non differentiable points, the gradient can be substituted with the subgradient.

### Finding Subdifferentials
First identify the non-differntiable point, then just apply the definition.

If \\(f\\) is differentiable, \\(\subdifferential f(x)\\) contains just the gradient.

#### Unlike finding gradients
Where \\(f\\) is differentiable, to find \\(\gradient f(x)\\), once can merely compute \\(\partder{f(x)}{x_i} \forall i\\), and arrange the result in a vector.

For finding the subdifferential of \\(f\\) at a non-differentiable point, this does not work. Taking the OR of conditions describing subdifferentials of restrictions of a function to individual axes yields a superset of that function's subdifferential! For example, applying this flawed technique to finding \\(\subdifferential \norm{0}_2\\) yields the unit ball of \\(\norm{x}_\infty\\). +++(Can't do it one coordinate at a time.)+++

#### Of non-negative linear combo
Take \\(f(x) = ag(x) + a' r(x);\ a, a' \geq 0\\). \\(\subdifferential f(x) \supseteq \set{z' + z: z' \in \subdifferential g(x) z \in \subdifferential r(x)}\\): applying dfn.

##### Of penalties plus regularizers
Commonly encountered in statistics and modelling.

If \\(f(x) = g(x) + r(x)\\) is convex, g is differentiable but not r: \\(\subdifferential f(x) = \set{\gradient f(x) + z: z \in \subdifferential r(x)}\\).

eg: Take \\(f(x) = g(x) + l\norm{x}_1\\), where g is convex. Here, \\
\\(\subdifferential f(x) = \set{\gradient g(x) + lz| \forall i: x_i \neq 0, z_i = sgn(x_i); \texttt{ else }: |z_i| <= 1}\\).

#### Of f(Ax + b)
\\(\subdifferential f(Ax + b) = A^{T} \subdifferential f(x)\\). Pf: 
$$\subdifferential f(Ax + b) = \\
\set{t': \forall d: f(Ax + b + Ad) \geq f(Ax + b) + \dprod{t', d}} \\
= \set{A^{T}t: \forall d: f(Ax + b + Ad) \geq f(Ax + b) + \dprod{A^{T}t, d}} \\
= A^{T} \subdifferential f(x)$$.

So, linear shift \\(x \to x+b\\) does not change the subdifferential.

#### Of max of functionals
Take \\(f(x) = \max \set{f_1(x) .. f_m(x)}\\). Take \\(act(x) = \set{i: f_i(x) = f(x)}\\); then \\(\subdifferential f(x) = conv(\union_{i \in act(x)} \subdifferential f_i(x))\\).

This property can be used to find subdifferential of the \\(\infty\\) norm.

#### Subdifferentials of norms
For any norm, subdifferential at 0 is just the unit ball of the corresponding dual norm!

<div class="proof">\\(\subdifferential \norm{0} = \set{z: \forall d: \norm{0+d} \geq \norm{0} + \dprod{d, z}} = \set{z: \forall d: \norm{d} \geq \dprod{d, z}} \\= \set{z: \forall \norm{d} = 1: 1 \geq \dprod{d, z}} = \set{z: 1 \geq \norm{z}^{D}}\\).</div>

For \\(\norm{x}_\infty\\), many other points are non differentiable. Using the form of \\(\subdifferential \max f_i(x)\\), we get: \\(x\neq 0: \subdifferential \norm{x}_\infty = conv(\set{sgn(x_i)e_i: \forall |x_i| = \norm{x}_\infty})\\).

### Operations which preserve convexity
What preserves the curvature? Let \\(f\\), g be convex.

#### Sum, max
\\(a_1 f(x)+ a_2 g(x): a_i \geq 0\\) convex.

max(f, g)(x), \\(sup_{f \in F}f(x)\\)  convex. Eg: \\(\sup_{c \in C} \norm{c-x}, \ew_max(A)\\). This is widely used: eg: concavity of dual function, conjugate function.

#### Minimization over some dimensions
Take f(x, y) convex in both \\(x\\) and \\(y\\), C a convex set. From defn, \\(\inf_{y \in C} f(x, y)\\) also convex.

#### Composition with affine transform
If f(x) is convex, so is g(x) = f(Ax+b): from defn; Even concavity preserved.

#### Other compositions
Take \\(h:R^{k}\to R\\) convex. If \\(g:R^{n} \to R^{k}\\) componentwise convex, \\(\hat{h}\\) also componentwise non-decreasing, h(g(x)) convex: from defn. Also, if g concave, \\(\hat{h}\\) also componentwise non-increasing h(g(x)) convex.

#### Transformations
Perspective of a functional (not same as perspective fn): See \cite{cvx_boydVan}.

conjugate of \\(f\\) also convex: supremum of affine functions.


### Important instances
#### In R
Affine functional: ax + b (also concave, so linear).

Exponential \\(e^{ax} \forall a\\).

Powers \\(x^{a} \forall a \notin (0,1)\\).

Negative entropy: \\(x \log x\\).

#### Matrix functionals
\\(f(Y) = \log \det Y; \gradient f(Y) = Y^{-1}\\) \why.

#### Log sum exponents
\\(f(x) = \log \sum e^{x_i}\\) is convex: its Hessian \\(H \succeq 0\\) (can't simply use composition rules!). Pf: Let \\(z_i = e^{x_i}\\); then \\(\gradient f(x) = (\sum_i z_i)^{-1}z\\), Hessian is \\(H = (\sum_i z_i)^{-2}((\sum_i z_i)diag(z) -zz^{T})\\). \\((\sum_i z_i)^{2}x^{T}Hx = (\sum_i z_i)(\sum_i x_i^{2}z_i) - (x^{T}z)^{2}\\). Take \\(a_i = z_i^{1/2}, b_i = x_i z_i^{1/2}\\), use Cauchy schwartz to see \\(x^{T}Hx \geq 0\\).

So, its composition with Affine transformation: \\(\log \sum e^{a_i^{T}x + b_i}\\).

##### Importance
The convexity of these functionals is important because they are used to specify the -ve log likelihood functions of exponential families of distributions, and they need to be minimized during maximum likelihood estimation.

#### Other examples
Norms. Each component of an affine function: \\((Ax + b)_i\\).

#### Convex quadratic functionals
Like this: \\(f(x) = x^{T}Ax + hx + c\\), with \\(A \succeq 0\\). Many level sets are ellipsoids.

## Other Functional-classes defined using convexity
### Concave functionals
Concave function: -f is convex, domain is still convex.

Any affine linear function y = ax+b is both concave and convex.

f(x, y) = xy not simultaneously convex in \\(x\\) and y: have a saddle point graph; but individually convex in \\(x\\) and y.

### Linear functionals
These are both convex and concave.

### Quasi-convex functionals
#### Convex sublevel sets
Any function with convex domain, convex sub-level sets. Eg: \\(|x|\\). Similarly, quasi-concave, quasi-linear functionals are defined.

So, can replace each sublevel set with a sublevelset of a convex functionals. This is used in quasi-convex programming.

#### Smoothness along line segment in the domain
\\(\forall t \in [0, 1]: f(tx + (1-t)y) \leq \max\set{f(x), f(y)}\\): else \\(\max\set{f(x), f(y)}\\) sublevel-set of \\(f\\) would not be convex. So, there can't be local hills or craters, but there can be plateaus on the way down to any of the global minima.

#### First order condition
f quasiconvex iff \\(f(y) \leq f(x) \implies \gradient f(x)^{T}(y-x) \leq 0\\) : otherwise, could take a small step along the segment connecting \\(x\\) and \\(y\\), and value of \\(f\\) would be greater than f(x). Visualize with contour maps in case of 2D functional.

#### Importance
Sublevel sets of quasi-convex functions, being convex, can be used to specify feasible region of convex optimization program.

### Log concave functional f
log \\(f\\) is concave.

#### Importance
Many probability distributions log concave.

#### Properties
Directly from concavity of log f: \\(f(tx + (1-t)y) \geq f(x)^{t}f(y)^{1-t} \\), if \\(f\\) differentiable: \\(f(x)\gradient^{2}f(x) \preceq \gradient f(x) \gradient f(x)^{T}\\).

\\(g(x) = \int f(x, y)dy\\) is also log concave, but sum of log concave functionals not necessarily log concave.

Convolution of \\(f\\) also log concave.

