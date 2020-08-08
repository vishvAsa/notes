+++
title = "+Number theory"
+++

## Notation
[n]: Set of first n natural numbers.

## Themes
About Z.


## Properties of Numbers
Evenness and odness. Primes and composites. Unique factorization of n as product of primes: \\(n=p_{1}^{e_{1}} ..\\).

## GCD
gcd(x,y). \\(gcd(x, y) |x-y\\).

### Euclid's algorithm
To find gcd(x, y): if \\(y|x\\) return y else return gcd(x, y-x).

From Euclid's alg, GCD(x,y)=ax+by. If 1 = ax+by, a \\(\equiv\\) multiplicative inverse of x mod y.

### Extended Euclid's alg
Find a,b using Euclid's alg.

### Diophontine equation
Indeterminate polynomial eqn with integer solutions: eg: gcd(x, y) = ax + by in Euclid's alg.

## Conjectures
Goldbach conjecture: \\(\forall x \in N, x>4\\), x = sum of 2 primes.

## Primes
### Special primes
Marsenne prime: writ as \\(2^{n}-1\\).

### Prime number theorem
Num of primes under k = \\(\Pi(k) = (1 + o(1))\frac{k}{\ln k}\\). \why

(Green, Tao) Number of arithmatic progressions of primes of length \\(\geq k\\) is \\(\geq 1\\).

### Primality testing of n
Don't try to factor: assumed hard.

