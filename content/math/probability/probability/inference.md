+++
title = "Inference and comparison"
+++

\## Statistics
See statistics ref.

\### Estimating a probability with accuracy \htext{$\eps$}{..}
See statistics ref.

\## Results
Max load Y when hash function from k-universal family used: $Pr(Y > \sqrt[k]{2n})<2^{-1}$ (bounding expected number of collisions, use Markov).



## Distances between distributions
### Total variation distance between distributions
Aka Statistical distance. Sample space X. $\Del(D, D') = 2^{-1} \sum_{x \in X} |D(x) - D'(x)|$: $\in [0,1]$. But, $\sum_{x \in X} (D(x) - D'(x)) = 0$.

Visualize as space between probability curves. Total prob under either curve is 1.

#### Largest deviation in event probability
For event $E \subseteq X: \max_{E \subseteq X} |Pr_{D}(x \in E) - Pr_{D'}(x \in E)| = \Del(D, D')$. Or, max (signed) area between curves covered by E is at most half the total area. Useful in bounding probability of events.

### Code-length divergence
(Kullback Leibler) Aka information divergence, information gain, relative entropy. A particular Bregman divergence. General case specified in vector spaces ref. For connection with entropy and cross entropy, see information theory ref.

$K(D||D') = E_{x \distr D}[\log \frac{D(x)}{D'(x)}] = \\
\sum D(x) \log \frac{D(x)}{D'(x)} = \sum D(x) \log \frac{1}{D'(x)} - H(D) = H_c(D') - H(D)$. Expected number of extra bits used to code samples in $D$ using code based on $D'$.

#### Nonnegativity
See wiki diagram: Puts greater weight D(x), often for cases where $\frac{D(x)}{D'(x)} \geq 1$.

$K(D, D') \geq 0$ (aka Gibbs inequality): Take probability distributions p, q; get $\sum p_i \log (p_i/ q_i) \geq 0$ using $\ln x \leq x - 1$.
$K(D||D') = 0$ only if $D = D'$ using same idea.

#### Other properties
Not a metric as it is asymmetric and does not satisfy the triangular inequality.

$\exists x: D(x) \neq 0, D'(x) =0: \implies K(D||D') = \infty$.

#### Connection with variation distance
(Pinsker's inequality) $\sqrt{KL(P||Q)/2} \geq \Del{P, Q}$.\why

## Inferences about distributions of function(RV)
Y = g(X).

Use $Pr(g(X) \in A) = Pr(X \in g^{-1}(A))$. So, given CDF, PDF of X, can deduce CDF of g(X) and thence derive PDF of g(X).

### Using \htext{$\frac{dg^{-1}(Y)}{dY}$}{..}
If g is monotone in $(x, x+\gd x)$: $p_{X}(x)\gd x \approx p_{Y}(y)\gd y$, taking $(x, x+\gd x)$ to $(y, y+\gd y)$ using g: So $p_Y(y) = p_{X}(x)|\frac{dx}{dy}| = p_{X}(g^{-1}(y))|\frac{d g^{-1}(y)}{dy}| $: so maximum probability density changes with variable change.

If g is not continuous, but $\exists$ partition $A_{0}, .. A_{k}$ with $Pr(X \in A_{0}) = 0$, with $\set{g_{i}} = g $ over $\set{A_{i}}$ monotone; then $p_Y(y) = \sum_{i} p_{X}(g^{-1}(y))|\frac{d g_{i}^{-1}(y)}{dy}|$; where $\sum$ appears to account for the probability that Y=y over various domains of X.

#### Extension to multidimensional distributions
$Y = g(X_{1}, X_{2}); \\
X_{1} = h(Y, X_{2})$. Fix $X_{2} = x_{2}$; get $p(Y, x_{2}) = p_{X_{1}, X_{2}}(X_{1} \\
= h^{-1}(Y, x_{2})| x_{2})|\frac{dh^{-1}(Y, x_{2})}{d Y}|$; then do $p_{Y}(y) = \int p(Y, x_{2}) dx_{2}$.

### Using moment generating functions
Given $m_{X}(t)$, find \\
$m_{Y}(t) = E[e^{f(X)t}]$; thence deduce pdf of Y.


## Bounds on deviation probability
Aka concentration of measure inequalities.

### Expectation based deviation bound
(Aka Markov's inequality). If $X\geq 0$: $Pr(X \geq a) \leq \frac{E[X]}{a}$: $Pr(X \geq a)$ is max when $X$ is 0 or a.

Averaging argument. If $X\leq k$, $c\mean Pr(X\leq c\mean) + k(1-Pr(X\leq c\mean)) \geq \mean$; so $Pr(X\leq c\mean) \leq \frac{k-\mean}{k-c\mean}$.

This technique is used repeatedly in other deviation bounds based on variance and moment generating functions.

### Variance based deviation bound
(Aka Chebyshev's inequality). By Markov's inequality: $Pr((X-E[X])^{2} \geq a^{2})\leq  \frac{Var[X]}{a^{2}}$.

#### Use in estimation of mean
$Pr(n^{-1}(\sum X_i-E[X_i])^{2} \geq a^{2}) = Pr((\sum X_i-E[X_i])^{2} \geq na^{2})\leq  \frac{Var[\sum X_i]}{na^{2}}$. Applicable for pair-wise independent Bernoulli trials.

### Exponentially small deviation bounds
#### General technique
(Chernoff) $Pr(e^{tX} \geq e^{ta})\leq E[e^{tX}]/e^{ta}$: applying Markov. Used to bound both $Pr( X>a)$ and $Pr(X<a)$ with $t>0$ or $t<0$. Get a bound exponentially small in $\mean$, deviation.

#### For random variable sequences
$\mean = \sum E[X_i]$. For $X=\sum_{i=1}^{n}X_{i}$. Note that RVs are not necessarily identically distributed.

##### Pairwise independent RVs
Use variance based deviation bounds, as variance of pairwise independent RVs is an additive function.

#### Sum of n-wise independent RVs
##### Bounds from MGF's.
$Pr(e^{tX} \geq e^{ta})\leq E[e^{tX}]/e^{ta} = (\prod E[e^{tX_i}])/ e^{ta}$: here ye have used independence.

If $d>0$, $Pr(X \geq (1+d)\mean) \leq \frac{e^{\mean(e^{t}-1)}}{e^{t(1+d)\mean}} \leq \frac{e^{d\mean}}{(1+d)^{(1+d)\mean}}$: using $t = \ln(1 + d)$ and $M_{X}$ bound.

So, if $R = (1 + d)\mean >6 \mean: d = \frac{R}{\mean} - 1 \geq 5, Pr(X \geq (1 + d) \mean) \leq (\frac{e}{6})^{R} \leq 2^{-R}$.

If d in (0,1], $Pr(X \geq (1+d)\mean) \leq e^{\frac{-\mean d^{2}}{3}}$: As $\frac{e^{d}}{(1+d)^{(1+d)}} \leq 2^{\frac{-d^{2}}{3}}$: as $f(d) = d - (1 + d) \ln (1+d) + \frac{d^{2}}{3}\leq 0$: as $f(0) \leq 0$ and $f'(d) < 0$.

If d in (0,1], $Pr(X \leq (1-d)\mean) < \frac{e^{-d\mean}}{(1-d)^{(1-d)\mean}}$; $Pr \leq e^{\frac{-\mean d^{2}}{2}}$.

So, $Pr(|X-\mean|\geq d\mean) \leq 2e^{-\mean d^{2}/3}$. \exclaim{So, probability of deviation from mean decreases exponentially with deviation from mean.}

Can be used in both additive and multiplicative forms.

##### Goodness of empirical mean
Now, $E[X_i] = p$. Using $X/n = \sum X_{i}/n$ to estimate mean p. So, $Pr(|\frac{\sum X_{i}}{n}-p|\geq d p) \leq 2e^{-np d^{2}/3}$. \exclaim{So, probability of erroneous estimate decreasing exponentially with number of samples!}

##### Code length divergence bound
Let $D_p$ and $D_q$ be probability distributions of binary random variables with probabilities $p$ and $q$ of being 1 respectively.

$D_p(\sum_i X_i \geq qn) \leq (n-qn)e^{-n KL(D_p||D_q)}$.

\pf{Suppose that $X_i\distr D_p$ and that $p<q, k \geq qn$.

$D_p(\sum_i X_i = k) \leq \frac{D_p(\sum_i X_i = k)}{D_q(\sum_i X_i = k)} = 
(\frac{p}{q})^{k}(\frac{1-p}{1-q})^{n-k} 
\leq (\frac{p}{q})^{qn}(\frac{1-p}{1-q})^{n(1-q)} =\\ e^{-n KL(D_p||D_q)}$.

So, taking the union bound over all $k \geq qn$, we have the result.}

Using the connection between the code length divergence and the total variation distance: $KL(D_p||D_q) \geq 2(p-q)^{2}$. This can be used to derive other deviation bounds.

##### Additive deviation bounds
See Azuma inequality section.

#### iid RV: Tightness of the Chernoff bound
(Cramer) Take $l(a) = \max_{t} ta-M(a)$. For large $n$: $Pr(\frac{\sum X_{i}}{n}\geq a) \geq e^{-n(l(a) + \eps)}$ \why. Combining with Chernoff, $Pr(\frac{\sum X_{i}}{n}\geq a) = e^{-n(l(a) + \eps_{n})}$ for some seq $(\eps_{n}) \to 0$.

\part{Probabilistic Analysis Techniques}
## Existence proofs
$Pr(X\geq E[X])>0$, $Pr(X\leq E[X])>0$.

### For sparse dependency graphs
Aka Lovasz local lemma.

For Dependency graph with $Pr(E_{i})<p, 4dp<1$: $Pr(\cap \bar{E_{i}}) > 0$.

Lovasz local lemma: general case: Dependency. graph G=(V,E), \\
$x_{i} \in [0,1]$: $Pr(E_{i}) \leq x_{i} \prod_{(i,j) \in E}(1-x_{j})$: $Pr(\cap \bar{E_{i}})\geq \prod_{i}(1-x_{i}) > 0$

### Threshold behavior
$X>0$: Second moment method: $Pr(X=0)\leq Pr((X-E[X])^{2} \geq (E[X])^{2})$. Conditional expectation inequality for $\sum$ indicators: \\
$Pr(X>0) \geq \sum_{i=1}^{n}\frac{Pr(X_{i}=1)}{E[X|X_{i}=1]}$.

### Explicit constructions
\tbc


### Make Existence proofs
Design sample space, show $Pr(E)>0$, maybe modify to get final object. Use Expectation argument. Make non-negative RV X, use Chebyshev to bound Pr(X=0). Make dependency graph, use Lovasz local lemma.

## Extremal combinatorics
Prove extremal statistic about some extremal set. \tbc

## Analysis strategies
### General strategies
Pick things randomly. Be able to specify the random process.

Analyzing $X$ and Y; If there is uniform symmetry in X, set $X$ to be any value without loss of generality.

Cast the problem into a stochastic process : Eg: Markov chain/ Random walk problem, Martingale.

### Bound probabilities and expectations
#### Break up big events into smaller cases
One can analyze $Pr(A)$ using $Pr(A) = \sum_b Pr(A|G)Pr(G)$.

##### One of many events
Use the Union bound.

##### Co-occurring events
$Pr(\land_{i \in S} E_i) = Pr(E_1)Pr(E_2|E_1) Pr(E_3|E_2, E_1)..$. Taking conditional probabilities, one analyzes events with smaller sample spaces. If this decomposition is done considering the 'causation', as in the case of  directed graphical models, we can take advantage of conditional independence.

Or one can use $Pr(\land_{i \in S} E_i)  \leq Pr(E_i)$ for some suitable $i$.

##### Principle of deferred decisions
Find or lower bound $Pr(F(X))$ using principle of deferred decisions: Let RVs $X_{1} \dots X_{n}$ decide X's value: suppose $X_{1} \dots X_{n-1}$ happen: What is the probability that $X_{n}$ takes the right value for $F(X)$?

#### Identify independent events
Identifying independent events often helps in bounding probabilities: whether in being able to apply suitable tail bounds, or in decomposing $E[XY]$ or $var[X+Y]$ or $Pr(XY)$.

To do this, one can consider causation by constructing a graphical model; or identify it algebraically by keeping track of the sample space connected with the expectation/ probability/ variance using suitable subscripts.

#### Use super-events
If $E_1 \implies E_2$, then $Pr(E_1) \leq Pr(E_2)$.

#### Use concentration of measure around the mean
Find mean, use tail bounds.

##### Means and variances
In finding mean, we can often use properties such as the linearity of expectation. Similarly, we can decompose the problem of finding $var[X+Y]$ or $E[XY]$ the random variables involved have suitable independence properties.

If it is difficult to find the mean directly (Eg: $E[X] = \sum E[X_{i}]$), one can find an upper bound to it by other means, and use it.

##### Dealing with lack of independence
If you're analyzing a probability distribution of $f(X_{1}, .. X_{i})$ or $\sum X_{i}$, and $\set{X_{i}}$ are not independent, use a martingale. If $\exists$ pairwise independence, use Chebyshev.


