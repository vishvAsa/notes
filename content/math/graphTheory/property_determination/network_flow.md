+++
title = "Network flow"
+++

Take network G=(V,E) with source s, sink t; \\
\\((u,v) \in E\\) has capacity c(u,v). Flow \\(f:V\times V \to R\\) with capacity constraints, flow conservation \\(\sum_{u} f(u, v) = 0\\), skew symmetry: f(u, v) = -f(v, u). Residual capacity of an edge: \\(c_{f}(u, v)\\). Thence, can get residual network \\(G_{f}\\). Augmenting path \\(s, v_{1}, v_{2} .. t\\): \\(\forall i, c_{f}(v_{i}, v_{i+1})>0\\).

## Max flow problem
Start with 0 flow. Max flow exists iff \\( \nexists \\) augmenting path. Check for augmented flow; Keep increasing or decreasing flow by small fractions.

## Min cut problem
Reduce to max flow problem.