### Randomized primality test
(Miller Rabin) Pick rand x in \\(Z^{+}_{n} - \set{0}\\). If \\(x | n\\) reject. See if (Fermat's little th, Lucas-Lehmer) \\(\forall x \in Z_{n}^{*}: x^{n-1} = 1 \mod n\\) holds: do it in polylog time with repeated squaring. Repeat test with many x's. In failure, reject. Else, check if it is a Carmichael composite number: see if 1 has a non-trivial square root: Write \\(n-1=2^{s}d\\); pick \\(x\neq \pm 1\\); repeatedly square and check if \\(x \mod n = 1\\): if so reject, else if \\(x \mod n = -1\\): try starting with another x.

### Picking some prime below N
Pick a random number below n, check if it is a prime: if not prime fail. By Prime number th, this alg has \\(\approx (\ln n)^{-1}\\) success rate, which can then be amplified.

## Special numbers
### Square free integers
Aka quadratfrei. Divisible by no perfect square except 1.

### Carmichael composite number
Let prime factorization: \\(n=p_{1}^{e_{1}} ..\\). Aka Fermat pseudoprimes: They're Fermat liers: \\(\forall a: a^{n-1} \equiv 1 \mod n\\). n is Carmichael iff it is square free; for all \\(p_{i}\\) \\(p_{i}-1|n-1\\). \why Eg: 561 = 3*11*17; \\(\forall a: a^{560} = 1 \mod 3, \mod 17, \mod 11\\) as \\(2, 10, 16 | 560\\).

## Modulo arithmatic
The remainder fn. \\(-3 \equiv 2 \mod 5\\). \\(ab \mod n \equiv (a \mod n) (b \mod n) \mod n\\). So, congruence relation over \\(\mathbb{Z}\\) wrt +, *. If \\(a \equiv b \mod n \implies n|a-b\\).

### Cancellation law
\\(ka \equiv kb \mod n \implies k(a-b) \equiv 0 \mod p \implies a \equiv b \mod n\\).

### Chinese remainder theorem
Let \\(n_{i}\\)'s coprime, \\(N=\prod_{j} n_{j}\\). System of simultaneous congruences \\(x = a_{i} \mod n_{i}\\) for \\(i=1 \dots k\\) has a unique solution for x in \\(\mathbb{Z}_{N}\\).

#### Uniqueness
If \\(\forall i, x \equiv x_{i} \mod n_{i}\\), and \\(y \equiv x_{i} \mod n_{i}\\), \\(x - y \equiv 0 \mod N\\).

#### Solving for x
Use Extended Euclid's alg on \\(1=r_{i}n_{i}+s_{i}\frac{N}{n_{i}}\\) to find \\(r_{i}\\) and \\(s_{i}\\), let \\(e_{i}=s_{i}\frac{N}{n_{i}}\\); then \\(e_{i} \equiv 1 \mod n_{i}\\) but \\(0 \mod n_{j}\\); thence find \\(x=\sum_{i=1}^{k}a_{i}e_{i}\\).

#### Equivalent statements and implications
\\(|Z_{N}| \to |\times_{i} Z_{n_{i}}|\\). Map \\(x \to (x \mod n_{1}, ..)\\) from \\(Z_{N} \to \times_{i} Z_{n_{i}}\\) is both one to one and onto. Also, Isomorphism by Chinese remainder fn: \\(\mathbb{Z}_{n} \cong \times_{i}\mathbb{Z}_{n_{i}}\\) preserves +, *.

#### Utility
Useful for manipulating composite numbers. An airthmatic question mod N reduced to arithmatic questions modulo \\(n_{i}\\), if we know \\(\set{n_{i}}\\).

## Additive group
\\(Z^{+_{p}\\) 
A prime order group. Does not have any subgroups.

## Multiplicative group
\\(Z_{N^{*}\\)

\\(Z^{*}_{N}\\) : N's coprimes in \\(\{1, \dots, N-1\}, * \mod N\\). Proof: GCD with N is 1, so use extended Euclid's alg to find inverses. If p prime; -1 := p-1; \\(\sqrt{1} \equiv \pm 1 \mod p\\).

### Order
N=pq; p, q primes: order = totient function: \\(|Z^{*}_{N}|=\varphi(N)=(p-1)(q-1)\\): we discard multiples of p, q. Also, if \\(N= \prod p_{i}^{e_{i}}\\), \\(\varphi(N)=\prod (p_{i}-1)p_{i}^{e_{i}-1}\\).

(Euler's theorem). \\(a^{\varphi(N)} \equiv 1 \mod N\\): Take \\(a, a^{2} \dots a^{k} = e\\); this is a subgroup of \\(Z^{*}_{N}\\); by Lagrange (see group theory in algebra ref), \\(k|\varphi(N)\\).

\\(N= \prod p_{i}^{e_{i}}\\). \\(\frac{|Z_{N}^{*}|}{|Z_{N}^{+}|} = \frac{\varphi(N)}{N} = \prod_{i = 1}^{t}\frac{p_{i} - 1}{p_{i}} \geq \prod_{i = 1}^{t}\frac{i}{i+1} = \frac{1}{1 + t} \geq \frac{1}{1 + \log_{2}N}\\).

So, **Fermat's little theorem**: p prime: \\(a^{p} \equiv a \mod p\\).

### Primitive roots
Aka generator. If \\(S = Z_{n}^{*}\\), g is primitive root of n. \\(Z_{p}^{*}\\) for prime p always has primitive root \why. 7 has primitive roots 3, 5. \\(1,2,4,p^{k},2p^{k}\\) have primitive roots for p odd prime and \\(k \geq 1\\).\\
\why \tbc

The number of primitive roots, if there are any, is \\(\phi(\phi(n))\\). (See group theory in algebra ref)

### Primitive root test
g is primitive root of n iff its multiplicative order is \\(\phi(n)\\): else it generates a subgroup. Efficiently see if g is a generator: find prime factors of \\(\phi(n) = \prod_{i} p_{i}\\), keep seeing if \\(g^{\frac{\phi(n)}{p_{i}}} = 1\\).

## Quadratic residues
\\(QR_{n}\\): set of squares mod n. Quadratic non residues. If \\(a \in QR_{n}, a R n\\), else a N n.

Finding \\(\sqrt{x}\\) same as solving \\(y^{2} = x \mod n\\), or factoring \\((y^{2}-x) \mod n\\).

### \\(QR_{p}\\) for odd prime p
As structure of \\(Z_{p}^{*}\\) cyclic; writable as \\(\set{g^{i}}\\) for primitive root g; only even powers \\(\set{g^{2i}}\\) are squares. So, \\(|QR_{p}| = |Z_{p}^{*}|/2\\).

1 has exactly 2 roots: \\(\pm 1\\), and no more: \\(x^{2} - 1 \mod p = (x-1) \mod p (x+1) \mod p = 0\\) so x-1 = 0 mod p or x+1 = 0 mod p. \\(g^{\frac{p-1}{2}} = -1\\). \\(\sqrt{g^{2i}} = \pm g^{i}\\) by Euler thm.

#### Jacobi symbol
\\((\frac{a}{p})\\) = 0 if \\(p|a\\); +1 if a R p, \\(p\nmid a\\); -1 if a N p.

Legendre: generalization to n=pq; \\((\frac{a}{n})\\) = -1 if a N n; if a R n, \\((\frac{a}{n}) = 1\\), but can't tell if a R n given \\((\frac{a}{n}) = 1\\).

### \\(QR_{n}\\) for p, q odd primes; n = pq (Blum integer)}
\\(\exists 4\ \sqrt{1}\\): take \\(x^{2} = 1 \mod n\\); \\(\pm 1\\) are obvious roots; Chinese remainder thm solutions s for \\(x = 1 \mod p; x = -1 \mod q\\) and t for \\(x = -1 \mod p; x = +1 \mod q\\) are the other two. As square roots appear in pairs, s = -t. To find the non trivial square roots, must know p, q.

Similarly, for any odd \\(m = m_{1}m_{2}\\), 1 has \\(\geq 4\\) roots.

So, any \\(a^{2} \in QR_{n}\\) has \\(\geq 4\\) roots: \\(a\sqrt{1}\\). So, \\(4^{-1} |Z_{n}^{*}| \leq |QR_{n}|\\).