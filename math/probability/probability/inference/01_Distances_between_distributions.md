+++
title = "01 Distances between distributions"

+++
## Total variation distance between distributions
Aka Statistical distance. Sample space X. \\(\Del(D, D') = 2^{-1} \sum_{x \in X} |D(x) - D'(x)|\\): \\(\in [0,1]\\). But, \\(\sum_{x \in X} (D(x) - D'(x)) = 0\\).

Visualize as space between probability curves. Total prob under either curve is 1.

### Largest deviation in event probability
For event \\(E \subseteq X: \max_{E \subseteq X} |Pr_{D}(x \in E) - Pr_{D'}(x \in E)| = \Del(D, D')\\). Or, max (signed) area between curves covered by E is at most half the total area. Useful in bounding probability of events.

## Code-length divergence
(Kullback Leibler) Aka information divergence, information gain, relative entropy. A particular Bregman divergence. General case specified in vector spaces ref. For connection with entropy and cross entropy, see information theory ref.

$K(D||D') = E_{x \distr D}[\log \frac{D(x)}{D'(x)}] = \\
\sum D(x) \log \frac{D(x)}{D'(x)} = \sum D(x) \log \frac{1}{D'(x)} - H(D) = H_c(D') - H(D)\\(. Expected number of extra bits used to code samples in \\)D\\( using code based on \\)D'$.

### Nonnegativity
See wiki diagram: Puts greater weight D(x), often for cases where \\(\frac{D(x)}{D'(x)} \geq 1\\).

\\(K(D, D') \geq 0\\) (aka Gibbs inequality): Take probability distributions p, q; get \\(\sum p_i \log (p_i/ q_i) \geq 0\\) using \\(\ln x \leq x - 1\\).
\\(K(D||D') = 0\\) only if \\(D = D'\\) using same idea.

### Other properties
Not a metric as it is asymmetric and does not satisfy the triangular inequality.

\\(\exists x: D(x) \neq 0, D'(x) =0: \implies K(D||D') = \infty\\).

### Connection with variation distance
(Pinsker's inequality) \\(\sqrt{KL(P||Q)/2} \geq \Del{P, Q}\\).\why
