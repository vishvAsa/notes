---
title: +Language Design
---

Programming is data processing.

## Type-generic definitions

One may define generic classes or functions in a generic way. Such
definitions accept a type parameter, apart from other values. Eg: class
List\[T\] may define a linked list which holds objects of type T.

## Specifying generators

These are functions which produce the ith element only on demand - a
sort of lazy evaluation. They lead to time savings.

These are often traversable only once. Some languages allow a succinct
notation for producing a list by executing some code for various
elements drawn from an iterator.

#### Set-builder syntax

Aka comprehension. This is not equivalent to a for loop in C, but a
consise way of specifying a list literal.

Eg: The for comprehension in scala.

## Application programming interface (API)

To aid rapid software development, many programming languages come with
libraries of objects and functions implementing common data structures
like collections, file parsing etc..

### Higher order functions for lists

Having an API with support for higher order functions acting on
iterators and lists enable writing concise code.

#### Map

map(iter, fn) applies the fn to each element produced by an iterator and
returns a iterator of results.

#### Filter

This produces an iterator with elements of another sequence which pass a
test specified by a certain function.

#### Transformation-types

In case of functions which produce new lists/ iterators such as maps,
fitlers, one might either want the transformations to take effect one at
a time while an element is being retrieved (lazy/ non-strict), or one
might want a function which produces the result list/ iterator fully
upon call. The former is more efficient (especially when avoiding
intermediate results when doing x.map().fitler..), while the latter may
be desirable to preserve modularity.

#### Fold

foldLeft(list, fn, b): Let head(list) be the first element in the list
and tail(list) be the list without its first element. Then, if list is
empty, foldLeft returns b; otherwise, foldLeft(tail(list), fn, fn(b,
head(list))) is returned.

foldRight: is a function which does the same, but from the other end of
the list: so one needs to modify definitions of head and tail
appropriately in the above description.


## Remote procedure call (RPC)

Allows a process (RPC client) to run a procedure within a remote process
(RPC server) is such a way that the programmer does not have to worry
about details of how the arguments/ results are communicated etc.. -
from the perspective of the programmer, this call should be as simple as
a local procedure call. In case of synchronous calls, the calling
process blocks until the remote procedure terminates and returns the
result.

### Pipeline

Client code - RPC client stub - RPC server stub - Server procedure.

Client code - client stub and server code - server stub calls are done
using normal (local) procedure invocation mechanisms. The purpose of
client stub and server stub is to communicate the arguments/ results
returned to/ from them by their respective processes - this involves
marhsalling locally received objects and unmarshalling messages from the
other stub into objects. Client stub - server stub communication is done
through an internal protocol which the calling function need not know.

## Test framework

Desiderata for tests are listed in the software architecture survey.

Various test-cases may use a single object. So, to achieve speed, they
may share a test fixture, which contains the shared object - rather than
initialize it multiple times.


## Domain specific languages (DSL)

### Objectives

The objective is often to define a special, simple language for a certain domain so as to provide a linguistic user interface usable by non-programmer domain-experts. This could also be an intermediate step for programmers ultimately providing other interfaces - a paradigm called ’Language oriented programming’.

### Compiler implementation

These are often written using high level functional languages like Scala, Groovy which let one define binary operators/ relations, easy type conversions, ways to dynamically handle arbitrary class members, syntax for symbols etc.. So, one actually writes DSL code which also makes sense in that high level language; and this code is interpreted suitably due to exploitation of the aforementioned features.

Binding symbols is often accomplished using hashmaps.
