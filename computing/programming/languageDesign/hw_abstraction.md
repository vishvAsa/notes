---
title: Abstraction from Hardware
---

### View of memory

If in writing code, one thinks in terms of instructions and data which
can be understood by a processor (eg: bytes in the main memory,
registers, hardware IO signals), one is working with a low level
language.

High level languages allow the programmer to think of memory locations
and data more abstractly/ declaratively by starting with assumptions
that there exist memory locations with certain properties which will be
bound to variables used by the programmer by the compiler with the OS’s
help.

Mixed level languages allow a combination of both these paradigms.

### Portability

Programs written in high level language are more portable across
computers with different architectures and abilities due to the
existence of compilers or interpreters or virtual machines implemented
on various platforms which suitably translate a high level program to
something understandable to the processor.

### Programming discipline

High level languages often try to enable/ enforce some programming
discipline (eg: by enforcing OOP paradigm, functional programming,
variable scoping etc..), provide more concise commands for frequent
operations, perhaps using ’syntactic sugar’; though internally they may
be forced to use programming paradigms different from the programming
interface provided to the programmer.

### Type system

#### Implementing abstract data-types

While programming, rather than think of data in terms of bytes, one can
consider and manipulate data (collection of data) at a more abstract
level. One can define different generic operations and views on a set of
bytes depending on the type of data stored therein.

Examples of data-types may be Integers, Floating point numbers or even
arbitrary user-defined classes. A very basic datatype offered by
high-level languages is the Array/ sequential storage.

#### Compile time vs run-time

Aka Static vs dynamic.

In static type checking, data types are associated with variables, and
these are checked at compile time to ensure that assignments do not
violate this binding. So, the binding of a type to a variable happens at
compile time, rather than run time. This enables us to catch errors and
prove more properties about a program’s correctness before it is
compiled and run. It also enables safer refactoring of code (changing
type to a subtype etc..).

In case of dynamic typing, types are associated with values rather than
variables. THis allows the programmer more flexibility in his use of
variables.

#### Strong vs weak

Can the type of data pointed to by a variable symbol change within its
scope?

Scala has weak typing and static typing. Python has weak typing and
dynamic typing.
