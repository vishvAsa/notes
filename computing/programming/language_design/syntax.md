---
title: Syntax
---

### Literals

All literals, apart from comments, in a program are of the following
sort: keywords; identifiers (names of variables); operators. Literals
are separated using delimiters and by using rules which specify the
allowed structure of the literal.

### Identifiers

#### Overloading

A language may allow methods/ operators with similar names, but
different signature.

#### Scope

Namespace/ scope of variables and functions is ordinarily defined by the
block of code wherein it is defined.

#### Implicit scope

But, in some cases, a variable may be defined to have ’implict’ scope.
Such variables are automatically used by the compiler when necessary -
example to bind an argument not explicitly passed to a function, to
convert between data-types.

### Expression evaluation

#### Lazy vs eager evaluation

In lazy eval: length(\[2+1, 3\*2, 1/0, 5-4\]) returns 4 without even
bothering to evaluate the values in the array. This difference in
evaluation becomes important when the computations involved are costly:
eg: function calls.

### Syntactic sugar

Some languages, for the convenience of the programmer, define shorter
ways of writing various frequently used expression types.

#### Macros

Sometimes, a user may add to syntactic sugar by the definition of
’macros’ or expressions which are evaluated before the program is even
parsed by the compiler.
