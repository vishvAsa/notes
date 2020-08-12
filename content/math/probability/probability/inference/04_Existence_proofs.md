+++
title = "04 Existence proofs"

+++
\\(Pr(X\geq E[X])>0\\), \\(Pr(X\leq E[X])>0\\).

## For sparse dependency graphs
Aka Lovasz local lemma.

For Dependency graph with \\(Pr(E_{i})<p, 4dp<1\\): \\(Pr(\cap \bar{E_{i}}) > 0\\).

Lovasz local lemma: general case: Dependency. graph G=(V,E), \\
\\(x_{i} \in [0,1]\\): \\(Pr(E_{i}) \leq x_{i} \prod_{(i,j) \in E}(1-x_{j})\\): \\(Pr(\cap \bar{E_{i}})\geq \prod_{i}(1-x_{i}) > 0\\)

## Threshold behavior
\\(X>0\\): Second moment method: \\(Pr(X=0)\leq Pr((X-E[X])^{2} \geq (E[X])^{2})\\). Conditional expectation inequality for \\(\sum\\) indicators: \\
\\(Pr(X>0) \geq \sum_{i=1}^{n}\frac{Pr(X_{i}=1)}{E[X|X_{i}=1]}\\).

## Explicit constructions
\tbc


## Make Existence proofs
Design sample space, show \\(Pr(E)>0\\), maybe modify to get final object. Use Expectation argument. Make non-negative RV X, use Chebyshev to bound Pr(X=0). Make dependency graph, use Lovasz local lemma.
