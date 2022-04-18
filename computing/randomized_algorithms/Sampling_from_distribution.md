+++
title = "Sampling from distribution"

+++
## Sampling a random variable X
### Problem
The pseudo random number generator yields a sequence of almost independent random bits: see randomized alg ref. How do you use them to sample from a given distribution?

#### Visualization
Want to 'cover' the entire range(X) by the sampling: visualize as throwing darts in a oval: dart density corresponds to probability; the shape formed by the darts corresponds to the Pr(X) contour.

#### Challenges
Can't sample from \\(\Re\\): computer can't even store all possible \\(\Re\\). So, must sample from Q.

Or, Pr(X=x) or \\(Pr(X=x|Y=y)\\) may be difficult to calculate.

### Sampling some distributions
#### Uniform distribution
Sampling from U[a,b] is easy: sample 1 bit at a time form the range.

#### Discrete probability distribution
Take a line segment [0, 1], partition it into ranges \\(\set{R_i}\\) corresponding to probabilities of various values; Sample x from U[0, 1]; identify its range j; output value j corresponding to \\(R_j\\).

#### Normal distribution
Use rejection sampling: accept x drawn from uniform distribution with probability proportional to \\(e^{(x-\mean)^{T}\covmatrix^{-1}(x-\mean)}\\). Can similarly sample from any distribution.

Or, sample from discrete probability distribution which approximates N: but this is costly as the number of rational numbers in the range is large.

##### Multidimensional Normal distribution
Sampling from a spherical normal distribution is easy: just apply a linear transformation to the inputs before sampling.

## Problems solved by sampling X
### The integration/ summation problem
Maybe you want to \\(E[f(X)|T]\\) where T is an event (maybe 'true'), but ye find it difficult to do this analytically. The expectation could involve a combinatorial sum: the RV f(X) can take on many different values with different probabilities.

#### Find normalization const Z of Pr(X)
Given prob distribution \\(Pr(x) = Z^{-1}f(x)\\) specified only by f(x) to find Z.

#### Finding Pr(T) for hard to analyze T
Same as finding the expectation of an indicator random variable.

Visualize sample space as an oval, and sampling as putting dots in the oval; you estimate the size of a smaller oval where the event is true.

Aka counting if every sample point is equally probable.

### Optimization
Sampling with special attention being paid towards finding an optimum is considered elsewhere.

Maybe you want to find \\(\min_{X} f(X)\\). As seen in optimization ref, in general it is hard to find a global minimum; so repeated sampling / random restarts with gradient descent can be a useful strategy.

#### Optimization after summation
Maybe want \\(\min_{X} E[f(X)|T]\\).

### Simulation
Maybe you want to simulate roll of dice, or want AI's which behave realistically in games.

## Sampling Random vectors
### Arbitrary randomg vectors
Suppose random vector \\(X\\) is 3-dimensional, and suppose that we are given the joint potential \\(\gf_X\\). One can first deduce and sample \\(x_1\\) from \\(f_{X_1}\\), then \\(x_2\\) from \\(f_{X_2|X_1 = x_1}\\), and finally \\(x_3\\) from \\(f_{X_3|X_1 = x_1, X_2 = x_2}\\). The cost mostly comes from having to sum over \\(|ran(X_2)||ran(X_3)|\\) terms in deducing the distributions.

### From graphical models
#### Forward sampling for DAG's
Consider a directed graphical model with fully specified conditional probability distributions for non-root nodes and distributions for root nodes.

One simply samples successive each level of the DAG, starting at level 0, utilizing the conditional probability distributions given samples drawn from the previous level at each step.

This is an exact sampling technique.

#### Undirected trees
Sampling from undirected tree-structured graphical models can be accomplished by converting them efficiently to tree structured directed graphical models. Computing marginal probabilities by summing over pairwise potentials  is efficient when \\(range(X_i)\\) is finite, which then makes computation of conditional probabilities for the DAG efficient.

