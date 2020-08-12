+++
title = "05 Modeling stochastic processes"

+++
## Stochastic process with state space T
Aka random process. T-valued random variable/ state sequence indexed by \\(r\in R\\) (often time): visualize as a time-series - a directed graph which is a straight line.

### Multiple coin toss processes
Consider a sequence of coin tosses. Let \\(X_i\\) model the outcome of the i-th toss.

Bernoulli process: iid bernoulli trials: the same coin is tossed multiple times, that is \\(\forall i: X_i \distr p\\). Resulting from such a process is the Binomial distribution for \\(\sum_i X_i\\).

Poisson trials: independent but not necessarily identically distributed trials, that is \\(X_i \distr p_i\\).

### Continuous time
Aka flow. \tbc

## State transitions
Many models often propose that behind the production of a sequence of observations, there are (possibly hidden/ latent) changes in internal state. They allow transition from one state to another to be stochastic.

Let the state at time t be \\(X_{t}\\). Let \\(V\\) be the set of possible states.

### Assumptions about state transitions
#### Dependence solely on prior state
A model which assumes the Markov property described below is often convenient to represent states.

##### Sequence distribution: chain structure
Markov property/ assumption: Future states are independent of past states: \\(f_{X_{t+1}|X_{t} .. X_{0}} = f_{X_{t+1}|X_{t}}\\).

A state transition model with this property is called a Markov chain/ bigram state chain, considering the chain-like graphical model of the distribution of the variables \\(\set{X_t}\\).

So, the set of distributions \\(\set{f_{X_t|X_{t-1} = t} \forall t \in T}\\) completely describes the state transition model.

#### Dependence on prior k states
Suppose that the concept of a bigram state chain is generalized to a k+1-gram state chain. So, \\(f_{X_t|X_{t-1} .. X_0} = f_{X_t | X_{t-1} .. X_{t-k}}\\): a weaker independence property holds.

#### Reduction to bigram state chain
Consider a bigram state chain with the state sequence being \\((Y_t)\\), and \\(ran(Y_t) = T^{k}\\). Then, we will have the bigram Makrov property: \\(f_{Y_t | Y_{t-1} .. Y_0} = f_{Y_t|Y_{t-1}}\\).

Since it is easy to translate between \\((Y_t)\\) and \\((X_t)\\), we have a way to do learn k-gram model using corresponding algorithms for the bigram model.

### Describing bigram model
#### State transition matrix
Thence get a \\(|V| \times |V|\\) transition matrix P with \\\\(P_{x,y} = f_{X_{t+1}| X_{t} = x}(y)\\); also see stochastic matrices in linear algebra ref.

Probability distribution vector over states at r: \\(p_t\\). \\(p_{t} = P p_{t-1} = P^{t}p_{t-1}\\).

#### State transition graph
Consider state graph G = (V, E) with transition probabilities on edges, labeled with transition probabilities independent of time (time homogenous). This labeled graph is a diagrammatic way of accurately representing a markov chain.

#### Types of states and chains
Recurrent state: \\(Pr(revisit) \rightarrow 1\\). Aperiodic state: \\(GCD \set{t: P^{t}_{x,x} >0} = 1\\).

Irreducible: No unreachable state. If finite and irreducible, +ve recurrent. If +ve recurrent et aperiodic: ergodic.

##### Detailed balance property
Reversible chain: \\(\exists \pi: \forall x, y: \pi_{x}P_{x,y} = \pi_{y}P_{y,x}\\).

#### Learning transition probabilities
Given a sufficiently long sequence \\(X_i\\), one can estimate various transition probabilities \\(P_{x, y}\\) by \\(\frac{\sum_t I(X_t = y| X_{t-1} = x)}{\sum_t I(X_{t-1}=x)}\\).

### Unique Stationary distribution \\(\pi\\) of ergodic chains
$\forall x, y: \\
lt_{t\to \infty}P^{t}_{x,y} = \pi_{y}\\(. Find \\)\pi\\(: \\)P\pi =\pi\\(, \\)\sum \pi_{i}=1\\(; or inflow = outflow. If time-reversible, \\)\pi$ uniform.

