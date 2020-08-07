+++
title = "Orders over set"
+++

## Total order
All \\((x, y) \in S\\) comparable.

### Minimum element
\\(\forall y \in S: x\leq y\\).

## Partial order
Aka Posets: Partially Ordered sets. Maybe some \\((x, y) \in S\\) not comparable. Eg: vectors, componentwise \\(<\\). Visualize with Hasse diagrams.

### Minimal element
\\(\forall y \in S: x\leq y \implies x = y\\). Note difference from minimum. Eg: in triangle joining (1,1), (0, 1), (1, 0): line joining the last 2 pts are minimal elements.


## Bounds on A, subset of S
Upper and lower bounds: need not be in A.

Supremum or least upper bound or GLB or join. Infimum or greatest lower bound or LUB or meet.

### Difference from max and min
\\(\max(A) \in A \subseteq S\\) always, but \\(\sup(A) \notin A, \sup(A) \in S\\) possible.

### Supremum property in S
S with supremum property: For any \\(A \subseteq S: \exists \sup A \in S\\).

If S has supremum property, it has infemum property: For any subset \\(A \neq S\\), take S-A and find its supremum.

### Examples
Q does not have supremum property, but R does. See complex analysis survey.

## Lattices
Sets where every pair has a same supremum and same infemum: Diamond.

## Well founded order
Take any 'decreasing chain' \\(a<b<c..\\): it must be finite. So, \\(a<a\\) not allowed, no cycles too. Not total or partial order: no transitivity etc required.

Thence get 'well founded set'. Minimal elements exist.

Eg: \\((N, <)\\), (strings, psurveyix), (strings, subsequence), (trees, subtree). Lexicographic ordering of \\(((a, b), <)\\) is well founded if \\(<\\) well founded over dom(a) and dom(b).

### Mathematical induction proofs generalized
(Noether). If \\(\forall y:: x>y \land p(y) \implies p(x)\\), then \\(\forall x: p(x)\\); note: base cases subsumed here. Strictly more powerful than induction on natural numbers: consider lexicographic ordering.

