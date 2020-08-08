+++
title = "Decision trees"
+++

## Decision lists
Decision list is fully specified by a sequence of \\(k\\) variables \\((x_{i})\\) and outputs \\(r(x_{i}), r'(x_k)\\). It is like an 'if .. elseif .. elseif .. else' statement. It can be visualised as a chain of variables, each with one outgoing edges representing an output.

In a d-decision list, \\(d-CNF\\)'s are used in place of \\(\set{x_i}\\).

### Generality
This can be writ as halfspace: \\(sign(\sum 2^{k-i}x_{i}o(x_{i}))\\).

We can write conjunctions, disjunctions as decision lists.

## Decision trees
DAG with internal nodes labelled with variables; leaves are labelled \\(0\\) or \\(1\\) (range of the 'label' variable to be predicted). A decision tree is same as a nested 'if .. else ..' statement.

### Power
They include decision lists, but are strictly more powerful: can represent \\(x_{1} \oplus x_{2}\\) as a decision tree.

### Evaluation and interpretation
Apart form the overall classification error, one can consider classification errors particular to various decision paths. The leaves of the decision trees, which represent a decision path can be labeled with the error rate observed for that particular path.

### t augmented Decision tree
Decision tree with t-DNF's at leaves. t augmented Decision tree of rank \\(r\\) reducible to t + \\(r\\) + 1 decision list.

### Rank of decision trees
Rank of a leaf variable is 1. Rank of decision tree (not max depth) = Max (ranks of kids) if kids have diff ranks; else rank of kid + 1. So, \\(rank \leq \log(nodes)\\).

### Number of decision trees
Number of Decision trees = \\(2^{2^{n}}\\). Number of poly size Decision trees probably same as number of polysize DNF's: they're interchangeable \chk.

### Rank r decision tree to r+1 decision list
Easy decision list for Rank 1 subtree; Take node x with kid subtrees \\(T_{1}\\) and \\(T_{2}\\), append \\(\bar{x}\\) to conjunctions of DL of \\(T_{1}\\) and x to conjunctions of DL of \\(T_{2}\\), join them.

### Decision tree to polysize DNF f
Taking \\(\lor\\) of AND's corresponding to paths to leaves with label 1; only one of the terms can be true at a time. So, f = \\(\sum\\) AND terms, with \\(\norm{AND(..)}_{1} \leq 1\\). So, \\(\norm{f}_{1}\leq t\\).

### Sparsity
As \\(\norm{f}_{1}\leq t\\), Decision tree with t leaves has approximator with sparsity \\(O(t)\\).

