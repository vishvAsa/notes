+++
title = "Properties"
+++

Because of the nature of their range, real valued functions can be characterized using some special features.

Also consider properties of functions over ordered semigroups described elsewhere.

## Topological properties
Limits, continuity, smoothness, steepness. See topology ref.

### Limits
See topology ref. Left and right handed limits. \\(\pm \infty\\) as limits.

Limits of sums, products, quotients. Squeeze or pinching theorem: If \\(f(x) \leq g(x) \leq h(x)\\), and if \\(\lim_{x \to a} f(x) = \lim_{x \to a} h(x) = b\\), \\(\lim_{x \to a} g(x)=b\\).

#### f:F to F: Find limits
Try Substitution, factorization, rationalization.

L'Hopital rule: If \\(lt_{x \to c}f(x) = lt_{x \to c}g(x) = 0, L = \lim_{x\to c}\frac{f(x)}{g(x)} = \frac{f(x)'}{g(x)'}\\): from definitions or from generalized mean value thm: define f(c) = g(c) = 0, so derivatives exist around c; as \\(\exists L, g'(x) \neq 0\\).

#### Closed functional f
All sublevel sets of \\(f\\) are closed. Equivalently, the epigraph is closed. \why

Consider/ visualize the epigraph: If \\(f\\) is continuous, dom(f) is closed, then \\(f\\) is closed. Also, if \\(f\\) is continuous, dom(f) is open, \\(f\\) is closed iff \\(f\\) converges to \\(\infty\\) along every sequence converging to bd(dom(f)). \why

### Continuity
See topology ref.

If \\(f, g\\) are continuous, then f+g, fg, f/g are continous.

#### Absolute continuity of f:Rm to Rn
More powerful/ specialized than uniform continuity.

\\(\forall \eps \geq 0, \exists d \geq 0: \forall \\) finite sequence of pairwise disjoint sub-intervals \\((x_k, y_k)\\) : \\(\sum_{k} | y_k - x_k| < \delta \implies \sum_{k} | f(y_k) - f(x_k) | < \epsilon.\\) This can be extended to \\(f:R^{m} \to X\\) for any topological space X.
 

#### Simple discontinuity
Upper and lower limits exist, but different: \\(\floor{x}\\). Non-simple disc: f(x): 1 if \\(x \in Q\\), 0 else.

Fixing discontinuities. \\(\lim_{x \to 0} \frac{\sin x}{x} = 1\\).

#### Extreme value existence, boundedness
(Weierstrass) If real valued \\(f\\) is continuous over compact (closed and bounded in R) \\(S = [x_{1}, x_{2}]\\), it attains maximum and minimum value somewhere in S.



<details><summary>Proof</summary>

As S compact, f(S) compact [See topology ref.]. So \\(f\\) closed and bounded. By LUB property of R, \\(\sup \\)f\\( = M\\); take \\(d_{n}\\): \\(M - n^{-1}\leq f(d_{n}) \leq M\\); so \\(f(d_{n}) \to M\\); by Bolzano Weierstrass take convergent subseq \\((d_{n_{k}}) \to d\\); \\(d \in S\\) as S closed; as \\(f\\) cont, so \\(f(d) = M\\). 
</details>



If S not compact, there can be: unbounded but cont f: \\(S = (0,1), f(x) = x^{-1}\\); cont \\(f\\) without max: f(x) = \\(x\\) on (0,1); cont but not uniformly cont: \\(S = (0,1), f(x) = x^{-1}\\).

#### Intermediate value theorem
If continuous f(x):[a, b] \\(\to\\) R , \\
\\(u \in [f(a), f(b)], \exists c \in [a, b] : f(c) = u\\): [a,b] connected, so f([a,b]) connected.

