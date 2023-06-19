+++
title = "05 Random variable sequence"

+++
\\((X_{i})\\) with CDF \\((F_i)\\).

## Convergence in distribution to X
Aka weak convergence. If \\(\forall x: \lim_{n \to \infty} F_n(x) = F(x)\\), then \\(X_n \to^{d} X\\). Comments about limit of CDF's.

## Convergence in probability to X
If \\(\forall \eps: \lim_{n \to \infty}Pr(|X_n - X| > \eps) = 0\\), say \\(X_n \to^p c\\); so limit of sequence of probabilities. Probability of deviation from \\(X\\) grows smaller and smaller, but doesn't necessarily hit 0. Eg: Weak law of large numbers.

Implies convergence in distribution.

## Almost sure convergence
\\(Pr(\lim_{n \to \infty}(X_n = X)) = 1\\): Note that \\(\lim\\) is inside Pr(); so limit of sequence of boolean events. Eventually, \\(X_n\\) will behave exactly like X. Eg: Animal's daily consumption will some day hit 0 and stay 0.

Implies convergence in probability.

## Sure convergence
All \\(X_n\\) are over exactly same sample space \\(\gO\\). \\(\forall w \in \gO: \lim_{n \to \infty} X_n(w) = X(w)\\). Implies all other forms of convergence.
