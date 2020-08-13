+++
title = "Constraint satisfaction problems"

+++
Discrete vs continuous valued variables. Number of variables involved in constraints; preferences. Problem structure: the constraint graph.

## As an uninformed search problem
The naive backtracking search. Variable ordering: Most constrained variable / minimum remaining values.

Value ordering: least constraining value. Solve independent subproblems separately; collapse nodes in constraint graph. Propogating information through constraints: forward checking: delete unsuitable values in current node; constraint propogation: delete unsuitable values in lower nodes: arc consistency.  Intelligent backtracking.

## Local search for CSPs
Eg: n-queens. Effective for overconstrained problems?.