### Mixing time of Ergodic chain
#### Purpose, definition
Suppose that given the state transition graph of a markov chain, one wishes to sample a state from the stationary distribution.

One way to do this would be to do a long random walk (see randomized algorithms survey) on the state transition graph.

The mixing time of a Markov chain is the time taken for this sampling process to lead to a distribution close to the stationary distribution.

Mixing time also determines number of transitions to make before you can take a sample roughly independent from previous sample.

#### Coupling lemma
Start 2 identical copies of markov chain starting from arbitrary states. States at time T: \\(X_{T}, Y_{T}\\). \\(Pr(X_{T} \neq Y_{T}|X_{0}\neq Y_{0}) \leq \epsilon \Rightarrow t(\epsilon) \leq T\\). Variation distance is non-increasing.

Let \\(\sum\\) smallest column entries = m. Then, \\(||p_{x}^{t}-\pi|| \leq (1-m)^{t}\\). \\(t(\epsilon)\leq t(c)(\ln \epsilon/\ln c)\\).

#### Mixing time bound
Select clever coupling, maybe define distance function \\(d_{t}\\) and show that \\(Pr(d_{t} \geq 1) = E[d_{t+1}|d_{t}] \leq b d_{t}\\) for \\(b<1\\), bound prob that chains haven't converged, use coupling lemma. Maybe take 2-step chain, use geometric coupling. 

### Straight line state transitions
#### Gambler's winnings
Suppose that two gamblers start with seed money: \\(l_{1}, l_{2}\\). They toss a fair coin and bet a dollar until one of them is bankrupt.

From the perspective of player 1, this can be modeled as a markov chain with the state space representing the amount of money player 1 has: ranging \\(\set{0, .. l_1 + l_2}\\). The initial state of the player is \\(l_1\\), and transition probabilities are defined thus: \\(Pr(X_t = l_k +1 |X_{t-1}= l_k) = Pr(X_{t}= l_k -1 |X_{t-1}= l_k) = 1/2\\) for \\(k \in {2 .. l_1 + l_2 -1}\\), with \\(0\\) and \\(l_1 + l_2\\) being terminal states.

##### Analysis using martingale property
\\(E[X_t]=X_{t-1}\\); and so \\(E[X_{\infty}] = l_1\\). So \\(Pr(X_{\infty} = l_2 + l_1) (l_2 + l_1) = l_1\\). So, Pr(1 wins)=\\(\frac{l_{1}}{(l_{1}+l_{2})}\\).

#### Queue
Arrival rate \\(a\\), departure rate \\(m\\). \\(\pi_{i}=(\frac{a}{m})^{i}(1-\frac{a}{m})\\). \\(h_{u,v}\\) = E[Steps from u to v]. \\(\pi_{i} = 1/h_{i,i}\\).

## Martingale \\(\seq{Z_{n}}\\) wrt filtration
### Problem
Suppose that one observed RV \\(\seq{Z_n}\\) and a filtration or a series of events \\(\seq{F_n}\\), with the property that \\(F_n \supseteq F_{n-1}\\).

Suppose further that: \\\\(E[|Z_{n}|] < f(n) < \infty\\), that \\(Z_n\\) is fully determined when \\(F_n\\) is observed, and \\(E[Z_{n}|F_{n-1}] = Z_{n-1}\\) (or \\(E[Z_{n}|F_{n-1}] - Z_{n-1} = 0\\)).

This process is the martingale \\(\seq{Z_n}\\) wrt filtration \\(\seq{F_n}\\).

#### Example
The filtration can correspond to the observation of a sequence of random variables \\(\seq(X_n)\\).

Note that this defines martingale \\(\seq{X_{n}}\\) wrt itself. Eg: Wealth after 100 fair-coin-toss bets, Brownian motion.

### Properties
Note that this implies that  \\(E[Z_n] = E[Z_0]\\).

