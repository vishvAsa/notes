+++
title = "+Classification complexity"
+++
Aka COLT/ computational learning theory, Binary classification and Queries: Theory

## Themes
Consider the classification task described in the statistics survey. Computational learning theory is about binary classification problem, and getting the best classifier using 0/1 loss.

Hardness of (accurately/ approximately) learning a concept in a concept class in terms of time, space, sample size: Upper (\textbf{Efficient Learning Algorithm design}) and Lower bounds. Doing this: Agnostic or gnostic of distribution; In the presence or absence of noise (in label or in input); relative to ease of evaluation of a concept; Proper learning vs learning using a different Hypothesis concept class.

What concept classes are more general?

How many mistakes does an algorithm make whilst efficiently learning a concept class? Learning using bunch of experts.

Judge the importance of problem/ model: Consider real-life learning scenarios where they are useful. Consider if lower / upper bound for some important scenario may be obtained.

### Interplay with other areas.
Observe similarities between compression and learning: learning which is more than mere memorization usually (kNN being an example to the contrary) involves learning some concise, general things from the examples.

Cryptography and learning: opposites.

### Folk theorems
The only C we know to learn are polynomials (Eg PTF).

### Characterization of research effort
See computational complexity theory ref and algorithms ref; emphasis is on the former.

### Notation
#### The sample
Universal set of possible inputs $X$. An example := ($x \in X$, label $l$). Label is $\{1,0\}$ or $\{1,-1\}$ depending on context. Bits in $x$: $x_{1}\dots x_{n}$. Sample set S, $|S|=m$

#### Concepts and their sets
Target concept (classifier function) in a certain representation: $c$; Concept class $C$; Concept representation class $R$, representation dimension (f(input size)) or number of binary vars in $x$: $n$, sampling distribution $D$; hypothesis concept h, hypothesis class H.

$|H_{n,m}|$: H restricted to \\
algorithms with $m$ $n$-dimensional examples. \chk

#### Learning algorithm
Learning algorithm $L$, attribute/ variable list V.

### The binary classifier c
For different ways of looking at c, see boolean fn ref. For VCD proofs/ measuring complexity of representation classes, it is profitable to view a hypothesis as the dichotomy it induces on X.

## Representation classes of classifiers
### Properties of representation classes
#### Error regions
Class of error regions: $\Del(c)=\set{c \Del h]}$.

##### epsilon net of examples
\textbf{$\eps$ net}: A set of examples which hits all error regions ($\Del_{\eps}(c)$) of weight $\geq \eps$ under D. A bad hypothesis h: $c \Del h \in \Del_{\eps}(c)$.

#### Monotonicity
To understand monotonicity of boolean functions, see boolean functions reference.

Transformation to non-monotone R by introducing n new literals, if n finite.

#### Closures
##### Projection closure
Take partial assignment P; let P/A: an assignment to V first using P, then using A for unassigned vars. Projection of an example using P. Projection closed concept class: Take any f in $C$, fix values of some variables using P, get another $f_P=f(P/A)$ in $C$.

##### Embedding closure
Embedding one domain of variables into another; embedding a concept into a domain of variables. Embedding an example. Embedding closed concept class: Take f, rename variables, add irrelevant variables to the domai$n$, f is still in $C$.

##### PEC classes
Most useful concept classes are projection and embedding \\
closed (pec), or are contained in some projection and embedding closed $C$.

### Some representation classes
#### Geometric classes
Also see boolean functions ref for halfspaces etc.. Axis aligned rectangles (good basic example).

#### Boolean functions
See boolean functions ref: k-DNF. k-CNF, Conjunctions. Disjunctions. Decision lists. Decision trees. T-augmented decision trees. Polynomial size DNF. D-PTF. Halfspaces: common benchmark for machine learning algs. Intervals in R. Polyhedra in $R^{n}$. The class of parity functions with length k: PARITY(k).

#### Classes of Continuous fns
See complex analysis ref.

#### Restricted concept classes
$C_n$: concepts depending on a set of n vars. $C_{r,n}$ Concepts in $C_n$ with at most $r$ relevant variables.

#### Some PAC Reductions
k-CNF to Conjunctions. k-decision list to 1-decision list.

Boolean formula to Log-space turing machine: Parse the circuit, Have identifier for each node.

Log-space turing machine concept class (max klogn space) to Deterministic Finite Automaton (DFA) concept class: DFA state = $<$state, possible tape content, head location$>$, Transitions = L/R, $x \to x.x...x$.

