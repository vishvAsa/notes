+++
title = "Norms"
+++

## Semi-norm properties
Aka pre-norm. Obeys triangle inequality, non negativity, homogeniety / scalability (\\(\norm{cv} = |c|\norm{v}\\)). But, not necessarily +ve definiteness (\\(\norm{x} = 0\\) iff \\(x\\) = 0.).

## Norm: Defining properties
A seminorm which obeys **positive definiteness** (\\(\norm{x} = 0\\) iff \\(x\\) = 0.). Often triangle inequality is the only non trivial property to verify. Prenorm omits trinagle inequality.

All norms are metrics (see topology ref).

## Variants
### Absolute norms
\\(\norm{a} = \norm{|a|}\\).

#### Monotonicity connection
\\(\norm{.}\\) monotone (\\(|x|\leq |y| \implies \norm{x} \leq \norm{y}\\)) iff it is absolute.

Pf: if monotone, take \\(y = |x|\\); as \\(|y| = |x|\\) get absoluteness. If absolute: take x; for \\(\ga \in [0, 1]\\), replace \\(x_{i} \to \ga x_{i}\\) to get x', replace \\(x_{i} \to -x_{i}\\) to get x''; \\(\norm{x'} = \norm{2^{-1}(1-\ga)x'' + 2^{-1}(1-\ga)x + \ga x} \leq 2^{-1}(1-\ga)\norm{x''} + 2^{-1}(1-\ga)\norm{x} + \ga \norm{x} = \norm{x}\\); by repetition get \\(\norm{(\ga_{i}x_{i})} \leq \norm{x}\\); thus, for \\(|x| \leq |y|\\): \\(\norm{x} = \norm{(\ga_{i}e^{i\gth_{i}}y_{i})} = \norm{(\ga_{i}|y_{i}|)} \leq \norm{y}\\).

## Dual norm of pre-norm f
Take pre norm \\(f\\), \\(f^{D}(y) = \sup_{x:f(x) \leq 1} \Re \dprod{x, y}\\) : like the matrix norm. This is a norm defined on the dual space of \\(dom(f)\\); so it measures the size of continuous linear functionals operating on \\(dom(f)\\); so it is an operator norm - more precisely a functional norm. It is the maximum value attained by \\(y(x)\\) in the unit ball defined by \\(f\\).

For finite dimensional spaces, dual of dual norm is the original norm. \why

### Normness proof
+ve definiteness comes from +ve definiteness of \\(\dprod{}\\). \\(\triangle\\) inequality easily shown from linearity of \\(\dprod{}\\).

### Geometric view
The greatest inner product with y of any \\(x\\) in the unit ball \\(\set{x: f(x) = 1}\\).

### Importance
Plays an important role in describing duality theory in optimization. Also important in describing the subdifferentials of many norms at 0.

### Common dual norms
Dual of \\(\norm{.}_1\\) is \\(\norm{.}_\infty\\), and vice-versa: easily from definition.

Dual of \\(\norm{.}_2\\) is itself: from Cauchy Schwartz: \\(z^{T}x \leq \norm{z}\norm{x}\\) is thight.

#### Applications
Steepest descent method in optimization.

## Properties
### New norms out of old
Take norms \\(f_{1} .. f_{m}\\) on F; norm g on R with \\(g(x) \leq g(x+y)\\) (monotonicity); then \\(\norm{x} = g(f_{i}(x))\\) also norm: Monotonicity ensures \\(\triangle\\) ineq.

So, sum/ multiples/ max of norms is a norm.

Take \\(\norm{}\\): \\(\norm{x}_{T} = \norm{Tx}\\) also norm for non singular T.

