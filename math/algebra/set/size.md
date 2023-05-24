+++
title = "Size"
+++

## Measurable space
Suppose that \\(S\\) is a \\(\sigma\\) algebra over \\(X\\). \\((X, S)\\) is called a measurable space. Every member of \\(S\\) is a measurable set.

\\((S, 2^{S})\\) is a common measurable space.

### Importance
This notion is useful because it enumerates the sets whose size we want to measure.

### Product space
You can take two measurable spaces \\((S_1, F_1), (S_2, F_2)\\), and, by set product get a bigger measurable space \\((S_1 \times S2, F_1 \times F_2)\\).

## Measure
### Minimal definition
\\(m:S\to [0, \infty]\\), with \\(m(\phi)=0\\) and the countable additivity property (\\(A \cap B= \phi \implies m(A \cup B) = m(A) + m(B)\\)) is called a measure on \\(X\\) of subsets \\(S\\).

\\((X, S, m)\\) is called a measure space.

#### Motivation
This measure of size generalizes concepts such as volume/ area/ box measure, mass, time. Especially important measures are the box measure and the probability measure.

### Special classes
#### General additivity
For some measures \\(m\\), any bunch of mutually disjoint sets \\(S_i\\): \\(m(\cup_i S_i) = \sum_i S_i\\). This is stronger than countable additivity.

#### Finite measures
If \\(X\\) is a countable union of finite measure sets, \\(m\\) is \\(\sigma-\\)finite. This is a very common property.

#### Signed measure
If \\(m(x) < 0\\) is allowed, then \\(m\\) is a signed measure.

### Null set, almost-everywhereness
If \\(m(T) = 0\\), then \\(T\\) is called a \\(m-\\)null set.

A property (eg: \\(f(x)>0\\)) holds 'almost everywhere' if the set of elements for which the property does not hold is a null set. Eg: 'Almost always' in applications of probability.

### Size of the union and intersection
#### Inclusion/ exclusion principle
The following holds for any measure which is finite on the sets involved. \\(|\cup_{i \in V} S_i| = \sum_i |S_i| - \sum_{i \neq j}|S_i \cap S_j| + .. = \sum_{T \subseteq V} (-1)^{|T|+1}|\cap_{i \in T}S_i|\\).

#### Bounds
Thence, we have the union upper bound: \\(m(A \cup B) \leq m(A) + m(B)\\). In the case of probabilistic analysis, this is very useful. Aka Boole's inequality.

Intersection lower bound: \\(m(A \cap B) \geq m(A) + m(B) - 1\\). Aka Bonferroni's inequality. 

<details><summary>Proof</summary>

\\(m(A \cup B) \leq 1\\) with the inclusion-exclusion principle.
</details>



By mathematical induction, \\(m(\cap_{i \in (1, n)} A_i) \geq \sum_i m(A_i) - (n-1)\\).

#### Generalization
(Mobius inversion lemma). Got functions on sets f, g. \\([\forall A \subseteq V: f(A) = \sum_{B \subseteq A} g(B)] \equiv [g(B) = \sum_{B \subseteq A}(-1)^{A-B}f(B)]\\). \chk Easy algebraic proof.

## Counting measure
The counting measure of \\(A\\), \\(|A|\\), equals the number of elements in a set. 

### Counting, combinatorics
See probability survey.

## Cardinality
The concept of Cardinal numbers extends the notion of the counting measure to compare the sizes of even infinite sets. For finite sets, the cardinality equals the counting measure.

### Comparison by bijection
Comparison of cardinalities of A and B can be made by making bijections, even if they're \\(\infty\\) sets: 'Equinumerousness'.

### Hierarchy of cardinal numbers
Consider the power set \\(P(S)\\). \\(|P(S)|>|S|\\).

## Cardinalities of compared to N
Cardinality (or power) of the continuum \\(c = |R|\\); \\(\aleph_{0} = |N|\\). Continuum hypothesis: \\(\exists c'?: \aleph_{0}< c'<c\\).

### Countability
\\(S\\) is countable if it can be mapped to \\(N\\).

Countable unions of countable \\(S\\) still countable: write any \\(S\\) as a row vector, see their sequence as a matrix, draw a zig-zag line to cover all matrix elements. Similarly, see countability of Q.

If \\(S\\) is countable, \\(S^{n}\\) is countable: use induction: if \\(S^{k-1}\\) countable, for every \\(a\in S\\), \\(\set{ba: b\in S^{k-1}}\\) is countable; So, their union is also countable.

### Show uncountability
Use Cantor's diagonalization.

### Infinite (sub)sets' cardinality
(Dedekind): \\(S\\) is \\(\infty\\) iff \\(\exists A\set S\\) with same cardinality as \\(S\\). 

<details><summary>Proof</summary>

Finite \\(S\\) can't have such a proper subset. If \\(|S|= \infty\\), get countably \\(\infty\\) \\(S'\\); map to \\(N\\) with function \\(f\\); but map \\(n\in N\\) to \\(n+1\\) with function g, do \\(f^{-1}\\).
</details>



## Product measure
Consider the product of two measure spaces: \\(\set{(S_i, F_i, m_i) | i \in \set{1, 2}}\\). The product measure: \\(m(E_1, E_2) = m_1(E_1) \times m_2(E_2) : \forall E_i \in S_i\\).

By induction, one can define product measure for the product of arbitrary number of measure spaces.

### Importance
This measure finds application in defining, for example, measures for \\(R^{n}\\) based on the common box measure for \\(R\\); and in considering measures over the product of ranges of multiple random variables.

### Extension to bigger sigma algebra
Consider the product space with an expanded sigma algebra \\(T\\) such that \\((F_1 \times F_2) \subseteq T \subseteq 2^{S_1} \times 2^{S_2}\\).

For \\(A \in T\\), one can use the product measure \\(m\\) to define the minimum cover measure \\(m'(A) = \inf \set{\sum_i m(B_i) : A \subseteq \cup_i B_i}\\). One can show that this obeys required properties like countable additivity.

This is aka Lebesgue measure.

#### Importance
It forms a natural basis for defining and studying the box integral over product of multiple measure spaces.

## Connecting measures
### Absolute continuity
Consider two \\(\sigma-\\)finite measures \\(m, n\\). \\(m\\) is absolutely continuous with \\(n\\) - or \\(m\\) is dominated by \\(n\\) - or \\(m << n\\) if \\(\forall t \in S: n(t) = 0 \implies m(t) = 0\\).

This is equivalent to a definition reminiscent of absolute continuity of functions \\(n, m\\): \\(\forall \eps, \exists \gd: \forall t: n(t) \leq \gd \implies m(t) \leq \eps\\). Prior definition implies this because if there \\(\exists \eps, t: m(t) \geq \eps \land (n(t) \leq \gd \forall \gd)\\) then for that t, \\(m(t) \geq \eps\\) while \\(n(t) = 0\\).

This notion is important in defining the inter-measure derivative.

### Inter-measure Derivative
Aka Radon-Nikodym derivative. For measures \\(m<<n\\) over \\((X, S)\\), a theorem by Radon/ Nikodym says that \\(\exists f:X \to [0, \infty]: m(t) = \int_{x \in t} f(x) dn\\), and that this \\(f\\) is unique almost everywhere wrt \\(n\\). \why

Note that \\(m<<n\\) is necessary: otherwise, for the event \\(E\\) where \\(n(E) = 0, m(E) \neq 0\\), there is no \\(f\\) such that: \\(m(E) = \int_{E} f(x) dn\\).

This concept is important in defining probability density functions of random variables.


