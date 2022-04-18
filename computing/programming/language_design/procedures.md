---
title: Functions
---

## Procedures
Code is often organized into different procedures, which may be invoked
under different contexts with different arguments.

### Mathematical functions

A procedure can change state (has a side-effect) and maybe return a
value, doesn’t naturally correspond to mathematical function which
cannot do this. So a function, which cannot have side-effects, can be
viewed as a special type of procedure.

C is a procedural programming language which is not structured.

### Passing arguments to procedures

Variables can be passed by reference, or by value. In the former case,
an address to the data can be considered as being passed; so a
modification to the data will be visible after the function returns. In
the latter case, this is not true.

### Operators

Operators are special functions, often with special syntax. They
sometimes implement logic which is so finely grained that it is executed
in a lower level programming/ machine language.


## Functions as objects

Functions can be used as arguments and return values. So, functions can
be regarded as objects.

Several languages provide excellent support for easily defining such
functions.

#### Functions acting on functions

Aka Higher order functions. Easy to define higher order functions: Eg:
$$(\frac{d_{n}}{dx^{n}})$$. So, one can conveniently pass a function as an
argument to another function.

#### Event driven programming

One can view some computation in terms of events and event listeners/
handlers/ callback functions which might handle them. A ’main loop’
keeps polling for events and dispatching events to the correct handler.
This can be easily realized with functional programming.

### Functions with non-local references

Aka closures.

With closures, a function definition may include references to non-local
variables. The function object is created/ updated anew just before it
is called, so that changes to the non-local variable alters the function
definition.

Some languages even allow the function definition to update the value of
these variables.

#### Extended function definition using decorator

Consider a higher order function h() accepting and returning a function.
The statements f = someFunction and f = h(f) is given syntactic sugar
using decorators: see python chapter for example.

### Partial application

From the definition of a function \(f\) over \(k\) arguments, one can
derive definitions of other functions depending on \(l<k\) arguments
which arise as a result of fixing a value to one of the arguments of
\(f\). Enabling this with simple syntax is an attractive feature in many
languages.

### Currying

Any such vector-domain function can be described as a function \(f'\)
acting on a scalar domain (corresponding to the first dimension of the
domain of \(f\)) and producing a  
vector-valued function: \(f':D \to G\), where
$$(G = \set{D^{k_{in}-1} \to D^{k_{out}}})$$ and $$(f'(a) = g \in G)$$ such
that \(g\) corresponds to the partially applied function
$$(f(x_1 = a, x_2 .. ))$$.

Doing this recursively, the entire computation can be written in terms
of scalar functions\!

#### Lambda calculus

Lambda calculus provides a good representation and manipulation rules
for considering computation in this way. It describes computation in
terms of formulae (unnamed functions) involving many variables, which
may be composed with each other; whose free variables may be bound to a
certain value etc..


### Iteration aids

Functional programming, in its purest form, does iteration using
recursions.

Plus, various higher-order functions which can be defined to act on
lists and iterators enable succinct definition of recursive computation.

#### Tail recursion

A tail recursion is a recursive function where the last statement
executed before the function exits (which is not necessarily the same as
the last statement in the function definition) involves a simple
recursive call. The value returned, if any, is simply the unmodified
result of this recursive call.

###### Reuse of stack space

Ordinarily an additional recursive call would involve addition of new
memory in the call-stack space. This can be avoided in this case by
simply reusing the stack-space already allocated to the calling
function. When the language standard does not demand it, but is
implemented by a certain compiler, this deserves to be called an
’optimization’; otherwise it is an integral feature of the language.

###### Advantage

This allows iteration to be written using a recursive call without the
penalty of using space linear in number of iterations.


## Functions without side effects

Computation is the evaluation of math functions.  
State changes outside the function, other than sending a return value is
not allowed: functions without side effects.

### Dependence on non-input values

To avoid side effects, some languages may force function behavior
depends purely on input: there is no access to higher-scope variables
(eg: global variables in C).

#### Closure restrictions

However, other languages may allow function-behavior to depend on
non-input values, but may not allow altering them within the function.
Eg: Matlab, R.

Such non-input and non-local variables and values in the function
definition are called free variables (- similar to the definition in
case of first order logic). These free variables may be bound (assigned
values) at run-time, just before the function is to be invoked.

Thus the precise definition of a function is finalized only at run-time
- So functions with free variables essentially define a function family
with a method for picking the right function from this family given some
values.

### Immutability of input

’Pass by reference’ is not allowed as that would allow code in the
function to have side-effects.
