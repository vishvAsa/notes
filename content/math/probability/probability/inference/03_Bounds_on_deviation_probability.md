+++
title = "03 Bounds on deviation probability"

+++
Aka concentration of measure inequalities.

## Expectation based deviation bound
(Aka Markov's inequality). If \\(X\geq 0\\): \\(Pr(X \geq a) \leq \frac{E[X]}{a}\\): \\(Pr(X \geq a)\\) is max when \\(X\\) is 0 or a.

Averaging argument. If \\(X\leq k\\), \\(c\mean Pr(X\leq c\mean) + k(1-Pr(X\leq c\mean)) \geq \mean\\); so \\(Pr(X\leq c\mean) \leq \frac{k-\mean}{k-c\mean}\\).

This technique is used repeatedly in other deviation bounds based on variance and moment generating functions.

## Variance based deviation bound
(Aka Chebyshev's inequality). By Markov's inequality: \\(Pr((X-E[X])^{2} \geq a^{2})\leq  \frac{Var[X]}{a^{2}}\\).

### Use in estimation of mean
\\(Pr(n^{-1}(\sum X_i-E[X_i])^{2} \geq a^{2}) = Pr((\sum X_i-E[X_i])^{2} \geq na^{2})\leq  \frac{Var[\sum X_i]}{na^{2}}\\). Applicable for pair-wise independent Bernoulli trials.

## Exponentially small deviation bounds
### General technique
(Chernoff) \\(Pr(e^{tX} \geq e^{ta})\leq E[e^{tX}]/e^{ta}\\): applying Markov. Used to bound both \\(Pr( X>a)\\) and \\(Pr(X<a)\\) with \\(t>0\\) or \\(t<0\\). Get a bound exponentially small in \\(\mean\\), deviation.

### For random variable sequences
\\(\mean = \sum E[X_i]\\). For \\(X=\sum_{i=1}^{n}X_{i}\\). Note that RVs are not necessarily identically distributed.

#### Pairwise independent RVs
Use variance based deviation bounds, as variance of pairwise independent RVs is an additive function.

### Sum of n-wise independent RVs
#### Bounds from MGF's.
\\(Pr(e^{tX} \geq e^{ta})\leq E[e^{tX}]/e^{ta} = (\prod E[e^{tX_i}])/ e^{ta}\\): here ye have used independence.

If \\(d>0\\), \\(Pr(X \geq (1+d)\mean) \leq \frac{e^{\mean(e^{t}-1)}}{e^{t(1+d)\mean}} \leq \frac{e^{d\mean}}{(1+d)^{(1+d)\mean}}\\): using \\(t = \ln(1 + d)\\) and \\(M_{X}\\) bound.

So, if \\(R = (1 + d)\mean >6 \mean: d = \frac{R}{\mean} - 1 \geq 5, Pr(X \geq (1 + d) \mean) \leq (\frac{e}{6})^{R} \leq 2^{-R}\\).

If d in (0,1], \\(Pr(X \geq (1+d)\mean) \leq e^{\frac{-\mean d^{2}}{3}}\\): As \\(\frac{e^{d}}{(1+d)^{(1+d)}} \leq 2^{\frac{-d^{2}}{3}}\\): as \\(f(d) = d - (1 + d) \ln (1+d) + \frac{d^{2}}{3}\leq 0\\): as \\(f(0) \leq 0\\) and \\(f'(d) < 0\\).

If d in (0,1], \\(Pr(X \leq (1-d)\mean) < \frac{e^{-d\mean}}{(1-d)^{(1-d)\mean}}\\); \\(Pr \leq e^{\frac{-\mean d^{2}}{2}}\\).

So, \\(Pr(|X-\mean|\geq d\mean) \leq 2e^{-\mean d^{2}/3}\\). \exclaim{So, probability of deviation from mean decreases exponentially with deviation from mean.}

Can be used in both additive and multiplicative forms.

#### Goodness of empirical mean
Now, \\(E[X_i] = p\\). Using \\(X/n = \sum X_{i}/n\\) to estimate mean p. So, \\(Pr(|\frac{\sum X_{i}}{n}-p|\geq d p) \leq 2e^{-np d^{2}/3}\\). \exclaim{So, probability of erroneous estimate decreasing exponentially with number of samples!}

#### Code length divergence bound
Let \\(D_p\\) and \\(D_q\\) be probability distributions of binary random variables with probabilities \\(p\\) and \\(q\\) of being 1 respectively.

\\(D_p(\sum_i X_i \geq qn) \leq (n-qn)e^{-n KL(D_p||D_q)}\\).

\pf{Suppose that \\(X_i\distr D_p\\) and that \\(p<q, k \geq qn\\).

$D_p(\sum_i X_i = k) \leq \frac{D_p(\sum_i X_i = k)}{D_q(\sum_i X_i = k)} = 
(\frac{p}{q})^{k}(\frac{1-p}{1-q})^{n-k} 
\leq (\frac{p}{q})^{qn}(\frac{1-p}{1-q})^{n(1-q)} =\\ e^{-n KL(D_p||D_q)}$.

So, taking the union bound over all \\(k \geq qn\\), we have the result.}

Using the connection between the code length divergence and the total variation distance: \\(KL(D_p||D_q) \geq 2(p-q)^{2}\\). This can be used to derive other deviation bounds.

#### Additive deviation bounds
See Azuma inequality section.

### iid RV: Tightness of the Chernoff bound
(Cramer) Take \\(l(a) = \max_{t} ta-M(a)\\). For large \\(n\\): \\(Pr(\frac{\sum X_{i}}{n}\geq a) \geq e^{-n(l(a) + \eps)}\\) \why. Combining with Chernoff, \\(Pr(\frac{\sum X_{i}}{n}\geq a) = e^{-n(l(a) + \eps_{n})}\\) for some seq \\((\eps_{n}) \to 0\\).

\part{Probabilistic Analysis Techniques}