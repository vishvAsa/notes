+++
title = "Statement"
+++

Aka formula.

## Language
### Syntax
All sentences are written with symbols/ words drawn from some alphabet, in a formal language. A statement/ formula is said to be well formed if it makes sense according to some formal grammar.

#### Values
The most basic statements are the values T / TRUE and F/ FALSE.

### Semantics
Corresponding to languages of various levels of expressiveness, there are Logics/ calculii which specify the semantics. They, for example, specify what 'P', \\(\lnot P\\) etc.. stand for. Truth of a proposition often follows from the semantics: \\(2>3\\) is F.

Statements assumed to be true (in the context of model checking or inference) in a given model is called an assertion.


## Variables
A variable is a symbol used within a sentence which may be substituted for some value (T, F, objects in a set) or even by other symbols (Eg: \\(P \dfn Q \land R\\)).

### Assignment
Assignment statements assign a value to a symbol. Notation when restricted to a particular statement \\(P\\): \\(P[Q \assign T, R \assign F]\\). Then, the semantics/ logic rules ensure that wherever the variable-symbol occurs in a given statement, the corresponding value may be substituted.

#### Model
Assignment statements, when part of a set of assertions, help specify a 'possible world' or model.

### Free and bound variables
Variables occurring within a sentence or a set of sentences may require assignment (ie assignment sentences may need to be added) in order for us to be able to evaluate the truth value of a sentence. Such variables are called free variables. Variables which are not free are called bound variables.

An expression with atleast one free variable is an open term.

Eg: In the sentence \\(\forall a \in B, a<5c\\), \\(a\\) is \\(a\\) bound variable, while \\(b\\) is a free variable.

Domain of discourse: The domain of \\(x, y\\) and other free variables. 

### Boolean valued
Boolean valued variables (aka Propositional symbols) constitute the atomic formulae of propositional calculus. These are usually denoted by CAPITAL letters.

## Proposition
A proposition is a statement whose truth value can be evaluated.

### Truth value
A statement \\(P\\) may be TRUE or FALSE - depending on the 'possible world' or model we are considering.

#### Validity
Or, if it is a tautology, it is true in every possible world.

## Predicates
Eg: x is sick: 'is sick' is a predicate; thence get isSick(x). Can talk about relations between objects: R(x, y).

### Free variables
In predicate \\(R(x, y), x\\) and \\(y\\) are free variables. 

### As a set
Every predicate defines a set of values for which it is true. Eg: \\(x>3\\).

### Quantification and assignment
Upon assignment, or quantification eg: \\(R(x\assign 3, y \assign 2)\\), predicate becomes a proposition.

#### Special cases
\\(\forall x \in \nullSet: P(x)\\) is true; \\(\exists x \in \nullSet : P(x)\\) is false.

## Types
Simple propositions are devoid of quantifiers and connectors.

### Compound propositions
Compound propositions: simple propositions combined by logical connectives \\(\land \lor ..\\); actually \\(\lor, \lnot \\) enough.

So, these are propositions involving boolean free variables.  They state some relationship among simple propositions.

#### Implication, equivalnce
\\(p \implies q\\): \\(p\\) 'stronger' than \\(q\\). Equivalence \\(\equiv\\): \\((p \implies q) \land (q \implies p)\\). This notion of strength is natural when \\(p\\) and \\(q\\) are viewed as events or sets in the sample space; then we see that \\(E_p \subseteq E_q\\).

### Quantification
One can use the universal and existential quantifiers to write statements such as \\(\forall x: x< 5\\) and \\(\exists x: x< 5\\).

#### Notations
\\(\forall x \in S: P(x)\\).

Or \\(\forall x: x \in S: P(x)\\) or \\(\forall x: Q(x): P(x)\\): second part specifies domain of \\(x\\).

## Other perspectives
A statement can be viewed in several ways, including as a set or an event. These perspectives are described in the boolean functions survey.

