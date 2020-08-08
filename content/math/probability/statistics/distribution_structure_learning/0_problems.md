+++
title = "0 Problems"
+++

## Conditional distributions and notation
Got observations of events: RV \\(X\\) took values \\(\set{x_{i}}\\), deduce/ model the process causing those events. In general, we want to model the conditional distributions \\(f_{X_r|X_{\lnot r}}\\). Often, we use the alternate notation \\(Y = X_r\\) and \\(X = X_{\lnot r}\\).

## Connection to modeling marginal density
Note that \\(X_{\lnot r}\\) may be empty, so that marginal/ unconditional distribution modeling - which is estimating \\(f_X(X)\\) - is a special case of conditional distribution modeling.

Techniques which are suitable for modeling conditional distributions can be directly applied to such special cases. Techniques specialized for modeling unconditional distributions can be applied to modeling one conditional distribution \\(f_{X_r|X_{\lnot r} = x_{\lnot r})}\\) at a time.

### Problem structure
For discrete probability distribution \\(p\\), valid values of \\(p\\) form the probability simplex. Also, expectation is linear in \\(p\\), variance is concave in \\(p\\).  So, can specify many convex optimization problems using these constraints.

