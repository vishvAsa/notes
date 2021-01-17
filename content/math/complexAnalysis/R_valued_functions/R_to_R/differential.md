+++
title = "Differential"
+++

## Definition
### Rate of change
The differential function, aka derivative, is \\
\\(f'(x) = \frac{df}{dx}= \lim_{\change x \to 0} \frac{f(x+\change x) - f(x)}{\change x}\\), if the limit exists.

### Linear approximation view
Hence, \\(f(x + \change x) = f(x) + \change(x) f'(x)\\), as \\(\change x \to 0\\).
As the primary use of the differential function is to be able to make linear/ polynomial approximations to \\(f\\), one can view the differntial function as a measure of \\(f(x + \change x) - f(x)\\) as \\(\change x \to 0\\).

### Other views and generalizations
See the derivatives of general functionals and functions in the vector spaces survey.

## Existence: Differentiability
The the above limit exists at a certain point \\(x\\), \\(f\\) is said to be differentiable at that point.

\\(f\\) can be differentiable on \\((a, b)\\) but not on endpoints of \\([a, b]\\).

### Relationship with continuity
If \\(f\\) differentiable, \\(f\\) continuous; but not reverse: consider \\(|x|\\).

Also, \\(f = \sum_{n=0}^{\infty} g(4^{n}x) (3/4)^{n}\\), where \\(g(x) = g(x+2), g(x) = |x| on [-1, 1]\\) is continuous but nowhere differentiable: Take \\(f_{n}= g(4^{n}x) (3/4)^{n}\\); by Weierstrass M test, \\(\sum f_{n}\\) converges to f; also converges uniformly; as the partial sums are continuous functions and as \\(\sum f_{n} \to f\\), \\(f\\) is continuous.

### Smoothness
If for all \\(k\\), \\(D^k(x)\\) exists at a certain point \\(x\\), \\(f\\) is said to be smooth at that point.

## Differential operator
### Definition
Consider the operator \\(D\\), which maps a given function \\(f\\) to its differential function \\(f'\\). Note that the differential function may have a smaller domain than \\(f\\).

#### Notation
So, \\(D(f)(x) = f'(x)\\). Often, this is written as \\(Df(x)\\).

Below, represent the scalar functions \\(f\\) and \\(D(f)\\) as vectors in a vector spaces: see vector spaces and functional analysis surveys for details. Also, \\(f+g, fg, f/g\\) etc.. are naturally defined.

#### Higher order differentials
These are defined by \\(D^k(x) = D(D^{k-1}(x))\\) \\(: \forall k > 1, k \in N\\).

Other notations include: \\(\frac{d^{k}f(x)}{dx^k}, f^{(k)}(x)\\).

### Inverse
Directly from the definition, \\(D(f^{-1}) = \frac{1}{D(f)}\\).

### Linearity
\\(D(f + g) = D(f) + D(g)\\). This follows from the definition of the differential function.

Hence, the differential operator \\(D()\\) is a linear map between these vector spaces. It is a matrix.

### Other properties
If \\(f, g: R \to R\\) differentiable at a certain point \\(x\\), using :
\\(D(fg) = f D(g) + D(f)g\\). This follows from the definition of the differential function. Similarly, \\(D(f/g) = D(f)g - fD(g))/g^2\\).

### Composition (chain rule)
Suppose \\(g, h\\) are functions. \\(D(g(h)) = D(h)D_h(g)\\), where \\(D_h(g)\\) is the differential function of \\(g\\) evaluated at \\(h(x)\\). This is proved using linear approximations \\(f(x + \change x) = f(x) + f'(x)\change x\\) and the definition of \\(D(f)\\).

### Parametrically defined functions
Suppose \\(y = f(t)\\) and \\(x = g(t)\\). Then, \\(\frac{dy}{dx} = \frac{f'(t)}{g'(t)}\\); as \\(y = f(g^{-1}(x))\\).

## Differentiation
Differentiation is the procedure of evaluating the differential operator for a certain function.

### Differentiation tricks
\\(y=(f(x)^{g(x)})'\\): take log on both sides, differentiate. Chain rule.

### Differentials of important functions
Ab initio differentiation of sin x, cos x.

#### Differentiation of powers and exponents
\\(x^{n} :n \in N\\) can be derived from the definition. Thus, using the expansion/ definition of \\(e^{x}\\), \\(D(e^{x})(x) = e^{x}\\).

\\(\forall n\in R: \der{x^{n}} = \der{e^{n\ln x}} = nx^{n-1}\\).

## Other properties
### Geometry
Geometry is described for the case of general functionals in the vector spaces survey.

### Connection with extrema
If \\(f\\) differentiable, \\(f'\\) is \\(0\\) here (minimum / maximum singularity). See optimization ref.

### Effect of uniform convergence
Take \\(f_{n}\\) on \\([a, b]\\), \\(f_{n} \to f\\) uniformly.

\\(f_{n} = \sin nx/\sqrt{n} \to 0\\), but \\(f'(x) \notto 0\\).

If \\(f_{n}'\\) continuous, uniformly convergent, and if \\(\exists c \in (a, b): f_{n}(c)\\) converges (This condition ensures ye're not adding constants to \\(f_{n}\\) to keep \\(f_{n}'\\) convergent but \\(f_{n}\\) non convergent); then \\(\exists f: lt_{n \to \infty} f_{n} = f, f\\) is differentiable, \\(\lim f_{n}' = f'\\). Pf: Let \\(\lim  f_{n}' = g\\); From fundamental theorem of calculus: \\(\int_{c}^{x}f_{n}'(t)dt = f_{n}(x) - f_{n}(c)\\); take limits on both sides, get: \\(\int_{c}^{x} g(x)dt = f(x) -f(c)\\); g continuous as \\(f_{n}'\\) continuous, uniformly convergent to g; so use fundamental theorem of calculus again.

## Polynomial approximation of f
### f(x): Mean change and the gradient
#### Interior extremum existance
(Rolle) If \\(f\\) is continuous and \\
differentiable in \\([x_{1}, x_{2}], f(x_{1}) = f(x_{2}) = 0, \exists c \in (x_{1}, x_{2}): f'(c) =0\\). 

Easy to make a visual argument.

<div class="proof">There exists atleast one maximum and one minimum in [a, b]; if it happens to be in the interior set \\((a, b)\\), \\(f'(x) = 0\\) at this point; otherwise \\(f\\) is a constant function, and there is still an extremum in \\((a, b)\\).</div>

#### Mean value theorem
If \\(f\\) is continuous and differentiable in \\
\\([x_{1}, x_{2}], \exists c \in (x_{1}, x_{2}): f'(c) = \frac{f(x_{1})- f(x_{2})}{x_{1} - x_{2}}\\). Easy to visualize. For proof, see the generalization to two functions below.

+++(Thence, linear approximation to \\(f\\)!)+++

#### Relative to another function
If \\(f, g\\) continuous and differentiable: \\((f(b) - f(a)) g'(x) = (g(b) - g(a)) f'(x)\\): Make new function, apply Rolle. Aka Cauchy's mean value theorem.

<div class="proof">Suppose that \\(f(b) = f(a) + M(g(b)- g(a))\\). Now, solve for \\(M\\). Take \\(F(x) = f(x) - f(a) - M (g(x) - g(a))\\). \\(F(a) = F(b) = 0\\); so because of the Interior extremum existance argument, there must exist some \\(c \in [a, b]\\) with \\(F'(c) = 0\\).</div>

#### Definite integral view and the mean
\\(\int_{[a, b]} f'(x) dx = f(b) - f(a) = f'(c) (b-a)\\) for some \\(c \in [a, b]\\). This can be extended to integration \\(\int_{[a, b]} f'(x) dg(x)\\) wrt another function \\(g(x)\\) using the mean value theorem relative to another function.

As integration can be viewed as an extension of summation, \\(\frac{\int_{[a, b]} f'(x) dx}{(b-a)} = f'(c)\\) can be viewed as the mean of \\(f'(x)\\).

### Polynomial approximation
Aka Taylor theorem. \\(P(a)\dfn \sum_{k=0}^{n-1}f^{(k)}(a) (b-a)^{k}/k!\\); then \\(f(b) = P(a) + R\\), where \\(R = f^{(n)}(c)(b-a)^{n}/n! = \int_{[a, b]} f^{(n)}(y)(b-y)^{n-1}/(n-1)! dy\\) for some \\(c \in [a, b]\\).

Can then bound error term by bounding \\(f^{(n)}(c)\\).

\pf{We want to find \\(f(b) - P(a)\\). Note that \\(P(b) = f(b)\\), and \\(P'(x) = \sum_{k \geq 0} (- f^{(k)}(x)/((k-1)!) + f^{(k+1)}(x)(b-x)^{k}/(k!)) = f^{(n)}(x) (b-x)^{n-1}/(n-1)!\\): note how P was cleverly defined around \\(b\\) rather than \\(a\\) to let this happen.

From mean value theorem wrt function \\(g\\), we get \\(f(b) - P(a) = P(b) - P(a) = \frac{f^{(n)}(c) (b-c)^{n-1}/(n-1)!}{g'(c)}(g(b) - g(a))\\). Then, using alternatively \\(g(x) = (b-x)^{n}\\) and \\(g(x) = \int_{[a, x]} f^{(n)}(y)(b-y)^{n-1}dy\\), we get the stated remainders.} 

### Associated series
In Pf, note that, in general, \\(c_i\\) getting closer and closer to \\(a\\) as \\(n\\) increases; but we cannot be sure about it: for all we know, all \\(c_i\\) may be very close to \\(b\\).

The polynomial approximation series, aka Taylor series, is the polynomial approximation \\(P(x)\\) as the degree \\(n \to \inf\\).

McLaurin series: Taylor series about 0.

### Importance
Polynomial approximation of functions described above is very important in analyzing the solutions to many problems. This is because one can use the nth degree approximation and upper bounds on \\(|f^{(n)}(x)|\\) to get easy to analyze upper and lower bounds on \\(f(x)\\).

For example, this is used to prove that solutions to certain optimization problems which arise in doing maximum likelihood estimation have desirable properties. Also, several optimization algorithms work by minimizing the polynomial (quadratic in the case of Newton's method) approximation to \\(f(x)\\), and this analysis is naturally used there.

## Extensions
Can't easily extend to general metric spaces by using a distance function \\(d()\\): rates of change won't be negative.

### Extension to functionals
See vector spaces ref.

