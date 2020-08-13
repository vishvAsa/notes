+++
title = "01 Computability and efficiency of problems"

+++
## Uncomputability by TM
Tabulate all TM strings vs all inputs; mark output (0, 1 or *); \textbf{diagonalize} (reverse output in diagonal) to get function UC no TM can solve. \textbf{Halting problem}: Uncomputable, else UC computable; Even model checking cannot predict halting of the twin primes (p, p+2) problem.

## Decidability by TM
TM decides 'recursive languages'. Given query \\(x \in L?\\), TM gives coorect answer eventually.

## Acceptance by TM/ Recursive enumerability
Given query \\(x \in L?\\), TM gives coorect answer eventually if \\(x \in L\\). It may run for ever otherwise. TM accepts 'recursively enumerable lanugages'.

### Enumerability
Strings in L can be enumerated. Create \\(S = \set{(x, n): x \in \set{0,1}^{*}, n \in N}\\); S is countable as \\(\set{0,1}^{*}, N\\) are countable. Generate one string after another from S, check to see if the simulated TM accepts x in exactly n steps, if so print x, else continue.

## Hierarchy
Time and space hierarchy theorems. \tbc

## Decision problems vs Function prolems
Efficiently convering decision problem alg (Eg: INDSET) to function problem alg with binary search. FP.

## Reduction
Polynomial time / log space reduction from A to B \\(\implies A \preceq B\\) (B atleast as hard as A). Reduction is transitive.
