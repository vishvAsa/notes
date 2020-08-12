+++
title = "03 Martingale \\\\(\\seq{Z_{n}}\\\\) wrt filtration"

+++
## Problem
Suppose that one observed RV \\(\seq{Z_n}\\) and a filtration or a series of events \\(\seq{F_n}\\), with the property that \\(F_n \supseteq F_{n-1}\\).

Suppose further that: \\(E[|Z_{n}|] < f(n) < \infty\\), that \\(Z_n\\) is fully determined when \\(F_n\\) is observed, and \\(E[Z_{n}|F_{n-1}] = Z_{n-1}\\) (or \\(E[Z_{n}|F_{n-1}] - Z_{n-1} = 0\\)).

This process is the martingale \\(\seq{Z_n}\\) wrt filtration \\(\seq{F_n}\\).

### Example
The filtration can correspond to the observation of a sequence of random variables \\(\seq{X_n}\\).

Note that this defines martingale \\(\seq{X_{n}}\\) wrt itself. Eg: Wealth after 100 fair-coin-toss bets, Brownian motion.

## Properties
Note that this implies that  \\(E[Z_n] = E[Z_0]\\).

## Stopping time T
One can stop the stochastic process based on past (not future) bets/ Observations of \\(X_i\\); the corresponding time is called the stopping time.

**Stopping theorem**: If \\(E[T] < \infty\\) or \\(T\\) bounded or \\(|Z_{i}|<c\\), then \\(E[Z_{T}]=E[Z_{0}]\\). Wald: If \\(X_{i}\\) iid, \\(T\\) stopping time: \\(E[\sum_{i=0}^{T}X_{i}] =E[T]E[X]\\).


## Doob martingale
Anything like \\(Z_{i}=E_{X_{i+1 .. X_{n}}}[f(X_{1}..X_{n})|X_{1}..X_{i}]\\) fits defn of Martingale: \\
Eg: \\

$$E_{X_{2} .. }[Z_{2}|X_{1}] = E_{X_{2} ..}[E_{X_{3} ..}[f(X_{i})| X_{1}, X_{2}]| X_{1}] = \\
\sum_{x_{2}} E_{X_{3} ..}[f(X_{i})| X_{1}, X_{2} = x_{2}] Pr_{X_{2}}(X_{2} = x_{2}|X_{1})= E_{X_{2} ..}[f(X_{i})| X_{1}] = Z_{1}$$.

## Find expected running time of a game
Make a martingale, use Wald's equation.

## Concentration around starting value
(Azuma) For martingale \\(\set{X_{i}}\\): \\
\\(|X_{k}-X_{k-1}|<c_{k}\\) : \\(Pr(X_{t}-X_{0} \geq l) \leq e^{-\frac{l^{2}}{2\sum c_{k}^{2}}}\\).

Eg: If you make small bets then you stay near mean.

\pf{Define new RV: \\(Y = X_{t}-X_{0} = \sum Y_{i}, Pr(e^{aY} \geq e^{al}) \leq \frac{E[e^{aY}]}{e^{al}} = \frac{E[\prod e^{aY_{i}}]}{e^{al}} = \frac{\prod E[e^{aY_{i}}]}{e^{al}}\\) (from independence of \\(\set{Y_i}\\)). Take \\(a>0\\).

As \\(e^{aY_{i}}\\) is convex and \\(Y_i \in [-c_i, c_i]\\), so \\(e^{aY_{i}} \leq \frac{e^{ac_{i}} (1 - \frac{Y_{i}}{c_{i}}) + e^{-ac_{i}}(1 + \frac{Y_{i}}{c_{i}})}{2} \leq \frac{e^{ac_{i}} + e^{-ac_{i}}}{2}\\) as \\(e^{ac_{i}} > e^{-ac_{i}}\\). So \\(E[e^{aY_{i}}|X_{1} .. X_{i}] \leq \frac{e^{ac_{i}} + e^{-ac_{i}}}{2} \leq e^{(ac_{i})^{2}/2}\\) from \\(e^{x}\\) series.

So, \\(Pr(e^{aY} \geq e^{al}) \leq e^{-al}e^{\sum_i (ac_{i})^{2}/2}\\). Setting \\(a=\frac{l}{\sum c_i^{2}}\\), we get the result.}

\core{In the foregoing proof, the crucial idea was considering the exponentiated event, which could then be decomposed and bounded due to independence. The algebraic trickery in selecting the right value for \\(a\\) and in coming up with the bounds were interesting.}

Applying to martingale \\(\set{-X_{i}}\\): \\(Pr(X_{t}-X_{0} \leq -l) \leq e^{-\frac{l^{2}}{2\sum c_{k}^{2}}}\\).

### Applied to Doob Martingale
\\(Z_{i}=E[f(X_{1}..X_{n})|X_{1}..X_{i}]\\). If f satisfies Lipschitz condition with bound c (max change c in \\(f(X_{1}..X_{n})\\) when \\(X_{i}\\) changes): \\(Pr(|E[f(X_{1}..X_{n})] - f(X_{1}..X_{n})| \geq l) \leq 2e^{-\frac{l^{2}}{2nc^{2}}}\\). Aka method of bounded differences (MOBD).

Note: No independence needed till here.

### Additive Bound for deviation from mean
(Azuma Hoeffding) So, let independent, not necessarily identically distributed \\(X_{i} \in [b, c]\\), \\(f(X_{1}..X_{n}) = X = \sum X_{i}\\). \\(Pr(|\sum X_i - \sum \mu_i| \geq na)\leq e^{-\frac{n^{2}a^{2}}{2nc^{2}}}\\).

#### Application in estimating mean
If \\(\set{X_i}\\) also identically distributed:\\
 \\(Pr(|X - n\mu| \geq na)\leq e^{-\frac{n^{2}a^{2}}{2nc^{2}}}\\).

### Additive deviation bound for sum of Poisson trial RV's
If \\(\frac{X}{n} = \hat{p}, Pr(|\hat{p} - \mu| \geq \epsilon) \leq 2e^{-\frac{n\epsilon^{2}}{2}}\\). \\(1-\epsilon\\) confidence interval for parameter p.
