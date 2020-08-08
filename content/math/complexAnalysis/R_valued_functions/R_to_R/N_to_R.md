+++
title = "N to R"
+++

## Convergent sequences \\((s_{n), (t_{n})\\) in a field
Also see Topology ref, properties noted in lin alg ref.

Sums, products, quotients (sans 0 denominator) of convergent sequences are convergent.

### Boundedness
Upper and lower bounds.

### Montonicity
Monotone increasing and decreasing sequences.

A monotone increasing sequence that is bounded above must converge: imagine points on real line; similarly monotone decreasing sequence that is bounded below.

(Bolzano, Weierstrass): Every bounded sequence has a subsequence which converges: let M be the bound; either [-M, 0] or [0, M] has \\(\infty\\) elements; so use this repeatedly to find monotone, bounded subsequence; this converges. Also holds for \\(R^{n}\\).

### Upper and lower limits
Take set of subsequential limits E. Upper limit of \\(s_{n}\\): \\(s^{*} = \limsup_{n \to \infty}s_{n} := \sup E\\); similarly lower limit: \\(s_{*} = \liminf_{n \to \infty}s_{n}\\).

If \\(s_{n} \to s, s^{*} = s_{*} = s\\). E is closed, so \\(s_{*}, s^{*} \in E\\).

## Generating function of a sequence
Take sequence \\((a_i)\\). Get generating function: \\(G(x; a_n) = \sum_{n=0}^{\infty}a_n x^{n}\\).

## Series
\\(\infty\\) series. A sequence of partial sums: \\(s_{n} = \sum_{i=1}^{n} a_{i}\\).

### Convergence
Many ideas from convergence of sequences.

### Convergence tests
\\(s_{n}\\) converges \\(\equiv\\) it is cauchy. Aka completeness property of R or C. Cauchy criteria for convergence of \\(s_{n}\\): \\(\forall \eps, \exists N: |s_{N}-s_{N+n}|< \eps\\). So, \\(|a_{n}| \to 0\\).

Sum or product of absolutely convergent series is absolutely convergent: limit of new series is sum or product of limits (Cauchy product).

Comparison test: If \\(|a_{n}| \leq c_{n}\\): if \\(\sum c_{n}\\) converges, \\(\sum a_{n}\\) converges; if \\(\sum |a_{n}|\\) diverges, \\(\sum c_{n}\\) diverges: using Cauchy criterion.

If \\(a_{k} \geq a_{k+1}\geq 0, s_{n} = \sum a_{n}\\) converges \\(\equiv\\) \\(t_{n} = \sum_{k=0}^{n} 2^{k}a_{2^{k}}\\) converges: \\(s_{n}\\) monotonically increasing, so check boundedness: \\(\frac{t_{k}}{2}\geq s_{n}\leq t_{k}\\) for \\(n\leq 2^{k}\\).

#### Ratio test
Converges if \\(\limsup |\frac{a_{n+1}}{a_{n}}| < b< 1\\): bound by geometric series \\(b^{k}a_{n}\\); diverges if \\(>1: |a_{n}| \notto 0\\).

#### Root test
Take \\(x = \limsup |a_{n}|^{1/n}\\): So \\(|a_{n}| \leq x^{n}\\). So, convergence if \\(x<1\\), divergence if \\(x>1\\); No info otherwise: \\(\sum 1/n \diverge\\), but \\(\sum 1/n^{2} \to c\\).

More powerful than ratio test: \\
\\(\liminf |\frac{a_{n+1}}{a_{n}}| \leq \liminf |a_{n}|^{1/n} \leq \limsup |a_{n}|^{1/n} \leq \limsup |\frac{a_{n+1}}{a_{n}}|\\). \why

#### Alternating series test
If \\(|c_{i}| \geq |c_{i+1}|; c_{2k+1} \geq 0, c_{2k} \leq 0, \lim c_{n} = 0\\), then \\(\sum c_{n}\\) converges \why. So, \\(\frac{(-1)^{n}}{n}\\) converges.

### Conditional convergence
Absolute (\\(\sum |a_{i}|\\)) vs conditional (\\(\sum a_{i}\\)) convergence. Absolute convergence \\(\implies\\) conditional convergence: ratio test.

For conditional convergent series: There are \\(\infty\\) +ve and -ve numbers which converge to \\(+\infty\\) and \\(-\infty\\): else contradicts absence of absolute convergence or presence of conditional convergence.

### Absolute convergence
All \\(a_{n} \geq 0\\). \\(s_{n}\\) monotone: so converges \\(\equiv\\) it is bounded.

### Rearrangement
Take \\(\sum a_{n}\\) conditionally but not absolutely convergent: so \\(|a_{n}| \to 0\\), \\(x \leq y\\). \\(\exists\\) rearrangement of terms: \\(s_{n}' = \sum a_{k}'\\), with \\(\liminf s_{n}' = x, \limsup s_{n}' = y\\): take +ve \\(\set{p_{n}}\\), -ve \\(\set{q_n}\\): both diverge, collect enough \\(p_{n}\\) to go just over y; collect enough -ve numbers to go just under x; repeat: visualize as displacement between 2 points in R. So, can converge to any real number r. Eg: Rearrange terms of alternating harmonic series.