### Stopping time T
One can stop the stochastic process based on past (not future) bets/ Observations of \\(X_i\\); the corresponding time is called the stopping time.

**Stopping theorem**: If \\(E[T] < \infty\\) or \\(T\\) bounded or \\(|Z_{i}|<c\\), then \\(E[Z_{T}]=E[Z_{0}]\\). Wald: If \\(X_{i}\\) iid, \\(T\\) stopping time: \\(E[\sum_{i=0}^{T}X_{i}] =E[T]E[X]\\).


### Doob martingale
Anything like \\(Z_{i}=E_{X_{i+1 .. X_{n}}}[f(X_{1}..X_{n})|X_{1}..X_{i}]\\) fits defn of Martingale: \\
Eg: \\
$E_{X_{2} .. }[Z_{2}|X_{1}] = E_{X_{2} ..}[E_{X_{3} ..}[f(X_{i})| X_{1}, X_{2}]| X_{1}] = \\
\sum_{x_{2}} E_{X_{3} ..}[f(X_{i})| X_{1}, X_{2} = x_{2}] Pr_{X_{2}}(X_{2} = x_{2}|X_{1})= E_{X_{2} ..}[f(X_{i})| X_{1}] = Z_{1}$.

### Find expected running time of a game
Make a martingale, use Wald's equation.

### Concentration around starting value
(Azuma) For martingale \\(\set{X_{i}}\\): \\
\\(|X_{k}-X_{k-1}|<c_{k}\\) : \\(Pr(X_{t}-X_{0} \geq l) \leq e^{-\frac{l^{2}}{2\sum c_{k}^{2}}}\\).

Eg: If you make small bets then you stay near mean.

\pf{Define new RV: \\(Y = X_{t}-X_{0} = \sum Y_{i}, Pr(e^{aY} \geq e^{al}) \leq \frac{E[e^{aY}]}{e^{al}} = \frac{E[\prod e^{aY_{i}}]}{e^{al}} = \frac{\prod E[e^{aY_{i}}]}{e^{al}}\\) (from independence of \\(\set{Y_i}\\)). Take \\(a>0\\).

As \\(e^{aY_{i}}\\) is convex and \\(Y_i \in [-c_i, c_i]\\), so \\(e^{aY_{i}} \leq \frac{e^{ac_{i}} (1 - \frac{Y_{i}}{c_{i}}) + e^{-ac_{i}}(1 + \frac{Y_{i}}{c_{i}})}{2} \leq \frac{e^{ac_{i}} + e^{-ac_{i}}}{2}\\) as \\(e^{ac_{i}} > e^{-ac_{i}}\\). So \\(E[e^{aY_{i}}|X_{1} .. X_{i}] \leq \frac{e^{ac_{i}} + e^{-ac_{i}}}{2} \leq e^{(ac_{i})^{2}/2}\\) from \\(e^{x}\\) series.

So, \\(Pr(e^{aY} \geq e^{al}) \leq e^{-al}e^{\sum_i (ac_{i})^{2}/2}\\). Setting \\(a=\frac{l}{\sum c_i^{2}}\\), we get the result.}

\core{In the foregoing proof, the crucial idea was considering the exponentiated event, which could then be decomposed and bounded due to independence. The algebraic trickery in selecting the right value for \\(a\\) and in coming up with the bounds were interesting.}

Applying to martingale \\(\set{-X_{i}}\\): \\(Pr(X_{t}-X_{0} \leq -l) \leq e^{-\frac{l^{2}}{2\sum c_{k}^{2}}}\\).

#### Applied to Doob Martingale
\\(Z_{i}=E[f(X_{1}..X_{n})|X_{1}..X_{i}]\\). If f satisfies Lipschitz condition with bound c (max change c in \\(f(X_{1}..X_{n})\\) when \\(X_{i}\\) changes): \\(Pr(|E[f(X_{1}..X_{n})] - f(X_{1}..X_{n})| \geq l) \leq 2e^{-\frac{l^{2}}{2nc^{2}}}\\). Aka method of bounded differences (MOBD).

Note: No independence needed till here.

