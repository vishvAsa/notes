+++
title = "Tree search"
+++

## Find minimum spanning tree (MST)
(Kruskal) Start with forest F = V; pick \\(e \in G\\) with least weight; if e connects 2 trees in F, add it to F: else discard e; repeat.

(Prim) Grow a tree T starting from a vertex: at each step, add edge with least wt which brings in new vertex to T.

