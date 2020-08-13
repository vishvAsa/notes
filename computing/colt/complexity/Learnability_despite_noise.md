+++
title = "Learnability despite noise"

+++
## Classification noise
Random noise vs Adversarial noise. Getting (x, l) instead of (x, c(x)).

Malicious noise: both x and c(x) corrupted.

### Random Classification noise model
Uniform noise $\eta \leq \eta_{0} \in [0,.5)$; $L$ given $\eta_{0}$, also polynomial in $\frac{1}{.5-\eta_{0}}$.

### Statistical Query (SQ) learning model
(Kearns). A \textbf{statistical query} (criterion, tolerance) = $(\chi, \tau)$ yields probability $Pr_{x}(\chi)$ or $E_{x}(\chi)$ of $\chi$ over examples. $\chi$ efficiently evaluatable, $\tau$ not very tiny. $L$ forms h using only statistical queries.

### Show non-constructive SQ learnability
If $d = sqd_{D}(C)$ and $S_{D} = \set{f_{i}}$ the corr shattered set; $\forall f \in $C$, \exists f_{i} \in S_{D}: |corr_{D}(f_{i},f)| > (d+1)^{-1}$. Let \\
$g_{S} = max(|corr_{D}(f_{i}, f_{j})|)$; 
$f_{i}, f_{j} \in S$; $g^{*} = \min \set{g_{S}: |S| = d}$ : pick such S; if $g^{*} \leq (d+1)^{-1}$ $sqd_{D} \geq d+1$: absurd; so, $g^{*} > (d+1)^{-1}$; so swapping any $s \in S$ with $s' \in S_{D}$, get result.

#### Non uniform algorithm
So make SQs: $\forall f_{i} \in S_{D}, E[f_{i}c] = ?$ to find $f_{j}: E[f_{j}c] > (d+1)^{-1}$; $Pr(f_{j} \neq c) \geq 2^{-1} + (d+1)^{-1}$. So, $\exists$ weak learning algorithm for C with running time $O(d^{t})$, t constant.

Also $\Omega(d^{t'})$: as $sqd = \Omega(vcd)$.

### Simulate SQ learning
Noise absent: Take many examples to find $P_{\chi}$, use Chernoff. \textbf{Classification Noise} present: Sample $\eta_{i}$ from [0,1/2) at sufficiently small intervals; Express $P_{\chi}$ as combo of probabilities over noisy examples, $\eta$; for each $\eta_{i}$ get $h_{i}$; gauge noisy errors, return h with least noisy error (which grows like actual error).

### Efficient PAC learnability with noise
Any C efficiently learnable using SQ is efficiently PAC learnable with classification noise. So, PAC model more powerful than SQ: $\exists$ C learnable in PAC+noise, but not learnable in SQ. (Find proof.) But, Folk theorem: most existing PAC algs extensible to SQ algs.

(Also using statistical queries): Conjunctions. k-CNF: by feature expansion.

Halfspaces (\why: Blum etal): Important subroutine for various learning algs.

### Learning Parity
$c = p_{S}$; classification noise. Best algorithm: $2^{\frac{n}{\log n}}$. \why

Learning k-PARITY with random noise: Measure errors of all $O(n^k)$ h over a random sample set of size $O(\frac{1}{1-2\eta} k \log n)$.

If parity learnable in polytime, DNFs efficiently learnable under U: see reduction from agnostic parity learning.

\oprob: If you can learn parity when there is constant noise, can you learn it when $\eta = 1/n^{r}$?

### Random persistant classification noise
Classification noise model with modification: $\forall x$: once mq(x) is returned, all future queries mq(x) elicit the same label.

Motivation: Random classification noise can be beaten if MQ(c) oracle present: For each example, make $poly(\frac{1}{.5-\eta_{0}})$ mq and take majority answer.
