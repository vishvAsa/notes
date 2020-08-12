+++
title = "Fourier Analysis"
+++

Fourier analysis of ANY real valued boolean fn. 

## The function space for Uniform distribution
### Dimensionality
Take the real space \\(R^{2^{n}}\\): Not \\(\infty\\) dimensional Hilbert space. Any real valued boolean function can be represented by a point in this space.

Can also be applied to randomized boolean functions: Alter expectations and probabilites to handle extra randomness.

### Inner product
\\(\dprod{f,g} \dfn 2^{-n} \sum_{x} f(x)g(x) = E_{x \in_{U} \set{\pm 1}^{n}}[f(x)g(x)]\\): defined thus scaled to make \\(\norm{p_{S}} = \norm{f} = 1\\). If \\(S \neq T\\): \\(\dprod{p_{S}, p_{T}} = 0\\).

#### The basis
These form an alternate basis: Parity functions \\(p_{S}\\), where S is the index vector.

The standard basis is just \\(\set{e_i}\\).

## Transforms
### Discrete Fourier series
Discrete Fourier series for any real valued fn over \\(\set{\pm 1}^{n}\\): \\(f = \sum_{S\subseteq [n]} \hat{f}(S)p_{S}\\).

\\(\norm{f}^{2} = \sum_{S} \hat{f}(S)^{2} = E_{x}[f(x)^{2}] = 1\\): [Parseval].

### Correlation / Discrete Fourier coefficient
Aka Fourier weights on basis vectors or Fourier spectrum. \\(\hat{f}(S) = \dprod{f, p_{S}} = E_{x}[f(x)p_{S}(x)]= Pr_{x}(f(x) = p_S(x)) - Pr_{x}(p(x) \neq p_S(x))\\): so, a measure of how good an approx of f \\(p_S\\) is. \\(\dprod{f,g} = \sum_{S} \hat{f}(S) \hat{g}(S)\\).

### Fourier transform of f
\\(\hat{f}(S) = 2^{-n} \sum_{x} f(x)p_{S}(x)\\). All \\(\hat{f}(S)\\) can be computed in time \\(O(n2^{n})\\) using FFT alg, given all f(x). \why Inverse FFT can be similarly done. Also see Functional analysis ref.

## Estimating coefficients
### Estimate all Fourier coefficients of f using FFT
\\(f_R\\): A boolean fn on \\(\set{0,1}^m\\): Take random m*n matrix, define \\(f_R(y) = f(yR)\\). Fourier coefficients of \\(f_R\\) are Fourier coefficients of f restricted to a random subspace.

For random non singular m*n R, with m large enough to give good estimation of \\(Pr(f(x) p_a(x) = 1)\\) whp. Thence find approximations of all the Fourier coefficients of f by finding all coefficients of \\(f_R\\) using FFT.

### Relationship with total influence
\\(I(f) = \sum_{S}|S|\hat{f}(S)^{2}\\). \why

### Relationship with noise sensitivity
Eg: \\(NS_{\eps}(\Land_{i} x_{i}) = \frac{2}{2^{n}}(1-(1-\eps)^{n}) \approx 0\\); For parity: \\(NS_{\eps}(p_{1^{n}}(x)) = 2^{-1}-2^{-1}(1-2 \eps)^{n} \approx 2^{-1}\\); note correlation with good/ bad Fourier concentration.

\\(NS_{\eps}(f) = 2^{-1}-2^{-1} \sum_{S}(1-2\eps)^{|S|}\hat{f}(S)^{2}\\):\\
\\(Pr_{x,y}(f(x) \neq f(y)) = 2^{-1} - 2^{-1}E_{x,y}[f(x)f(y)]\\); \\
But 
$$E_{x,y}[f(x)f(y)] = E_{x,y}[(\sum_{S}\hat{f}(S)p_{S}(x)) (\sum_{T}\hat{f}(T)p_{T}(x))] \\
= \sum_{S, T}\hat{f}(S)\hat{f}(T)E_{x,y}[p_{S}(x)p_{T}(y)] = \sum_{S}\hat{f}(S)\hat{f}(T)E_{x,y}[p_{S}(x)p_{S}(y)]$$; but\\
 \\(E_{x,y}[p_{S}(x)p_{S}(y)] = \prod_{i} E[p_{\set{i}}(x)p_{\set{i}}(y)] = (1-2\eps)^{|S|}\\).

\\(\sum_{|S| \geq \eps^{-1}} \hat{f}(S)^{2} \leq NS_{\eps}(f)\\), k const: \\(2NS_{\eps}(f) = 1 - \sum_{S}(1-2\eps)^{|S|}\hat{f}(S)^{2} = \sum_{S} \hat{f}(S)^{2}-\sum_{S}(1-2\eps)^{|S|}\hat{f}(S)^{2} = \sum_{S} \hat{f}(S)^{2}(1-(1-2\eps)^{|S|}) \approx \sum_{S} \hat{f}(S)^{2}(1-e^{-2}) \geq k' \sum_{S} \hat{f}(S)^{2}\\).

As, \\(\sum_{|S| \geq \eps^{-1}} \hat{f}(S)^{2} \leq NS_{\eps}(f)\\), any f is \\((NS_{\eps}(f), \eps^{-1})\\) concentrated.

### Concentration in the spectrum
Aka Fourier concentration.

#### (eps, d) concentrated function f
\\(\norm{\sum_{|S| >d} \hat{f}(S)p_{S}}_{2}^{2} \leq \eps\\). Visualize with histogram.

If C = polysize DNF formulae, every \\(c\in C\\) is \\((\eps, \log |c| \log\frac{1}{\eps})\\) concentrated. \why

Depth d ckts of size \\(|c|\\): \\((\eps,\log |c| \log\frac{1}{\eps})^{d-1}\\) concentrated. \why

### Best fitting d degree polynomial
\\(\norm{f-g}^{2} = \sum_{S} (\hat{f}(S)-\hat{g}(S))^{2} = E_{x}[(f(x)-g(x)))^{2}]\\); \\
so \\(\min_{g} E_{x}[(f(x)-g(x))^{2}] = \sum_{|S|\leq d} \hat{f}(S)p_{S}\\).

### t - sparse f
Number of non zero coefficients in f \\(\leq t\\).

#### Sparse approximator for any f
\\(\exists \frac{\norm{f}_{1}^{2}}{\eps}\\) \\
sparse g with \\(\norm{f-g}^{2} \leq \eps\\): Remove all \\(\hat{f}< \frac{\eps}{\norm{f}_{1}}\\); then g is \\(\frac{\norm{f}_{1}^{2}}{\eps}\\) sparse: \\(\norm{f}_{1} = \sum \hat{f}(S)\\) and each \\(\hat{f}(S)\\) has min size \\(\frac{\eps}{\norm{f}_{1}}\\). 
$$\norm{f-g}^{2} = \sum_{p_{S} \notin basis(g)} \hat{f}(S)^{2} \leq \\
(\max_{p_{S} \notin basis(g)}) \hat{f}(S) \sum_{p_{S} \notin basis(g)} \hat{f}(S) \leq \eps$$.

So, sgn(g) approximates f.

#### Weak parity learning problem
Let f have a t-heavy Fourier component; then find a t/2 heavy Fourier component. Thence find weakly correlated parity.

KM alg solves this; See colt ref.


