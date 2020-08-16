+++
title = "Generate random bits"

+++
Random bit generator is usually a physical device. Usually, \\(Pr(X = 1) = p\\); from this, easily get random generator with \\(Pr(X = 1) = 1/2\\): flip every alternate bit. Flippling every t-th bit, get Pr(X = 1) = 1/t.

## 2-wise independent bits generation
\\(2^{b}-1\\) 2-ind bits \\(Y_{i}\\) from b ind bits \\(X_{i}\\): For each subset, \\(Y_{i}=\oplus X_{i}\\). In GF(p), p 2-ind elements from 2 ind elements: \\(Y_{i}=(X_{1}+iX_{2}) \mod p\\) for every i in GF(p). 2-universal (\\(Pr(h(x) = h(x')) \leq n^{-1}\\)) hash function family: H has \\(h:U \to V; |V| = n; a, b \in GF(p), a \neq 0\\); \\(h_{a,b}(x) = ((b+xa) \mod p) \mod n\\). If a can be 0, strongly 2-universal (\\(Pr(h(x) = y, h(x')=y') = n^{-2}\\)).

## Pseudorandom generator G
Based on operational meaning of randomness: Better than early definitions, which were based on statistical properties of bit string.

\\(G:\set{0,1}^{l} \to \set{0,1}^{n}\\), computable in time \\(2^{O(l)}\\), is an \\((\eps, s(n))\\) pseudorandom generator if \\(\forall\\) ckts c of size s(n) [strength parameter], Indistinguishability / unpredictability property holds: \\(Pr_{y \in \set{0,1}^{n}}[c(y)=1] - Pr_{x \in \set{0,1}^{l}}[c(G(x))=1] \leq \eps\\) [error parameter].

Distinguishers c usually try to learn from string and guess if G generated it. For example of distinguisher, see colt ref.

Notion similar to PFF: If ye pick y, you've picked random functions f; if ye pick x, you've picked a subset of pseudorandom functions.

### Hard function f
f is (a(n), s(n)) hard if \\(\forall\\) ckts of size \\(\leq s(n)\\), \\
\\(Pr_{y \in \set{0,1}^{n}}[c(y)=f(y)] \leq 2^{-1} + a(n)\\). (a(n), s(n), D) hardness: a generalized notion: take Pr wrt D.

Worst case hardness: \\(a(n) = 2^{-1} + 2^{-n}\\): otherwise, c can memorize +ve inputs.

Any pseudorandom generator is also hard. \why

Any hard function is also a pseudorandom generator. \why

### Hard core function f
f is (a(n), s(n), M) hard core wrt \\
measure M (defining distribution \\(D_{M}\\)) if f is \\((a(n), s(n), D_{M})\\) hard.

If f is hard wrt distribution D which is uniform over set S, it is (a(n), s(n), S) hard core. Then S is a (a(n), s(n), f) hard core set. If (a(n), s(n), M) hard, then (a(n), s(n), S) hard for S of a certain size.

(Impagliazzo): If f is (a(n), s(n), U) hard, it is \\((b(n), b(n)^{2}a(n)^{2}, M)\\) hard core where \\(D_{M}\\) is close to U: if not hard core, could smoothly boost the good guessing ckt to get a ckt which violates hardness.

### BBS pseudorandom generator
(Blum, Blum, Shub). Input: N=pq: p, q are primes \\(= 2 \mod 4\\); Initial seed \\(s_{0}\\) of n bits. Output: A stream of poly(n) bits which look random. \\(s_{i} = s_{i-1}^{2} \mod N  = s_{0}^{2^{i}} \mod N\\); ith bit output: \\(b_{i} \dfn LSB(s_{i})\\).

If factoring is hard, you cannot distinguish between a truly random m bit string and an m bit string obtained by choosing \\(s_{0}\\) at random and running BBS gen. \why

## Pseudo random function family (PFF)
### Function family F
Set of polynomial sized boolean circuits with input length n, of size \\(O(e^{n})\\) with samplable index set I; \\(\exists\\) alg A to input \\(i \in I\\), return \\(f_{i} \in F\\), simulate its input/ output behavior by accepting x and returning \\(f_{i}(x)\\) in poly time.

### Distinguisher D
Any Poly time alg; inputs function f: black box access to it; outputs 1 if it thinks f is random.

#### Indistinguishability
Let f be truly random function. F is PFF if for every D, \\(Pr_{f \in rand}(D^{f}=1)-Pr_{i \in_{U} I}(D^{f_{i}}=1) < O(e^{-n})\\).

### Existance
Goldwasser, Goldreich, Micali (GGM): If one way functions exist (if factoring is hard), then PFF's exist.

\tbc

