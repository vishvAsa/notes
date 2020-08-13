+++
title = "Mistake bounded models"

+++
## Mistake bound (MB) learning model
### Problem
$L$ learns $C$: $L$ given sample point $x$, returns h(x), told if it is correct; this is repeated; has mistake bound $m$ (over any sequence of examples).

#### Adversarial nature and randomization
The mistake bounded model is adversarial in nature - we are concerned with the number of mistakes made in the worst case. So, randomization helps : the adversary decides on the input before the coin is tossed, so not knowing the algorithm's output, its attempts to cause mistakes are less successful.

### Traits of MB learners
#### General traits
Any $L$ with finite mb can be written as sober algorithm $L'$  which makes its hypothesis consistant with all examples seen so far: Otherwise, can feed inconsistant hypothesis repeatedly, and $L$ would exceed mb.

Careful algorithm $L_{c}$: updates hypothesis only if it makes mistake. $L$ without careless updates is $L_{c}$, which has same mistake bound: Else, if $L_{c}$ makes m+1 mistakes, $L$ would exceed mistake bound $m$ on that sequence.

#### Efficient learnability in MB model
Show runtime per trial = poly($n$, size(c)), show polynomial mistake bounds. Reduce to efficiently learnable problem.

### Learnability in EQ only model
MB oracle can be simulated using an EQ oracle.

### Learnability in PAC model
Any C which is efficiently learnable in the MB model is PAC learnable. We use this PAC algorithm: Take sober algorithm, get hypothesis consistant with large enough sample $S$ drawn from the given distribution $D$.

Or translate to EQ algorithm, then convert to PAC algorithm.

### Lower bound
$mb = \Omega(VCD(C_{r,n}))$: Else you'd be able to learn in the PAC model with an impossibly low sample complexity.

#### Halving algorithm
For $|C|$ finite: At max $O(\log |C|)$ mistakes needed, ignoring efficiency: $L$ replies to x with $maj(h_{1}(x), \dots)$ : falsifies atleast 1/2 the concepts with every mistake.

mb of Halving algorithm is a lower bound: no algorithm can make better use of sample \chk. $mb = \Omega(|C|)$ not lower bound: Take k point functions; halving algorithm has mb = 1, not log k.

\oprob Compare halving algorithm running time with VCD.

### Make Mistake bounded learning algorithm for C using H
Decide initial h (maybe null, universal); decide update to hypothesis corresponding to example provided by the sampling oracle: Eg: Learn Disjunctions with mistake bound 2n.

### Find mistake bound
Enumerate cases where algorithm makes mistake; find max num of improvements to h possible in each case.

Start with some money; show that you never get to 0.

\oprob In MB model: Does ae learnability imply strong ae learnability?

## Mistake bounds (mb) for some R

### Disjunctions (so Conjunctions)
$n$ vars, $k$ terms.

#### Simplified Winnow
Mb = O(k log n), runtime O(n).

Algorithm: Initial $h$ is the sign of the halfspace $f = \sum x_{i} -n$ of weight $W=0$; if mistake on +ve $x$, double weights of all $Wt(x_{i}) = 1$ upto max $n$; if mistake on -ve $x$, $\forall x_{i}=1$, set $Wt(x_{i}) = 0$.

Analysis: On +ve $x$: From $f$ def$n$, $\sum_{x_{i}=1} Wt(x_{i}) \leq n$, Max wt added: $n$, so max mistakes $k \log n$. On -ve $x$: From f def$n$, $\sum_{x_{i}=1}Wt(x_{i}) \geq n$, Min wt removed: $n$, so mb = $k \log n$.

### Decision lists
Length k. 1-Decn lists: Have bag of candidates for 1st position (bag 1); Demote to bag 2 if guess is wrong; etc.. ; $mb = O(nk) = O(n^{2})$. \oprob: Get closer to $\Omega(|C|) = \Omega(k\log n)$.

So, t-Decision lists efficiently learnable, by \textbf{Feature expansion}; mb = $O(n^{t}k) = n^{O(t)}$. As $|C| = n^{tk}, \Omega(tk \log n) = O(tn^{t}\log n)$ needed.

### Decision trees
Rank of dec tree is $r \leq \log n$, so dec tree reduced to $\log n + 1$ dec list learnt with mb= $n^{O(r)} = n^{O( \log n)}$. Information theoretically $O(n (\log n))$ enough. \why \oprob: Can we get to $O(n^{k})$?. Similarly l augmented dec tree of rank $r$ has $mb = n^{O(l+r)}$.

### Polynomial size DNF f
Reduce to l-augmented dec tree of rank $\leq \frac{2n}{l}\log s + 1$;\\
taking $l=\sqrt{n\log s}$, f reduced to $O(\sqrt{n\log s})$ decn list, so mb = $n^{O(\sqrt{n\log s})}$.