### Measure complexity of C
Consider $n$, size(c) ($\approx \log |C|$). Find VCD; Plot dichotomy count $D_{C}(m)$: these are described in the boolean functions survey. Find sample complexity.


#### SQ dimension (sqd or d)
##### Definition
Take c: \\
$\set{-1, 1}^{n} \to \set{-1, 1}$, $C = \set{c}$. $sqd_{D}(C) = \max d | \exists S_{D} = \set{f_{1}, .., f_{d}} \subseteq C$ with $|corr_{x \distr D}(f_{i}f_{j})| = |E_{x \distr D}(f_{i}(x)f_{j}(x))| \leq d^{-1}$; \\
$sqd(C) = \max_{D} sqd_{D}(C)$.

Applications: Learning in the presense of noise.

##### Bounds on SQD
Max sqd  = max $|C|$ = $2^{n}$. Parity fn $p_{S}(x) = \prod_{x_{i} \in S} x_{i}$; $C = \set{p_{S}: |S|\leq n}$ has max sqd: Sets S, T differ in some $x_{d}: E_{x_{i} \distr U}[p_{S}(x)p_{T}(x)] = E[x_{d}]E[..] = 0$.

$sqd(C) = \Omega(VCD(C))$: Construct the set $\set{f_{i}}$: Take uniform distr on the shattered set; select two fns $\set{f_{i}}$ solving it for set of 2 examples $\set{x_i}$; assume for $2^{i}$; make $\set{f_{i}}$ vs $\set{x_i}$ sign matrix M; get matrix for $2^{i+1}$: $\mat{M & M\\M & -M}$; extend proof for those between $2^{i-1}$ and $2^{i}$ by using matreces for powers of 2.

$sqd(C) = 2^{O(VCD(C))}$. \why

##### Other properties
All in the corr-shattered set $S_{D} = \set{f_{i}}$ linearly independent. Proof by contr: If d is sqd, $c_{i}f_{i} = 0$, take $c_{m} = max(\set{c_{i}})$, so $f_{m} = \sum_{i \neq m} \frac{c_{i}}{c_{m}}f_{i}$, so $1 = E[f_{m}f_{m}] = \sum_{i \neq m} \frac{c_{i}}{c_{m}} E[f_{m}f_{i}]$; but $\frac{c_{i}}{c_{m}} \in [-1, 1]$, $E[f_{m}f_{i}] \leq d^{-1}$, so absurdity.

#### Other measures
\textbf{Unique -ve dimension}: UND(C) = Max Subclass $C' \in C$ with unique -ve examples.

Can use covering and packing numbers. These measures of the size of sets are described in the topology ref.

## Resources used by the learner
### Queries and oracles
An oracle provides examples according to D. A teacher answers membership and equivalence queries.

Example oracle $EX_D(c)$. \\
Membership query (mq): mq(x) yields c(x). Equivalence query (eq): eq(h) yields counterexample. MQ(c), EQ(c) oracles.

$EX_U(c)$ can be simulated using MQ(c). In PAC setting, EQ(c) can be simulated by the EX oracle.

#### Probabilistic oracle
PEX(f) for fn $f:\set{0, 1}^n \to [-1, 1]$: produces (x, b) where $x \distr U$, b is $\pm 1$ binary RV with mean f(x). For boolean f, this is UPAC oracle EX(f, U). Models random noise under U: PEX(tf) is an oracle for f(x) with random noise of rate $1/2-t/2$: simply see how to make binary RV b with mean tE[f].

Statistical dist: $D(PEX(f), PEX(g)) = E_x[|f(x)-g(x)|] \leq \norm{f-g}$. So, upon querying, an algorithm notices difference between PEX(f) and PEX(g) with prob $\leq \norm{f-g}$. (See probability ref.)

### Non adaptive mq (namq)
Points on which mq's are made do not depend on concept being learnt. So, many concepts can be learnt from same set of query points: like the brain. Also, easier parallizability.

### Relative power of various queries
As they solve iterated products problem, polynomial sized circuits are not learnable using random examples. By modifying the circuits to encode the ckt at certain fixed points, ye get a class learnable with namq but not with random examples alone. By placing the encoding at varying locations, but encoding the location of the encodings at certain fixed points, ye get a class learnable with mq, but not with namq.

### Attribute efficient (ae) learning
r: Number of relevant attributes. \\
Alg is poly time, calls to oracle is $p(r, |c|)h(n), h(n) = o(n)$.

Strong ae learning:
$h(n) = O((\log n)^{k})$. Or, calls to oracle polynomial in $|c|$, not in n.

