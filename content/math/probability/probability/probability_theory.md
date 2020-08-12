+++
title = "Probability theory"
+++


## Sample space and Events
### Sample/ state space
#### States/ sample points
Consider the output of a stochastic system. This output can be considered to be characterized as the state of a system. If two outputs are distinguishable from one another, then they can be interpreted as correspond to different states of the system.

#### Specification with state variables
Two states or outputs are distinguishable by differing assignments $(x_i)$ to certain features or variables $(X_i)$.

#### Sample space notation
Sample space of a statistical experiment: $\gO$ or S.

### Events and Sigma algebra
#### Events
A certain event is a set of outputs, which share some common characteristic. Usually, this shared characteristic is concise: Eg: fixing a certain variable $X_i= x_i$ specifies an event. Eg: Sun rises.

###### Specification using Iverson brackets, indicator functions
See algebra ref. Eg:[Sun rises]. They can also be specified naturally using indicator random variables.

#### Sigma algebra
Sigma algebra F over $\gO$: $\Union$ closed set of sets (events) which includes $\emptyset$ and $\gO$.

###### Inclusion of negation
If event $A \in \gO$, so is $\lnot A = \gO - A$.

###### Representation by variables
Each $S \in F$ can be represented by the values assigned to a variable $X =x$.

### Space of events
$(\gO, F)$ describes a space of events.

#### Product probability space
Take spaces $(S_1, F_1), (S_2, F_2)$; thence get product space $(S_1 \times S2, F_1 \times F_2)$.

##### Over the same sample space S
If $S_1 = S_2 = S$, product space is just $(S, F_1 \times F_2)$, as the $(s_i, s_j) \forall j \neq i$ will have 0 probability measure, if defined over that set.

It is useful to think of this as including events $f_i \inters g_j$ and $f_i \union g_j$ for $f_i \in F_1, g_j \in F_2$.

### Counting
#### Count action sequence
Multiplicative principle. If action A can be made in $a$ ways, and action B can be made in $b$ ways, there are $ab$ ways of doing action $AB$.

#### 'Picking' phenomena: varieties
Many phenomena are modeled as picking $k$ items from a set of $n$ items. The picking may or mayn't be done with repetition. The order of picking may or mayn't matter (the corresponding phenomena are called permutation/ arrangement and choosing/ combination respectively).

##### Permutation
Any permutation is writable as a set of directed cycles in a graph whose nodes are the items chosen. So, counting is equivalent to counting the number of 'legal' cycles.

With repetition, using the multiplicative principle, we have $n^k$ permutations, without repetition, we have $n..(n-k+1)$ permutations. When $n =k$, we use the notation $n!$.

###### Dealing with identical items
Suppose, there are $t$ identical items of a kind among the $k$ selected. In this case, as these $t$ items can be indistinguishably arranged in $t!$ ways, the previous argument cannot be used.

##### Combinations without repetition
Here, order does not matter. Observing that, for each selection of $k$ items, there are $k!$ permutations, we see that the number of combinations is $\binom{n}{k} = n..(n-k+1)/k!$

Useful property: $\binom{n}{r} = \binom{n}{n-r}$. For extension to real n and general properties, see complex analysis ref.

##### Choosing with repetition
$\binom{n+k-1}{k-1}$ choices. \pf{select places to put k-1 $|$ in $n+k-1$ spots.}

\error{One may try to use the argument, as in the case of choosing without repetition, that for each selection of $k$ items, there are $k!$ permutations and conclude that there are $\frac{n^k}{k!}$ choices. But this is false (too low) because, when there are repetitions, each selection of $k$ items corresponds to fewer than $k!$ items.}

#### Combinatorial proofs of equality
Take a process, count it in two ways, conclude that expressions corresponding to the two counting procedures are equal.

#### Cardinality of sets
General properties concerning set sizes are considered elsewhere.

## Probability of events
Example applications, modeling intricacies, various interpretations of probability are discussed in the probabilistic modeling survey.

### Probability measure
The following axiomatization is common to both frequentist and subjective interpretation of probability.

Take sample space $S$, sigma algebra $F$. The probability measure is a special measure $v:F \to [0,1]$; so operates over sets, like CDF. Additionally, the general additivity property (described in algebra survey) is usually assumed.

Other properties of the measure: should be countably additive over disjoint sets: $\gs$ additive; $v(\gO) = 1$.

So, $v$ specifies event probability. $(S, F, v)$ is called a probability space.

#### Importance
\exclaim{Viewing probability as the measure of a set of events makes many notions [even the simple Union bound] much more intuitive!}

#### Visualization: An area of atomic events
Use a spotted 2-d compact set, whose area represents the randomness (cross product of all distributions) involved in the probability; the spots represent an event of interest.

#### Subscript notation
Consider the subscript in $Pr_{X \in_{D} S}(E)$. In this case, the subscript indicates the variables which need to be specified in order to specify a point in the sample space; in doing so, it tells us where the randomness lies. It also tells us something about the range $S$ of the random variable $X$, and its distribution $D$.

