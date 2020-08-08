+++
title = "Views and normal forms"
+++

## Views
The truth table. Subset of the hypercube. The concept.

A set system: Can consider c as a set: set of 'selected' points, induces dichotomies on X.

Social (binary) choice or voting scheme of n people.

## Normal forms
### Write as sign of multinomial of n variables
\\(x \in \set{0, 1}^{n}\\). Take DNF, change \\(\bar{x_{i}} \to (1-x_{i})\\).

### k-DNF and k-CNF
\\(k \leq n\\). DNF is a disjunction of conjunctions. CNF is a conjunction of disjunctions.

#### Derivation from truth tables.
DNF \\(c\\) for boolean function \\(f\\) is obtainable from truth table of \\(f\\): \\\\(\set{x: f(x) = 0}\\).

CNF \\(d\\) for boolean function \\(f\\) is obtainable from truth table of f: get the CNF of \\(\bar{f}(x)\\), negate it to get a \\(d\\).

#### Connection between DNF and CNF.
Any term in \\(d\\) and any clause in \\(c\\) cannot be disjoint \why.

\\(t\\) term CNF can be reduced to \\(t\\)-DNF using distributive laws.

t-DNF to t-term CNF is also possible, but this may take exponential time as \\(RP \neq NP\\): See colt ref about hardness of proper learning k-DNF.

#### Minimization of number of terms
Drawing rectangles in Karnaugh / Veitch tables.

\paragraph*{Minterms and maxterms}
Minterms of a DNF are terms such that: Each var appears \\(\leq 1\\) times. Maxterms of a CNF are similarly define. So, a minimal DNF is a sum of minterms, while the minimal CNF is a product of maxterms.

A minterm as \\(\set{\pm 1}^{n}\\) fn: \\(\prod(\frac{1+x_{i}}{2})\\). Constant term is coefficient of \\(p_{\phi} \dfn 1\\).

#### DNF norm
In the uniform distr fn space, Mansour's conjecture: \\
\\(\exists\\) polynomial p: \\(\norm{DNF}_{1} \leq O(n^{\frac{1}{\eps}}); \norm{f-p}^{2} \leq \eps\\).

### Size s DNF f
Aka s-term DNF. Some notation: Term-length t, terms \\(\{T_{i}\}\\), s = size(f) = num of terms: maybe poly(n), n variables. 

Actual representation size \\(\leq ns\log n\\).

\\(|k-DNF| \leq (2n)^{k}\\): count the number of possible ways to make a k-DNF.