$mb = O(n^{O(n^{1/3}\log s}))$: reduce to $O(n^{1/3}\log s)$ degree PTF.

### Halfspace
Given sample set $S = \set{(x_{i}, y_i)}$. The target classifier has the form: $\sum a_{i}x_{i} - a_0 \leq 0 \forall i: y_i = -1$. We want to learn some possible $a_{i}, a_0 \in R$. This can be solved with linear programming; max mistakes: $O(n^{c})$.

See statistics survey for the winnow algorithm, the perceptron algorithm, SVM's etc.

### Learn parity
Use the GF(2) representation of assignments and parity functions. See mq only algorithm to learn parity.

Could be important in learning Fourier coefficients.

\oprob Parity: Show learnability in IMB model.

#### Halfspaces: Sample net algorithm for Uniform distr
Take S labeled points; given random point p, choose points with positive inner products; return label of the majority.

### Halfspaces: Averaging algorithm
#### Problem
With $U(\mu, \sigma)$. Target hyperplane $c$ through origin; unit vector $u \perp c$ defines $c$. Draw $S$ points uniformly from unit sphere $S^{n-1}$'s surface.

#### Algorithm
Reflect $x_i$ with $c(x_i)=-1$; get all +ve S. $u_{h} = avg_{x_i \in_{U} S} x_i$.

#### Proof of goodness
Angle between u, $u_{h}$ be $\theta$: $Pr(sgn(\dprod{u,x}) \neq sgn(\dprod{u_{h},x})) = \frac{\theta}{\pi}$. Let $u'_{h}$ be component of $u_{h} \perp u$. $\theta = tan^{-1}\frac{\norm{u_{h}'}}{\dprod{u, u_{h}}}$.

Show $\dprod{u_{h},u}$ large; \\
so see $\dprod{u_{h},u} = m^{-1}\sum\dprod{u_{h},x_i}$; so $E[\dprod{u_{h},u}] = E[\dprod{u_{h},x_i}]$. But, for u fixed and x uniform from unit sphere, \\
$Pr(a \leq \dprod{u,x} \leq b) = \sqrt{n}\int_{a}^{b}(\sqrt{1-z^{2}}^{n-3}dz)$ \why. So, $E[\dprod{u_{h},x_i}] = 2\sqrt{n}\int_{0}^{1}(1-z^{2})^{\frac{n-3}{2}}z dz \geq 2\sqrt{n}\int_{0}^{\sqrt{\frac{1}{\sqrt{n}}}}(1-z^{2})^{\frac{n-3}{2}}z dz \geq c$. Also, can see $E[\dprod{u_{h},u}]$ big whp. \why

