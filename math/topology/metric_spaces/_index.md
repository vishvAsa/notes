+++
title = "+Metric space S"
+++
Set with a metric \\(d: S\times S \to R^{\geq 0}\\). Metric obeys non negativity, positive definiteness, symmetry, \\(\triangle\\) inequality. Eg: Euclidian k space: \\(R^{k}\\): every point is a vector.

Absolute value: \\(|x| = d(x,0)\\) for some 0.

## Open ball around p of radius r
Aka r- neighborhood (nbd) of p: \\(N_{r}(p) = \set{x \in S: d(x,p) < r}\\). Similarly define r-nbd of set of points S. A uniform nbd of S contains some r-nbd of S.

Set of open balls defines a topological space: topology from nbds. Similar topologies for vector spaces, manifolds.

Open ball in \\(R^{k}\\) is convex.

### Interior point p of S
If \\(\exists r: N_{r}(p) \subset S\\). \\((0,0) \in N_{2}(1,1) \subset R^{\geq 0} \times R^{\geq 0}\\) is interior pt. All others are boundary points. Thence defined interior of S: int(S), and boundary of S: bd(S) = cl(S) - int(S). If S has a non-empty interior, it is \textbf{solid!}

[0, 1] has an interior wrt R, but not wrt \\(R^{2}\\): then every pt is in boundary.

### Limit point p of set S
\\(\forall r: N_{r}(p)\\) contains a pt in S other than itself.

\\(\forall r : |N_{r}(p)| = \infty\\): Else, can find small \\(r'\\) with \\(N_{r'}(p) = \set{p}\\). So, a finite set has no limit points.

p is the limit of some Cauchy sequence: Keep reducing r and pick \\(q \neq p \in N_{r}(p)\\) in each step.

Every interior pt is a limit pt, but not vice versa. For \\(E\subset R\\), sup(E) is a limit pt.

If p is a lt pt of E, \\(\exists\\) convergent seq \\((s_{i})\\) in S with \\(s_{i} \to p\\). Set with 1 limit pt: A convergent sequence in R.

### Closure of E
cl(E): E with all its limit pts. Also: cl(E) = S - int(S - E).

### Diameter of E
\\(diam(E) = \sup_{p, q} d(p, q)\\). diam(E) = diam(cl(E)): by \\(\contra\\), using triangle inequality.

## Sets in S: Topology
### Nature of the boundary
#### Open set S
Aka Open space. For every \\(p \in S\\) is an interior point. Diagramatic representation: [] and () in R, dotted an undotted lines in \\(R^{2}\\). Eg: dotted dumbbell in \\(R^{2}\\). 

Open sets \\(S_{i}\\): \\(\union S_{i}\\) is open. \\(S = \inters_{i=1}^{k} S_{i}\\) is open: for any \\(p\in S\\), pick r small enough to ensure \\(\forall i: N_{r}(p) \in S_{i}\\).

If \\(S \subset Y \subset X\\): S open wrt \\(Y\\) iff \\(\exists G \subset X\\), G open wrt \\(X\\) and \\(S = G \inters Y\\): \pf if G open wrt Y, \\(G\inters Y\\) open wrt Y; If S open wrt Y, take \\(\union_{p \in S} N_{r}^{X}(p)\\) where r is radius which shows interiorness of p in S.

#### Closed set S
Set with all its limit points. So, finite sets closed. \\([n, \infty )\\) closed. Same as S with all its boundary points.

\\(S\subset X\\) closed iff \\(S'\\) open (good trick to show closedness). \\(\inters\\) of closed sets \\(S_{i}\\) is closed: \\(\union S_{i}'\\) is open. Similarly, \\(\inters_{i=1}^{k} S_{i}\\) is closed.

