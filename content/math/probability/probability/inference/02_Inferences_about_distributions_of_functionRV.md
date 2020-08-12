+++
title = "02 Inferences about distributions of function(RV)"

+++

Y = g(X).

Use \\(Pr(g(X) \in A) = Pr(X \in g^{-1}(A))\\). So, given CDF, PDF of X, can deduce CDF of g(X) and thence derive PDF of g(X).

## Using \\(\frac{dg^{-1}(Y)\\)
If g is monotone in \\((x, x+\gd x)\\): \\(p_{X}(x)\gd x \approx p_{Y}(y)\gd y\\), taking \\((x, x+\gd x)\\) to \\((y, y+\gd y)\\) using g: So \\(p_Y(y) = p_{X}(x)|\frac{dx}{dy}| = p_{X}(g^{-1}(y))|\frac{d g^{-1}(y)}{dy}| \\): so maximum probability density changes with variable change.

If g is not continuous, but \\(\exists\\) partition \\(A_{0}, .. A_{k}\\) with \\(Pr(X \in A_{0}) = 0\\), with \\(\set{g_{i}} = g \\) over \\(\set{A_{i}}\\) monotone; then \\(p_Y(y) = \sum_{i} p_{X}(g^{-1}(y))|\frac{d g_{i}^{-1}(y)}{dy}|\\); where \\(\sum\\) appears to account for the probability that Y=y over various domains of X.

### Extension to multidimensional distributions
$Y = g(X_{1}, X_{2}); \\
X_{1} = h(Y, X_{2})\\(. Fix \\)X_{2} = x_{2}\\(; get \\)p(Y, x_{2}) = p_{X_{1}, X_{2}}(X_{1} \\
= h^{-1}(Y, x_{2})| x_{2})|\frac{dh^{-1}(Y, x_{2})}{d Y}|\\(; then do \\)p_{Y}(y) = \int p(Y, x_{2}) dx_{2}$.

## Using moment generating functions
Given \\(m_{X}(t)\\), find \\
\\(m_{Y}(t) = E[e^{f(X)t}]\\); thence deduce pdf of Y.

