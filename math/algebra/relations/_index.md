+++
title = "+Relations"
+++

## Relations among n sets
### Definition
It is a subset of \\(A_1 \times .. A_n\\).

It is a binary relation between \\(A_1 \times .. A_{n-1}\\) and \\(A_n\\).

### Binary relation R on (A, B)
Aka dyadic relation.

#### Definitions/ views
A relation is fully defined by a subset \\(G \subseteq A \times B\\), called the graph of \\(R\\). So, it is a \\(R = (A, B , G)\\).

It corresponds to a function \\(2^{A} \to 2^{B}\\), and to the characteristic function \\(A \times B \to \set{0, 1}\\).

It is a general many-to-many relationship : a directed graph involving the sets.

#### (Co)Domain
\\(A\\) is the domain/ set of departure. \\(B\\) is the co-domain/ set of destination.

Domain of definition is \\(\set{a: a \in A, \exists b \in B: aRb}\\).

range(R) is the subset of \\(B\\) related by \\(R\\) to some element in \\(A\\).

#### Totality
If ran(f) = codomain(f), f is onto / surjective/ right-total.

If domain of definition = domain, f is left-total.

A correspondence: a binary relation that is both left-total and surjective.

### Endo-relations
A relation where the domain = co-domain.

The set of endo-relations is same as the set of directed graphs.

#### Equivalence
Equivalence relations: Reflexive (\\(a R a\\)), symmetric (\\(a R b \implies b R a\\)), transitive (\\(a R b \land b R c \implies a R c\\)).

The set of symmetric relations is the set of undirected graphs.

Equivalence class determined by a set of elements \\(S\\) and equivalence relation \\(R\\) is the set of all elements related to elements in \\(S\\) by \\(R\\).

#### Congruence
Complement: \\(A \times B - R\\).

Restricting domain/ codomain of the relation, we get other (left/ right) restricted relations.

#### Reduction and closure
Equivalence relation which preserves certain algebraic operators. Eg: Modulo arithmetic preserves +, *, -.

### Functions on relation R: A to B
Ensuring or removing all cases of reflexivity, symmetry and transitivity, we get closures and reductions of relations.

#### Inverse
\\(R^{-1}(b) = \set{a: a\in A, R(a) = b}\\).

## Functions/ transformation f
### Partial function A to B
Aka functional, right unique.

#### Definition
It is a special binary relation, where every element in \\(A\\) is mapped to at most one element in \\(B\\).

#### (Co)domain sets
The domain of definition is also called the preimage. The range is also called the image.

### (Total) function
A function is a partial function which is left-total.

A function acts. Like an electrical circuit with an input and an output.

### Types
If every element in B has at most one preimage, \\(f\\) is said to be One to one / injection.

A bijective function is both injective and surjective.

Also see survey on Analysis of functions over fields.

### Vector nature
A finite domain function can be seen as a vector. So can an \\(\infty\\) domain function. See functional analysis survey.

### Domain: Interesting locations
#### Level Set
\\(\set{x | f(x) = c}\\). A 2d contour line for 3d function. See linear algebra survey for geometric properties.

Kernel is the 0 level set.

#### Fixed point
f(w) = w.

### Traits of functions from X to X
Idempotence: \\(f^{n}(x) = f(x)\\). Nilpotence: \\(\exists n: f^{n}(x) = 0\\).

### Measurable function
Consider a function \\(f: X_1 \to X_2\\), where \\((X_i, S_i) \forall i \in \set{1, 2}\\) are measurable spaces.

\\(f\\) is a measurable function if the preimage \\(f^{-1}(s \in S_2)\\) is a measurable set: a member of \\(S_1\\). (This is analogous to definition of continuous functions over metric spaces.) So, it preserves some structure - but not fully: not every member of \\(S_1\\) is represented in \\(S_2\\) - only a subset is.

This notion is important in defining box integrals and random variables.

### Function/ model family
Suppose that \\(f:X \times W \to Y\\). Suppose that \\(w \in W\\) are designated parameters, and \\(x \in X\\) is designated the independent variable. Then, \\\\(\set{f_w:X \to Y = f(x, w)| w \in W}\\) is a parametrized family of functions.

Such function families occur frequently, for example, in machine learning.

## Sequence of maps to metric space
Consider \\(E \subseteq S\\).

### Pointwise convergence on E
\\(f_{n} \to f\\) pointwise if \\(\forall x \in E, \eps, \exists N: n > N \implies d(f_n(x), f(x)) < \eps\\). Visualize geometrically as a sequence of curves which get closer and closer at different rates at different points.

### Uniform convergence on E
\\(f_{n} \to f\\) if $\forall \eps, \exists N: n > N \implies\\
 \forall x \in E\ d(f_n(x), f(x)) < \eps\\(. \\)f_{n} \to f\\( uniformly \\)\equiv\\( \\)\sup_{x \in E} d(f_{n}(x), f(x)) \to 0$.

Visualize geometrically as a sequence of curves which get closer and closer at all points.

Cauchy criterion: \\(\forall n, m>N, x: d(f_{n}(x), f_{m}(x)) < \eps\\).

### Interesting functions
Point function: f(x) = 1 only if x = a, f(x) = 0 elsewhere.

#### Important functions over R and C
Includes polynomials over fields. See complex analysis survey.

#### Sequence over S
\\(f:N\to S\\); \\(\set{a_{i}}_{i=1}^{\infty}\\).

Subsequence: \\(\set{a_{j_{i}}}_{i=1}^{\infty}\\): \\(\set{j_{i}}\\) monotonically increasing. \\((1^{k})\\) not subsequence of N.

For topological properties, see topology survey.

### Randomized function
For any set \\(S\\), and set of random variables RV: \\(f: S \to RV\\). RV \\(f(x)\\) independent of \\(f(y)\\) and of previous runs.

#### Functions over vector spaces
See linear algebra survey.

#### Functions defined over convex and affine spaces
See linear algebra survey.

### Function families and parameters
Functions with a certain form(ula). An member function over \\(\set{x}\\) actually specified by the parameter t. f(x, t).

### Operators
See functional analysis survey.

