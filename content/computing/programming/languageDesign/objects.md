---
title: Objects
---


Object oriented design is considered in the software architecture
survey.

### Object manipulation

The main idea of object oriented programming is to describe computation
in terms of manipulating states of objects. This causes state changes to
be local - which helps programmers design a well structured view of
state and behavior.

This is distinct from the functional programming paradigm.

### Encapsulation and locality

Hiding data and methods from outside methods restricts state changes to
be local.

For enforcing varying degrees of locality, Method/ property access
specifiers may be provided: public, private, protected, default.

#### Methods

Methods: procedures associated with a class. The behavior of a method
within a certain object obj - say obj.f(argList), in terms of functional
programming, can be considered to be a function which accepts two
argument sets: first is the object obj, and the second is the argList
passed to the method; and which then returns values which include the
modified object, which is then assigned to the appropriate reference.

Maybe class has events, listeners too.

### Object construction and destruction

There are various patterns for specifying functions which create objects
based on prototypes.

#### Classes

Based on their state-space and purpose, these objects may be described
as instances of various classes, in whose definition various attributes
and methods may be defined.

Use of classes enables static type checking.

#### Cloning prototypes

One way to create objects is by creating a clone. This mechanism works
even where objects’ types are not well defined.

Properties and methods are then added as desired.

#### Deep copy

With a deep copy, not only is a new object with the same state as the
original object created, but the following happens too: any object
contained within the original object is also deep copied (rather than
both objects referring to the same member object).

#### Factory methods

Often easily accessed factory methods are provided in order to create an
object of a certain class with a certain state. When these are member
methods of the class in question, they are called constructors.

When an inheritance structure is present, and when a parent class has
multiple constructors, it becomes necessary to ensure the calling the
right parent constructor. Sequence of calling constructors: superclass
first. Destructors: subclass destructor called first.

### Inheritance

Among classes of objects, a inheritance structure may be defined - Eg:
class A extends class B in that it has all the members in B (with
identical or overriden semantics/ behavior), together with some extra
members.

#### Benefits

Inheritience is compared with object composition elsewhere.

This accomplishes two things: 1\] It is a neat code-reuse pattern; and
2\] enabling static type-checking (in case of statically typed
languages) - ie when a member \(x\) is accessed, ensuring that the class
has an appropriate member \(x\).

The fact that members of objects of different subclasses of the same
superclass can be accessed using a variable (of the superclass type) is
called polymorphism.

#### Abstract class/ interface

Programming laguages often allow definition of types which cannot be
instantiated, but can be used to define the members of other classes
which extend/ implement them. So, these abstract classes need not define
a generic implmentation of methods they declare.

This enables one to define functions which accept arguments with a
certain ’interface’.

#### Dynamic dispatch

When a superclass and a subclass have a function of the same name f, it
is generally intended that subclass.f should be called when obj.f is
invoked, where obj is declared to be of the superclass type.

Some languages require this to specified explicitly using the keyword
virtual.

#### Multiple inheritance

In case multiple ancestors (along distinct inheritance paths) of a class
\(C\) define a method with the same name \(m\), the effect of the call
\(C.m\) needs to be disambiguated explicitly by the programmer: and the
programming language should ideally provide him the ability to do so.

In case of programming languages which do not allow this, one must
instead use interfaces with object composition as a way of sharing code.

### Prototyping-based languages

These do not provide a mechanism to explicitly define a class or
inheritance structure. Objects are created exclusively by cloning and
dynamically (at run-time) adding members - Classes/ inheritance are
implicitly defined in this process.

### Mutability

Some objects may be designed to be immutable (having unchangeable
state). Such objects may have ’state-altering’ methods which construct
and return an object with the altered state.

So, object-cloning is superfluous for such objects.

Example: Immutable maps, when return a copy of value objects to ensure
that the value is not modified.


### Class with optional members

Aka algebraic data-type. An algebraic data-type a class which is mostly
defined by the members it does and does not have. These members are
often set using constructors.

#### As inheritance tree

Often it is defined by an inheritence hierarchy.

eg: trait Tree; class BTree(lTree: Tree, value: Int, rTree: Tree)
extends Tree; class LeafNode(value: Int) extends Tree.

#### Use with pattern matching

An instant of an algebraic data type is often matched using a special
pattern matching construct provided by the language.

eg pseudo-scala-code:

    f(tree) = tree match {
    case BTree: print(tree.lTree) f(tree.lTree) f(tree.rTree)
    case LeafNode: print(tree.value)
    }
