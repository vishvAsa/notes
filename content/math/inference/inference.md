+++
title = "Inference"
+++

## Proving validity of theorems
We are given a set of axioms and valid statements/ additional rules of inference \\(S = \set{s_i}\\). Does \\(S \implies^{*} p\\)? Or is \\(p \equiv q\\)? So, want to see if a certain relationship between propositions holds.

This is akin to the search for proofs.

## Use rules of inference
Eg: Modus ponens: \\((p \land (p \implies q)) \implies q\\). Strengthening and weakening of implications.

De Morgan law: \\(\lnot(p \land q) \equiv \lnot p \lor \lnot q\\).

Contrapositive: \\((p \implies q) \equiv (\lnot q \implies \lnot p)\\).

### Resolution
Take \\(s_i \dfn a \land b\\) and \\(s_j \dfn \lnot a \lor b\\); get \\(s_i \land s_j \implies \\).

Resolution is complete.

### Other Properties
\\(p \implies q \equiv \lnot p \lor q\\). \\(\implies\\) is transitive.

### Implications: Strengthening and weakening
FALSE or \\(a \land \lnot a\\): the strongest possible assertion; TRUE: weakest assertion.

Can always strengthen LHS in implication, and weaken RHS. Eg: If \\(q \implies r; p \implies q\\): Can say: \\(p \implies r\\) or \\(p \implies q \lor s\\).

View p as \\(\set{b1, b2: p[q \assign b1, p \assign b2] = T}\\), a predicate or propositinal fn. Sets of stronger p are smaller.

### Using truth tables
Suppose ye got a compound statement p involving \\(\set{p_i}\\). Show that for any assignment of T/F to these propositions, p is true.

## Chaining
### Forward chaining
Start with predicates you have; combine them in various ways; keep doing this till you hit q. Look at this as a directed graph, with P as the root nodes.

#### Backward chaining
Start with q. Look at conditions Q which need to be satisfied for q to be true; now try to prove each condition in Q; do this recursively until you hit P.

## Inference with quantifiers
De morgan's laws over \\(\forall\\) and \\(\exists\\) now exist.

### Instantiation
Universal instantiation: \\([\forall x :: A(x)] \implies A(a)\\).

Similarly existential instantiation.

## Satisfiability
Satisfiability as a constraint satisfaction problem. \tbc

## Applications
Planning: q could be some state of the world. Initial state may be set of actions/ transitions and current state of the world.

