+++
title = "Sequence operations"

+++
## Membership query algorithms
The abstract data types relevant here are Sets and multisets (defined in the algebra survey).

### Over Associative arrays
When the elements are stored as an associative array - eg: hash-fn map or a treep, answering membership queries is O(1).

### Fingerprinting
Coding theory is useful here: see fingerprinting in information theory ref.

### Sequential search and sorting
Sequential search: O(n) in the worst case. When the list is unsorted, there is no choice but to do this. But, when the list is sorted, one can do better.

### Balanced binary trees
Search trees are described in another section. Here, the assumption is that the search tree is balanced.

Starting at the root node, one keeps comparing the query value to the node value and traversing left of right as necessary until one finds a matching node, or reaches a leaf node having searched in vain. Same as doing binary search - except that the sorted list is stored explicitly as a balanced binary tree.

But updates are costly.

### Binary search
Here an array is viewed as if viewing a balanced binary search tree: this is because one can easily match the id of a node in the binary search tree to the corresponding position in the array list, the latter merely being the result of an inorder traversal of the tree. Time complexity: $O(\log n)$ in the worst case.

### Splay tree
Splay trees rotate and update themselves so that the most recently accessed item is at the root.

### Compression, allowing some fast operations
\tbc

## List Sorting
### Assumptions
Using only constant extra memory.

### Lower bounds
$\Omega(n)$ lower bound is easily obtained simply rom the need to look at the values in the $n$ positions.

Any deterministic algorithm involving binary comparisons requires \\$\Omega(n \log n)$ comparisons in the worst case: At least $\Omega(\log (n!))$ binary decisions are required to distinguish the $n!$ possible permutations of $n$ items.

### Repeated partitioning sort
Aka quick sort. Move first element to position x such that elements larger than x are to the right, and those smaller than x are to the left; so now you are left with two arrays excluding the partitioning element; repeat this procedure on both these arrays.

### Time complexity
If the partitioning element is chosen randomly: Average case: $O(n log n)$.

Worst case: $O(n^{2})$ if the partitioning elements always create very unbalanced partitions.

### Improvements
A median finding algorithm can find the median in O(n) time. This can be used to get roughly $O(n log n)$ time complexity on most sequences. But, if there are a huge number of duplicates, we still may need $O(n^2)$ time.

### Merge sort
Divide list into 2 equal parts, apply merge sort on them, merge the sorted lists.

Note that this algorithm can be implemented in a bottom-up manner.

### Time complexity
Merging two sorted lists of size $k$ takes $O(k)$ time, with atmost $k$ swaps - one uses two pointers, which initially point to the beginning elements of the two lists; one keeps moving the pointers one step at a time while maintaining the property described next using swaps. The property to be maintained is: The value under the first pointer should always be less than the value under the second pointer, the values between the two pointers should be sorted, the values from the second pointer to the last element should be sorted.

As there are $\log n$ sets of merges, each involving $n$ elements: Worst case, avg case: $O(n \log n)$.

### Space complexity
In a naive implementation, $O(n)$ memory is required to remember the start and end points of various sublists being sorted and merged. But, these points may be computed dynamically.

### Other Techniques
Bubble sort: lightest element in the sublist $1:k$ for $k \in n:1$ keeps bubbling to the top. Time complexity: $O(n(n-1)/2) = O(n^{2})$

## Ordinal selection algorithms
It is assumed that we only use constant extra memory.

### By Sorting
Median finding after doing merge sort requires $O(n \log n)$ time.

### By repeated partitioning
One repeatedly does the following: a] pick a pivot. b] derive two partitions of the list such that the left partition only contains elements $<=$ pivot, and right partition only contains elements $>=$ pivot. Then, having determined which partition to seek the kth largest element in, seek the element in that partition by recursively using the same procedure.

### Time complexity
Avg case complexity: $O(n) = n + n/2 + n/4 ..$ : for intuition consider the case where the sequence is divided evenly each time. Worst case: $O(n^2)$ due to bad pivots - this can be avoided by randomized choice of pivots.
