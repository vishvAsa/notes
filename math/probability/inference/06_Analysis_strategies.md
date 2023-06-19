+++
title = "06 Analysis strategies"

+++
## General strategies
Pick things randomly. Be able to specify the random process.

Analyzing \\(X\\) and Y; If there is uniform symmetry in X, set \\(X\\) to be any value without loss of generality.

Cast the problem into a stochastic process : Eg: Markov chain/ Random walk problem, Martingale.

## Bound probabilities and expectations
### Break up big events into smaller cases
One can analyze \\(Pr(A)\\) using \\(Pr(A) = \sum_b Pr(A|G)Pr(G)\\).

#### One of many events
Use the Union bound.

#### Co-occurring events
\\(Pr(\land_{i \in S} E_i) = Pr(E_1)Pr(E_2|E_1) Pr(E_3|E_2, E_1)..\\). Taking conditional probabilities, one analyzes events with smaller sample spaces. If this decomposition is done considering the 'causation', as in the case of  directed graphical models, we can take advantage of conditional independence.

Or one can use \\(Pr(\land_{i \in S} E_i)  \leq Pr(E_i)\\) for some suitable \\(i\\).

#### Principle of deferred decisions
Find or lower bound \\(Pr(F(X))\\) using principle of deferred decisions: Let RVs \\(X_{1} \dots X_{n}\\) decide X's value: suppose \\(X_{1} \dots X_{n-1}\\) happen: What is the probability that \\(X_{n}\\) takes the right value for \\(F(X)\\)?

### Identify independent events
Identifying independent events often helps in bounding probabilities: whether in being able to apply suitable tail bounds, or in decomposing \\(E[XY]\\) or \\(var[X+Y]\\) or \\(Pr(XY)\\).

To do this, one can consider causation by constructing a graphical model; or identify it algebraically by keeping track of the sample space connected with the expectation/ probability/ variance using suitable subscripts.

### Use super-events
If \\(E_1 \implies E_2\\), then \\(Pr(E_1) \leq Pr(E_2)\\).

### Use concentration of measure around the mean
Find mean, use tail bounds.

#### Means and variances
In finding mean, we can often use properties such as the linearity of expectation. Similarly, we can decompose the problem of finding \\(var[X+Y]\\) or \\(E[XY]\\) the random variables involved have suitable independence properties.

If it is difficult to find the mean directly (Eg: \\(E[X] = \sum E[X_{i}]\\)), one can find an upper bound to it by other means, and use it.

#### Dealing with lack of independence
If you're analyzing a probability distribution of \\(f(X_{1}, .. X_{i})\\) or \\(\sum X_{i}\\), and \\(\set{X_{i}}\\) are not independent, use a martingale. If \\(\exists\\) pairwise independence, use Chebyshev.

