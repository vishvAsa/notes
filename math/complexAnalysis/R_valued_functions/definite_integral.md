+++
title = "Definite integral"
+++

## Definitions
For a fixed \\(f:R \to R\\), the definite integral function is \\(R^{2} \to R\\). In general, it is defined for any \\(f\\) over a measurable space.

Simply see the definition of min-cover integrals defined elsewhere: those form superior notions of integration than what follows.

### Integral as least Upper sum, greatest lower sum
Aka Reimann Integral.

#### Partitions of [a,b]
Any such partition \\(P\\) is specified by a set of points \\(a = x_{0} \leq x_{1} .. x_{n} = b; \gD x_{i} = x_{i}- x_{i-1}\\).

##### Refinement
\\(P'\\) is a refinement of \\(P\\) if \\(P \subseteq P'\\). Common refinement of \\(P_{1}, P_{2}: P_{1} \union P_{2}\\).

#### Upper, lower sums
Take bounded function \\
\\(f: [a,b] \to R; M_{i} = \sup \set{f(x)|x \in [x_{i-1}, x_{i}]}; m_{i} = \inf\set{..}\\); visualize; upper, lower sums $U(P, f) = \sum_{i=1}^{n}M_{i}\gD x_{i}; L(P, f) = \sum_{i=1}^{n}m_{i}\gD x_{i}; \\
\bar{\int_{a}^{b}}f(x) dx = \inf_{P} \set{U(P, f)}, \underline{\int_{a}^{b}}f(x) dx = \sup_{P} \set{L(P, f)}\\(: both exist as both \\)L\\( and \\)U$ sums are bounded and real.

#### Integrability
If \\(L=U\\), \\(f \in \mathcal{R}\\), that is: \\(f\\) is Reimann integrable.

#### Limitations
Not Reimann integrable: \\(I_Q(x)\\) (Indicator function for rational numbers): \\(U=1\\), while \\(L=0\\) as every partition will contain a rational and an irrational number. However, this is box integrable: the corresponding box Integral is 0.

It is but a special case of superior notions such as the Stieltjes integral and the min-cover integral.

### Min-cover integral of measurable functions
Aka Lebesgue integral, box integral. Take a real valued function \\(f\\) over measure space \\((X, S, m)\\). Suppose \\(f:X \to R\\) is a measurable function from \\((X, S, m) \to (R, S_r, m_r)\\), where \\(S_r\\) is the sigma algebra of open sets in \\(R\\), and \\(m_r\\) is the common box measure on R.

For \\(f(x) \geq 0 \forall x\\),  for any \\(E \in S\\), \\(\int_E f(x) dm\\) is the min-cover measure of portion of the space \\(E_f\\) in \\((X \times R)\\) bounded by \\(E\\) and \\(f(x)\\). This measure was described for the general case in the product measure portion of the algebra survey. There is the additional restriction that the each \\(B_i = (B_{iX} \times B_{iR}) \in (S \times S_r)\\) used to cover \\(E_i \subseteq E_f \\) is such that for any \\((x, f(x)) \in E_i \\), its measure along \\(R\\), \\(m_r(B_{iR}) \geq m_r(f(x))\\): that is, they can be visualized as vertical boxes - with \\(R\\) being the vertical axis.

This can be extended to any function \\(f\\). Let \\(f^+ = 2^{-1}(|f(x)| + f(x))\\) and \\(f^- = 2^{-1}(|f(x)| - f(x))\\) be the positive and negative parts of \\(f\\), so that \\(f = f^+ - f^-\\). Then, \\(\int_E f(x) dm = \int_E f^+(x) dm - \int_E f^-(x) dm\\).

#### Importance
It is superior to Reimann integral. The indicator function over rationals \\(I_Q(x)\\) is not reimann integrable, but it is box integrable as the measure \\(m(Q)=0\\).

### Min-cover integral wrt to non decreasing g
Aka Lebesgue-Stieltjes integral or Radon integral.

This is defined as the min-cover integral obtained using a measure \\(m_g\\) which corresponds to \\(g\\).

#### Upper and lower sums view
Aka Stieltjes integral. Take \\(g:[a,b] \to R\\) nondecreasing. \\(\gD g_{i} = g(x_{i}) - g(x_{i-1})\\). \\(f\\) bounded. Define \\(U(P, f, g) = \sum_{i=1}^{n}M_{i}\gD g_{i}\\), L(P, f, g), \\(\bar{\int_{a}^{b}}f(x) dg, \underline{\int}\\).