#### Factor trees
One can forward-sample tree structured factor graphs by conversion to equivalent directed trees whose nodes correspond to factor-nodes.

### Arbitrary undirected graphs
Arbitrary undirected graphs may be sampled by conversion to corresponding factor trees.

## Repeated Sampling
Aka Monte Carlo sampling. Repeated sampling is done for several purposes, like inference. It is usually much simpler when Pr(X) is modelled by a graphical model.

Here we consider various techniques for repeated sampling themselves, rather than their special applications to problems such as inference (as in rejection sampling).

### Markov chain Stationary distribution
Aka Markov Chain Monte Carlo (MCMC).

Consider a stochastic process whose state space is \\(ran(X)\\). For any distribution \\(f_X\\), we can usually construct markov chain whose stationary distribution is \\(f_X\\). So, doing appropriate random walks on the state transition graph of this Markov chain (see probabilistic models for details), one can sample various states from \\(f_X\\).

But before each sample is picked, one must 'throw away some samples' in order to let the state distribution approximate the stationary distribution.

The art is in finding a fast mixing one. If it is time reversible, can get very fast mixing Markov chain.

#### Sampling from discrete distribution
Aka Metropolis alg.

Want to sample from distribution over \\
\\(range(X) = \set{v_{i}}\\). Make ergodic Markov chain with right stationary distribution: Pick \\(M \geq maxDegree\\), set \\(Pr(v_{i} \to v_{j}) = (1/M)min(1, \pi_{v_{j}}/\pi_{v_{i}})\\) otherwise self-loop. Note that finding \\(\pi_{v_{j}}/\pi_{v_{i}}\\) usually easy : ye don't need to know normalization constant Z.

### Repeated conditional sampling
Aka Gibbs sampling.

#### Algorithm
Start with random assignment to \\((X_i)\\). For each i, sample \\(X_i \distr Pr(X_i|X_{j\neq i})\\); repeat.

The conditional probability distribution is computed using \\\\(f_{X_i|X_{-i}} = \gf_{X}/\gf_{X_{-i}} = \gf_{X}/\sum_{x_i} \gf_{X}\\), where the joint potential \\(\gf_X\\) is not necessarily normalized.

#### Correctness
Why is this same as sampling from Pr(X)? \why

#### Efficiency
Gibbs sampling is efficient as long as the \\(\gf_X\\) can be efficiently computed. This is because of the fact that the normalization constant cancels out, and need not be computed; and becuase \\(range(X_i)\\) is limited.

#### Modifications
This is akin to a 'random walk on a graph' behavior, so often takes long to cover the entire sample space well. Consider \\((X_1, X_2)\\) with them being very correlated: visualize sample space as elongated ellipse around some line; so going L units away on \\(X_i\\) requires \\(O(L^{2})\\).

So, maybe use random restarts.

### Block conditional sampling
Aka block-Gibbs sampling.

#### Algorithm
Here, we sample whole blocks of variables at a time. Consider a partition of variables \\(X\\) into \\(A, B\\). Starting with a random assignment, we sample from \\(f_{A|B}\\) and \\(f_{B|A}\\) in turn. \\(f_{A|B} = \gf_X/\gf_B\\), where \\(\gf\\) is the potential function which is not necessarily normalized.

Finding \\(\gf_B(b) = \sum_a \gf_X(a, b)\\) requires summing over \\(\prod_i ran(B_i)\\) items in general, which is not efficient.


#### Advantages


It is better than Gibbs sampling when the subgraphs can be more efficiently or accurately (perhaps even exactly) sampled from, and when summing over them is easy. This is true for example when the partitions correspond to tree-structured subgraphs of directed graphical models.

## Physics-inspired sampling
### Energy temperature analogy
Can write \\(Pr(x) = Z^{-1}e^{-\frac{E(x)}{T}}\\), where E is energy function, T is the temperature. \tbc
