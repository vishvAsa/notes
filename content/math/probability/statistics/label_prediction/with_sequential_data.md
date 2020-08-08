+++
title = "With sequential data"
unicode_script = "devanagari"
+++

## Trajectory prediction
### Problem
Consider sequential data: observations \\(S\\) consisting of labels \\(L_1 .. L_n\\) observed at different positions \\(X_1.. X_n\\) (perhaps times). We want to predict \\(L_{n+1}\\) corresponding to \\(X_{n+1}\\).

The underlying process is such that the distribution of \\(L_{n+1}\\) depends on both \\(S\\) and \\(X_{n+1}\\). 

### Simplifications
Even predicting a lower bound or upper bound (whp) of \\(L_{n+1}\\) may be useful.

### Applications
Predicting trajectory of a missile, market price of a security tomorrow.