If \\(L=U\\), \\(f \in R'(g)\\): Stieltjes integrable.

For \\(\int\\) to exist, \\(f\\) and \\(g\\) must not share any points of discontinuity: See how g is used to deal with discontinuity in \\(f\\).

#### Advantages
Suppose \\(f\\) is \\([x \in Q]\\) in a certain interval X, \\(f \in R(g)\\) where g(x) = constant over X.

If \\(f\\) bounded on \\([a, b]\\), has finite discontinuities, g conts at these points, then \\(f \in R(g)\\): take partition with \\(\del g_{i}\\) small in these pts, where \\(|m_{i} - M_{i}|\\) maybe big but bounded; thence show \\(U - L < \eps\\).

##### Series as Stieltjes integral
Derive g from unit step functions: \\(g(x) = \sum_{n=1}^{\infty} c_{n}I(x - s_{n})\\), with \\(c_{n} \geq 0, \sum c_{n}\\) convergent. Then \\(\int_{a}^{b}f(x) dg = \sum c_{n}f(s_{n})\\) : From \\(\int f d(g_{1} + g_{2}) = \int f d(g_{1})+ \int f d(g_{2})\\). \\(\int_{a}^{b}1 dg = \sum c_{n}\\).

## Importance
For a fixed \\(f, m\\), the integral can be viewed as a signed measure over \\(X\\). This measure is significant as it captures and extends the notion of area/ volume etc.; and as described in another chapter, it happens to be closely related to the gradient of the function.

## Basic properties
### Integral sandwiched between L and U
If \\(P \subseteq P'\\), \\(L(P, f, g) \leq L(P', f, g), U(P', f, g) \leq U(P, f, g)\\): see geometrically. So, \\(\bar{\int_{a}^{b}}f(x) dg \leq \underline{\int}\\): take common refinement of of \\(P_{1}, P_{2}: P'\\), see \\(L(P_{1}, f, g) \leq L(P', f, g) \leq U(P', f, g) \leq U(P_{2}, f, g)\\).

\\(f \in R(g)\\) \\(\equiv\\) \\( \forall \eps: \exists P: U(P, f, g) - L(P,f,g) < \eps\\). \\(\gets\\) Pf: \\(L \leq \underline{\int} \leq \bar{\int} \leq U\\). \\(\to\\) Pf: As \\(\underline{\int} = \bar{\int}\\), take \\(L(P_{1}), U(P_{2})\\) close to these, take common refinement.

#### Closeness to any sum between L and U
So, if \\(s_{i}, t_{i} \in [x_{i-1}, x_{i}], \sum |f(s_{i}) - f(t_{i})| \gD g_{i} \leq \eps\\). Also, \\(|\sum f(t_{i}) \gD g_{i} - \int_{a}^{b}f dg| < \eps\\): both are bounded between L and U.

### Continuity implies integrability
If \\(f\\) continuous on \\([a, b]\\), \\(f \in R(g)\\) on \\([a, b]\\).

\pf{As \\([a, b]\\) compact, \\(f\\) uniformly cont; so \\(\forall \eta \exists d: |x-t|\leq d \implies |f(x) - f(t)| < \eta\\); take \\(\eta:  (g(b) - g(a)) \eta \leq \eps\\); take any partition P with \\(\gD x_{i} \leq d\\); so \\(U(P, f, g) - L(P, f, g) = \sum (M_{i} - m_{i}) \gD g_{i} \leq \eps\\).}

### Relationship with Uniform convergence
Take \\(f_{n}\\) on \\([a, b]\\), \\(f_{n} \to f\\) uniformly.

If \\(f_{n} \in R, f \in R\\): \\(lt_{n \to \infty} \int f_{n} dx = \int f dx\\) as \\(\int (f_{n} - \eps_{n}) dx \leq \underline{\int} f dx \leq \bar{\int} f dx \leq \int (f_{n} + \eps_{n})dx\\).

So, if \\(\sum f_{n} \to g\\) uniformly, \\(\sum \int f_{n} dx = \int g dx\\).

### Continuity of semi-definite integral
If \\(f \in \mathcal{R}\\) on \\([a, b]\\): \\(F(x) = \int_{a}^{x}f(t)dt\\) is continuous: \\(f\\) is bounded; so \\(F(y) - F(x) \leq M (y-x) < \eps\\) as \\(y \to x\\).

## Connection to derivative
### Differential of integral over f
If \\(f\\) is continuous at \\(c\\): : \\(F(x) = \int_{a}^{x}f(t)dt\\) is differentiable at \\(c\\), \\(F'(c) = f(c)\\).

\pf{Continuity of f states that \\(t-c < d \implies |f(t) - f(c)| < \eps\\). So \\(|\frac{F(t) - F(c)}{t-c} - f(c)| = |\frac{1}{t-c}||\int_{c}^{t}f(u)du - f(c)(t-c)| = |\frac{1}{t-c}||\int_{c}^{t}(f(u)-f(c))du| \leq \eps\\).}

### Definite integral = difference in antiderivative
#### Anti-derivative
If \\(f \in R\\), and if \\(\exists F\\) differentiable on \\([a, b]\\) with \\(F' = f\\), then \\(F\\) is called the antiderivative or the indefinite integral of \\(f\\).

For any \\(f\\), if there is an antiderivative \\(F\\), \\(\set{F(x) + k | k \in R}\\) is also an antiderivative. +++(So, there are either 0 or \\(\infty\\) antiderivatives.)+++

#### Fundamental theorem of calculus
\\(\int_{a}^{b} f(x)dx = F(b) - F(a)\\).

\pf{Pick a partition \\(P = (x_i)\\) with \\(U - L < \eps\\). Apply Mean Value Thm to get: \\(F(x_{i}) - F(x_{i-1}) = f(t_{i})\gD x_{i}\\); add all such terms to get \\(F(b) - F(a) = \sum f(t_{i})\gD x_{i} = \int_{a}^{b} f(x)dx + \eps\\) by a property seen under Stieltjes Integral.}

### Inter-measure Derivative
Aka Radon-Nikodym derivative. The min-cover integral may be used to define a derivative which connects two measures on the same measurable space: this is described in the chapter on measures in the Algebra survey.

## Integration: evaluating definite integrals
Methods relevant (eg: transformation to polar coordinates) only for evaluating definite integrals of functions over product spaces are described elsewhere.

Also see section on important integrals for examples of application of these techniques.

### Integration by parts
As definite integral equals the difference in the anti-derivative, $\int_{a}^{b}f(x)H(x)dx + \int_{a}^{b}F(x)h(x)dx =\\
 \int_{a}^{b}f(x)h(x)dx = F(b)H(b) - F(a)H(a)$.

Thus, \\(\int_{[a, b]} u dv = uv]_{[a, b]} - \int_{[a, b]} v du\\) is a useful rule when RHS is easier to integrate.

### Sum, product, decomposition rules
Due to definite integral being equal to difference in the antiderivative: \\(\int_{a}^{b} f(x) + h(x) dg = \int_{a}^{b} f dg + \int_{a}^{b} h dg\\). \\(\int_{a}^{b} f dg = \int_{a}^{c} f dg + \int_{c}^{b} f dg\\).

\\(\int f d(g_{1} + g_{2}) = \int f d(g_{1})+ \int f d(g_{2})\\).

### Transform the integral
Suppose you want to evaluate the definite integral I. Often, evaluating kI or \\(I^2\\) (as in the case of the Gaussian integral) is simpler. Thence one can deduce the value of I.

### Change of variables
#### Function composition: integrability
If \\(f \in R(g), f(x) \in [m, M]\\), h continuous over [m, M], then \\(j(x) = h(f(x)) \in R(g)\\). 

\pf{Take \\(\forall \eta \exists P: U(P, f, g) - L(P, f, g) = \sum (M_{i} - m_{i}) \gD g_{i} = \del (g(b) - g(a)) \leq \eta\\). (Supposing \\(M_i - m_i \leq \gD\\).)

\\(h\\) uniformly continuous over \\([m, M]\\), so \\((h(M_{i}) - h(m_{i})) \leq \eps\\) for some \\(\eps\\).

Hence, \\(\forall \eta' \exists P: U(P, j, g) - L(P, j, g) = \sum (M_{i}^{*} - m_{i}^{*}) \gD g_{i} = \eps (g(b) - g(a)) \leq \frac{\eta \eps}{\del} = \eta'\\).}

So, if \\(f, g \in R(g): fg = 4^{-1}((f+g)^{2} - (f-g)^{2}), |f(x)| \in R(g)\\). Also, \\(\int f(x) dg \leq \int |f(x)| dg\\).

#### Integration
Take strictly increasing onto \\(h:[A, B] \to [a, b]\\). Suppose that \\(f \in R\\) on \\([a, b]\\).

Then \\(g = f \comp h \in R(h)\\) on \\([A, B]\\). Then \\(\int_{x \in [A, B]} g(x) dh = \int_{t \in [h(A), h(B)]} f(t) dh = \int_{x \in [A, B]} f(h(x)) h'(x)dx \\).

\core{Take a partition \\(P\\) with upper and lower sums \\(L, U\\). Use mean value theorem to rewrite in terms of \\(x\\).}

##### Utility
Change of variables is in general a extremely useful algebraic trick - so is this particular instance. Suppose \\(x = h(y)\\). With this, one can write: \\(\int_{[A, B]} f(x) dx = \int_{y \in [h^{-1}(A), h^{-1}(B)]} f(h(y)) \frac{dx}{dy}dy \\), as the RHS may be easier to evaluate.

### Reversing limits
By convention \\(\int_a^bf(x)dx = - \int_b^af(x)dx\\).


## Over product measure spaces
Consider \\(f(x) \geq 0 \forall x\\). (The integral for the general case may thence be derived as earlier.)

Let \\((X, S, m)\\) be the product measure space of \\(\set{(X_i, S_i, m_i) : i \in {1, 2}}\\). Let \\(E \in S = S_1 \times S_2\\): Note that this includes only rectangles in \\(R^{2}\\), but not circles etc.. \\\\(E_1 = \set{x_1 \in X_1: \exists x = (x_1, x_2) \in E}\\). Let \\(E_2(x_1)\\) be similarly defined.

Then, from the properties of the product measure: (Fubini) \\(\int_E f(x) dm = \int_{E_1} g(x_1) dm_1\\), where \\(g(x_1) = \int_{x_2 \in E_2} f(x_1, x_2) d(m_2)\\).

\pf{Let \\(R\\) be associated with the usual measure space \\((R, S_r, m_r)\\). (Core intuition) The min cover measure of the space in \\((X \times R)\\) bounded by \\(E\\) and \\(f\\) is \\(inf_{\set{B_i}} (m \times m_r)(\union_i B_i)\\), where \\(B_i = (B_{iX_1}\times B_{iX_2}  \times B_{iR}) \in (S \times S_r)\\) cover \\(E\\). Because we are dealing with the product measure, \\(m_1 m_2 m_r(B_i) = m_1(B_{iX_1})m_2 m_1(B_{iX_2} \times B_{iR})\\).}

Thus, integration over the product measure space reduces to integrating over one variable at a time; and the order in which these integrals are taken does not matter in this case. This case is aka multiple integration.

### Bounds
If \\(f \leq h, \int f dg \leq \int h dg\\). If \\(|f(x)| < M \implies |\int_{a}^{b} f dg| \leq M (g(b) - g(a))\\).

### Use polar coordinates
Consider \\(\int_{a, b} f(x, y) dx dy\\), one can find an equivalent expression in polar coordinates using \\(x = r \sin \gth, y = r \cos \gth\\) and \\(dxdy = dr (r d\gth)\\). This is sometimes simpler to solve.

As in the case of the Gaussian integral, the form \\(\int_{a, b} f(x, y) dx dy\\) may be derived from considering \\(I^2\\).

## Important integrals
### Normal integral
Aka Gaussian integral.
\\(\int_{-\infty}^{\infty}e^{-x^{2}}dx = I = \sqrt{\pi}\\): \\
\pf{\\(I^{2} =  \int_{y=-\infty}^{y=\infty}\int_{x=-\infty}^{x=\infty}e^{-x^{2}-y^{2}}dxdy \\); thence transform to polar coordinates and solve.}

#### Importance
The Gaussian integral itself is important due to this nice integrability and the nice properties observed in the Gaussian distribution (very suitable for modeling). Further, it is useful because realated integrals can be used to smooth functions for various purposes (eg: optimization).

In calculating similar integrals, one often uses similar techniques and results about exponential and gamma probability densities.

