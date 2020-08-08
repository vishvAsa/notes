+++
title = "Node search"
+++

## Searching for a goal node
Problem; initial state; successor function; goal test; path cost; step cost.

The search tree vs state graph; its branching factor. NP hardness. Optimality vs completeness of algorithms. Eg: Route finding problem with a map; TSP.

## Uninformed Search problem
Breath first search; exponential memory demands. When pathcost varies: Uniform cost search.

Depth first search: linear space complexity. Iterative deepening DFS: use diameter of state graph. When pathcost varies: Iterative lengthening search.

Bidirectional search.

Avoid repeated states: open and closed lists of states.

## Informed search
At node x, distance to goal node: d(x). Heuristic functions h(x). Admissible heuristics: \\(h(x) \leq d(x)\\); never overestimate. Consistent heuristics and the triangle inequality. Greedy best-first search. A*.

## Local search/ optimization
Eg: Protein structure prediction. Hill climbing. Statespace landscape: Local minima and shoulders. Random restarts. Simulated annealing. Local beam search. Genetic algorithms.

## Offline vs online search
Eg: Search on internet without a prior index; protein design. Learning in online search (exploration); updating the search tree and heuristic values of nodes.


