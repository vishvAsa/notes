+++
title = "03 Other classes"

+++
## Space-classes
\\(NTIME(f(n)) \subseteq DSPACE(f(n))\\).\\
L, NL, polylog space, \\(PSPACE = NSPACE\\). \\(L \subseteq NL \subseteq P \subseteq NP \subseteq PSPACE\\): One of these is \\(\subset\\): from space hierarchy theorem.

\textbf{Reachability method} on configuration graph: \\
\\(NSPACE(f(n)) \subseteq DTIME(2^{f(n)})\\).

Directed reachability in \\(DSPACE(log^{2} n)\\) (Savitch) \chk. So, by reachability method: \\(NSPACE(f(n)) = DSPACE((f(n))^{2})\\). Reachability is NL complete. \why

Immerman-Szelepcsenyi: \\(Unreachability \in NL\\).\\
So, coNSPACE(f(n)) = NSPACE(f(n)).

## Boolean circuits
See Boolean fn ref.

### Crictuit families and uniformity
Circuit family \\(\set{C_{n}}\\): Circuits for various input size. Uniformity: TM can efficiently construct ckt given input size n (on input \\(1^{n}\\)). Log space uniform ckt family.

### P/Poly : Non uniform
\\(P/Poly\\) inlcudes non uniform ckts ('advice'). \\(P \subseteq P/Poly\\): Take OTM for alg; Make ckt to sync with head movements and state change.

### NC and AC
\\(NC_{k}\\): (Nick's class) polylog depth, uniform, bounded fan-in. Also polylog space from defn.

\\(AC_{k}\\): \\(NC_{k}\\) with unbounded fanin.

#### Their relationship
\\(AC_{k} \subseteq NC_{k+1}\\). \\(AC_{0} \subset NC_{1}\\): \\(PARITY \notin AC_{0}\\) \why.

\\(NC_{k} \subseteq L^{k}\\): just need to store current path.

### PRAM
RAM model with parallel processors, shared mem. Logspace uniform family of PRAMs. Parallel computation time: f(ckt depth). \\(AC_{k}\\) = Languages L decided by concurrent read/ concurrent write PRAM programs with polynomial procs and \\(O(\log^{k}n)\\) time: Take ckt for L; 1 proc for each edge, 1 mem location for each gate; AND gate initialized with 1, OR gates initialized with 0.

### Arithmatic
a+b \\(\in AC_{0} \subset NC_{1}\\): trivial ckt.

#### Multiplication
Find ab. \\(O(n^{2})\\) school alg; \\(O(n\log n)\\) FFT alg: \\
\\(a = \sum a_{i}2^{i} = p(2), b = q(2)\\): p and q are polynomials.

\\(a*b \in AC_{1}\\).

#### Matrix multiplication
\\(c_{i,j} = \sum_{k=1}^{n} A_{ik}B_{kj}\\) : both * and \\(\sum\\) doable in \\(O(\log n)\\) ckt: \\(\in NC_{1}\\).

Boolean multiplication: \\(c_{i,j} = \lor A_{ik}B_{kj} \in AC_{0}\\).

Matrix powering by repeated squaring: \\(\in NC_{2}\\).

\\(DETERMINANT \in NC_{2}\\): do gaussian elimination, multiply.

Boolean powering \\(\in AC_{1}\\): repeated squaring. So, \\(REACHABILITY \in AC_{1}\\). So, \\(NL \subseteq AC_{1}\\).

### Randomized ckts
Random bits r, \\(C_{n}(x, r)\\). Contains BPP. \\(RNC\\): RP for NC ckts.

#### Non-uniformity stronger than randomness: \htext{\\(BPP \subseteq P/Poly\\)}{..}
Take BPP alg; get randomized ckt \\(C_{n}(x, r)\\); reduce Pr (\\(C_{n}(x, r)\\) wrong for fixed x, rand r) to \\(2^{-n-1}\\); so Union bound: Pr ( rand r bad) \\(\leq 2^{-1} < 1\\); so \\(\exists\\) r for which \\(C_{n}(x, r)\\) correct; get deterministic ckt.

Can make \\(log_{\frac{3}{2}}n\\) depth tree from any tree like ckt. So, polynomial size boolean formulae in \\(NC_{1}\\).

## Probabilistic computation
### One sided error: RP
Aka Monte Carlo alg h. RP: \\(Pr(h(x)=1|x \in L)\geq 0.5\\), \\(Pr(h(x)=1|x \notin L) = 0\\). Visualize the possible execution of an RP alg with computation tree: 2 types of leaves: yes or no.

Also see randomized algorithms ref. Bounding error prob p. Boosting confidence: \\((1-p)^{\frac{l}{p}} \leq e^{-l}\\). \\(RP \subseteq NP\\) (NP has one sided error too).

### 2 sided error: BPP
PP: \\(Pr(accept(x)|x \notin L)< 0.5\\). No good if \\(Pr(accept(x)|x \notin L) = 0.5 - 2^{-O(n)}\\)

Also see randomized algorithms ref. \\(BPP \subseteq PP\\): \\(Pr(accept(x)|x \in L)\geq 0.5\\), \\(Pr(accept(x)|x \notin L)\leq 0.5 - \frac{1}{q(.)}\\); 2-sided bounded error; Boosting accuracy: Run many trials, take majority; use Chernoff. \\(RP \subseteq BPP\\).

### ZPP
\\(RP \cap coRP = ZPP\\): Las Vegas alg by combining RP, coRP algs : both unsure when RP alg says \\(x \in L\\) and coRP alg says \\(x \notin L\\); (check).
