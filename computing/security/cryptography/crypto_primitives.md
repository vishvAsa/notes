+++
title = "Crypto primitives"
+++

## Collision resistant hash function
A hash function where it is hard for an adversary to find y: h(x) = h(y), given h(x) and y.

## Strength of hardness assumptions
If violation of hardness assumption A implies violation of assumption B, A is weaker than B. Weaker assumptions are preferred.

### To show weakness \htext{\\(A < B\\)}{..}
Take poly time alg to break A and make poly time alg to break B whp.

### Hierarchy of strength
\\(DL < CDH < DDH < CDH\\).

## Candidate one way functions
Easy to compute, hard (takes superpolynomial time) to invert whp. Often from computational number theory. Useful in key exchange.

## One way functions based on Factoring
\\(f: (x,y) \to xy\\). Believed to be hard.

### Hard core predicate h for one way functions F
No prob. polytime alg to predict output of h using F significantly better than random guessing, over U.

## Group theoretic functions
Group G, generator g. In practice, \\(|G| \approx 2^{160}\\).

### Number theoretic groups
For alg for finding large primes, see number theory ref. Can efficiently find generators \why.

### Elliptic curve groups
See Topology ref.

The discrete log problem on elliptic curve groups is believed to be more difficult than in the underlying finite field's multiplicative group. So shorter keys yield same security.

### Discrete logarithm (DL)
\\(x \in Z_{p}^{*}\\), g its  generator, \\(DLog_{p,g}(a) \dfn\\) least power \\(i \in \set{0, .. p-2}\\): \\(g^{i} = a\\).

Breaking: So, given a, p, g: find i.

### Computational Diffie Hellman (CDH)
Pick a, b randomly from G.

Breaking: Given \\(g^{a}, g^{b}, g\\), output \\(g^{ab}\\).

### Decisional Diffie Hellman
Pick a, b from G. Pick \\(d \in_{U} \set{0, 1}\\). If d = 0, output \\(T = g^{ab}\\), else output \\(T \in_{U} G\\).

Breaking: Given the Diffie Hellman tuple \\(\tuple{g^{a}, g^{b}, g, T}\\), guess d. Do this significantly better than random guessing.

Not secure if bilinear map efficiently computable.

### Decisional linear assumption (DLA)
Decisional linear problem: Given group G of prime order p and elements\\ \\(g, u, v, g^{a}, u^{b}\\), distinguish \\(T = v^{a+b}\\) from a random number. T is chosen to be \\(v^{a+b}\\) based on a random bit s.

## Group with efficiently computable bilinear map e
Now adversary has access to p.

CDH assumed to be hard.

DDH is no longer hard: Given \\(g, g^{a}, g^{b}, T\\), check if \\(e(g, T) = e(g^{a}, g^{b})\\).

### Bilinear DDH (BDDH)
Extends DDH.

Breaking: Do this significantly better than random guessing:

Given \\(g, g^{a}, g^{b}, g^{c}\\), distinguish \\(g^{abc}\\) from random T wnnp.

### q-BDHE
Given \\(g, h, g^{a}, g^{a^{2}}, .. g^{a^{q}}, g^{a^{q+2}} .. g^{a^{2a}}\\):\\
 no \\(g^{a^{q+1}}\\); distinguish \\(e(g,h)^{a^{q+1}}\\) from random r. A different assumption for each q!

Can prove security (if \\(P\neq NP\\)) under generic group model: only certain ops ( pairing, arithmatic .. ) allowed; oracle access to pairing fn.

## Information theoretic one way functions
Decoding random (n, k) linear codes. See Information and coding theory ref for details.

## Assumptions from learning theory
Learning subspace with noise assumption. Weaker than LPN.

Learning partity with noise (LPN) assumed to be hard.

## Lattice based cryptography
Does not assume hardness of factoring.

\tbc

## Trapdoor one way function
One way function f which also has some trapdoor used to invert f.

### RSA hardness assumption
p,q prime. N=pq. Given \\(y = x^{e} \mod N\\), N, e, hard to find \\(y^{\frac{1}{e}}\\). Hard to find d given e and N by factoring N=pq, then finding \\(\phi(N)\\) and then finding \\(d\\) by Euclid's Algorithm.

#### Discrete cube root
Special case where e = 3.

#### Circuits to compute RSA fn: Iterated products problem
Multiply n n-bit numbers mod N. Computable by polynomial sized ckts of depth \\(O(\log n)\\).

Finding \\(x^{e} \mod N\\) efficient with poly(n) sized boolean ckts which use repeated squaring and multiplying the right squares.

Similarly, can compute ith output bit of BBS pseudorandom generator (see randomized algorithms ref).

#### Strong/ Flexible RSA assumption
Got N = pq, h; Find some \\(e, h^{1/e}\\). \\
Stronger than RSA ass.
