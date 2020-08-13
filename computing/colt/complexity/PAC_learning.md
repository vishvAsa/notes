+++
title = "PAC learning"

+++
## The goal
### Distribution and the oracle
Distribution agnostic. Assumption: training distribution = testing distribution. 2 Oracle PAC model variant: Algorithm can use both \\(D^{+}_{c}\\) and \\(D^{-}_{c}\\), \\(error \leq \eps\\) wrt both.

EQ oracle can be simulated by the EX oracle.

### Strong PAC learning
Given \\(\eps, \del, C\\), we want to find \\(h \in C\\) such that, with probability \\(1 - \gd\\), \\(Pr(c(x) \neq h(x)) \leq \eps\\).

### Weak PAC learning algorithm
p, q polynomials; \\(\eps \leq 2^{-1}-g = 2^{-1}-\frac{1}{p(n, size(c))}\\), \\(\del \leq \frac{1}{q(n, size(c))}\\). g: the advantage of \\(L\\) over random guessing. Minimally better than random guessing: any g subexponential, can be achieved by memorizing previously seen examples.

h is weak hyp for \\(c\\) iff: \\
\\(Pr_{x\distr D}[h(x)f(x)= -1] \leq 2^{-1}+g\\); or \\(E_{x \distr D}[h(x)c(x)]\geq 2g\\).

## PAC learning model
### Make PAC learning algorithm
For C using H (containing C) with \\(m\\) finite: Cast a \textbf{multivalued discrete classification function} into PAC model: Make a binary classifier concept for each bit.

Decide initial h (maybe null, universal); decide update to hypothesis corresponding to example provided by the sampling oracle : check if +ve examples enough.

If H finite: Create an Occam algorithm; maybe use size(h) to bound \\(|H|\\); use Occam's razor. If H finite: Create an Occamish algorithm inconsistent with at most \\(\eps|S|/2\\) examples; maybe use size(h) to bound \\(|H|\\); use Chernoff to bound \\(Pr(\exists \\)bad h\\(; |[c \Del h] \cap S| \leq m\eps/2)\\); thence continue Occam razor proof.

Try to find an algorithm which will grow the hypothesis decision list efficiently, as if solving a set cover problem.

Any \\(|H|\\): Make algorithm to find h consistent with S, use VCD - Occam razor.

Make an algorithm to learn C using only EQ(c), simulate EQ using EX.