cl(E) is closed: as \\((cl(E))'\\) is open.

#### Non-oppositeness of Openness and Closedness
Eg: \\(\phi\\) and R are both open and closed. (0, 1) open wrt \\(R\\) but nor wrt \\(R^{2}\\). Half open intervals in R are neither open nor closed.

#### Boundedness of set S
A is bounded if \\(\exists r, p: A \subset N_{r}(p)\\).

### Compactness
#### Open cover of S
Bounded Open sets \\(\set{G_{i}}\\) with \\(\union G_{i} \supset S\\). Subcovers: Subsets of open cover which also cover S.

#### Definition
Every open cover of S has a finite sub cover. In \\(R^{d}\\), compactness \\(\equiv\\) closed and bounded.

#### Properties
Finite S is compact. R is not compact: Take \\(G_{n} = (n-\frac{2}{3}, n+\frac{2}{3})\\), \\(\set{G_{n \in Z}}\\) is an open cover, but no finite or even proper subcover. Similarly, \\([n, \infty]\\) closed but not compact.

Any compact set S is closed: Any \\(p \in S'\\) is interior pt in \\(S'\\): \\(\union_{q \in S} N_{r}(q): r = \frac{d(p-q)}{2}\\) is an open cover of S, within it is some finite subcover; so \\(\exists N_{r'}(p) \subset S'\\).

Closed subset E of compact set S is compact: Take any open cover of E; add open set E' to it to get open cover of S; some finite subset of this without E' is also open cover of E.

Finite union of compact sets is compact.

If F closed and K compact, \\(F \inters K \subset K\\) compact: \\(F \inters K\\) is closed.

If \\(\set{K_{i}}\\) is (possibly \\(\infty\\)) set of compact sets and if \\(\inters\\) of every finite subclass \\(\neq \nullSet\\), \\(\inters K_{i} \neq \nullSet\\). Assume \\(\inters K_{i}=\nullSet\\); Take \\(K_{1}\\); every \\(p \in K_{1}\\) is \\(\notin \inters_{i \neq 1} K_{i}\\); so \\(p \in \union_{i \neq 1} K_{i}'\\); so finite subset of \\(\set{K_{i}'}\\) is an open cover of \\(K_{1}\\); so some finite \\(\inters\\) of \\(\set{K_{i}}\\) is \\(\nullSet\\): contradiciton.

So, if \\(\set{K_{i}}\\) compact, \\(K_{n} \supset K_{n+1}\\): \\(\inters_{i} K_{i} \neq \nullSet\\). Does not hold for open sets: Take \\(G_{n} = (0, n^{-1})\\).

If E is an \\(\infty\\) subset of compact set K, E has a limit pt in K: Else every \\(p \in K\\) would have some \\(N_{r}(p) = \set{p}\\); \\(\union N_{r}(p)\\) is an open cover of E without a finite subcover. Also, if every \\(E \subset K, |E| = \infty \\) has a lt pt in K, K is compact. \why

If \\(\set{K_{i}}\\) compact, \\(K_{n} \supset K_{n+1} \neq \nullSet\\), \\(\lim_{n \to \infty} diam(K_{n}) = 0\\), then \\(\inters K_{n}\\) is 1 pt: else \\(\contra\\).

### Connectedness and completeness
#### Connectedness
A, B separated if \\(A \inters cl(B) = cl(B) \inters A = \nullSet\\). Eg: (0, 1) and (1, 2) but not (0,1] and (1, 2). S is connected if it is not \\(\union\\) of separated sets.

\\(E \subset R\\) connected iff it is an interval.

#### Dense set
Contains points in the neighborhood of every point.

#### Completeness of S
Limit of every Cauchy sequence \\((s_{n})\\) wrt metric = some point \\(s \in S\\).

Any closed set in complete metric space S is complete. Also, any compact space is complete.

### Sigma algebra of open sets
Aka Borel Sigma algebra. This is the sigma algebra \\((X, \bS)\\) formed by the closure wrt \\(\union, \inters, \bar{X}\\) of all open sets in \\(X\\). All sets in \\(\bS\\) are called Borel sets.

## Covering and packing Number
Let the space have norm \\(\norm{}\\), and let \\(C\\) be a set in it.

### Covering number \htext{\\(N(\eps, C, \norm{)\\)}{..}}
\\(\eps\\) covering \\(F_\eps\\): Set of \\(\eps\\) balls which contains \\(C\\). Covering number \\(N(\eps, C, \norm{}) = \min |F_\eps|\\).

#### Covering entropy
Aka metric entropy. \\(\log (N(\eps, C, \norm{}))\\).

#### Total boundedness
If \\(N(\eps, C, \norm{})\\) is finite for all \\(\eps\\), \\(C\\) is totally bounded. Else, \\(C\\) is non totally bounded: for every \\(n\\), there is some \\(\eps: N(\eps, C, \norm{}) > n\\).

#### For D dim sphere
\\(\frac{Vol(sphere(r_1))}{Vol(sphere(r_2))} = (\frac{r_1}{r_2})^D\\). Let \\(vol(B(f', \eps)) = k \eps^{D}\\). Then, \\
\\(k(R+ \eps)^{N} \geq N(\eps, C, \norm{})k \eps^{D} \geq kR^{D}\\). Thence, \\(\log (N(\eps, C, \norm{})) \approx D \log(\frac{R}{\eps})\\).

### Packing number \htext{\\(M(\eps, C, \norm{)\\)}{..}}
\\(\eps\\) packing is a set of points \\(\set{g_i}\\) with \\(g_i\in C; \norm{g_i - g_j} \geq \eps\\). The maximal \\(\eps\\) packing: packing number.

#### Relationship with N
\\(M(2\eps, C, \norm{}) \leq N(\eps, C, \norm{}) \leq M(\eps, C, \norm{})\\). 2nd ineq: For maximal packing \\(\set{g_i}\\), \\(\forall h \in \\)C\\(: \norm{g_i-h} \leq \eps\\). 1st ineq: For maximal \\(2 \eps\\) packing: Any \\(\eps\\) ball has \\(\leq 1\\) \\(g_i\\).

#### Use
Often easier to find than covering number; thence can bound covering number.

## \\(R^{k\\)}: Topological properties }
See complex analysis ref.

## Sequence \\((s_{n)\\) in S}
For properties of sequences in fields and vector spaces, see complex analysis and linear algebra ref.

### Cauchy sequence
After some point, elements get closer as sequence progresses: contraction or Cauchy criterion: \\(\forall m, n> N: d(p_{m}, p_{n}) < \eps\\) or diameter of tail of seq tends to 0. Limit of sequence may not exist in S. Like convergence without needing a limit.

Any cauchy seq S in compact set \\(X\\) converges: As \\(X\\) compact, S has limit pt in X, also limit of S is unique.

### Bounded sequences
Range is bounded.

### Convergent sequence
Convergence to limit c: \\(\forall i>N: d(x_{i}, c) < \eps: x_{n} \to c\\). Divergence. Limit is unique. If \\(x_{n} \to c\\), every \\(N_{r}(c)\\) has all but finitely many \\(x_{i}\\).

Any convergent sequence is bounded. \\(1^{n}\\) convergent but has finite range. If range not 1, it is \\(\infty\\).

All convergent sequences are cauchy sequences.

Every subsequence of a convergent sequence converges to the same limit. If every subsequence of a sequence converges to the same limit, the sequence is convergent.

Sequence \\((s_{n})\\) in compact S has convergent subsequence: If S compact, every \\(\infty\\) subset has limit pt p; make seq out of \\(s_{i}\\) in decreasing \\(N_{r}(p)\\).

### Subsequential limits
Take seq \\(s_{n}\\), subsequential limits form closed set E: Take any limit pt p of E, can find subseq limit e close to it, so can find \\(s_{n}\\) close to it; so p is in E.

## Function across metric spaces: f:X to Y
See algebra ref for general properties of functions. Also ref on analysis of functions over R and C.

### Limit of f
\\(\lim_{x\to p}f(x) = q: \forall \eps, \exists \del: 0< d(x,p) < \del \implies d(f(x), q) < \eps\\): f has a limit at p. q is unique. Visualize as balls in X, f(X).

\\(\forall (p_n), p_n \to p, f(p_n) \to q \equiv lt_{x \to p} f(x) = q\\): show \\(\implies\\) by \\(\contra\\). So, can use properties of sequences. So, get \\(\lim f+g, f(x)g(x), f/g\\).

### Continuity of f:X to Y
f continuous at \\(p \in E\\) if \\(\forall \eps \exists \del: d(x,p)<\del \implies d(f(x), f(p))< \eps\\). If f has limit at p, continuity iff \\(\lim_{x \to p} f(x) = f(p)\\): f defined only over p has no limit at p but is continuous. Continuity over \\(E \subseteq X\\).

If f continuous at p, g continuous at f(p), then f(g(x)) continuous at p.

f continuous over \\(X\\) iff \\(\forall\\) open \\(V \subseteq Y\\), \\(f^{-1}(V)\\) open in X: Visualize interior pts, match \\(\del\\) balls in \\(X\\) with \\(\eps\\) balls in Y.

If f continuous, \\(X\\) compact, then f(X) compact: Take open cover \\(\set{V_{i}}\\) of f(X); \\(\set{f^{-1}(V_{i})}\\) is open, covers X; so take finite subcover; get \\
\\(f(X) \subseteq \union_{i=1}^{k} f(f^{-1}(V_{i})) \subseteq \union_{i=1}^{k} V_{i} \\).

If f continuous, bijection, then \\(f^{-1}\\) is cont: f(V) open iff V is open.

If f continuous, \\(E \subseteq X\\) connected, then f(E) connected: else if f(E) separated into A, B but \\(f^{-1}(A) \union f^{-1}(B)\\) not separated,  \\(cl(f^{-1}(A)) \inters f^{-1}(B) \neq \nullSet\\) or \\(cl(f^{-1}(B)) \inters f^{-1}(A) \neq \nullSet\\); then continuity of f violated, so \\(\contra\\).

### Uniform continuity over X

$$\forall p, q \in X \forall \eps>0, \exists \del: \\
d_{x}(p,q) < \del \implies d_{y}(f(p), f(q)) < \eps\\(. \\)1/x\\( continuous, but not uniformly cont over \\)R\\(: consider points near \\)0\\(; neither is \\)x^{2}$$. A measure of whether gradient gets very big.

If f continuous, \\(X\\) compact, then f uniformly cont: As \\(Y\\) compact: Given \\(\eps\\), take \\(\forall p \in X: g(p)\\), radius which guarantees \\(\eps/2\\) closedness to \\(f(p)\\); make open cover \\(\set{N_{g(p)}}\\); get finite subcover; take max \\(g(p)\\); use \\(\triangle\\) ineq to guarantee \\(\eps\\) closedness anywhere.

Also see the more powerful notion of absolute continuity in the complex analysis survey.

### Bounding steepness
Aka Lipschitz continuity/ smoothness. Lipschitz condition: \\(d(f(x), f(y)) \leq L d(x, y)\\). \\(L\\) is lipshcitz constant. Note that it implies the usual notion of continuity.

But, it does not imply differentiability! When differentiable, there is a relationship with the derivative, see complex analysis ref.

#### A generalization
Holder continuity: Holder condition of order a: \\(d(f(x), f(y)) \leq L d(x, y)^{a}\\).

## Sequence of functions \\((f_{n: \\)X\\( \to Y)\\)
Consider the properties of sequence of functions from any set to a metric space, which is described in the survey on basic mathematical structures.

If \\(x\\) is a limit pt of \\(E \subseteq X\\), \\(lt_{t \to x}f_{n}(t) = A_{n}\\), then \\(A_{n}\\) converges, \\(lt_{t \to x} f(t) = li_{n \to \infty} A_{n}\\). Pf: \\(d(f(t), A) \leq d(f(t), f_{n}(t)) + d(f_{n}(t), A_{n}) + d(A_{n}, A)\\): make 1st and 3rd terms small by picking large \\(N\\), make 2nd term small by picking large t.

So, if \\((f_{n})\\) continuous, f continuous: see \\(lt_{t \to x}f_{n}(t) = f_{n}(x)\\), get \\(lt_{t \to x} f(t) = lt_{t \to x} f_{n}(x) = f(x)\\).


