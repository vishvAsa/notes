+++
title = "02 State transitions"

+++
Many models often propose that behind the production of a sequence of observations, there are (possibly hidden/ latent) changes in internal state. They allow transition from one state to another to be stochastic.

Let the state at time t be \\(X_{t}\\). Let \\(V\\) be the set of possible states.

## Assumptions about state transitions
### Dependence solely on prior state
A model which assumes the Markov property described below is often convenient to represent states.

#### Sequence distribution: chain structure
Markov property/ assumption: Future states are independent of past states: \\(f_{X_{t+1}|X_{t} .. X_{0}} = f_{X_{t+1}|X_{t}}\\).

A state transition model with this property is called a Markov chain/ bigram state chain, considering the chain-like graphical model of the distribution of the variables \\(\set{X_t}\\).

So, the set of distributions \\(\set{f_{X_t|X_{t-1} = t} \forall t \in T}\\) completely describes the state transition model.

### Dependence on prior k states
Suppose that the concept of a bigram state chain is generalized to a k+1-gram state chain. So, \\(f_{X_t|X_{t-1} .. X_0} = f_{X_t | X_{t-1} .. X_{t-k}}\\): a weaker independence property holds.

### Reduction to bigram state chain
Consider a bigram state chain with the state sequence being \\((Y_t)\\), and \\(ran(Y_t) = T^{k}\\). Then, we will have the bigram Makrov property: \\(f_{Y_t | Y_{t-1} .. Y_0} = f_{Y_t|Y_{t-1}}\\).

Since it is easy to translate between \\((Y_t)\\) and \\((X_t)\\), we have a way to do learn k-gram model using corresponding algorithms for the bigram model.

## Describing bigram model
### State transition matrix
Thence get a \\(|V| \times |V|\\) transition matrix P with \\(P_{x,y} = f_{X_{t+1}| X_{t} = x}(y)\\); also see stochastic matrices in linear algebra ref.

Probability distribution vector over states at r: \\(p_t\\). \\(p_{t} = P p_{t-1} = P^{t}p_{t-1}\\).

### State transition graph
Consider state graph G = (V, E) with transition probabilities on edges, labeled with transition probabilities independent of time (time homogenous). This labeled graph is a diagrammatic way of accurately representing a markov chain.

### Types of states and chains
Recurrent state: \\(Pr(revisit) \rightarrow 1\\). Aperiodic state: \\(GCD \set{t: P^{t}_{x,x} >0} = 1\\).

Irreducible: No unreachable state. If finite and irreducible, +ve recurrent. If +ve recurrent et aperiodic: ergodic.

#### Detailed balance property
Reversible chain: \\(\exists \pi: \forall x, y: \pi_{x}P_{x,y} = \pi_{y}P_{y,x}\\).

### Learning transition probabilities
Given a sufficiently long sequence \\(X_i\\), one can estimate various transition probabilities \\(P_{x, y}\\) by \\(\frac{\sum_t I(X_t = y| X_{t-1} = x)}{\sum_t I(X_{t-1}=x)}\\).

## Unique Stationary distribution \\(\pi\\) of ergodic chains

\\(\forall x, y: lt_{t\to \infty}P^{t}_{x,y} = \pi_{y} \\). Find \\( \pi : P\pi =\pi, \sum \pi_{i}=1\\); or inflow = outflow. If time-reversible, \\(\pi\\) uniform.

## Mixing time of Ergodic chain
### Purpose, definition
Suppose that given the state transition graph of a markov chain, one wishes to sample a state from the stationary distribution.

One way to do this would be to do a long random walk (see randomized algorithms survey) on the state transition graph.

The mixing time of a Markov chain is the time taken for this sampling process to lead to a distribution close to the stationary distribution.

Mixing time also determines number of transitions to make before you can take a sample roughly independent from previous sample.

### Coupling lemma
Start 2 identical copies of markov chain starting from arbitrary states. States at time T: \\(X_{T}, Y_{T}\\). \\(Pr(X_{T} \neq Y_{T}|X_{0}\neq Y_{0}) \leq \epsilon \Rightarrow t(\epsilon) \leq T\\). Variation distance is non-increasing.

Let \\(\sum\\) smallest column entries = m. Then, \\(||p_{x}^{t}-\pi|| \leq (1-m)^{t}\\). \\(t(\epsilon)\leq t(c)(\ln \epsilon/\ln c)\\).

### Mixing time bound
Select clever coupling, maybe define distance function \\(d_{t}\\) and show that \\(Pr(d_{t} \geq 1) = E[d_{t+1}|d_{t}] \leq b d_{t}\\) for \\(b<1\\), bound prob that chains haven't converged, use coupling lemma. Maybe take 2-step chain, use geometric coupling. 

## Straight line state transitions
### Gambler's winnings
Suppose that two gamblers start with seed money: \\(l_{1}, l_{2}\\). They toss a fair coin and bet a dollar until one of them is bankrupt.

From the perspective of player 1, this can be modeled as a markov chain with the state space representing the amount of money player 1 has: ranging \\(\set{0, .. l_1 + l_2}\\). The initial state of the player is \\(l_1\\), and transition probabilities are defined thus: \\(Pr(X_t = l_k +1 |X_{t-1}= l_k) = Pr(X_{t}= l_k -1 |X_{t-1}= l_k) = 1/2\\) for \\(k \in {2 .. l_1 + l_2 -1}\\), with \\(0\\) and \\(l_1 + l_2\\) being terminal states.

#### Analysis using martingale property
\\(E[X_t]=X_{t-1}\\); and so \\(E[X_{\infty}] = l_1\\). So \\(Pr(X_{\infty} = l_2 + l_1) (l_2 + l_1) = l_1\\). So, Pr(1 wins)=\\(\frac{l_{1}}{(l_{1}+l_{2})}\\).

### Queue
Arrival rate \\(a\\), departure rate \\(m\\). \\(\pi_{i}=(\frac{a}{m})^{i}(1-\frac{a}{m})\\). \\(h_{u,v}\\) = E[Steps from u to v]. \\(\pi_{i} = 1/h_{i,i}\\).
