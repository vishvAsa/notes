+++
title = "Convex set"
+++

## Containment of convex combinations
X is convex if, for every \\(\set{x_{i}} \subseteq X\\), its convex combination is in X. For convex combinations \\(c\\), \\([x, y \in C \implies c(x, y) \in C] \equiv [\set{x_i} \subseteq C \implies c((x_i)) \in C]\\): from induction. extend this to possibly infinite number of points to get Jensen's inequality!

### Containment of line-segments
Equivalently, convex combination of any pair of pts in X is in X: Can get the former condition by induction on number of points combined. So, join any 2 pts in X by a line, pick any pt p on that line; \\(p \in X\\). So, easier to show that a set is non-convex than it is to show that it is convex.

## Properties
### Extreme points of convex set S
A corner of S; not in any line between two pts in S. If S also compact, S is the convex hull of the extreme points (Krein Milman).

### Separating hyperplane
If C and D are 2 disjoint convex sets, then they are separable by a hyperplane. Strict separation need additional assumptions.

### Supporting hyperplane
C has a supporting hyperplane at every boundary point.

### Intersection of supporting half-spaces
If C is closed, it is intersection of halfspaces formed by supporting hyperplanes.

### As domain of special barrier functionals
Any open convex set can be written as the domain of a self-concordant barrier functional.

## Convex hull of a set of points X in a real vector space V
The minimal convex set containing X. \\(H_{c}(X)\\). X is the boundary of the convex set.

If \\(|X|\\) finite, convex hull is a polyhedron. Circle is the convex set of \\(\infty\\) points.

Convex set is a set whose convex hull is itself.

## Check convexity
Use defn. Start with convex sets, apply functions known to preserve convexity. Derive set using convexity prserving operations on other sets.

### Functions which preserve convexity in image, inverse image
Affine fns: f(x) = Ax + b: see from defn. Perspective fns: see from defn. Linear fractional function: from composition of affine, perspective fn.

### Convexity preserving operations
\\(\inters\\).

### Important convex sets
Sublevelsets of (quasi)convex fn.

Half-spaces, hyper-ellipsoids, polyhedra which are solutions of \\(Ax \leq b\\). Norm ball.

The probability simplex: \\(p \geq 0; 1^{T}p = 1\\).