#### Additive Bound for deviation from mean
(Azuma Hoeffding) So, let independent, not necessarily identically distributed \\(X_{i} \in [b, c]\\), \\(f(X_{1}..X_{n}) = X = \sum X_{i}\\). \\(Pr(|\sum X_i - \sum \mu_i| \geq na)\leq e^{-\frac{n^{2}a^{2}}{2nc^{2}}}\\).

##### Application in estimating mean
If \\(\set{X_i}\\) also identically distributed:\\
 \\(Pr(|X - n\mu| \geq na)\leq e^{-\frac{n^{2}a^{2}}{2nc^{2}}}\\).

#### Additive deviation bound for sum of Poisson trial RV's
If \\(\frac{X}{n} = \hat{p}, Pr(|\hat{p} - \mu| \geq \epsilon) \leq 2e^{-\frac{n\epsilon^{2}}{2}}\\). \\(1-\epsilon\\) confidence interval for parameter p.

## n-gram model
### Model
#### Subsequence/ prefix probabilities: notation
First, one models the probability \\(Pr(w_n|w_{1:n-1})\\) of a word \\(w_n\\) coming after \\(n-1\\) words \\(w_{1:n-1}\\).

##### Occurrence near sentence terminals
We want to use the notation \\(w_n|w_{1:n-1}\\), with \\(n\\) fixed, for considering the event where \\(w_n\\) appears after the string \\(w_{k+1:n-1}\\) appearing at the beginning of a sentence - distinct from the case where \\(w_{1:k}\\) is some specific string. We accomplish this by setting \\(w_{1:k} = @^k\\), where \\(@\\) represents a special 'sentence terminal' word. This will allow us to write \\(Pr(w_n|w_{1:n-1})\\) without being wrong.

Similarly, if \\(w_{n} = @\\), \\(Pr(w_n|w_{1:n-1})\\) denotes the probability of \\(w_{1:n-1}\\) appearing at the end of a sentence.

Note that \\(Pr(w_1|@^m)\\) actually represents the probability of \\(w_1\\) appearing first in a sentence, and \\(Pr(w_2|@^{m-1}w_1)\\) is the probability of \\(w_2\\) appearing 2nd in a sentence after \\(w_1\\). They are distinct from probabilities of occurrence of \\(w_1\\) or \\(w_2\\) after \\(w_1\\) irrespective of position in the sentence.

#### Actual probability
As a sort of necessary preprocessing, ensure that \\(w_m\\), the last word in the string is \\(@\\), and \\(w_{1:n-1} = @^{n-1}\\).

Then, the probability of generating a given \\(m\\) word string is exactly \\\\(Pr(w_{1:m}) = \prod_{k=n:m} Pr(w_k|w_{1:k-1})\\).

#### Markov assumption
If one makes a simplifying nth order Markov assumption, which says that any word depends only on the previous \\(k<=n-1\\) words, we get the approximation: \\(Pr(w_{1:m}) \approx \prod_{k=n:m} Pr(w_k|w_{k-n+1:k-1})\\).

### Estimation
\\(Pr(w_n|w_{1:n-1})\\) are estimated by counting the number of occurrences of strings \\(w_{1:n}\\) and \\(w_{1:n-1}\\).

#### n and corpus size
Even in a large sized corpus, for large \\(n\\), n-string sequences \\(w_{max(k-m+1, 1): k}\\) may be very rare; so it becomes difficult to estimate the necessary probabilities accurately.

One way of dealing with probabilities \\(Pr(w_n|w_{1:n-1})\\) for which there is inadequate data is to replace them with \\(Pr(w_n|w_{2:n-1})\\). In doing this, we have locally simplified the n-gram model into an \\(n-1\\) gram model. One can even recursively reduce the model complexity until the data we have suffices to accurately estimate the simplified model. Thus, there is a tradeoff between accuracy/ complexity and estimability.

Also, storage space required to store model parameters grows exponentially with \\(n\\).

