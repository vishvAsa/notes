+++
title = "Properties"
+++

## Dependence on input variables
### r-junta
f depends on only \\(r\\) variables. k-junta has at most \\(2^k\\) non 0 coefficients. Each of them is \\(2^{-k+1}\\) heavy: Make two equally high stacks unequal.

Witness to the relevance of variable \\(x_{i}\\): an assignment a which flips f(a) when ith bit is flipped.

### Monotone fn f
Flipping \\(x_{i}\\) from 1 to -1 cannot flip f(x) from -1 to 1. \\((\forall i, x_{i} \leq y_{i}) \implies f(x_{1}, .. x_{n}) \leq f(y_{1}, .. y_{n})\\).

Define \\(g(x_{i}, x_{-i}) = f(x)\\) naturally. Then \\(g(-1,x_{-i}) = -g(1,x_{-i})\\) iff \\
\\(g(-1,x_{-i}) = -1 \land g(1,x_{-i}) = 1\\);\\ $E_{x_{-i}}[g(1,x_{-i}) - g(-1,x_{-i})] = 2 Pr_{x_{-i}}(g(1,x_{-i}) \\
= 1 \land g(-1,x_{-i}) = -1 ) $.

#### Influence
\\(\hat{f}(\set{i}) = 2^{-1}(E_{x_{-i}}[g(1,x_{-i})] - E_{x_{-i}}[g(-1,x_{-i})]) = I_{i}(f)\\).

#### Total influence
As \\(\norm{x}_{1} \leq \sqrt{n}\norm{x}_{2}\\): \\(I(f) = \sum_{i} \hat{f}(\set{i}) \leq \sqrt{n}\sum_{i} \hat{f}(\set{i})^{2} \leq \sqrt{n}\\).

For majority: \\(I(f) \approx n(\frac{2}{(n-1)\pi})^{0.5}\\).

### Fairness
f is fair if it is 1 on exactly half the inputs.

## Combinatorial properties
### Sensitivity to bit i
Aka Influence of bit i. \\(x^{(i)}\\): x with ith bit flipped. Sensitivity wrt bit i: \\(I_{i}(f) = Pr_{x}(f(x) \neq f(x^{(i)})\\).

Total influence or avg sensitivity or Energy: \\(I(f) = \sum_{i}I_{i}(f)\\).

### Noise sensitivity
Aka noise stability. \\(y = N_{\eps}(x)\\): \\
x with \\(\eps\\) noise in each bit. \\(NS_{\eps}(f) = Pr_{x,y}(f(x) \neq f(y)) = 2 Pr_{x,y}(f(x) = 1 \land f(y) = -1)\\) by symmetry of sign changing bit flips.

## Expressiveness measures
Let \\(C\\) be a class of boolean function. Viewing \\(c\\) as the dichotomy it induces on a given set is profitable here.

### Count the number of f in C
One can use \\(|C|\\) or packing/ covering numbers. See the functional analysis survey for details.

### Dichotomy count fn
Take S with \\(|S| = m\\). \\(D_{C}(S)\\): set of dichotomies on S induced by C; Max dichotomy count: \\(D_{C}(m) = \max_{|S|=m}|D_{C}(S)|\\).

#### Shattering and VCD d
If \\(D_{C}(S) = 2^{m}\\), it is said to be shattered by \\(C\\). VCD(C) is the size of maximal set which is shattered by \\(C\\).

#### Bounding using the VCD
If \\(m<=d\\), \\(D_{C}(m) = \sum_{i=1}^{m}\binom{n}{i} = 2^{m} = O(m^{d})\\). If \\(m > d\\), we use Sauer's lemma. These bounds are important in quantifying the number of samples required to accurately estimate probabilities of a class of events (an example event: a classifier is wrong.). For details, see statistics and computational learning theory surveys.

\paragraph{Sauer's lemma}
(Sauer) If d = vcd(C), by induction and intermediate function, \\
\\(D_{C}(m) \leq \sum_{i=1}^{d} \binom{m}{i} \leq (\frac{em}{d})^{d} = O(m^{d})\\).

Pf: Let \\(s = |X|\\). By induction on s+d. \why Intuition: Can't produce some dichotomy on some d+1 set.


### Prove VCD(C) = d
Show some d-sized set shattered by C (Lower bound); show that no \\(d+1\\) sized set is shattered (Upper bound). Use geometric intuition.

#### Lower bound
Try making a matrix of points shattered, whose rows are bit vectors of the shattered points.

#### Upper bound
Find optimal shattering geometry, optimal strategy; Use adversarial labelling. Find \\(D_{C}(m)\\), solve \\(D_{C}(m)<2^{d}\\). If C finite, shatters S, \\(|C| \geq 2^{|S|}\\), so \\(\log |C| \geq d\\).

### VCD's of some R
Intervals in R: 2. Halfspaces in \\(R^{n}\\): n+1. Axis aligned rectangles: 4. d-gons in a plane: 2d+1. \\(VCD(C_{G}) \leq 2ds\log(es)\\).

\\(VCD(C_{r,n}) \geq r(\log (n/r))\\) if \\(C_{r, n}\\) embedding closed, contains function f with exactly \\(r\\) relevant vars. Take f. Key idea: A sample point \\(s_{j}\\) is the witness of relevance of var j in f. Key idea: Make a matrix whose rows are points shattered by \\(C\\). Let \\(k = \log (n/r)\\). Build a \\(rk \times r2^k\\) block matrix: 1 row block for every \\(s_{j}\\). In row block j: every column block \\(i \neq j\\) has same entry: \\(s_{j,i}\\); but column block i has all separate entries from \\({0,1}^k\\). To select any set of points/ rows, select embedding of f into the right set of relevant vars.

So, for decision list of \\(r\\) relevant vars: \\(r(\log (n/r))\leq d \leq \\)r\\( \log n\\).

