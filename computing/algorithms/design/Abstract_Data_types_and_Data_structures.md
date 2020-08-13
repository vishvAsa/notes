+++
title = "Abstract Data types and Data structures"

+++
## Abstract data types
When data is stored, we often want to perform various operations (ie evaluate mathematical functions) on it.

Abstract data type is a mathematical construct of a data-store, defined by the operations which can be performed over it, and consistency rules (which define the effect of the aforementioned operations on the stored data). For example, a stack can be defined using push, pop operations, with constraints such as pop(push(stack, x)) = x.

This concept may be extended to include rules which limit the cost of various operations.

Abstract data types are thus useful in specifying design goals, which may be met by various data structures.

## Data structure for the task
Suppose we want to realize a certain abstract data type on the computer. The same data can be stored in different ways in the computer. For various operations on the data, some ways result in better performance, in terms of memory, time, success rate, than others.

So, one must choose the data structure depending on the types of operations one intends to perform on the data : ie the abstract data-type being implemented.
