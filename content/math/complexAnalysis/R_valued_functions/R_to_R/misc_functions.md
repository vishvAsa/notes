+++
title = "Misc functions"
+++

## Classification by dependence on parameters
See probability ref.

## Recurrance equations
Eg: \\(a'h_{i+2}+b'h_{i+1}+c'h_{i}=0\\) (Linear, homogenous). Get characteristic eqn by supposing \\(h_{i} = tx^{i}\\); Get roots and multiplicity: \\((r_{1},2), (r_{2},1)\\); Then, \\(h_{i} = ar_{1}^{i} + bir_{1}^{i} + cr_{2}^{i}\\); Solve for a, b, c with boundary conditions. Or, use telescoping sum.

## Polynomial P over field K
Polynomial over field K has coefficients from K. Rational function: ratio of polynomials. For \\(\perp\\) polynomials, see Approx theory ref. p is monic: highest degree of x has coefficient 1.

To show that P has high degree, show it has many roots.

### Multivariate polynomials
\\(Q(x_{1}, .. x_{n}) = Q(x)\\), let \\(x_{-i} = \\)x sans \\(x_{i}\\): Multivariate polynomial over field F; degree \\(d = \sum d(x_{i})\\). Have \\(\infty\\) roots: \\(x_{-i} = r_{-i}\\), Q(x) = univariate \\(P(x_{i})\\) has roots.

### Symmetric polynomials
\\(Q(x_{1} \dots x_{n}) = Q(\pi(x_{1} \dots x_{n}))\\) : no change on permutation. Eg: Parity function P. If Q is symmetric, multilinear \\(\implies\\) Q writable as monomial \\(Q'(\sum x_{i})\\) of same degree: intuitive b'coz vars are indistinct, (Find inductive proof).

#### Probability of multivariate polynomials becoming 0
(Schwartz Zippel). \\
Q(x); \\(S\subseteq F\\); \\(Pr_{r \in S}(Q(r) = 0) \leq \frac{d}{|S|}\\): generalizes univariate case: \\(P(x_{i})\\) has d roots. True for d=0; assume for d=n-1; \\(Q(x) = \sum_{k} x^{k}Q_{k}(x_{-1})\\); \\(Pr(Q(r) = 0) \leq Pr(Q(r_{-1}) = 0) + Pr(Q(r)=0 | Q(r_{-1}) \neq 0) \leq \frac{d-k}{|S|} + \frac{k}{|S|}\\).

### Roots of polynomial P over R
From group theory: P over the field Q. For \\(deg(P) \geq 5, \exists P: P(r)=0, r \in R\\), r can't be writ in terms of +, -, *, /, kth root. \why

Fundamental theorem of algebra: P of degree d has d roots in C. \why

If x is root of P, so is \\(\bar{x}\\): \\(P(x) = \sum a_{i}x^{i} = 0 = \conj{\sum a_{i}x^{i}} = \sum a_{i}\bar{x^{i}} = \sum a_{i}\bar{x}^{i} = P(\bar{x})\\). So, if deg(P) is odd, atleast 1 real root exists: also from the fact that \\(P = \Theta(x^{n})\\).

Every polynomial of odd degree (= \\(\Theta(x^{n})\\)) has a real root: Consider large +ve and -ve values for x and Intermediate value theorem. Also from the fact that complex roots appear in pairs.

Tricks: The constant gives clues about the root. Use the \\(\Theta\\) notation to consider the roots: To solve \\((\frac{e}{x})^{x}=n^{-2}\\); get \\(x \log \frac{x}{e} = 2 \log n\\); so \\(x \leq 2 \log n \leq x^{2}\\); so \\(x = (\log n)^{\theta(1)}\\).

Geometry: loci.

#### Quadratic eqn
Reduce to \\((ax+b)^{2}=c\\) and solve. So find roots of \\(x^{3}-1\\) (Invent i). Similarly, every polynomial can be factorized to (sub)quadratics. Cubics.

## Important functions over R and C
### Extrema
\\(\min(a, b) = 2^{-1}(|a+b| - |a-b|)\\).

### Unit step function I(x)
\\(I(x) = [x >0]\\). See connection with series and Stieltjes integrals.

Integer functions: \\(\floor{x}, \ceil{x}\\).

### Logarithm and exponential
\\(\ln x \dfn \int_{t=1}^{x} t^{-1}dt\\). By fundamental theorem of calculus, \\(\der{\ln x} = x^{-1}\\). So, \\(\ln(ab) = \ln a + \ln b\\), \\(\ln x^{k} = k \ln x\\).

\\(e \dfn x: \ln x = 1\\). So, \\(\ln e^{x} = x\\), \\(\der{e^{x}} = e^{x}\\). The McLaurin series \\(e^{x}\\).

### Generalized binomial coefficient
\\(\binom{r}{k}\\) for any \\(k\in Z, r\in R\\): generalizes \\(\binom{r}{k}\\) from combinatorics (See probability ref).

\\(\binom{n}{r} = \frac{n}{r}\binom{n-1}{r-1}\\). For \\(r \in N\\): \\(\binom{r}{k} = \binom{r}{r-k} = \frac{r}{r-k}\binom{r-1}{r-k-1} = \frac{r}{r-k}\binom{r-1}{k}: \therefore r\binom{r}{k} = (r-k)\binom{r}{k}\\): Both sides are degree k polynomials in r, agree in \\(\infty\\) points: so should be identically equal \\(\forall r\in R\\).

So, \\(\binom{r}{k} = \binom{r-1}{k} + \binom{r-1}{k-1}\\). Applying repeatedly, \\(n \in N: \sum_{k=0}^{n}\binom{r+k}{k} = \binom{r+n+1}{n}\\).

By induction: \\(n,m \in N:\sum_{k=0}^{n} \binom{k}{m} = \binom{n+1}{m+1}\\). Useful in summing series.

\\(\binom{r}{m}\binom{m}{k} = \binom{r}{k}\binom{r-k}{m-k}\\): combinatorial proof for r, m, k integers; thence generalize to \\(r \in R\\): use Polynomial interpolation argument.

Vandermonde convolution: \\(\sum_{k} \binom{r}{k}\binom{s}{n-k} = \binom{r+s}{n}\\): combinatorial proof for integer case; generalize to \\(r \in R\\): use Polynomial interpolation argument.

#### Polynomial interpolation argument
This is very useful in extending relationship between integers to all real numbers: as in proof of \\(r\binom{r}{k} = (r-k)\binom{r}{k}\\).

### Logistic sigmoid function
\\(f(z) = (1+e^{-z})^{-1}\\): an \\(S\\) trapped between \\(0\\) and \\(1\\). Used in logistic regression. \\(f'(z) = (1-f(z))f(z)\\).

### Normal function
Aka Gaussian function. Generalization of Gaussian distribution. \\
\\(f(x) = ae^{-\frac{(x-b)^{2}}{2c^{2}}}\\): mean at b, max value a, variance/ width \\(c^{2}\\). Using Gaussian integral \\(\int_{-\infty}^{\infty}e^{-x^{2}}dx = \sqrt{\pi}\\).

### Gamma function
\\(\gG(z) = \int_{0}^{\infty} x^{z-1}e^{-x}dx\\). \\(\gG(1) = 1\\). \\(\gG(a) = (a-1)\gG(a-1)\\): using integration by parts; so generalizes factorial: \\(\gG(n) = (n-1)!\\). Useful in specifying normalization constants in some distributions.