#### Rare words
With rare words, one again encounters the problem of being able to estimate \\(Pr(w_n|w_{1:n-1})\\) accurately with limited data. To deal with this, one often replaces rare word occurances with a special word UNK during preprocessing.

### Smoothing
\tbc

## Partially observed states
### Observations, states
\\((X_i)\\) are called features/ covariates/ predictor/ input/ observed variables. \\(\seq{L_i}\\) is the unobserved response/ state variable sequence. \\(X_i\\), being a partially dependent of \\(L_i\\), can be viewed as a partial observation of the state \\(L_i\\).

The state space is \\(ran(L_i)\\), while the observation space is \\(ran(X_i)\\).

#### Use
These models are not only used for deriving models for \\(f_X\\), but also for determining the state sequence \\(L\\) given \\(X\\).

#### Applications
Spelling corrector, where X stands for the observed typed word and L stands for unobserved dictionary word. 

Predicting part of speech is a classic application of HMM's.

### Model classes
#### Generative model of Pr(X, L)
As in the case of general models of response variables, one may use these models to derive models for \\(f_{L|X}\\) if needed.

This class of models includes HMM's.

#### Model L given X
Aka Conditional random field (CRF). Here, one uses a discriminative model \\(f_{L|X}\\); so no effort is wasted in modeling \\(f_X\\). The most common CRF is just a chain among \\(L_i\\).

##### Ignoring sequentiality
One can model \\(f_{L|X}(l |x) = \prod_i f_{L'|X'} (l_i|x_i)\\). This model works surprisingly very well: Eg: In part of speech tagging, it yields around .95 correctness, while HMM may yield perhaps .02 more accuracy.

Note that this is not entirely same as Naive Bayes because \\(ran(X_i)\\) may be multidimensional, and the  model \\(f_{L'|X'}\\) need not assume that these features are independent. So, any of the wide variety of classifiers may be used.

### Partially observed state chain
Aka Bigram Hidden Markov Model (HMM).

#### Graphical model
The graphical model of the observation and label sequences has the following structure for \\(i = 2:N\\) :

{{< figure src="../images/bigram_HMM.svg">}}


#### Representations
Parameters of a bigram HMM are the state transition probabilities \\(f_{L_t|L_{t-1}}\\) and observation generation probabilities: \\(f_{X_t|L_t}\\). As in the case of fully observed state chains, the state transition probabilities can be represented using a transition matrix or as labels of edges in a state transition graph which could now be expanded to include vertices corresponding to various observations.

#### Decoding/ filtering
##### Problem
We want to find the most likely state sequence \\(X_1:X_N\\).

##### Message passing algorithm
Viewing the state-chain as an equivalent undirected tree-structured graphical model, we can solve the problem using the divide and conquer max-product algorithm. When the messages passed during this computation are done in an order similar to that described in case of the forward-backward algorithm for finding marginal state distributions, we have the Viterbi algorithm.

#### Online label distribution inference
##### Problem
Unlike the decoding problem, one is not satisfied with finding the most likely state sequence, the task is to find \\(f_{L_N|X_{1:N} = x_{1:N}}\\) at time \\(N\\).

##### Forward algorithm
One can use a node elimination/ message passing \\
algorithm applied to find the marginal probability distribution in the equivalent undirected tree structured graphical model. The node elimination ordering is: \\(1 .. N\\). So, this is aka 'forward' algorithm.

This algorithm can be described inductively. At step \\(t\\), suppose that one has determined \\(f_{L_{t-1}, x_{1:t-1}}\\), one simply does: 

\\($f_{L_t, x_{1:t}}(l_t) = \sum_{l_{t-1}} f_{L_{t-1}, x_{1:t-1}}(l_{t-1}) f_{L_{t}|L_{t-1}}(l_t|l_{t-1}) f_{X_t|L = l_t}(x_t)\\)$.

The base case is when \\(t = 1\\), and \\(f_{L_1|x_1} = f_{X|L_1}(x_1)f_{L_1 = l}\\) can be easily determined. So, by induction it follows that we are able to determine \\(f_{L_N, X_{1:N} = x_{1:N}} \propto f_{L_N| X_{1:N} = x_{1:N}}\\).

