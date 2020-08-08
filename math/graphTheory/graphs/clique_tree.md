+++
title = "Clique tree of G"
+++

Look at maximal cliques, pick a set of such cliques so that every edge is in some clique, make corresponding clique-nodes, make a tree by adding paths between cliques passing through shared-vertex-set nodes.

Eg: 1-2-3 has clique tree (1,2)-2-(2,3).

G can have multiple clique tree.

## Junction tree property
Take any path in the clique tree between cliques \\(C_1\\) and \\(C_2\\); then \\(C_1 \inters C_2\\) appears in every shared-vertex-set node inbetween them.

If a clique tree has it, it is a junction tree. These are useful in inference using graphical models: see probabilistic modelling ref.

Only chordal graphs have a junction tree; but can always add edges to convert non chordal graphs to chordal graphs.

### Finding a junction tree
Take all maximal cliques (this is easy for chordal graphs), connect them with edges with certain weights, find maximal weight spanning tree. \tbc

### Tree width of G
Take t = The size of the maximal clique in the junction tree of G with the smallest maximumal clique size. The tree width  = t-1.

