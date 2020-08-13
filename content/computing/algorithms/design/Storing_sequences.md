+++
title = "Storing sequences"

+++
## Operations
Already stored data may be mutated with additions and deletions. Searching and sorting are considered elsewhere.

### Low level operations
Important special cases defined based on restrictions on insertion and deletion operations include stacks, queues, priority queues. In the case of stacks, elements leave the sequence in a last in first out (LIFO) order. In case of queues, elements leave in a first in first out (FIFO) order.

### Higher level operations
These operations are defined in terms of low level operations described earlier: Eg: map, filter etc.. So, an efficient realization of low level operations automatically enables higher level operations.

Coding efficiency in implementing these higher level operations is considered elsewhere.

## Iterators
Here, elements are generated one at a time according to some rule. So, with the next() operation one gets a value which may not be produced again. Iterators can be used in iterative statements without wasting memory to store all possible values at once.

## Integer indexed Arrays
Integer tuples (indices/ keys) are mapped to values of any general data-type; so that values can be stored at or retrieved from a given indexed location in the array.

### General implementations
Storage of (key, value) pairs in a way which allows fast search of keys and retrieval of corresponding values is essential. So, (key, value) pairs can be stored using binary search trees, easily calculated map to memory locations, dictionary search trees (using the string representations of the integers) etc..

Values stored with the key can in-fact be pointers to different memory locations containing the corresponding actual-values.

### Sequential locations implementation
In the most common implementation, Elements stored in sequential memory locations.

But the sequentialness requirement makes deletion of nodes, and insertion of nodes in a certain positions costly.

Their advantage in terms of memory is in locality/ contiguity and in overall - minimality (constant factor better than linked lists, for example). This advantage is usually not significant to bother with.

### Array buffers
An array buffer stores a list internally using an array. Its length may then be expanded or contracted by replacing the array. So despite the flexibility with the size compared to an array, the access time remains constant, while the amortized update time is also constant.

## Associative arrays
These generalize the integer-indexed arrays so that the index is allowed to be of an arbitrary data-type. The aim is to have an O(1) operation for for retrieving elements corresponding to a certain index.

### Hash-fn map implementation
Here, a hash function maps keys to integers, which together with the values are stored in the usual integer-indexed arrays.

Several keys may be mapped to the same integer, which results in a hash-collision.

In this case, the multiple values associated with different keys but the same integer keys may be stored using any sequential data structure, which may be searched using the query-key. This is aka 'chaining'.

### Randomization
A hash function can be a fixed rule. But that can be exploited in DoS attacks by forcing collisions. So, ideally the hash function is randomized.

Some implementations randomize iteration over hashmaps the same way.

### Prefix tree/ treep
Here, the keys are mapped to unique string representations, which are then used as substitute keys. These keys can then be stored as a k-ary tree, where \\(k\\) is the size of alphabet used to form the string. For each string-key stored, characters associated with nodes along the path from the root to a certain leaf is equal to the string key.

Using this, a k-characters long key can be looked up in time O(k).

### Comparison to hash-fn map
The number of leaf nodes is exactly equal to the number of entries in the associative array. So, this is more efficient when storing a small number of entries, whereas a hash-function implementation would reserve space for a huge table even when the number of entries is small.

## Linked list of node objects
Linked lists is a chain of node objects, each of which contains a stored value and the address of the next node. Linked lists occupy more memory than arrays. Accessing the kth element is an O(k) operation, rather than an O(1) operation in the case of arrays.

### Array list comparison
Linked lists are more dynamic when it comes to 'on-demand' insertion: if one has the memory location of a given node, one can insert a sublist next to it more efficiently than in the case of arrays. For comparison with arrays, see the array-list section.

### Doubly linked list
Doubly linked lists are extensions of linked lists, where the node also includes the address of the previous node. Their disadvantage relative to a singly linked list is only in terms of memory - usually insignificant in the modern context of cheap memory.

## Tree
Tree data-structures of nodes are defined as described in the graph theory survey, with the additional modification that they have a clearly specified root  node, and the children of each node are clearly enumerated! Each node can have k child nodes: when \\(k \leq 2\\), we have a binary tree.

### Traversals
Traversals are enumeration of node values in particular orders. These include in-order (only for binary trees), pre-order and post-order traversals. In each case, one starts at the root node and executes a certain traverse(node) function on that node.

This function, in the case of in-order traversal, executes traverse(left child) (if it exists), then appends the value of the current node, and finally executes traverse(right child) (if it exists).

The function, in the case of pre and post order traversals, executes traverse(node) for each child node in order before and after printing the value of the current node respectively.

### Search trees
Nodes in search trees have the property that, for any node: the left child node value, the current node value and the right child node value are in non-descending order. Thus, an in-order traversal yields a sorted list. These are very useful because they can be dynamically created - by adding nodes at run-time; and when they are balanced, they yield a sorted list.

### Heap
\tbc
