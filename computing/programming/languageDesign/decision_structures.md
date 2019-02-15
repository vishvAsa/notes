---
title: Decision structures
---


The conciseness and clarity of expression of branching and iterative
operation in different languages is different.

## Branching

The if-else structure is the most basic decision structure, using which
more convenient decision structures like the if-elseif.. structure is
defined.

## Matching a value

Different branches of execution often depend on different tests
performed over the value of an expression. This is provided in terms of
the ’match with various cases’ construct.

## Iterative operations

The essential ingredients of an iteration are the starting state, the
code to be executed and the termination condition.

### Imperative loops

A basic imperative programming construct for iteration is the while
loop. To handle various specialized cases more concisely, constructs
such as C’s do-while and for loops are defined.

### Recursion

The most basic functional programming construct for iteration is
recursion, with efficient reuse of the stack space using tail recursion
where possible. Concise definition of recursive functions is possible
with the use of branching based on matching values- as in Scala.

### Declarative operations on lists

One can then define higher-order functions which operate on iterators
and lists leading to very concise statements. These are described
elsewhere.


## Exception handling

Exception handling features which require special language features are explained in the programming languages survey.

### try catch blocks

This is exemplified by the try - catch - finally block of Java.
### Error codes

As in case of C, one may cause a function to exit abnormally in case of an exception, notifying the caller of the case by returning a special value, and setting a particular flag/ message in a memory location.

### Monads vs exception throwing

Using monads is cleaner conceptually in its ability to write the program as a series of function operations. The resultant code is also more concise compared to the exception throwing paradigm.