Number of functions: \\(O(\binom{3^{n}}{s}) = O(3^{ns})\\). So, number of polysize DNF: \\(`3^{n^{O(\log n)}}\\).

t-DNF reducible to disjunction upon feature expansion. With distributive laws, size s DNF reducible to s-CNF and thence to negation of s-DNF. Negation of size s DNF is size s CNF.

Strictly more expressive than decision lists: \why: so more powerful.

#### DNF f to l-augmented Decision tree of rank \htext{\\(\leq \frac{2n{l}\log s + 1\\)}{}}
Let p = terms of length \\(>l\\), make most commonly occuring literal \\(x_{i}\\) in the p terms (occurs atleast in \\(\frac{pl}{2n}\\) by pigeon hole), make kids DNF's with \\(x_{i}\\) set to 0 (make many terms disappear) and 1; repeat till all terms have lower term length: rank r(n, p) increases when r(kids): \\(r(n-1, p-\frac{pl}{2n})\\) and r(n-1,p) are same; r(n,0) = r(0, p) = 0; solving recurrance, rank \\(\leq \frac{2n}{l}\log s + 1\\).

#### DNF f to PTF
\\(sign(T_{1} \dots + T_{s} - 2^{-1})\\). So, Any f needs \\(\leq n\\) PTF: Any f is at most n-DNF.

Has PTF of degree \\(O(\sqrt{t} \log s)\\): Let \\(T_{i} = x_{1}\dots x_{t}, a_{i}(\bar{x}) = \frac{x_{1} + \dots x_{t}}{t}\\), Chebyshev pol (see Approx theory sheet) \\(C_{\sqrt{t}}((1+t^{-1})a_{i}(\bar{x})) = Q_{i}, deg(Q_{i}) = \sqrt{t}\\); for \\(T_{i}(x)=1, |Q_{i}|\geq 2\\), else \\(|Q_{i}| \leq 1\\); PTF is \\(\sum Q_{i}^{\log s} - s - 2^{-1}\\).

Has \\(O(n^{1/3} \log s)\\) PTF: \\
Make \\(n^{2/3}\\) augmented Decision tree of rank \\(2n^{1/3}\log s + 1\\); change each \\(n^{2/3}\\) DNF at leaf to \\(n^{1/3} \log s\\) PTF; change Decision tree to \\(2n^{1/3}\log s + 2\\) Decision list (k long, terms: \\(\{T'_{i}\}\\)) which output PTF's \\(\{P_{i}\}\\); \\(\exists\\) PTF with polynomial \\(2^{k}T'_{1}P_{1} + 2^{k-1}T'_{2}P_{2} \dots\\) of degree \\(O(2n^{1/3}\log s + n^{1/3} \log s)\\).

#### Lower bounds on PTF degree
f = parity fn: \\(\{0,1\}^{n} \to \pm 1\\), an \\(O(2^{n})\\) size DNF needs n PTF: Let sign(Q(x)) be parity PTF: \\(x_{i}^{2} = x^{i}\\), so all polynomials (even Q(x)) multilinear; \\(Q(x) = Q(\pi(x))\\); let \\(Q'(x) = \sum_{\pi}Q(\pi(x_{1} \dots x_{i}))\\); Q' symmetric, sign(Q') computes parity, degree(Q') = degree(Q); \\(Q'(x) = Q''(\sum x_{i})\\); \\(Q''(0)<0, Q''(1)>0, Q''(2)<0 \dots\\); so Q'' has n roots; so Q', Q has degree n.

Some polysize DNF in n variables needs PTF of degree \\(n^{1/3}\\): DNF f = '1 in a box' fn (Minsky, Papert): \\(s= m; T_{i} = \bigwedge_{j=1}^{4m^{2}}x_{i,j}\\); let \\(x_{i}\\) be variables in box \\(T_{i}\\); let sign(Q(x)) be PTF for f; \\(Q'(x) = \sum_{\pi_{1,i} \dots \pi_{m,i'}} Q(\pi_{1,i}(x_{1}), \dots \pi_{m,i'}(x_{m}))\\); sign(Q') also is f, degree(Q') same; \\(Q''(\sum x_{1,i}, \dots \sum x_{m, i})\\) with same degree \\(Q''(x)>0\\) iff \\(\sum x_{1,i} \geq 4m^{2}\\); let \\(p(t) = Q''(4m^{2}-(t-1)^{2}, 4m^{2}-(t-3)^{2} \dots 4m^{2}-(t-(2m-1))^{2} )\\); \\(deg(p) = 2 * deg(Q'')\\); \\(p(1)>0, p(2)<0, p(3)>0 \dots\\); \\(degree(p) \geq 2m\\), so \\(deg(Q) \geq m\\).

### Boolean circuits (ckt)
A DAG with \\(n\\) inputs: \\(C_{n}\\); internal nodes represent logic gates/ operations; directed edges represent inputs and outputs to these nodes. Circuit basis: the gates: usually AND, OR. Bounded vs unbounded fanin. Size and depth of ckt.

Using De Morgan's laws, any ckt can be changed to have all NOT gates at input. Ckt with bounded fan in \\(k\\) can be changed to have bounded fan in 2 with constant blowup in depth. Unbounded fanin ckt convertible to bounded fanin ckt with \\(\log(size(ckt))\\) blowup in depth.

Turing machine halting in time \\(T(n)\\) convertible to ckt of depth \\(T(n)\\) and size \\((T(n))^{2}\\).

#### Boolean formula f
Aka Boolean expressions, tree like circuits. Subset of Boolean circuits: Only 1 output per gate. Can be rewritten as a 3 CNF.

#### Balance tree-like circuits, reduce depth
(Spira): Take tree O with n nodes, find subtree A with (2/3)n nodes; A could be T or F: create 2 trees BT, BF out of the other n/3 nodes with either A=T or A=F; Now, \\(O=(A \wedge BT) \vee (\sim A \wedge BF)\\); keep repeating this for A, BF, BT to get tree of depth \\(log_{\frac{3}{2}}n\\).

### Turing machines
See Computational Complexity ref.