Show $u'_{h}$ small: Wlog, take $u = (1,0 .., 0)$, let $u_{h}' = v$. $v_{1} = 0$; get other $v_{i}$ by choosing points uniformly at random from $S^{n-2}$: get each $v_{i} \distr N(0, n^{-1})$. So, each $v_{i} = O(\frac{\sqrt{t}}{\sqrt{n}})$ whp. $\norm{u_{h}'} \leq m^{-0.5}$. \why

So, $\theta = \frac{\sqrt{n}}{\sqrt{m} \pi}$. \chk. For $m = \frac{n}{\eps^{2}}$, error = $\frac{\theta}{\pi} \leq \frac{\eps}{\pi}$.

\oprob Prove that $\Inters$ of halfspaces using averaging algorithm works for arbit distr.

### PTF of degree d
$mb = O(n^{d})$, Time: $O(n^{dc}) = O(n^{O(d)})$: reduce to Halfspace.

### Of a panel of k experts
#### The problem
You have a panel of experts $(e_{i})$, who on input $x$ return their verdict $(e_{i}(x))$ on whether $c(x) = 1$ or $c(x) = -1$.

##### Best expert for input sequence
It is possible that no $e_i(x)$ works perfectly $forall x$. So, for every $e_i$, there is always an input sequence, for which $e_i(x)$ is always wrong. However, for a given input sequence, the 'best expert' can easily discerned from hindsight.

##### Performance goal
If you knew who the least erroneous expert was, you would use the verdict of that expert alone; but you do not know this. You want an algorithm which combines the verdicts of all these experts in such a way that you do not perform much worse than the best expert.

#### Weighted majority
Classifier returns $sgn(\sum_{i} w_{i}e_{i})$.

Learning algorithm: init: $w_{i} = 1$; mb(best expert) = $m_{min}$. When wrong, halve $w_{i}$.

Analysis: When the algorithm is wrong, $\geq \frac{1}{2}$ of total weight $W$ is on wrong experts and $\frac{1}{4}W$ is lost due to the corrective update. So, after $m$ mistakes, $W \leq (\frac{3}{4})^{m}k$. So, considering the weight of the best expert after $m$ mistakes, $(\frac{1}{2})^{m_{min}} \leq W \leq (0.75)^{m}k$; so $m \leq O(m_{min} + \log k)$.

Matter of focusing wt on the best expert: see also external regret minimization analysis in Game Theory ref.

#### Randomized weighted majority
In this version of the algorithm, the classifier returns +1 with probability $\frac{\sum_{i: e_i(x) = 1} w_i}{\sum_i w_i}$. This is the same as returning the vote of the expert $e_i$ with probability $w_i$.

The expected number of mistakes after a certain number of rounds (rather than a certain number of mistakes) can then be analysed using a similar analysis. It turns out to be better. For intuition as to why this is the case, see note on the adversarial nature of the mistake bounded learning model.

#### Comparison with halfspace algorithms
By vieweing input bits as experts, learning a halfspace $w^{T}x + w_0$ used to classify $x$ can be cast as one of learning weights to be assigned to a panel of experts.

For comparison with some related half-space learning algorithms, like the winnow and the perceptron learning algorithm, see sections about them in the statistics survey.

### Intersection F of k halfspaces
As $NS_{a} \leq k \sqrt{a}$. \why

## Infinite attribute MB learning model (IMB)
### Problem and notation
Infinite literals $\set{x_{i}}$ out there. A sample point is specified by a list of attributes present in the sample.

$r$ is the number of variables $c$ actually depends on. $L$: MB model algorithm for learning $C$. $n$, when not used in the MB sense: size of the largest example seen. $L'$ : algorithm to learn in infinite attribute model. $p(r, |c|)h(n)$ = mistake bound of $L$; $p'(r, |c|)h'(n)$ = mistake bound of $L'$. $N_{i}$ : set of literals used by $L'$  at step $i$.

We can assume that $L'$  knows $r$ and $p$: else, $r$ and $p$ can be doubled or squared till $L'$  stops making more than $p(r, |c|)h(n)$ mistakes.

#### The key problem
Which attributes are relevant for classification?

#### Importance
Eg: A rover in mars trying to understand the properties of life there.

### ae learning
Same as in MB model, except use n as size of largest example.

### Lower bound
Using MB model lower bounds: $\Omega(VCD(C_{r,n}))$.

### Sequential learning algorithm
$L'$  uses $L$ and an attribute set $N$ to label the examples.

#### Algorithm
Init: $N$ empty. When $L$ makes $\geq p(r, |c|)h(|N_i|)$ mistakes, we know that $N_i$ doesn't have all relevant vars; during mistakes, we would have seen $\geq 1$ relevant literal not already in $N_{i}$. So, we set $N_{i+1}$ to include all variables seen during mistakes, along with $N_i$.

#### Analysis
After $r$ iterations, $L'$ gets all relevant literals. So, mistake bound is $O(rp(r, |c|)h(|N_r|)) = rp(r, |c|)h(n)p(r, |c|)h(|N_{r-1}|)))$ ...

### Learning by mapping
Works for pec $C$. Keep mapping/ projecting variables to a list of variables, $N$: yields better bound, simpler analysis. We use $s = |c|$ below.

Whenever a mistake is made, any new attribute is immediately added to $N$. Now, if the MB algorithm made at most $p(r, s)h(|N|)$ mistakes, the new algorithm makes at most $p(r, s)h(|N|)$ mistakes, where $|N|$ solves $|N| \geq n p(r, s)h(|N|) + n$.

So, if pec class ae learnable in MB model, it is also learnable in the IMB model. Also, if pec class strongly ae learnable in MB model, it is also strongly ae learnable in the IMB model.

\oprob Show that learnability in IMB implies ae learnability in MB model.

### Results
Using $O(r \log n)$ winnow algorithm from MB, disjunctions \\
learnable with mb $O(r^{3} \log rn)$ and time per trial $O(rn \log rn)$. So, size s k-CNF and k-DNF learnable using winnow with time per trial $\tilde{O}(n^{k})$ and mb $O(s^{3}k \log sn)$.

\oprob Learn decision lists in the IMB in time and mistake bound poly($n$, r)?

### Expensive Sequential halving algorithm
Sequential learning algorithm where $L$ = expensive halving algorithm with $mb = \log |C(N)|$, $C(N) = \set{c' | c'(x) = c(x \inters N}$. $C(r) = \Union C(S') : |S'|\in[0,r]$. $C(N) \leq \binom{|N|}{k}C(k)$ as all $c$ based on max $r$ literals. So, at any step, $p(r, |c|)h(n) = r\log(|N||C(r)|)$. So, $p'(r, |c|)h'(n) = r^{2}\log (nr|C(r)|)$.

## MBQ and IMBQ models
MB and IMB models with MQ oracles. Trying to learn pec class. An example of Active Learning. Motivating scenarios: password cracking.

If $f(s_1) = 1$ and $f(s_2)=0$, with $\log n$ membership queries (mq), you can identify the relevant variable in $s_1 \symdiff s_2$.

Lower bound: $\Omega(VCD(C_{r,n}))$. \why

Convert an efficient MBQ algorithm (L) with bound $q($n$, |c|)$ into an algorithm $L'$ that  strongly ae learns the class in MBQ or the IMBQ model with bound $2(r+1)q($n$, |c|) +r(\log m + 1)$. Pf: N: set of possibly relevant attributes; Init: $N = \phi$; keep growing N to include all relevant attributes. Take arbit partial assignment P for V-N; Run $L$ to learn $c_P$. Keep projecting examples ($s \to P/s$) and mq to and fro; Respond to mq in the obvious way. If it makes a mistake on some s, check using mq if $c(s) \neq c(P/s)$; if so, find and add the relevant variable therein. So, bound of the resultant algorithm $L'$  is roughly $r$ $\times$ bound of $L$: $ $, $L'$  is ae.

## Predictive power of Consistent (maybe small) h
### (a,b) Occam algorithm for C using H
Give $h$ consistant with sample $S$, $size(h) \leq (n .size(c))^{a}m^{b}$.

So, the size of the $h$ generated is not too big. This property turns out to be important in bounding the size of $H$, which in turn helps us prove the goodness of the PAC learning algorithm which we craft using the Occamish algorithm.

This is reminiscent of the predictive power of Occam razor used in elucidating the philosophy of science after the rennaissance: make as few assumptions in your theory as possible.

### Occam razor: Goodness from consistency
Any efficient Occam algorithm can be used to construct a good PAC algorithm: simply draw $m = O(\eps^{-1}(\log |H_{n,m}| + \log(\del^{-1})))$ samples from the distribution $D$ and use the Occam algorithm to learn a hypothesis $h$ consistent with this sample set.

\proof: Using the Chernoff bounds, we can say: The empirical estimate of the goodness of a fixed $h$ on a large sample set $S$ is, with high probability, very close to its actual goodness. But there can be many $h$ which are $\eps$ close to $c$, and we want to be able to say that, irrespective of which $h$ the Occam algorithm outputs, it is likely to be good. To do this, we use the union bound from probability theory: $Pr(\exists $ bad h$; [c \Del h] \cap S = \phi) \leq |\Del_{\eps}(c)|(1-\eps)^{m} \leq |H|(1-\eps)^{m} \leq |H|e^{-m\eps} \leq \del$.

In other words, we found a way of saying that $S$ is likely to be an $\eps$ net around $c$.

#### VCD - Occam razor: Extension to unbounded C
Even if $|H| = \infty$, $m = \Omega(\eps^{-1}\log(\del^{-1}) + \frac{d}{\eps}\log(\eps^{-1}))$ examples likely to form $\eps$ net: use bound on $\Pi_{C}(m)$. So, whp:\\
$\eps = O(m^{-1}\log(\Pi_{C}(2m)) + m^{-1}\log d^{-1})$: $\eps$ decreases with increase in $m$, decrease in $\Pi_{C}(2m)$.

#### Almost consistent h
Suppose that an Occam-like algorithm produces a $h$ with a small, non zero empirical error on $S$: $\eps_{S}$.

Using the Hoeffding's inequalityuality, for a fixed $h$, we see that this is likely to be a good estimate of the actual error. $Pr(|\frac{\eps}{2} - \eps_{S}| \leq \frac{\eps}{2}) \leq 2e^{-\frac{\eps^{2}}{2}m}$; so any h with $\eps_{S} = \frac{\eps}{2}$ on $m = \Omega(\eps^{-2}\log \frac{1}{\del})$ good whp.

As before, the union bound using either the VCD $d$ or using $|H|$ can then be applied to get: $\Omega(\eps^{-2}(\log|H| + \log \frac{1}{\del}))$ and $\Omega(\eps^{-2}(d + \log \frac{1}{\del}))$.

#### Occam with Approximate set cover
Take set $U$ of $m$ examples seen so far; $|c|$ := size (num of literals) of smallest $c$ to cover $U$. Greedily, repeatedly alter $c$ (add literal) to cover most of uncovered part of $U$ at step $i$ ($U_{i}$): as $c$ covers $U_{i}$, atleast 1 literal in $c$ covers $\frac{U_{i}}{|c|}$; so $U_{i+1} = |U_{i}| - \frac{U_{i}}{|c|} \leq m(1-|c|^{-1})^{-i}$; so, $|h| = O(|c| \log m \log n)$; by Occam razor $m = O( \frac{|c|\log^{2} n + \log \frac{1}{d}}{\eps})$. Eg: learn disjunctions of size $k$.

### Converse to Occam razor
For any pac learnable $C$, can use Adaboost with $L$, do boosting by sampling to find small hypothesis consistent with any sample S.
