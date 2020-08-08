+++
title = "Bounds and limits"
+++

\\(p^{1/n} \to 1\\): take seq \\(x_{n} = p^{1/n}-1\\). Also, \\(n^{1/n} \to 1\\).

## Bounds on combinatorial quantities
### Bounds on n!
(Stirling)\\(n!\approx \sqrt{2n\pi} (\frac{n}{e})^{n}\\). \why

### Bounds on (a choose b)
\\(\binom{a}{b} = \frac{a!}{b!(a-b)!} \approx \frac{a^{a}}{\sqrt{2n\pi} b^{b}(a-b)^{a-b}}\\) for large a, b and a-b.

So: \\(\binom{a}{b} \leq (\frac{ea}{b})^{b}\\). \\(\lceil \frac{a}{b}\rceil \leq \frac{a-1}{b}+1\\). \\(\frac{e^{m}}{\sqrt{em}}< \frac{m^{m}}{m!}\leq \sum \frac{m^{i}}{i!} = e^{m}\\). \\((\frac{a}{b})^{b} < \binom{a}{b} < a^{b}/b!\\).

## Bounds on powers and exponents
### Bounds on \htext{\\((1+b)^{n\\) and \\(e^{n}\\)}{exponentials}}
Using Taylor series of \\(e^{-x}\\) wrt 0, stopped at \\(x^{2}\\): \\(e^{-x} \geq 1-x\\).

\\((1-x^{-1})^{x} \leq e^{-1} \leq (1-x^{-1})^{x-1}\\): first inequality from taylor series argument. Latter ineq similarly proved for \\(x \in (0, 1)\\) by showing \\(e \geq (1-x^{-1})^{1-x}\\).

Also can get bounds using Taylor series; eg: \\(2^{-1}(e^{ac}+e^{-ac}) \leq e^{a^{2}c^{2}2^{-1}}\\).

### Bounds on log x
Using log series, or from concavity: \\(\ln x \leq x-1\\); easy to visualize with log x curve under x - 1 line.

## Inequalities among means
### Bound ab with a convex combination of powers
Aka Young's inequality. \\(a, b \geq 0\\); \\(p, q \in R^{+}\\) with \\(p + q = 1\\); then \\(ab \leq pa^{\frac{1}{p}} + qb^{q^{-1}}\\). Special case of the inequality of weighted arithmetic and geometric means, but is described separately to illustrate the proof technique.

Pf: Let \\(a, b >0\\). \\(\ln ab = \ln a + \ln b = p\ln a^{p^{-1}} + q\ln b^{q^{-1}}\\). \\(\ln(x)\\) is strictly concave function on \\(R^{+}\\); thence use this to get inequality.

### AM GM HM inequality
The various means are described in the statistics survey.

Suppose \\(a, b \geq 0\\). Using the same technique (taking \\(\log(a^{p}b^{q})\\) and taking advantage of concavity of \\(\log(x)\\)), we see that weighted GM \\(\leq\\) weighted AM.

Also, weighted GM \\(\geq\\) weighted HM: from applying the AM-GM inequality: \\((a^p b^q)^{-1} \leq pa^{-1} + qb^{-1}\\).

