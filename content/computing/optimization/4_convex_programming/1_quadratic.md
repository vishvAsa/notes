+++
title = "1 Quadratic"
+++

For ideas about its importance - both in solving general convex optimization problems and in other domains, look at the 'Least squares' chapter.

## Linear Constrained QP
Aka Quadratic programming. Minimize convex quadratic functional over a polyhedron (see vector spaces survey). Generalizes linear programming, special case of QCQP.

### Visualization
If optimal value occurs when a constraint is active: Think of contours of the objective hitting an edge of the polyhedron. Slightly harder than in the LP case, where the minimum always occured in a vertex.

### Dual problem
This is also a quadratic program; strong duality always holds! \chk

## Quadratically constrained QP (QCQP)
Minimize convex quadratic functional, subject to convex quadratic constraints: so all equality constraints are specified by linear inequalities. Feasible set is an intersection of hyperellipes and a polyhedron.

## Least squared error problem
### Problem
Aka least squares.

#### Unregularized problem
\\(\min \norm{Aw - b}^{2}\\), \\(A \in R^{m \times n}, m>n, rank(A) = m\\).

##### For the weighted least squares
More weight to one observation or correlated observations:\\ Use Weighted inner product to find projection.\\
\\(WAx = Wb; \min \norm{WAx - Wb} = \min \norm{Ax-b}_{M}\\) for \\(M=W^{*}W\\).

##### Solution
See numerical analysis survey for geometry and solution.

#### The regularized problem
Aka weight decay.

Want to balance love of sparsity or smallness with desire for a good fit. Pick a regularizer which is small for good w, and large for bad w.

Take \\(\min f(w) + l\norm{w}_n\\). As n decreases, feasible set decreases: consider progression of 1 balls from \\(\norm{.}_\infty\\) to \\(\norm{}_0\\).

### Application
#### Convex Optimization
A common technique of solving convex optimization problems is to  approximate the objective with a quadratic function and then solve it.

#### Other domains
See regression problem in statistics survey for motivation. Same as finding maximum likelihood solution while fitting linear model with Gaussian noise.

Interpolation of functions linear in parameters is also a specific case: see numerical analysis survey.

#### Regularized problems
If solving a regression problem, this amounts to the least squares solution, when a prior probability distribution is imposed on w to favor smaller w values.

\\(w\\) could be the coefficients of polynomial used to fit data in \\(A\\), \\(b\\). To avoid overfitting, we want \\(w\\) to be small.

##### Penalties and priors
Different regularizers (usually norms) correspond to different priors on w. Shape of the prior distribution looks like the unit spheres corresponding to the norms used: sphere, diamond etc..

\\(\norm{}_{q}\\) penalty for \\(q> 2\\) usually not worth the effort. Sometimes, \\(\norm{}_{1.x}\\) penalty used as compromize between lasso and quadratic regularizers.

### Standard formulations
#### Normalizing columns of A
By solving \\(A'w' = b\\), can solve \\(ADD^{-1}w \approx b\\) using diagonal matrix D.

### Quadratic regularizer
Aka ridge regression. \\
\\(\min f(w) + lw^{T}I'w= \min \norm{Aw-b}_{2}^{2}+ lw^{T}I'w\\) instead, to control size of w too.