##### Other notations
Also often used: $Pr_{X}(E), Pr_{D}(E)$, or  $Pr_{t}(E)$\\
 if the distribution $D$ is parametrized by $t$.

##### Importance
This notation/ representation is very valuable; using it, we can clearly manipulate and reason about probability quantities, seeing for example how the sample space shrinks as we consider condition probability distributions.

#### Empirical measure
$v_n(E) = n^{-1}\sum_{i} I_{E}(x_i)$, where I is the indicator function. This is useful in deducing the actual measure $v$ using experiments/ sampling.

### Conditional and unconditional probabilities
Conditional (posterior) probability $Pr(E_1|E_2)$ considers the evidence that $E_1$ has occurred. This conditioning alters the measure, so that $Pr(E_1|E_1) = 1$, and $\frac{Pr(E_1, E_2)}{Pr(E_1)} = Pr(E_2|E_1)$ (aka product rule). So, the sample space $S$ can be thought of as now being constricted to $E_1$.

The unconditioned measure $Pr(E_1)$ is called prior (marginal) probability.

#### Common errors
##### Equal weight error
Instead of calculating $\frac{Pr(E_1, E_2)}{Pr(E_1)}$, one common error is to use unweighted counts: $\#(E_1 \inters E_2)/\#(E_1)$, which leads to the wrong result. Hence, this should be avoided and proper formalism used.

See examples provided later.

##### Misidentified prior error
Another common problem is the misidentification of the prior event with another, which leads to a different weight being assigned to the probabilities involved. This can lead to the equal weight error.

See examples provided later.

##### Illustrations
\example{Warden problem. Of 3 prisoners $(P1, P2, P3)$ scheduled to be executed, one is pardoned. The identity of the spared prisoner is known only to the warden. $P1$ tries to find out about his fate.

On being pressed, the warden, reasoning that he is not leaking any information relevant to $P1$, only says that $P2$ is executed. But, $P1$ is now happy that the probability of his being pardoned is increased from $1/3$ to $1/2$.

The warden is correct and $P1$ is wrong. Reason follows.

Let $Pi$ also represent event where $Pi$ is pardoned. Let $W$ represent the event where warden tells $P1$ that $P2$ is being executed. Now, $Pr(P1) = 1/3$. We want to find $Pr(P1|W)$. $Pr(W) = \sum_i Pr(W \inters Pi) = 1/6 + 0 + 1/3 = 1/2$, and $Pr(P1 \inters W) = 1/6$, so $Pr(P1|W) = 1/3$. So, $P1$ has learned nothing about his fate.


Another source of error in this example is confusing $W$ with event $P2$.
}

\example{Monty Hall problem. In a game show conducted by Monty Hall, there are 3 doors $\seq(P1, P2, P3)$, one of which has a reward. Only Monty Hall knows where. A player chooses a door, say $P1$. Monty Hall opens one of the other doors, say $P2$, and reveals it to contain no reward. Should the player switch to $P3$?

Same rigorous reasoning as in the case of Warden problem can be applied to reveal that he should switch. The source of errors are also the same.
}

#### Independence of events
$E_1$ and $E_2$ are independent if the $Pr(E_2) = Pr(E_2|E_1)$: so, the evidence $E_1$ does not change the probability measure as applied to $E_2$. This is same as saying: $Pr(E_1 \land E_2) = Pr(E_1) Pr(E_2)$.

### Properties of the measure
Important properties such as the inclusion/ exclusion principle, union and intersection measure bounds follow from those described for general measures.

#### Connection with expectation
Consider the measure $v$. $Pr(E_i) = E_v[I_{E_i}(x)]$.

### Probability with Multiple variables/ sigma algebras
Consider the product $(S_1 \times S_2, F_1 \times F_2, v)$ of the probability spaces $(S_i, F_i, v_i)$ for $i \in {1, 2}$. Consider the specific event $E \in F_1$.

#### The product measure
The resulting product measure $v$ always obeys the following constraints:

$\forall E \in F_1: v(E, S_2) = v_1(E)$. A symmetrical condition holds for all $G \in F_2$.

##### Marginalization
Aka Law of total probability, marginalization. $Pr(E) = \sum_{G \in F_2} Pr(E \land G)$: like adding up rows in a table of joint probabilities.

#### Conditional probability inversion
Aka Bayes' theorem, Bayes's rule.

$Pr(G | E) = \frac{Pr(E|G)Pr(G)}{Pr(E)} \\
= \frac{Pr(E|G)Pr(G)}{\sum_{G \in F_2} Pr(E|G)Pr(G)}$.

Fixing $E$, this becomes a function $F_2 \to [0, 1]$, we can write $Pr(G|E) = \propto Pr(E|G)Pr(G)$.

##### Likelihood function
What is the likelihood of a hypothesis $E$ given the evidence $G$? We can use $f_G(E) = Pr(G|E)$, a function of $E$ alone, as a measure of this.

For use in statistical inference, see statistics ref.


### Associated quantities
#### Odds and log odds
Odds: $Pr(E_1)/ Pr(\lnot E_1)$. Thence is defined log odds or logit. In logistic models, this is modeled, rather than the probability itself.

