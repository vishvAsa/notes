+++
title = "Reasoning"
+++

Also see distributed computing ref.

## Correctness
### Assertion
Assertion p: Assume that p is true.

In practice, good programmers use special statements to check if assertions are true; eg: Java.

### Correctness
S is correct wrt precondition p and postcondition q if: starting with p true, run S, get q.

### Partial correctness
\\(\set{p}S\set{q}\\). S is correct wrt p and q if: starting with p true, if ye run S, ye get q if S terminates. This is useful notation for proving correctness of program segments.

#### Axioms
[Hoare] F indicates set of empty set of states (unreachable); so: \\
\\(\forall q, S:: F S \set{q}\\); \\(\set{p}S F \implies \lnot p \\): if S results in unreachable state, initial state itself must have been unreachable.

\\(\set{p_{1}} S_{1}\set{p_{2}}\land \set{p_{2}} S_{2} \set{p_{3}} \implies \set{p_{1}}S_{1};S_{2}\set{p_{3}}\\).

## Verification with forward chaining
### Picking invariants
During verification, select invariant weak enough to remain true before and after loop is executed, also strong enough to lead to the required postcondition: necessary to ensure postcondition even if loop not entered.

### Translate program into hoare triples
If S = if cond then \\(S_{1}\\) else \\(S_{2}\\): $(\set{p \land cond} S_{1} \set{q})\land (\set{p \land 
 \lnot cond} S_{2} \set{q})$.

Iteration: S = while cond do S', \\(q = (p \land \lnot cond)\\): \\((\set{p \land cond} S \set{p})\\): p is the loop invariant; cond is loop variant. p can be false during loop execution, but returns to true in the end.

Assignment: \\(\set{p(x)} x \dfn E \set{p(E)}\\).


## Verification with preconditions
Aka back substitution. This is backward chaining.

### Weakest preconditions for program S, postcondition q
p = wp(S,q). Weakest assertion p: \\(\set{p} S \set{q}\\). For any r : if \\(\set{r} S \set{q}\\) \\(\land\\) S terminates; \\(r \implies wp(S,q)\\). Converse is true.

So, use this if you want to show that \\(\set{r} S \set{q}\\) (like \\(\set{r} x \assign 5 \set{x\geq5}\\)): take q, substitute the effects of S in q, thence get wp(S, q); show \\(r \implies wp(S, q)\\)!

\\(wp(S_{1};S_{2}, q) = wp(S_{1}, wp(S_{2},q))\\).

wp(if cond then S; q) = \\((cond \implies wp(S,q)) \land (\lnot cond \implies q)\\).

\\(wp(x \dfn E, q(x))\\) = E is defined, q(E) true.
