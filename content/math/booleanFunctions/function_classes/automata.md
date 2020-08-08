+++
title = "Automata"
+++

## Grammar
### Definition
A grammar specifies a language by describing structural rules which can be used to accept or reject a sentence. So, each grammar is associated with a language.

It is fully described by (Variables, Terminal chars/ alphabet, Start symbol, Production rules).

Production rules are of the form:
string including variable V \\(\to\\) string with variables and terminal symbols, formed by replacing \\(V\\) with somwething else.

A given string is accepted if, starting with the start symbol, using a finite number of production rules, one can arrive at the string.

### Parsing connection
The rules involved in generating a given string (sentence or word) is closely connected to the semantic meaning underlying that string. 

### Characteristics
There are conflicting demands on grammar design/ development.

Due to the parsing connection, unambiguity is desirable.

A good grammar should define a language with which a wide variety of semantics can be expressed. So, expressiveness is desirable.

At the same time, if the resultant language is being used for communicaiton, brevity is desirable. 

### Context free grammars
(CFG) constrain production rules so that their left hand side (LHS) has exactly one variable/ start symbol.

### Normal forms
Chomsky normal form for CFG: only \\(A \rightarrow BC\\) or \\(A \rightarrow \alpha\\). Greibach normal form for CFG: only \\(A\rightarrow \alpha C\\).

### Other traits
Pumping Lemma for CFG (How could a sufficiently long string be produced by a CFG?); use in checking if language is CFG.

Syntax trees and ambiguity. 

## Regular expression
This is a symbolic representation of a certain type of languages (defined by its syntax). This language consists of strings which may be produced by the application of production rules specified by the regular expression. THe production rules may also be viewed as producing a set of strings.

### Production rules
Fundamental production rules include concatenation (cartesian product of string sets), alternation (union of k sets) represented by \verb |  , and the 'kleene star' represented by * (union with empty set of the concatenation-closure of a certain set).

### Grouping
To clarify operator precedence, expressions are grouped together. Generally, groupings are specified by enclosing them within ().

### Example
abc(def|hig)*uvw.

Also see programming languages' use of regular expressions for string search and for the associated richer syntax.

## Finite state automata
This is a class of boolean functions over strings that can be formed using a finite alphabet.

### States and transitions
Finite state automaton is a collection of states and transitions between the states. The states include special states such as exactly 1 start-state and \\(\geq 1\\) accept-states.

Every transition between two states is labeled with a (input) character from the alphabet. Depending on the number of transitions corresponding to a given (state, letter) pair, the transition is said to be deterministic or non-deterministic.

### As a directed graph
One can use a directed graph where nodes and edges correspond to states and transitions. The edges are labelled with appropriate input characters.

### Acceptance
A given string is accepted or rejected based on whether one can reach a 'final-state' by making transitions appropriate to characters in the string.

### Resources
Uses constant memory.

### Expressiveness
Accept regular languages (describable by a regular expression). Pumping lemma for regex: Middle part of strings in regular languages can be pumped.

Strictly more powerful than decision trees. \why

### (Non) determinism
Determinsitic (DFA) and non deterministic representations.

## Pushdown automata
Determinsitic Push-down automata and stack memory. Non deterministic push-down automata; accepts context-free languages (use Greibach).

