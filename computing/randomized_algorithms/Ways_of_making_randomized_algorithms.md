+++
title = "Ways of making randomized algorithms"

+++
## Algs for problems in the class RP
One sided error; success probability \\(p = Pr(f(x) = 1|x\in L) \geq 2^{-1}\\).

### Amplification of confidence of RP alg

#### 'Monte Carlo' search alg
Sample a solution, check correctness, repeat t times, lower bound p. If trials n-wise independent: tn random bits; failure probability: \\((1-p)^{t} \approx e^{-tp}\leq 2^{-tp} \to 0\\) for large t. So, even if \\(p = (poly(n))^{-1}\\); for t = poly'(n), success whp.

If trials 2-wise independent: 2n random bits: \\(t^{-1}\\) using Chebyshev ineq. \chk

#### Negligible success probability 
Anything asymptotically \\
smaller than an inverse polynomial. Eg: \\(O(n^{-\ln n}), e^{-n}\\). Else, could boost success rate.

### 'Las Vegas' search alg
Repeat MC alg till confirmed success.

### Disperser
Uneven bipartite graph (\\(V=L \union R, E\\)); Min degree of v in L: D; N(v): nighbors of v; \\(\forall S \subseteq L, |S|=k\\), expand: connect to \\(\geq \frac{|R|}{2}\\) verteces. How small be D? Solving Pr( G not disperser) \\(< 1\\): \\(D \geq \log |L| + 1\\).

#### RP amplification Make disperser with D=t; pick v in L; use N(v) as random bits. \tbc

## BPP alg
2-sided error. Repeat many times, take majority, use Chernoff.

## Random projections
Solve problem in \\(\mathbb{R}^{D}\\) by projecting points in V to random \\(\mathbb{R}^{d}\\), \\(d<D\\); distance preserved approx whp! Eg: Approx nearest neighbor, clustering; proj points in \\(\mathbb{R}^{2}\\) to most lines. Take \\(x = (a-b) \in \mathbb{R}^{D}\\), change bases to get \\(y =(a-b) \in \mathbb{R}^{D}\\), project to first d directions: drop D-d coords, get \\(z \in \mathbb{R}^{d}\\), renormalize (mult by \\((\frac{D}{d})^{0.5}\\)) as projection reduces length.

(Johnson, Lindenstrauss): Let \\(|V|=n\\); \\(\epsilon \in (0,0.5), d = \frac{18}{\epsilon^{2}}\ln n: \exists \texttt{ whp } f:\mathbb{R}^{D} \to \mathbb{R}^{d}\ \forall (a,b) \in V, \frac{\norm{f(a)-f(b)}-\norm{a-b}}{\norm{a-b}} \leq \epsilon\\) : Proj to rand plane \\(\equiv\\) proj rand unit vector y to get z. As \\(Pr(\norm{z}^{2} \leq k(\frac{d}{D})) \leq exp(\frac{d}{2} (1-k+\log k))\\): Chernoff style proof; show f(a)-f(b) close to a-b; then use union bound to cover all pairs in V.

Tight up to a factor \\(\log(1/\eps)\\): \\(\exists\\) points V: \\(\Omega(\frac{\log n}{\eps^{2} \log (\frac{1}{\eps})})\\) to preserve distances.

## Fingerprinting

BigObj1 = BigObj2 \\(\Leftrightarrow\\) SmallObj1 = SmallObj2.

### Matrix multiplication check
Problem: AB ?= C. Ordinary algorithm: Finding AB costs \\(O(n^{2.4})\\).

Randomized algorithm: Sample r from \\(\set{0, 1}^{n}\\), check if \\(ABr = Cr\\): \\(O(n^{2})\\).

Analysis: Let D = AB-C; \\(AB \neq C \implies [Pr(Dr = 0) \leq 2^{-1}]\\) using principle of deferred decisions. Also from Schwartz Zippel Thm (see Algebra ref).

### Codes and communication complexity
See Information and coding theory ref.

### String search
Find pattern vector \\(y \in \set{0, 1}^{m}\\) in text vector \\(x \in \set{0, 1}^{n}\\); x(j) is \\(x_{j} .. x_{j+m-1}\\).

Trivial alg: O(nm). Optimal det alg: (Boyer Moore) O(n+m) flops. Rand alg: compare fingerprints. Take rand prime p; use \\(F_{p}(x) = x mod p\\). Find \\(F_{p}(x(j+1))\\) from \\(F_{p}(x(j))\\) in O(1) flops: precompute \\(F_{p}(2^{m-1})\\); \\(x(j+1) = 2(x(j) - x_{j}2^{m-1}) + x_{j+m}\\); So O(n+m) flops. From \\(\union\\) bound, prime num theorem, Pr(false match) \\(\leq (n-m+1)\frac{m}{\Pi(mn^{3})} = O(\frac{\log n}{n^{2}})\\). \tbc