### PAC reduce C over X to C' over X'
Efficiently change \\(x \in X_{n} \to g(x) \in X'_{p(n)}\\); so that there exists proper image concept c' for every \\(c\\) with size(c') = q(size(c)).

### Prove efficient PAC learnability
Make PAC algorithm, bound \\(m\\) for \\((\eps, \del)\\) approximation of c; prove that running time is polynomial in \\((\eps^{-1}, \del^{-1}, size(c), \\)m\\(, n)\\).

Reduce to a known efficient PAC learning algorithm.

Show efficient learnability in the mistake bound model; bound \\(m\\) using Occam razor or VCD Occam razor.

Find weak learner; boost.

If learning on uniform distribution, see U distribution Fourier analysis section.

### Lower bound on sample complexity in PAC
#### Shatter dimension
m = \\(\Omega(\frac{d}{\eps})\\).

\pf Take \\(S\\) shattered by \\(C'\\), let \\(|S|=d\\) and distribution \\(D = U\\) over \\(S\\). Then, we show that no algorithm \\(L\\) can ensure \\(\eps\\) error whp. As \\(D\\) is the support of \\(C'\\), without loss of generality, we will consider \\(C\\) to be the finite set of \\(2^{d}\\) concepts with different dichotomies induced on \\(S\\).

Draw \\(S'\\) with \\(|S'| = \frac{d}{2}\\); suppose that \\(L\\) learns \\(h\\). \\(h = f_L(S')\\). But there are \\(|2^{S-S'}|= 2^{d/2}\\) different concepts \\(c\\) consistent with the labellings in \\(S'\\) and so, \\(h\\) is chosen independently of these different concepts. Does \\(h\\) have low error wrt all of these?

We want to show that there exists a \\(c\\) such that the \\(h\\) learned would have a high error rate with non-negligible probability. We will do this by considering the following process: Fix \\(S\\) and \\(h\\), pick \\(c \distr U(2^{S-S'})\\). We then show that \\(E_c[Pr_x(h(x) \neq c(x))] > 1/4\\), which implies the existence of \\(c\\) for which \\(h\\) is a bad approximation.

\\(E_{c}[Pr_x[h(x) \neq c(x)]] = E_c[Pr_{D}(x \in S-S') Pr_{c}(h(x) \neq c(x)|x \in S-S')] \geq 2^{-1}\times 2^{-1}\\). Thus, there exists a \\(c\\), for which the \\(h\\) learned using \\(S'\\) as the sample would be bad.

We then need to show that \\(L\\) cannot find a good hypothesis for this \\(c\\) with high probability. \tbc

#### From halving algorithm
Halving algorithm \\(L\\) mistakes in MB model is an approximate lower bound: take set S on which \\(L\\) makes mistakes, make uniform distr on S, use halving algorithm in PAC model, then error probability is \\((|S| - m)/(2 \log |S|) \leq \eps\\), so \\(|S|(1 - 1/(n^{k})) \leq m \forall k\\).

### PAC with mq
Any R efficiently PAC learnable using mq's and eq's is efficiently learnable with mq's only.

## PAC learnability of some R
Also see list of R which are PAC learnable with noise, learnable in MB.

### Halfspaces
\\(f=sgn(w.x)\\), \\(\forall \\)x\\(, \dprod{w,x} \neq 0\\), \\(\exists x_{i}: |E_{x\distr D}[f(x)x_{i}]|\geq W^{-1}\\); so some \\(x_{i}\\) weak hypothesis; then use ADAboost.

### Parities
Use the MB algorithm with Occam razor.

ae learning of parities wrt Uniform distribution is equivalent to decoding high rate random linear codes from low number of errors. So, believed to be hard.

## Approximate f with orthogonal polynomials
Aka Fourier coefficients. Must have orthogonal polynomials for D.

## Uniform distribution PAC learning (UPAC)
Easier than learning under general distributions: can use Fourier analysis.

Harder than learning Gaussian distr. \why

\oprob What is the lower bound for UPAC learning? Does ae learning D\\(L'\\) s make sense?

### Shortness of DNF term length, Decn tree depth
DNF term-length or 1-D\\(L\\) size is limited to \\(\log \frac{1}{\eps}\\): Probability of longer term being satisfied \\(< \eps\\).


#### Learn DNF
Collect all terms of size \\(log(s/\eps)\\) consistent with target DNF: use feature expansion, disjunction learning winnow algorithm.

### The function space
Basis of the input space: \\(\set{\pm1}^{n}\\). Basis of the function space: Parity functions \\(p_{S}\\). \\(f = \sum_{S\subseteq [n]} \hat{f}(S)p_{S}\\). See Boolean function ref for details.

### Alg to learn Fourier coefficient
Learn \\(\hat{f}(S)\\)\\
 using \\(\hat{f}(S) = E_{x \in_{U} \set{\pm 1}^{n}}[f(x)p_{S}(x)]\\): Choose sample of size m; by Chernoff \\(m = \Omega(\frac{\log \del^{-1}}{l^{2}})\\) for \\((\del, l)\\) approx of \\(\hat{f}(S)\\).

Best fitting polynomial g of degree d: \\(\sum_{|S|\leq d} \hat{f}(S)p_{S}\\) (See Boolean function ref). \\(Pr_{x}(sgn(g(x)) \neq f(x)) = E_{x}([sgn(g(x)) \neq f(x)]) \leq E_{x}((f(x)-g(x))^{2})\\).

### Low degree algorithm
If f is \\((\eps,\del)\\) concentrated, f learnable wrt U to accuracy 1-a in time \\(n^{O(\del)}\\): Sample to estimate \\(\hat{f}(S): |S|\leq \del\\), make g, output \\(sgn(g)\\). Agnostically learning big correlated parities.

#### Learning some R under U
Polysize DNF formulae learnable in \\
\\(n^{O(\log |c|\log\frac{1}{\eps}))}\\). Halfspaces learnable in \\(n^{O(\eps^{-2})}\\). Any function of k halfspaces learnable in \\(n^{O(k^{2}\eps^{-2})}\\). \oprob Do better for \\(\inters\\) of k halfspaces.

Depth d ckts of size \\(|c|\\). Also Decision trees. \why

### Based on total influence
f learnable in \\(n^{O(\frac{d}{\eps})}\\) to accuracy \\(1-\eps\\). \why

So, monotone f learnable in \\(n^{O(\frac{\sqrt{n}}{\eps})}\\).



### Hardness of ae learning of PARITY(k)
This is equivalent to decoding high rate random linear code C from low number of errors, a hard open problem. Also equivalent to learning PARITY with noise, in simpler case where noise is random and independent.

If you can decode \\(C\\), you can ae learn PARITY: Simply take the examples \\(\set{x_i}\\) you get, turn it into H, get a random G from \\(null(H^{T})\\), give it to the decoder along with the syndrome \\(\set{p_{e}(x_i)}\\), return hypothesis \\(p_{e}\\).

If you can learn PARITY(k) using algorithm \\(L\\), you can learn it properly whp. Take the hypothesis h returned by \\(L\\), turn it into an mq oracle which evaluates h(y) by taking h(x+y)+h(y) over many x. Thence make hypothesis parity \\(p\\) attribute efficiently.

By properly ae learning parity you can decode random linear code: Given G and y, make H and yH, use learner.


## UPAC with mq
### Learning PARITY(k) using namq
Let H be check matrix for a code C; corrupted code y = c+e for some code \\(c\\) and error e with \\(wt(e) < w\\). Take BCR decoding algorithm (see coding theory ref) A which accepts y and the syndrome yH = eH, and returns e. So, using namq's on the columns of H, A learns unknown \\(e \in PARITY(k)\\) attribute efficiently. Another view: using e, A learns parity \\(c\\) using noisy namq's.

### Sparse approach
For t-sparse f; or \\(\frac{\norm{f}_{1}^{2}}{\eps}\\) sparse g: approximator for f.

Thus, using K-M algorithm, f is learnable to accuracy \\(1-\eps\\) in time \\
\\(poly(\\)n\\(, \norm{f}_{1}, \eps^{-1})\\) using membership queries: find coords of g = coords of f of size \\(\geq \frac{\eps}{\norm{f}_{1}}\\); use sgn(g) as hypothesis.

### Weak parity learning
Given f with some t-heavy coefficient, given MQ oracle, find vector z with t/2 heavy \\(|\hat{f}(z)|\\). \\(|\hat{f}(y)| \geq t\\) iff \\(Pr(f = p_{y}) \geq 1/2 + t/2\\); so the weakly correlated parity \\(p_{y}\\) is \\(1/2 - t/2\\) approximator of f, so called weak parity learning.

Can also view this as learning parities in agnostic setting. See agnostic learning section.

#### ae-namq algorithm: Like a sieve
Take an aena-mq parity learning algorithm L.  \\(f_a: f(x \xor a)\\); S: the set of mq points of L. Estimate Fourier coefficients of f with t/4 accuracy. Also, for every y in S, find all Fourier coefficients of \\(f_{R,y}\\) to estimate coefficients of \\(f_y\\). \\(\hat{f}_c(a) = \hat{f}(a)p_a(c)\\); so \\(\hat{f}_c(a)\hat{f}(a)\\) and \\(p_a(c)\\) have same sign.

Run \\(L\\) for every \\(z \in {0, 1}^m\\) with \\(\hat{f}_R(z) \geq 3t/4\\), using \\(\hat{f}_{R,c}(z)\hat{f}_R(z)\\) to answer mq's and learn \\(p_a\\). If \\(a=zR\\), add \\(p_a\\) to a set of possible hypotheses. Repeat the process many times with different R. Really good \\(p_a\\) occur in hypothesis sets at much higher rate. Thus, find a with \\(\hat{f}(a) \geq t/2\\).

Can also be fixed to find t/2 heavy component of randomized fn \\(\psi\\). Only, \\(m\\) required for good approximation whp depends on \\(var(\psi)\\).

#### K-M algorithm to find big components using membership queries
Let \\(|a| = k\\). \\
\\(f_{a}(x) \dfn \sum_{Z \in \set{\pm 1}^{n-k}} \hat{f}(a,Z)p_{a,Z}(a,x)\\).\\
Then \\(f_{a}(x) = E_{y}[f(yx)p_{a}(y)]\\): Let \\(Z = Z_{1}Z_{2}, Z_{1} \in \set{\pm 1}^{k}\\); \\(E_{y}[f(yx)p_{a}(y)] =\\
 E_{y}[\sum_{Z} \hat{f}(Z)p_{Z}(yx) p_{a}(y)] = \sum_{Z_{1}, Z_{2}} \hat{f}(Z_{1} Z_{2}) p_{Z_{2}}(x) E_{y}[p_{Z_{1}}(y)p_{a}(y)] =\\
 \sum_{Z_{2}} \hat{f}(a Z_{2}) p_{Z_{2}}(x)\\).

(Kushilevitz, Mansour). Input t; output all \\(|\hat{f}(S)| \geq t\\) whp. Make tree: at root find \\(\norm{f}^{2}\\); at left child find \\(\norm{f_{0}}^{2}\\); at right child find \\(\norm{f_{1}}^{2}\\); if any branch has \\(\norm{f_{a}}^{2} \leq t^{2}\\) prune; repeat.

Leaves of the tree are individual coefficients \\(\hat{f}(S)\\). Height \\(\leq n\\). Breadth \\(\leq t^{-2}\\): every level is a partition of \\(\set{\hat{f}(S)}\\); \\(t^{-2}\\) of \\(\set{f_{a}}\\) have \\(\norm{f_{a}}^{2} > t^{-2}\\).

To find \\(\norm{f_{a}}^{2} = E_{x}[f_{a}(x)^{2}]\\): Find \\(f_{a}(x) = E_{y}[f(yx)p_{a}(y)]\\): pick random y's, use membership queries.

Opcount: poly(t, n).

#### Results
Decision trees with t leaves approximable by t-sparse function; so learnable in polynomial time with membership queries.

### Learning DNF
Aka Harmonic sieve. DNFs have a \\((2s+1)^{-1}\\) heavy component: For any D, there is \\(p_a\\) such that \\(|E_D[f p_a]| \geq (2s+1)^{-1}\\) and \\(wt(a) \leq \log ((2s+1)\norm{D2^n}_{\infty})\\). \why.

\\(E_D[f(x)p_a(x)] = E_U[f(x)2^n D(x)p_a(x)] = \hat{\psi}(a)\\). If ye give oracle access to D, you can evaluate \\(\psi\\). So, use ae-namq algorithm to learn \\(a\\) with \\(\hat{\psi}(a) \geq t/2\\). As \\(var(\psi) \leq \norm{2^n D(x)}\\), \\(m\\) required will depend on this. This is efficient only for D polynomially close to U.

Then boost using p-smooth algorithm.

## Boosting weak efficient PAC algorithm L
### Practical applications
Frequently used: boost decision trees.

### Boost confidence
Run \\(L\\) k times to gather k hypotheses (Get \\(\eps\\) approx with prob \\(1-(1-\del_0)^{k}\\)), select best h by using many examples to gauge \\(h \symdiff c\\).

### Boosting accuracy
So you are using the guarantee that polynomial time \\(L\\) works with any distribution to produce a hypothesis which produces very accurate results by playing with input distribution.

General idea for all techniques: put more weight on x on which weak hyp h makes mistake; rerun weak learner.

#### Lower bound
Number of iterations to get \\(\eps\\) accurate using \\(\gamma\\) weak learner is \\(\Omega(g^{-2}\log (\frac{1}{\eps}))\\).

### Properties of booster
Noise tolerance. Smoothness: How far does the artificially generated distribution deviate from original?: Affects speed.

### Boost accuracy by filtering
Reweight points using online algorithm.

#### Majority tree of Hypotheses Booster
(Schapire). Error b bosted to \\(g(b) = 3b^{2}-2b^{3}\\): Run \\(L\\) to get \\(h_{1}\\); filter D to get \\(D_{2}\\) where \\(h_{1}\\) is useless like random guessing; run \\(L\\) to get \\(h_{2}\\) - learn something new; filter D to get \\(D_{3}\\) where \\(h_{1}(x) \neq h_{2}(x)\\); run \\(L\\) to get \\(h_{3}\\); return \\(majority(h_{1},h_{2},h_{3})\\). Gauge errors of \\(h_{1}\\) and \\(h_{2}\\) to ensure efficient filterability.

##### Recursive accuracy boosting
For target accuracy b and distribution D: Maybe invoke self thrice for accuracy \\(g^{-1}(b)\\) and distributions \\(D, D_{2}, D_{3}\\). Final h like 3-ary tree; only leaves use samples for learning; others sample for error gauging.

### Boost accuracy by sampling
Reweight points using offline algorithm.

Get sample S; boost accuracy till h consistant with S; bound size of h; bound \\(|S|\\) using Occam razor.

### Adaptive booster (AdaBoost)
Get sample S; use \\(U\\) distr on it. At time t=0: wt on \\(s_{j}\\) is \\(w_{j}=1\\); \\(W_{0} = \sum w_{i} = m\\); prob distr \\(D(x_i) = \frac{w_{i}}{W}\\). On iteration i: run \\(L\\), get hypothesis \\(h_{i}:X \to \set{\pm 1}\\), \\(err(h_{i}) = E_{i}\\), accuracy \\(a_{i} = 1-E_{i}\\), \\(\beta_{i} = \frac{E_{i}}{a_{i}}\\); for each \\(s_{j}\\) where \\(h_{i}\\) is correct, reduce their weight: \\(w_{j} \assign w_{j}\beta_{i}\\). Output after time T: \\(sgn(\sum_{i}a_{i}h_{i} - 2^{-1})\\); \\(a_{i} = \frac{\lg \beta_{i}}{\sum_{j} \lg \beta_{j}}\\). If \\(E = \max_{i} E_{i}\\), \\(\beta = max_{i} \beta_{i}\\), this is \\(sgn(T^{-1}\sum_{i}h_{i} - 2^{-1})\\).

Final error \\(E_{T} \leq e^{-2Tg^{2}}\\): \\(W_{1} = m(2E); W_{T} = m(2E)^{T}\\). Weight of \\(x_i\\) misclassified at iteration T \\(\geq \beta^{T/2}\\): At \\(\geq \frac{T}{2}\\) of \\(\set{h_{i}}\\) could've been right on it. Total wt on misclassified points \\(\leq \eps \\)m\\( \beta^{T/2} \leq m(2E)^{T}\\); so \\(\eps \leq (\frac{4E^{2}}{\beta})^{T/2} = (4E(1-E))^{T/2} = (4(4^{-1} - g^{2}))^{T/2} \leq exp(-2g^{2}T)\\).

\\(e^{-2Tg^{2}} < m^{-1}\\) when \\(T > \frac{\ln m}{2 g^{2}}\\). So, final \\(|h| = O(\frac{\ln m}{2 g^{2}})|c|\\).

#### Contrast with maj tree booster
Gives simple hyphothesis; takes advantage of varying error rates of weak hypotheses. \why

#### Noise tolerance properties
Sensitive to noise even if \\(L\\) resistant to noise: Distributions created by looking at actual label.

### Boosting by branching programs
h = Branching program: DAG of hypotheses \\(\set{h_{i}}\\). Labels x according to leaf reached. Run weak learner, get \\(h_{0}\\). From distr \\(D_{h_{0}^{-}}\\) and \\(D_{h_{0}^{+}}\\), get \\(h_{1,1}\\) and \\(h_{1,2}\\). From \\(D_{h_{i,1}^{+}}\\) get \\(h_{i+1,1}\\); from \\(D_{h_{i,j}^{+}} \lor D_{h_{i,j+1}^{-}}\\) get \\(h_{i+1,j+1}\\): diamonds in the DAG; from \\(D_{h_{i,i+1}^{+}}\\) get \\(h_{i+1,i+2}\\).

Assume that both \\(err_{D_{c^{-}}}(h_{i,j})\\) and \\(err_{D_{c^{-}}}(h_{i,j})\\) \\(\leq 2^{-1} - g\\) : can be removed. \why

At node (j,k); k-1 hypotheses have said h(x)=1; j-k+1 hypotheses have said h(x)=0. So, in final level T; first T/2 leaves labelled 0; rest labelled 1.

Take x with c(x)=1: \\(h_{i} = h_{i,j}\\) seen in iteration i: In worst case, \\(E_{x}[[h_{i}(x) = 1]] = 2^{-1} + g\\); so \\(E_{x}\\)[leaf where x ends up] \\( = \frac{T}{2} + gT\\). A biased random walk.

Show \\(Pr_{x}(h(x) = 1)\geq 1-\eps\\): due to lack of independence of events h(x) = 1, martingale is the right tool; let \\(X_{i} = [h_{i}(x) = 1]\\), \\(Y = \sum_{i=1}^{T} X_{i}\\); \\(Y_{i} = E[Y|X_{1}, .. X_{i}]\\) is a Doob martingale with \\(Y_{i}-Y_{i-1}=1\\); \\(Y_{i} = \sum_{j=1}^{i} X_{i} + \frac{T-i}{2} + g(T-i)\\); by Azuma: \\(Pr(|Y-E[Y]|\geq gT) \leq 2e^{-g^{2}T} \leq \eps\\) for \\(T \geq \frac{10 \log \frac{1}{t}}{g^{2}}\\).

Resistant to noise if \\(L\\) resistant to noise: Boosting program creates distributions without looking at \\(c(x)\\).

### Consequences
PAC algorithm memory bound: \\(O(\frac{1}{\eps})\\). \why

## Hardness of PAC learning

### General techniques
Specify distr where learning hard.

Any C which includes functions which can be efficiently used to solve iterated products [ cryptography ref] is inherently unpredictable.

PAC-reduce a C' known to be hard to \\(C\\).

Show that VCD is \\(\infty\\). Eg: \\(C = \set{convex\ polygons}\\).

Reduce it to a hard problem in another area: eg: decoding random linear codes.

#### If RP neq NP
By contradiction: Take NP complete language A; efficiently reduce input a to labelled sample set \\(S_{a}\\) where \\(S_{a} \equiv \\)c\\( \in C\\) iff \\(a \in A\\); assume efficient PAC learning algorithm \\(L\\); with suitable \\(\eps \stackrel{_?}{=} |S_{a}|^{-1}\\), use \\(L\\) with timer to learn \\(\eps\\) close h whp; see if h is consistant with \\(S_{a}\\); if yes, \\(a \in A\\); otherwise \\(a \notin A\\); we have an RP algorithm for A!

### Hardness results for proper learning
\\(k \geq 3\\): k-term DNF learning intractable (H is restricted to equal C), but predicting classification accurately tractable: Hardness by reduction to graph coloring problem \why; k-term DNF = some k-CNF by distr law: so improper learning using k-CNF as H is easy. So, conversion from k-CNF learnt to k-term DNF is hard.

Usually the \\(RP \neq NP\\) assumption is used.

### Cryptographic hardness results for improper learning
Aka inherent tractable-unpredictability. Learning hard despite: Polynomial examples being sufficient; or concept evaluation easy.

#### C which include concepts which can find Discrete cube roots
Take n bit N's. Make discrete cube root hardness assumption [see cryptography ref]. Consider uniform distr over \\(Z^{*}_{N}\\); any algorithm can generate examples by itself - so doesn't learn anything new; otherwise contradicts assumption. Learning remains hard even if supplied n repeated squares of a number y mod N : no clue about d in this \\(O(n^{2})\\) input.

By PAC reduction, anything which can compute iterated products is hard to learn.

### C which include concepts to find ith bit of BBS pseudorandom generator outputs
\\(f_{s_{0}, N, t}(i)\\): ith output bit of BBS pseudorandom generator with seed \\(s_{0}\\) and N, if \\(i \leq t\\) (see randomized algs ref). If \\(\exists\\) \\(O(n^{ck})\\) time algorithm A to learn C with error \\(\leq 2^{-1} - n^{-k}\\); you can distinguish BBS from random string b of \\(n^{(d+1)ck}\\) bits, where \\(d\in Z, dc\neq 1\\); and thence factor \\(N\\).

#### Distinguisher D
Input random string; Use Uniform distr over b; use \\((i, b_{i})\\) as examples; learn with \\(n^{ck}\\) examples; get hypothesis h with error \\(\leq 2^{-1} - n^{-k}\\); Pick another bit index j; try predicting \\(b_{j}\\); if guess correct, output 1 or 'generator'. On truly random b, \\(Pr(D^{rand} = 1)\geq 2^{-1} + \frac{n^{ck}}{n^{(d+1)ck}}\\); but \\(Pr(D^{f_{s_{0}, N, t}} = 1) \leq 2^{-1} + n^{-k}\\): difference not negligible.

By PAC reduction, anything which can compute iterated products is hard to learn.

### Classes which include RSA decryptors
\\(C = \set{f_{d,N}}\\), with private key d, public key e: see Cryptography ref. Not learnable in polytime: else make examples over \\(U(\set{0,1}^{n})\\): \\((x^{e} \mod N, x)\\); learn and violate RSA unbreakability assumption.

### Inherently tractably-unpredictable classes
Polynomial sized boolean circuits of depth log n and \\(n^{2}\\) inputs: Can solve Iterated products with ckt of depth \\(\log^{2} n\\) (using binary tree like mult ckt). Beame et al: even with log n deep ckt. So, Poly-sized Boolean formulae inherently unpredictable.

Also, Neural networks of constant depth with boolean weights: \\
(Reif). By PAC reduction from Poly-sized Boolean formulae, Log-space turing machines and DFA inherently unpredictable (but DFA learnable with membership queries).

Intersections of halfspaces. \why Agnostically learning single halfspace. \why

\oprob DNF formulae (can learn under U if RP= NP) : hard to learn? : too weak to encode pseudorandom generators, many cryptographic primitives; if you unconditionally show DNF hard to learn under U, you show \\(RP \neq NP\\)!

