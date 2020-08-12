+++
title = "01 Sample space and Events"

+++
## Sample/ state space
### States/ sample points
Consider the output of a stochastic system. This output can be considered to be characterized as the state of a system. If two outputs are distinguishable from one another, then they can be interpreted as correspond to different states of the system.

### Specification with state variables
Two states or outputs are distinguishable by differing assignments \\((x_i)\\) to certain features or variables \\((X_i)\\).

### Sample space notation
Sample space of a statistical experiment: \\(\gO\\) or S.

## Events and Sigma algebra
### Events
A certain event is a set of outputs, which share some common characteristic. Usually, this shared characteristic is concise: Eg: fixing a certain variable \\(X_i= x_i\\) specifies an event. Eg: Sun rises.

##### Specification using Iverson brackets, indicator functions
See algebra ref. Eg:[Sun rises]. They can also be specified naturally using indicator random variables.

### Sigma algebra
Sigma algebra F over \\(\gO\\): \\(\Union\\) closed set of sets (events) which includes \\(\emptyset\\) and \\(\gO\\).

##### Inclusion of negation
If event \\(A \in \gO\\), so is \\(\lnot A = \gO - A\\).

##### Representation by variables
Each \\(S \in F\\) can be represented by the values assigned to a variable \\(X =x\\).

## Space of events
\\((\gO, F)\\) describes a space of events.

### Product probability space
Take spaces \\((S_1, F_1), (S_2, F_2)\\); thence get product space \\((S_1 \times S2, F_1 \times F_2)\\).

#### Over the same sample space S
If \\(S_1 = S_2 = S\\), product space is just \\((S, F_1 \times F_2)\\), as the \\((s_i, s_j) \forall j \neq i\\) will have 0 probability measure, if defined over that set.

It is useful to think of this as including events \\(f_i \inters g_j\\) and \\(f_i \union g_j\\) for \\(f_i \in F_1, g_j \in F_2\\).

## Counting
### Count action sequence
Multiplicative principle. If action A can be made in \\(a\\) ways, and action B can be made in \\(b\\) ways, there are \\(ab\\) ways of doing action \\(AB\\).

### 'Picking' phenomena: varieties
Many phenomena are modeled as picking \\(k\\) items from a set of \\(n\\) items. The picking may or mayn't be done with repetition. The order of picking may or mayn't matter (the corresponding phenomena are called permutation/ arrangement and choosing/ combination respectively).

#### Permutation
Any permutation is writable as a set of directed cycles in a graph whose nodes are the items chosen. So, counting is equivalent to counting the number of 'legal' cycles.

With repetition, using the multiplicative principle, we have \\(n^k\\) permutations, without repetition, we have \\(n..(n-k+1)\\) permutations. When \\(n =k\\), we use the notation \\(n!\\).

##### Dealing with identical items
Suppose, there are \\(t\\) identical items of a kind among the \\(k\\) selected. In this case, as these \\(t\\) items can be indistinguishably arranged in \\(t!\\) ways, the previous argument cannot be used.

#### Combinations without repetition
Here, order does not matter. Observing that, for each selection of \\(k\\) items, there are \\(k!\\) permutations, we see that the number of combinations is \\(\binom{n}{k} = n..(n-k+1)/k!\\)

Useful property: \\(\binom{n}{r} = \binom{n}{n-r}\\). For extension to real n and general properties, see complex analysis ref.

#### Choosing with repetition
\\(\binom{n+k-1}{k-1}\\) choices. \pf{select places to put k-1 \\(|\\) in \\(n+k-1\\) spots.}

\error{One may try to use the argument, as in the case of choosing without repetition, that for each selection of \\(k\\) items, there are \\(k!\\) permutations and conclude that there are \\(\frac{n^k}{k!}\\) choices. But this is false (too low) because, when there are repetitions, each selection of \\(k\\) items corresponds to fewer than \\(k!\\) items.}

### Combinatorial proofs of equality
Take a process, count it in two ways, conclude that expressions corresponding to the two counting procedures are equal.

### Cardinality of sets
General properties concerning set sizes are considered elsewhere.