If vector space finite dimensional, \\(\norm{.}, \norm{.}'\\) equivalent: see vector function properties. So, if vector seq \\((x_{k}) \to x\\) wrt 1 norm, it converges to the same vector wrt another.

### Convexity of the norm function
Follows from homogeneity and \\(\triangle\\) ineq. \\(\norm{\ga a+ (1- \ga)b} \leq \norm{\ga a} + \norm{(1- \ga)b} = \ga\norm{a} + (1- \ga)\norm{b}\\).

### The closed unit ball
\\(\set{x: \norm{x} = 1}\\). This is closed and bounded, so compact; has non empty interior; is convex; is symmetric about the origin. Conversely, any region with these properties is unit ball B of the norm \\(\norm{x} = 1/(\sup_t (tx \in B))\\).



### Isometry for a norm
\\(B: \norm{Bx} = \norm{x}\\). Set of isometries form a group: isometry group. \why

### Equivalence of norms in finite dimension
\\(\forall \norm{.}_1, \norm{.}_2: \exists a, b: \forall x: a\norm{x}_1 \leq \norm{x}_2 \leq b\norm{x}_1 \\). \why So, one norm can be approximated by another within a factor of b/a.

Any norm can be approximated by a quadratic norm within a factor of \\(\sqrt{n}\\).

#### Comaprison of p norms
\\(\norm{x}_{\infty} \leq \norm{x}_{p} \leq \norm{x}_{1}\\). \\(\norm{x}_{1}\leq \sqrt{m}\norm{x}_{2}\\): By induction. \\(\norm{x}_{p} \leq m^{\frac{1}{p}}\norm{x}_{\infty}\\).

## p norm for p atleast 1
\\(\norm{x}_{p} = (\sum |x_{i}|^{p})^{\frac{1}{p}}\\).

### Normness proof
Only \\(\triangle\\) inequality proof needs some steps.

(Minkowski): $\norm{a + b}^{p} = \sum_{i} |a_{i} + b_{i}||a_{i} + b_{i}|^{p-1} \leq \sum_{i} |a_{i}||a_{i} + b_{i}|^{p-1} + \sum_{i} |b_{i}||a_{i} + b_{i}|^{p-1} \\
\leq (\norm{a}_{p} + \norm{b}_{p})(\sum_{i}|a_{i} + b_{i}|^{(p-1)(\frac{p}{p-1})})^{\frac{p-1}{p}} = (\norm{a}_{p} + \norm{b}_{p})\frac{\norm{a + b}_p^{p}}{\norm{a + b}_p}$.

### The closed unit ball
Progression of shapes: \\(\norm{x}_{1}\\) :rhombus, \\(\norm{x}_{2}\\) :circle, \\(\norm{x}_{p}\\), \\(\norm{x}_{\infty}\\): square. 1 norm is \\(max_{i \in N} \norm{i}_{i}\\).

So, p norm not unitarily invariant. Take x; Ux, where U unitary; this is a combination of rotations and reflections; so projection Ux along various axes is different from that of x; so length differs: visualize with rhombus, square etc..

### 2 norm
Aka euclidian norm, \\(\norm{x}_{2} = \sqrt{x^{*}x}\\). So, squared euclidian norm, \\(\norm{x}_2^{2}\\) corresponds to \\(\dprod{a, b}\dfn b^{*}a\\).

For complex x: \\(\norm{x}^{2} = \norm{Re(x)}^{2} + \norm{Im(x)}^{2}\\).

#### Add orthogonal vectors
(Pythagoras theorem) If \\(\dprod{x, y} = 0, \norm{x+y}_2^{2} = \norm{x}_2^{2} + \norm{y}_2^{2}\\). Follows just from definition of the 2 norm.

### 1, infty norms
\\(\norm{x}_{\infty}\\): Max norm, aka Chebyshev norm. 1 norm: manhattan distance.

## Lp norms in function spaces Wrt measure p
\\((\int_X |f(x)|^{p} dv)^{1/p} = (\int_X |f(x)|^{p} p(x)dx)^{1/p}\\). This is well defined if \\(f\\) is p-power integrable.

## \\(p \in (0,1)\\) non-norms
Does not satisfy the triangle inequality. Not a norm, maybe a prenorm.

### Zero (not a) norm
\\(\lim_{p \to 0} \norm{x}_{p}^{p}\\); if \\(0^{0} \dfn 0\\): \\(\norm{x}_{0} = \sum_{i} x_{i}^{0}\\): number of non zero elements.

## Weighted p norm
Aka quadratic norm.

Corresponds to Weighted Inner product, W. \\(A = W^{*}W\\) hermitian +ve definite. If W a diagonal matrix: \\(\norm{x}_{2,W}\\), where W stretches x, shaped like ellipse. Sometimes writ as \\(\norm{x}_{A}\\).

## Non-norm from convex function f
(Bregman divergence). \\(d_f(x, y) = f(x) - f(y) - (x-y)^{T}\gradient f(y)\\): Error at \\(x\\) in 1st order approximation of \\(f\\) rooted at y.

Not necessarily a norm: in general, not symmetric. \\(d_f(x, y) \geq 0\\) from gradient inequality.

If \\(f(x) = \norm{x}_2^{2}: d_f = \norm{.}_2\\).

If \\(f(x) = \sum_{i}x_i \log x_i - x_i\\): with -ve entropy term, get (Kullback, Leibler) \\(KL(x, y) = \sum x_i (\log \frac{x_i}{y_i} - x_i - y_i)\\): has relative entropy term. For special case when applied to probability distrib vectors, see probability ref.

