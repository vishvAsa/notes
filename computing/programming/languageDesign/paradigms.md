---
title: Paradigms
---

## Chapter Scope

A signle programming language can support multiple paradigms. Programming language features enabling different programming paradigms and architectures are considered elsewhere. Eg: Higher order functions underlies functional programming paradigm.

## Imperative vs declarative programming

### Imperative programming

Views computation in terms of altering state.

#### Structured programming

In this programming paradigm, state changes are restricted locally. This helps organize code and state information. Structured programming code is more easily understood and maintainable than common procedural language code. This includes object oriented programming.

### Declarative programming

Describes what needs to be done, rather than how to do it Eg: saying list.map(fn) instead of a C-like for-loop. Includes functional programming, logical programming.

The ideal of declarative programming is for the programmer to be able to express computation in terms of computation of a mathematical function - despite internally using imperative programming and dealing with memory at a lower level.

## Modularity With Object oriented programming

### Encapsulation/ locality

One collates within objects various values describing object-state. Often nouns correspond to objects, verbs to method calls.

For the sake of clarity, one may separate member variables from methods, creating two separate classes : ClassA and ClassABehavior.

#### Member addition test

Not every entity manipulated by an object need be its member - one may for example merely pass it as an argument to the object’s methods.

To decide if an object should have a certain member, one way could be to ask the question: when a deep-copy of an object is made, is it proper that a copy of the member is made?

### Class relationships

#### Identifying shared code and state

The fundamental operation in deciding the mechanism for code and state sharing between two objects is intersection - one determines precisely the state and methods that are to be shared.

#### Sharing code and state

Sharing state and associated methods between between two objects can be accomplished in two ways: class inheritence, aggregation/ containment (and sharing) of objects. The difference is the one between ’is-a’ and ’has-a’ relationships.

#### Inheritence vs aggregation

If objectA contains all of objectB, inheritence may be appropriate. In case multiple inheritence is necessary but the programming language won’t allow it, one may use aggregation.

Sharing state and associated methods between between two objects can be accomplished in two ways: class inheritence, containment (and sharing) of objects.

### Add function interface to classes

Called Type-class pattern because generic/ type-parametrized classes are used to solve the below problem.

#### Problem

Suppose that one wants to define a function _f_ whose arguments include objects of classes _C_ and _D_.

Suppose further that we want to define generic function _g_, which accepts objects of all classes with _f_ \- without need of alteration as new classes with _f_ are defined.

Further, we want calls to _g_ to be type checked at compile-time.

#### Inheritence

A common way of implementing this is to add methods $$C.f$$ and $$D.f$$; and perhaps having them extend an interface __hasF__.

But, this may not be possible (because you don’t have access to the source code of _C_ or _D_). Also, for various aesthetic reasons, you may not want _C_ and _D_ to be ’coupled’ through an interface.

#### Generic function use

One can alternately define a generic function: f[T], which can behave differently based on the class of its input - whether it is _C_ or _D_. This feat is often implemented using ’pattern matching’ in case of algebraic data types.

The disadvantage of this is that type-checking usually happens at run-time, rather than at compile-time.

#### Creating concrete fn objects with generic interfaces

One can create a trait/ interface $$hasF[T]$$ where the function _f_ is defined, and create objects $$C_1$$ and $$D_1$$ which have the traits $$hasF[C_1]$$ and $$hasF[D_1]$$.

Then, $$g[T]$$ can be defined to accept $$hasF[T]$$.

If the programming language defines an ’implicit scope’ whence arguments to functions may be drawn, one does not even need to pass these function objects explicitly.

## Functional programming paradigm

### Introduction

The main themes in functional programming languages are higher order and partially applied functions and functions without side effects.

#### Facilitating parallel programming

Absence of side effects (ie use of immutable data structures) eliminates problems such as race conditions arising out of shared memory.

Higher order functions - particularly those defined on lists - makes parallel programs easier to express.

#### Computation as a vector function

Let $$D$$ be the set of all scalars. Any computation can be specified as a vector function $$f : D^{k_{in}} → D^{k_{out}}$$. We name the arguments to _f_ as $$x_1, x_2..x_{k_{in}}$$.

This function can in-turn be defined in terms of other simpler functions - using currying for example.

### Monad

A monad is a generic object/ value which contains within it another value _v_ of type _t_. Apart from monad construction and ability to get the contained value, it contains the following basic functions:

map(f), which applies _f_ on _v_ and returns the resulting monad.

#### None monad: error handling

This construct is very useful in error handling: in case of an exception one can return a ’None’ monad, for which map(f) has no effect.

### Advantages

#### Conciseness

Very concise: fewer lines of code.

Fewer bugs.

#### Highly parallelizable

For functions without dependencies, order can be reversed, plus there are no side-effects: Thread-safe.

So likely to become popular.
