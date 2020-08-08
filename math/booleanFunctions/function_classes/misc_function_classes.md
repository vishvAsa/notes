+++
title = "Misc Function classes"
+++

## Conjunctions and disjunctions
View as a set.

## Boolean functions from real valued functions
Take epigraph or subgraph. See complex analysis ref.

## Halfspace
Aka Linear Threshold fn (LTF). \\(f=sign(\sum a_{i}x_{i} + c) = sgn(a^{T}x + c)\\), \\(a_{i}, c \in Z\\). x called the weight vector, c called the bias.

\\(a^{T}x + c = 0\\) is a Hyperplane: take pts x and x' on the hyperplane, use \\(a^{T}(x-x') = 0\\); so a specifies orientation. Distance from origin : \\(\frac{a^{T}x}{\norm{a}} = \frac{-c}{\norm{a}}\\). Distance of any pt x from hyperplane: \\(\frac{a^{T}x - (-c)}{\norm{a}} = \frac{f(x)}{\norm{a}}\\) by geometry.

Weight of halfspace W = \\(\sum |a_{i}| + |c|\\). Low weight LTF has W = poly(n).

### Intuition
+1 on surface of one half of the unit sphere; -1 elsewhere; find orientation of halfspace. Like line in \\(R^{2}\\).

### Noise sensitivity and Fourier concentration
\\(NS_{a}(f) \leq \sqrt{a}\\). \why So, every halfspace is \\((a,a^{-2})\\) concentrated. By union Bound, if F is fn of k LTF, \\(NS_{a}(F) \leq k \sqrt{a}\\). So, F is \\((a,k^{2}(a)^{-2})\\) concentrated.

### Conversion to PTF
\\(\exists\\) Rational function \\(R(x) = \frac{p(x)}{q(x)}\\) of degree \\(O(l\log t)\\) like sign function for \\(|x| \in [1,2^{l}]\\): ergo \\(\exists\\) degree \\(O(l\log t)\\) P(x)=p(x)q(x) doing the same. So, get O(log W) PTF.

So, Functions of \\(\set{f_{i}}\\) W weight halfspaces: \\(\Land^{s} f_{i}\\) has O(log W) PTF: Use P(x) on \\(\sum^{s} f_{i} - s\\).

### Make origin centered halfspace
Add an extra dimension: Map f to \\(f' = sgn(\sum_{i=1}^{n+1} a_{i}x_{i}): x_{n+1} = 1, a_{n+1} = c\\).

## Polynomial Threshold functions (d-PTF)
Multivariate poly bool \\(f(..)=sign(p(..))\\): degree \\(d = \sum degree(x_{i})\\). Reduce to halfspace by feature expansion: make \\(n^{d}\\) variables.

## Neural network
G: Directed layered acyclic graph with s internal nodes of indegree r, n inputs, 1 output. \\(C_{G}\\) (in \\(R^{n}\\)): G composition of C (in \\(R^{r}\\)); each node in G assigned \\(c \in C\\). \textbf{Neural net}: \\(C_{G}\\) with each \\(c \in C\\): \\(r\\) weights \\(w_{i}\\), threshold \\(\theta\\).

## Important functions
### Parity function
Important in error checking, Fourier analysis. \\
\\(p:\set{-1, 1}^{n} \to \set{-1, 1}\\) better than \\(\set{0, 1}^{n}\\) defn: \\(p_{S}(x) \dfn \prod_{x_{i} \in S} x_{i}\\), \\(p_{\phi} \dfn 1\\). Length of \\(p_S = |S|\\).

Also writ as \\(p_{S}(x) : S = \set{0,1}^{n}\\), S is indicator vector or index. Or as \\(p_{S}(x) = (-1)^{S^{T}x}\\), where \\(S.x\\) is the GF(2) inner product.

Also \\(GF_2\\) form: \\(f = \sum_{i \in S} x_{i} \bmod 2\\): can be writ as a bit vector. Assignment x are also bitvector; evaluation: \\(f(x) = \dprod{x, f}\\).

\\(p_{S}p_{T} = p_{S\symdiff T}\\). \\(p_{S}(x \xor y) = p_{S}(x)p_{S}(y)\\) \chk.

### Majority function
\\(maj(x) = sgn(\sum_{i} x_{i})\\).

#### Noise sensitivity
\\(NS_{\eps}(maj) = \sqrt{\eps}\\): Random walks on Z starting from 0 induced by noise and by x; whp total deviation due to noise is \\(\leq \sqrt{\eps n}\\); after rand walk by x, prob of remaining within \\(\sqrt{n}\\) of 0 is \\(\sqrt{\eps}\\) by looking at lengths of line segments.

