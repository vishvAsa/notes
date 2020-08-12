+++
title = "02 Multiple random variables"

+++
## Random vector
A random vector is an n-dim vector \\(X = (A_{i})\\), which are a bunch of jointly distributed random variables. Similarly, \\(X\\) can be a \\(m \times n\\) random matrix.

Below, we consider \\(X = (X_1, X_2)\\), where \\(X_1:(S_1; F_1, v_1) \to R_1\\) and \\(X_2:(S_2; F_2, v_2) \to R_2\\).

A random vector is itself a random variable \\(X:(S_1 \times S_2; F_1 \times F_2, v) \to (R_1 \times R_2)\\).

### Marginalization
The marginalization properties of the joint/ product probability space leads to: \\(Pr(X_1 \in E_1, X_2 \in S_2) = Pr(X_1 \in E_1)\\), so \\\\(\int_{E_1 \times S_2} f_X(x) dv = \int_{E_1} \int_{x_2 \in S_2} f_{X}(x_1, x_2) dv_2 dv_1 = \int_{E_1} f_{X_1}(x_1)dv_1\\).

Hence, \\(\int_{x_2 \in S_2} f_{X}(x_1, x_2) dv_2 = f_{X_1}(x_1)\\).

## Conditional pdf
Definition (described elsewhere) \\of conditional probabilities of the form \\(Pr(A|B)\\) breaks down if \\(Pr(B)\\), the probability measure of the event \\(B\\) is 0.

One can craft a similar definition to cover events \\(X_2 = b\\) with \\(v_2(X_2 = b) = 0\\). Then, \\$Pr(X_1 \in E_1| X_2 = b) = \frac{Pr(X_1 \in E_1 \land X_2 = b)}{f_{X_2}(b)} = \\
\int_{E_1} f_{X}(x_1, b) f_{X_2}(b)^{-1} dv_1$.

\\(f_{X}(x_1, b) f_{X_2}(b)^{-1} = f_{X_1|X_2 = b}(x_1)\\) is aka conditional pdf.

### Inversion
Similar to the Bayes's rule, using the definition, one can invert the conditional pdf.

\\(f_{X_2|X_1 = x_1}(x_2) = \frac{f_{X_1|X_2 = x_2}(x_1)f_{X_2}(x_2)}{f_{X_1}(x_1)} = \frac{f_{X_1|X_2 = x_2}(x_1)f_{X_2}(x_2)}{\int_{S_2} f_{X_1|X_2 = x_2}(x_1)f_{X_2}(x_2) dv_2}\\).

#### Improper densities
Note that the construction of \\(f_{X_2|X_1 = x_1}(x_2)\\) works even if the prior pdf \\(f_{X_1}(x_1)\\) is an improper density which does not sum to 1! This sometimes makes the task of modeling random processes easier.

## Independence
One can extend the notion of independence of events to random variables, which represent a pair of algebras of events.

Suppose that \\(f_{X}(x) = f_{X_1}(x_1)f_{X_2}(x_2)\\). Then,  \\(\forall E_1, E_2: Pr(X_1 \in E_1, X_2 \in E_2) = Pr(X \in E_1)Pr(X_2 \in E_2)\\). In such a case, \\(X_1\\) and \\(X_2\\) are independent. This is denoted by \\(I(X_1, X_2)\\).

Also independence of events corresponds to independence of corresponding Indicator random variables: \\(A \perp B\\) if \\(I_A \perp I_B\\).

## Conditional Independence
Conditional: \\\\(X \perp Y|Z\\) $\equiv  f_{XY|Z}(x, y|z) = f_{X|Z}(x|z)f_{Y|Z}(y|z) \equiv f_{X|Y, Z}(x|y,z) = f_{X|Z}(x|z) \\
\equiv  f_{X, Y, Z}(x, y, z) = \frac{f_{X, Z}(x,z)f_{Y, Z}(y, z)}{f_Z(z)}$.\\
Marginal: \\(X \perp Y\\) when \\(Z = \nullSet\\).

Amongst sets of vars: \\(\set{X_{i}} \perp \set{Y_{i}}|\set{Z_{i}}\\) iff \\
\\(f_{(X_{i}|Y_{j},\set{Z_{k}})}(x_{i}|y_{j},\set{z_{k}}) = f_{(X_{i}|\set{Z_{k}})}(x_{i}|\set{z_{k}}) \forall i, j\\).

Marginal independence without conditional independent: \\
\\(X \nvdash Y| X+Y\\). Conditional independent sans marginal independent: consider suitable Bayesian network.

Graphical models can be used to specify this.