This objective is the lagrangian fn corresponding to the problem of finding \\(\min f(w) = \min \norm{Aw-b}_{2}^{2}\\) subject to \\(w^{T}I'w < c\\).

#### The solution form
\\((A^{T}A + lI)\hat{w} = A^{T}b\\): by setting \\(\gradient (f(w) + l\norm{w}_{2}^{2})= 0\\). Take \\(A = U\SW V^{*}\\), get \\(X\hat{w} = U \SW (\SW^{2} + lI)^{-1} \SW U^{T}y = UDU^{T}y\\), where \\(D_{i,i} = \sw_{i}' = \frac{\sw_{i}^{2}}{\sw_{i}^{2} + l}\\).

So, \\(X\hat{w} = \sum \sw_{i}' u_{i}^{T} u_{i}y\\); observe action of \\(l \in [0,\infty]\\) in \\(\sw_{i}'\\): the shrinkage parameter; or the prior distribution on w.

#### The geometry
Consider hypersphere \\(\norm{w}_{2}^{2} < c\\) and the paraboloid \\(f(w)\\). The objective is to find w within the hypersphere, having the minimum \\(f(w)\\) value. Visualize by taking contour map of \\(f(w)\\) : successively larger ellipsoids. optimal \\(w\\) is where the minimal contour touches the hypersphere, when the center of \\(f(w)\\) lies outside the hypersphere.

Compare with geometry of \\(\min f(w)\\) problem: see linear alg survey.

#### Effect
Shrinks components of \\(w\\) towards each other in magnitude. Also takes care of correlated features.

Does not penalize small \\(w_i\\), so does not lead to sparsity.

### l2 and linf regularizers
#### l2 regularizer
##### Problem
Solve \\(\min_w \norm{Aw - b}^{2} + \gl \norm{w}_2\\), with \\(\gl > 0\\). An alternate formulation is \\(\min_w w^{T}Hw + v^{T}w + \gl \norm{w}_2\\), with \\(H \succeq 0\\).

##### Solution
The obtimality condition involves taking the subdifferential of \\(\norm{w}_2\\). For diagonal \\(H\\), this has a closed form solution. The solution technique involves some nifty variable substitution.

##### Relation with Quadratic regularizer
Rewriting as \\(\min_w \norm{Aw - b}^{2} : \norm{w}_2 < C(\gl)\\); we see that this is equivalent to using the quadratic regularizer and solving: \\(\min_w \norm{Aw - b}^{2} : \norm{w}_2^{2} < C(\gl)^{2}\\). So, the tradeoff curve, is for practical purposes, identical.

The latter formulation has a simpler solution as subgradient calculations are not involved in specifying the optimality conditions for analytically finding a solution.

But, sometimes we are given the problem where an \\(l_2\\) regularizer is used. Such problems occur in doing block coordinate descent to solve multi-task lasso, for example, while finding the search direction using a quadratic approximation of the objective. In such cases, we can either solve the specified problem directly, or we can reformulate it using the quadratic regularizer; the former is quite simple.

#### lInf regularizer
Here, we solve \\(\min_w \norm{Aw - b}^{2} + \gl \norm{w}_\infty\\). Optimality condition involves taking the subdifferential of \\(\norm{w}_\infty\\). A closed form solution can be derived by using proof by cases: eg: see a paper on muti-task learning by Han Liu.

### Forward stepwise regression for sparsity
Trying to solve Aw = y. Take F = active set of features used in approximating y. Start with \\(F = \nullSet\\), w = 0. At step t, find residue \\(r = y - Aw_t\\), find feature i most correlated with r; set \\(w_{i}\\) to this projection; continue. \exclaim{Observe how the residue changes at each step!}

This is a greedy algorithm, so suboptimal. But note that this is not the same as simply finding the optimal w'' without any sparsity constraint, and then dropping some small elements.

#### Forward stagewise regression
A non greedy modification to forward stepwise. Find feature set B with maximum correlation with residue; for each such i: keep increasing \\(w_{B}\\) until you find another feature(s) with equal correlation with the residue; then add these feature(s) to B; repeat.

At any time, B is the set of features which form the \exclaim{least angle} with the residue. The coefficients increase such that \\(Aw_B\\) increases exactly along the projection of the residue on the hyperspace spanned by features in B.

Also, in case at some time, a feature correlated with other some feature in B gets added to B, the coefficient of B.

#### Least Angle Regression
A modification of the Forward stagewise regression, so that \\(w_{B}\\) is increased at one shot, rather than gradually.

#### Lasso solving modification
Losso just specifies an objective, which may be achieved in many ways, including using forward regression.

Can turn LAR to Lasso solver: Whenever \\(w_{i}\\) for some i in B hits 0, drop it out of B.

##### Reason for the fix
Compare conditions you get on lasso solution by setting gradient to 0 with conditions for LAR at any time: Correlation of residue with B with features in B is equal and correlation with other features is lower. They are identical as long as \\(sgn(w_j) = \\) sign of correlation of residue with feature j.

### 0 norm regularizer: Compressed sensing
#### Problem scenario
X is short and fat, Xw = y has many solutions for w, want to find w with \\(\norm{w}_0\leq s\\), \\(Xw \approx y\\). If X were tall and thin, the solution of a similar problem is easy: solve \\(\min \norm{Xw - y}^{2}\\) and pick the s most important components of w.

Consider the equivalent problem, where we assume columns of X are normalized.

##### Finding support: Combinatorial hardness
The difficulty comes from finding the support (non-zero coordinates) of w. Once support of w is found, it is easy to find the optimal linear combination of these components to get close to y: just solve \\(\min \norm{X'w' = y}\\), where \\(m \times s\\) X' is derived from X by dropping some columns.

There are many possible ways to form w with \\(\norm{w}_0\leq s\\).

#### Finding support: Target optimization problems
Maybe want to limit w to certain number of non-zeros. Solve \\(\min f(w) + l \norm{w}_{0}\\), where \\(f(w) = \norm{Xw - y}_2^{2}\\).

This is same as \\(\min f(w): \norm{w}_{0} \leq s\\). Feasible set is not convex: consider epigraph of \\(\norm{w}_0 \leq 1\\) for example.

A stricter version of the problem is: \\(\min \norm{w}_0 : Xw = y\\), as this does not allow \\(Xw \approx y\\).

#### Solution using 1 norm minimization
Just solve the linear program \\(\min \norm{w}_1 : Xw = y\\).

Arrival at sparse solution is guaranteed when some restricted isometry and incoherence properties hold for X. 

##### Restricted isometry constant for s
\\(1-\gd_{s} \leq \frac{\norm{Xw}^{2}}{\norm{w}^{2}} \leq 1+\gd_s, \forall w: \norm{w}_0 \leq s\\).

##### Incoherence/ almost orthogonality
\\(\abs{\dprod{Xw, Xw'}} \leq T_{s, s'}\\) for w, w' such that \\(supp(w) \inters supp(s') = \emptyset, \norm{w}_0 \leq s, \norm{w'}_0 \leq s'\\).

### 1 norm regularizer: Lasso
\\(\min f(w) + l \norm{w}_{1} = \min \norm{Aw-b}_{2}^{2} + l \norm{w}_{1}\\). Allegedly aka least absolute shrinkage and selection operator.

Same as minimizing f(w) subject to \\(\norm{w}_{1} < c\\). As you increase c, you get less and less sparse solutions. When \\(c\geq \norm{\hat{w}}_{1}\\) where \\(\hat{w}\\) is the unregularized least squares solution, you get least squares solution.

Want to get optimality condition \\(\gradient (f(w) + l \norm{w}_{1}) = 0\\), but \\(\norm{w}_1\\) not differentiable at all points; so take \\(l \norm{w}_{1} = l \sum_i sgn(w_i) w_i\\). Assume that \\(sgn(w_i')\\) around the solution \\(w'\\) is known.

Get conditions useful in Lasso solving modification of Least angles regression: Let \\(B = {o: w_i' \neq 0}\\), the basis/ support set. \\(\forall j\in B: a_{j}^{T}(y-Aw) = \gl sgn(w_j)\\), \\(\forall j\notin B: a_{j}^{T}(y-Aw) = \gl *sgn(w_j) \leq |\gl|\\). If A's columns have norm 1, get geometric meaning for \\(\gl\\): an upper bound for correlation of the residue with any feature!

#### Importance
Often yields sparse solutions: from geometry.

\\(\norm{w}_q\\) for \\(q \in (0, 1]\\) would also yield sparse solutions: see geometric interpretation for justification. These correspond to imposing the constraint \\(\norm{w}_q \leq c\\), which corresponds to the feasible region being non-convex. 1 norm is the least q which yields besides leading to a sparse solution, is also convex.

For importance of finding sparse models, see statistics survey.

#### The geometry
\\(\norm{w}_{1} < c\\) is hyper-rhombus, f(w) is a paraboloid, whose each level set is an ellipsoid. In general, w for min f(w) will lie outside the hyper-rhombus. So, the optimal w: the point where the edge of the hyper-rhombus meets the t-level set: f(w) = t, for the smallest t. Usually this happens where 2 edges meet, or where many \\(w_{i}\\) are 0: visualize in 2D; hence sparsity.

Compare with ridge regression.

