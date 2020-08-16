+++
title = "Low error computation"
+++

## Round off errors
See the computer architecture survey's chapters on number storage where representation accuracy and arithmetic accuracy are described. Tolerance of the problem and of the algorithm to representation error and error in basic arithmetic computations is considered later.

### Underflow avoidance
Sometimes, in case of computations involving multiplication and division with very small numbers (eg: probability calculation), there is the chance of underflow: a small non-0 number \\(x\\) may be stored as 0; which would then lead to \\(0\\) and \\(\infty\\) results during later multiplication and division. To avoid this, one can use the logrithmic representation: x would be stored as \\(\log x\\), and (xy) would be computed using \\(\log x + \log y\\).

## Condition of a problem
### Notation and motivation
Problem (at x)= Vector Function \\(f:X \to Y\\) (at x). Is \\(\change f(x)\\) big wrt \\(\change x\\)? Eg: Perturbing ball on peak vs is trough.

#### Use
Round off error analysis while solving on a computer!

### Absolute condition number
$\hat{k} = \lim_{\change x\to 0} \sup_{\change x \leq \change x'} \norm{\frac{\change f(x)}{\change x}} \\
= \frac{\norm{J_{f}(x) \change x}}{\norm{\change x}} = \norm{J_{f}}\\( (Induced p or \\)\infty$ or 2 norm of Jacobian).

### Relative condition number
Aka Cond Num.\\
\\(k = \lim_{\change x' \to 0} \sup_{\change x \leq \change x'} \frac{\norm{\change f(x)}/\norm{f(x)}}{\norm{\change x}/ \norm{x}} = \frac{\norm{J(x)}}{\norm{f(x)}/\norm{x}}\\). Well conditioned prob; Eg: \\(f(x) = \sqrt{x}\\).

Ill conditioned if k near \\((\epsilon^{-0.5}, \epsilon^{-1})\\). Loose log k digits of accuracy: can't distinguish between f(x) closer than k. Eg: Roots of polynomial p(x): f(p(x))= x; so also Eigenvalue prob: \\(det(A-lI)\\).

## Stability of algorithm
### Notation and motivation
#### Algorithm modeled as an approximate function
Vector fn \\(\tilde{f}\\): an algorithm which approximates problem f. \\(\hat{f}(x)\\): the value found by \\(\hat{f}\\). This is not just the computer storage approximation fl(f(x)) of f(x), but includes error introduced because of \\(\tilde{f}\\) being an approximation.

#### Relative accuracy of algorithm
Aka forward stability. \chk \\(\frac{\norm{\tilde{f}(x) - f(x)}}{\norm{f(x)}} \leq O(\eps)\\).

##### Limitations
Not useful if f() is ill conditioned at x: x rounded off to \\(\tilde{x}\\), \\(\frac{\norm{f(\tilde{x}) -f(x)}}{\norm{\tilde{x} - x}}\\) huge; so relative error huge.

#### Conditioning/ stability separation
##### Assume good conditioning
First, don't try to solve an ill-conditioned problem; any algorithm will yield poor results merely because cannot \\(f(fl(x))\\) is computed instead of f(x), due to limitations of computer storage.

##### A stable algorithm
Once you have a well conditioned problem, if you have an algorithm which computes some \\(\tilde{f}(x') \approx f(x')\\) for \\(x' \approx x\\), you are guaranteed a solution close to f(x).

##### Stability of algorithm: definition
For nearly right question, get nearly right ans:\\
\\(\forall x, \exists \tilde{x}:\frac{\norm{\tilde{x} - x}}{\norm{x}} \leq O(\eps):\ \frac{\norm{\tilde{f}(x) - f(\tilde{x})}}{\norm{f(\tilde{x})}} \leq O(\eps)\\). Independent of choice of norm.

### Backward stability
Like Stability, but \\(\tilde{f}(x) = f(\tilde{x})\\): Exactly right ans to nearly right question.

Implies stability; but simpler to analyze. Found useful in practice, with few exceptions; actual \\(\tilde{f}(x) - f(x)\\): backward error or residual is small.

#### Accuracy
\\(\frac{\norm{\tilde{f}(x) - f(x)}}{\norm{f(x)}} = \frac{\norm{f(\tilde{x}) - f(x)}}{\norm{f(x)}} \leq k\norm{\del x}/\norm{x} \leq O(k \eps)\\). So if alg stable, stability reflects condition number. So, useless if problem ill conditioned.

#### Show backward stability
Show \\(\tilde{f}(x) = f(x)(1 + \eps) = f(\tilde{x}) = f(x(1+\eps))\\): Start with \\(\tilde{f}(x)\\), end up with \\(f(\tilde{x})\\).

#### To show backward instability
Show for some x, \\(\tilde{f}(x) = f(\tilde{x})\\) means \\(\frac{\norm{\del x}}{\norm{x}}\\) is huge.

### Stability without backward stability
Outer product \\(f(x,y) = xy^{*}\\) stable, but not backward stable: cant write as \\((x+\del x) (y + \del y)^{*}\\). If \\(f(x,y)\\) has higher dimensions than x, y; backward stability often not possible. 

\\(x \oplus 1\\) stable but not backward stable: Take x so small that \\(fl(1+x) = 1\\), then \\(\tilde{x} = 0\\) for \\(1+\tilde{x} = 1\\): then \\(\frac{\tilde{x} - x}{x} = 1 \neq O(\eps)\\). Similarly, \\(fl(x+y-x)\\) is not backward stable: when x and y are so far apart that \\(x+y = x\\). But, x+y+z is backward stable.

### Backward stable linear algebra ops
#### Scalar Arithmatic
\\(f(x,y) = fl(x) \odot fl(y)\\) backward stable for \\(\odot = + - * /\\): as \\(fl(x) \odot fl(y) = (x(1+\eps_{1}) + y(1+\eps_{2}))(1+\eps_{3})\\).

##### Catastrophic cancellation
\\(a = fl(1 + \eps_{M}) = 1\\); so, \\(fl(1 - a) = 0\\). Catastrophic error when small nums are calculated from large nums. Soln: modify alg to avoid it; Eg: reflecting on plane in Householder triangularization \\(\perp\\) \\(v = -x -\norm{x}e_{1}\\), not \\(v = x -\norm{x}e_{1}\\).

#### Inner product
\\(fl(x^{*}y) = fl(\sum_{i=1}^{d}\conj{x_{i}}y_{i}) = \sum_{i=1}^{d}\conj{x_{i}}y_{i} (1+\del_{i}), |\del_{i}| \leq d\eps\\). This suffices, as usually \\(d << \eps\\) for dense x, y. Useful in backward error analysis.

#### Ab
So, \\(Ab = (A+\del A)b, \del A_{i,j} = nA_{i,j} \eps + O(\eps^{2})\\). Useful in backward error analysis.

### Error analysis
Estimate accuracy of alg.

#### Backward error analysis
Analyze conditioning of problem; then show backward stability of all steps of algorithm; then show backward stability of the entire alg; then easily compute accuracy.

QR is stable in the backward sense, but not in the forward sense.

#### Forward error analysis
Introduce rounding errors at each step; see how they accumulate to form 'forward errors'; thence find relative error. Tougher than backward analysis. \\(O(\eps^{2})\\) terms ignored.