##### Analysis
This is an \\(O(|T|^{2})\\) operation at each time step, where \\(T\\) is the state space.

If there are \\(N\\) time steps, the algorithm yields the correct result for \\(f_{L_N|x_{1:N}}\\). But for \\(k < N\\), \\(f_{L_k|x_{1:k}} \neq f_{L_k|x}\\). This can be remedied by using the forward backward algorithm described below.

#### Past Label Distribution inference
##### Problem
Aka Smoothing. One wants to find the sequence of distributions \\((f_{L_k})\\). This is a particular type of inference.

##### Algorithm
One simply uses the node-elimination/ message passing sum-product dynamic programming algorithm to find marginal probabilities \\(f_{L_k}\\) of tree structured graphical models.

This is aka the forward backward algorithm when done for all \\(k\\), and when computation is done in the following order: upchain 'messages' (\\(m_{t-1 \to t}\\)) are passed first (in the forward step) and then down-chain 'messages' (\\(m_{t+1 \to t}\\)) are passed (in the backward step).

##### Analysis
The first step corresponds to the forward step described earlier, so \\(f_{L_i, x_{1:i}}\\) is computed, at each node \\(i \in 1:N\\).

In the backward step, at each node \\(i \in N:1\\), \\(f_{x_{i+1:N}|L_i}\\) is calculated. This can be described iteratively: suppose that \\(f_{x_{i+1:N}|L_i}\\) is available, then one can find: \\(f_{x_{i:N}|L_{i-1}}(l_{i-1}) = \sum_{l_i} f_{x_{i+1:N}|L_i}(l_i) f_{L_i|L_{i-1}}(l_i|l_{i-1})\\). So, it is in a way symmetric to the forward step.

Then, \\(f_{L_i, x} \propto f_{L_i| x}\\) can be found by multiplying these.

#### Learning given (X, L) examples
Aka Supervised HMM learning. The basic idea is to use the empirical transition/ observation generation probabilities in order to estimate the HMM parameters.

##### Smoothing
Especially in the case of observation generation probabilities, some smoothing is required: otherwise the distribution model would assign a probability of 0 to every state sequence \\(l\\) which might generate the observation sequence \\(x\\) containing a word not seen among the labeled examples. Also, it may be desirable to ensure that the observation generation probability \\(f_{X'|L'}(x'|l') > 0\\) for any pair \\((x', l')\\).

##### Reestimation using observation sequences
Suppose that one also has access to samples of \\(X\\), one can improve the parameter estimates by applying the EM algorithm described elsewhere for the case where only samples of \\(X\\) are provided.

#### Learning given observation samples X only
To do this, starting with an initial guess about the parameters \\(\param^{(0)}\\), one can iteratively produce parameters \\(\param^{(i)}\\) with greater likelihood values \\(f_{X|\param}(x)\\) from \\(\param^{(i-1)}\\) using the EM local optimization algorithm.

Two steps of the algorithm: 1] For each sample \\(x\\): using \\(\param^{(i-1)}\\) with the forward-backward algorithm, infer distributions \\(f_{L_i| x}\\); 2] Use this distribution to update maximum likelihood estimates [ie expectations] of the number of occurrences of \\(k \in ran(L_i)\\), \\((k_1, k_2) \in ran(L_i)^2\\), \\((k, x)\\); using which \\(\param^{(i)}\\) is computed as in the supervised case (: empirical emission and transition probabilities, possibly smoothed).

### k-gram HMM
One can extend the notion of bigram HMM's to allow the current state to depend on previous \\(k-1\\) states. Analogous the case of k-gram Markov chains, these can be reduced to bigram HMM's by expanding the state space to \\(ran(L_i)^{k-1}\\). Thus, inference and learning algorithms for bigram HMM's can be adapted to work on k-gram HMM's.

## Decision process
Stochastic processes where state sequence partially depends on a sequence of actions taken by an agent are described in the Machine intelligence survey.