If \\(\sum a_{n}\\) converges absolutely, all rearrangements converge to same limit: Any \\(s_{n}' = \sum a_{k}'\\) is in some \\(s_N\\) and vice versa.

### Series product
\\(\sum a_{n}, \sum b_{n}: c_{n} = \sum_{k=0}^{n}a_{k}b_{n-k}\\) is the product: put all ordered sequences \\((a_{i}, b_{i})\\) on a line: the diagonals of \\(a_{i} vs b_{i}\\) matrix are \\((c_{n})\\).

If \\(\sum |a_{n}|\\) converges, \\(\sum a_{n} \to A, \sum b_{n} \to B, \sum c_{n} \to AB\\): Take \\(D_n = B_n - B\\), \\(C_{n} = \sum_{k=0}^{n}a_{i}B_{n-i} = \sum_{k=0}^{n}a_{i}(B + D_n) = A_{n}B + \gamma \to AB\\).

## Special series
### Arithmatic series
Arithmatic series: \\(S_n = \sum_n Tn: T_n = a + nd\\). Reverse the series, add respective terms, get: \\(2S_n = n(a+nd)\\)

### Geometric-like series
\\(T_n = ar^{n}\\). Multiply by r, subtract terms, get: \\((1 - r)S_n = a - ar^{n+1}\\). Convergence as \\(n \to infty\\): if \\(r < 1\\). Similar techniques for \\(a+2ar+3ar^{2} \dots\\).

### Harmonic-like series
General harmonic series has: \\(T_n = (a + nd)^{-1}\\).

\\(\sum 1/n \\) diverges: \\(1 + 1/2 + 1/3 + 1/4 ..\\): \\(\sum_{n=3}^{4} 1/n,  \sum_{n=5}^{9} 1/n\\) etc exceed 1/2. Harmonic number: \\(H(n)\approx \ln n = \int x^{-1} dx\\).

\\(\sum 1/n^{p}\\) converges if \\(p>1\\), diverges if \\(p \leq 1\\): check convergence of \\(\sum \frac{2^{k}}{2^{kp}}\\).

\\(\sum_{n=2}^{\infty} \frac{1}{n (\log n)^{p}}\\) converges \\(\equiv\\) \\(p>1\\).

### Power series
\\(z\in C: \sum c_{n}z^{n}\\). If this converges, got Generating Function!

Take \\(a = \limsup_{n \to \infty} |c_{n}|^{1/n}, R = 1/a\\): convergence if \\(|z|<R\\) (radius of convergence), divergence if \\(|z|>R\\): From Root test, ratio test.

If R = 1, \\(c_{i} \geq c_{i+1} \geq 0\\), then \\(\sum c_{i}z^{n}\\) converges \\(\forall z\\), except maybe z = 1. \why

### Binomial theorem
For \\((x+y)^{n} : n\in N\\): from combinatorics. For \\((1+x)^{n} : n\in R\\): Solve for coefficients in \\((1+x)^{n} = 1 + nx + .. \\) by differentiating repeatedly.

### e
\\(e = \lim_{n \to \infty} (1+n^{-1})^{n} = \lim_{n \to \infty} = 1 + 1 + \frac{1}{2!} .. \\). \\(2 < e < 1 + \sum_{n=0}^{\infty} (\frac{1}{2})^{n} = 3\\), and e is an increasing sequence: so it converges.

Observe relationship with definition using natural log in another section.

## Summation tricks
### Summation by parts
Like integration by parts. Seq \\((a_{n}), (b_{n}),  A_{n} = \sum a_{n}\\). If \\(p \in [0, q], a_{n} = A_{n} - A_{n-1}, \sum_{n=p}^{q} a_{n}b_{n} = \sum_{n=p}^{q-1} A_{n}(b_{n}-b_{n+1}) + A_{q}b_{q} - A_{p-1}b_{p}\\).

If \\((A_{n})\\) bounded seq, \\(b_{0} \geq b_{1} .., \lim_{n \to \infty} b_{n} = 0, \sum b_{n}a_{n}\\) converges: Can use summation by parts to show Cauchy criterion.

### Using binomial summation formula
\\(\sum k = \sum \binom{k}{1} = \binom{k+1}{2}\\). Similarly, any polynomial \\(\sum a_{i}k^{i} = \sum b_{i}\binom{k}{i}\\).

### Derivative to estimate limit of partial sums
\\((1-x)^{-1} = \sum_{i=0}^{\infty} x^{i}\\); take derivatives to get: \\((1-x)^{-2} = \sum_{i=0}^{\infty} ix^{i-1} = \sum_{i=0}^{\infty} (i-1)x^{i-1} - x^{i-1}\\). Use similar trick to find: \\(i^{2}x^{i}\\).

### Integral to estimate limit of partial sums
Also, use \\(\sum n \approx \int x dx\\).

The series \\(-\log (1 - x) = \int(\frac{1}{1-x}) = \sum_{i=1}^{\infty} x^{i}/i\\); also from McLaurin series.


