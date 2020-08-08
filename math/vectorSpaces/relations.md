+++
title = "Relations"
+++

## Majorization
Take \\(a, b \in C^{m}\\), rearrange in descending\\
 order to get \\(\set{a_{[i]}}, \set{b_{[i]}}\\); and in ascending order to get \\(\set{a_{(i)}}, \set{b_{(i)}}\\). \\(a \oleq b\\) (b majorizes a) if \\(\sum_{i=1}^{m} a_{i} = \sum_{i=1}^{m} b_{i}, \sum_{i=1}^{k}a_{[i]} \leq \sum_{i=1}^{k}b_{[i]} \forall k\\). \\(\equiv\\) notion from using ascending order and saying a majorizes b.

### Interleaving
If a majorizes \\(b \in R^{n}\\), \\(\exists g \in R^{n-1}\\) interleaved among a such that g majorizes \\(b' = b_{1:n-1}\\).

Pf: True for 2; suppose \\(n \geq 2\\); take \\(d \in R^{n-1}\\) interleaved among a (ineq A) with \\(\forall k \in [1, n-2]: \sum_{i=1}^{k} d_{(i)} \leq \sum_{i=1}^{k} b_{i}\\) (ineq B); take their set D; \\(a' = a_{1:n-1}\in D\\), D bounded, closed: so compact; D convex; \\(\norm{a'}_{1} \leq \norm{b'}_{1}\\); take \\(d' = argmax_{d \in D} \norm{d}_{1}\\), set \\(g(t) = \norm{ta' + (1-t)d'}_{1}\\) is continuous over [0,1]; if \\(\norm{d'}_{1} \geq \norm{b'}_{1}\\), \\(\exists t: g(t) = \norm{b'}_{1}\\). To show \\(\norm{d'} \geq \norm{b'}\\): if all ineq B are strict, all of ineq A must be equalities: else \\(\norm{d'} \neq max_{d} \norm{d}\\): then, \\(\norm{a_{2:n}}\geq \norm{b'}\\); if some ineq in ineq B is equality, take r = largest k for which this holds; then \\(\sum_{i}^{r}d'_{i} = \sum_{i}^{r} b_{i}\\), \\(\forall k> r: d'_{k} = a_{k+1}\\); thence again get \\(\norm{d'} \geq \norm{b'}\\).

### Connection with stochastic matrices
b majorizes a iff \\(\exists\\) doubly stochastic S: \\(a = Sb\\). Lem 1: If b maj a, can make real symmetric \\(B = Q\EW Q^{*}\\) with diag a and ew b; B is normal matrix, so can say a = Sb for doubly stochastic S. Lem 2: Take a=Sb; as PSP' remains stochastic with permutation matrix ops P, P', wlog assume a, b in ascending order; take \\(w_{j}^{(k)} = \sum_{i=1}^{k}s_{i,j}\\), with \\(\sum_{i=1}^{n}w_{j}^{(k)} = k\\); see \\(\sum_{i=1}^{k} (a_{i} - b_{i}) = \sum_{j=1}^{n}w_{j}^{(k)}b_{j} - \sum_{i}^{k} b_{i} + b_{k}(k - \sum_{j=1}^{n} w_{j}^{(k)}) \geq 0\\).

So, by Birkhoff, b maj a iff \\(a = Sb = \sum_{i}p_{i}(Pb)\\).

### Weak majorization
Weak majorization (\\(\ogeq\\)) if \\(\sum_{i=1}^{m} a_{i} = \sum_{i=1}^{m} b_{i}\\) condition omitted.

#### Connection with stochatic matrices
b weakly majorizes \\(a \geq 0\\) iff \\(\exists\\) doubly substochastic Q: \\(a = Qb\\). Pf of if: \\(\exists\\) doubly stochastic S: \\(Q \leq S\\); so \\(\sum_{i=1}^{k}(Qb)_{[i]} \leq \sum_{i=1}^{k}(Sb)_{[i]} \leq \sum_{i=1}^{k}b_{[i]}\\). Pf of \\(\to\\): Let a have n nz elements; take \\(d= \sum b - \sum a\\); extend b by adding m 0's to get b', extend a by adding m \\(d/m\\) valued entries; then \\(\exists\\) dbl stoch S with \\(a' = Sb'\\); then Q is \\(n \times n\\) principle submatrix.

b weakly majorizes a iff \\(\exists\\) doubly stochastic S: \\(a \leq Sb\\). Pf of \\(\gets\\): If \\(a \leq Sb, a \oleq Sb \oleq b\\). Pf of \\(\to\\): Pick k to get \\(a' = a+k1, b' = b + k1\\); If \\(a \oleq b\\), for substochastic Q, \\(a+k1 = Q(b + k1)\\); so \\(a = Qb \leq Sb\\) where S is stochastic dilation of Q.

### Weak Majorization and convex increasing fn
Take convex increasing scalar function f; b weakly majorizes a; then \\(f(b)\\) weakly majorizes \\(f(a)\\). Pf; For doubly stochastic Q, \\(a \leq Qb\\); using monotonicity, \\(f(a) \leq f(Qb)\\); so \\(f(a) \oleq f(Qb)\\); but by Birkhoff \\(f(Qb) = f((\sum \ga_{i}P_{i})b) \leq \sum \ga_{i}f((P_{i})b) = \sum \ga_{i}P_{i}f(b) = Qf(b)\\), where \\(\sum \ga_{i} = 1\\); so \\(f(Qb) \oleq f(b)\\).

If \\(0 \leq a\\), \\(0 \leq b\\), with entries in descending order, \\(\prod_{i=1}^{k}a_{i} \leq \prod_{i=1}^{k} b_{i}\\), g is such that \\(g(e^{x})\\) is convex increasing, then g(b) weakly majorizes (\\(\ogeq\\)) g(a): \\(\log a \oleq \log b\\); use \\(f(x) = g(e^{x})\\); take care of cases where \\(a_{i > k} = 0\\) using induction.
