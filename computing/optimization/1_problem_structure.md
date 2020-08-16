+++
title = "1 Problem structure"
+++

## The problem
\\(\min f_{0}(x): V \to F\\) subject to constraints \\(f_{i}(x) \leq b_{i}\\). Vector \\(x\\) is optimization variable of d dimensions. \\(f_0\\) is optimization fn. \\(b_i\\) are limits/ bounds for constraints.

### Standard (primal) form
\\(\min_x f_{0}(x): \set{f_{i}(x) \leq 0}, \set{h_{i}(x) = 0} \\): all are \\(V \to F\\) functionals.

#### Explicit constraints
\\(f_i\\) and \\(h_i\\) are explicit constraints. Problem is unconstrained if it has no explicit constraints.

#### Implicit constraints
\\(x \in D  = \inters dom(f_i) \inters dom(h_i)\\).

#### Optimal value
\\(p^{*} = \inf \set{f_{0}(x): f_{i}(x) \leq 0, h_j(x) \leq 0 \forall i, j}\\). \\(p^{*} = \infty\\) if problem is infeasible, or no \\(x\\) satisfies constraints. \\(p^{*} = - \infty\\) if it is unbounded below.

### Equivalent formulations
#### Epigraph formulation
\\(\min_{x,t} t: f_{0}(x) \leq t, \set{f_{i}(x) \leq 0}, \set{h_{i}(x) = 0} \\): all are \\(V \to F\\) functionals.

#### Linear equiality constraints
Got \\(\min_x f_{0}(x): \set{f_{i}(x) \leq 0}, Ax-b = 0\\). Take H which spans N(A), particular solution to Ax -b =0, \\(x_0\\). Then, can rewrite as: \\(\min_v f_{0}(Hv + x_0): \set{f_{i}(Hv + x_0) \leq 0}\\).


#### Augmented/ Slack form
Replace inequality constraints \\(\set{f_{i}(x) \leq 0}\\) with \\(f_i(x) + s_i \leq 0; s_i \geq 0\\).

### Conic (in)equalities constraints
\\(\min_x f_{0}(x): \set{f_{i}(x) \preceq_{K_i} 0}, \set{h_{i}(x) = 0} \\). Constraints are specified using conic (in)equalities.

### Special cases
#### Feasibility problem
\\(\min 5.5\\): \\(h(x) = 0, f(x) \leq 0\\).

### Perturbed problem
Replace constraints \\(f(x) \leq 0, h(x) = 0\\) with \\(f(x) \leq u, h(x) = v\\) to get problems parametrized by u, v; Denote optimum by \\(p^{*}(u, v)\\). Now can study sensitivity of problem to perturbations.

Large \\(u_i\\) implies loosening constraint \\(f_i\\); similarly constraints can be tightened. How will the optimum change in response?

## The solution
### Feasible region
Feasible region D satisfies all constraints.

#### Active, inactive constraints at x
Active constraints: \\(\set{h_i(x) = 0}\\), and \\(\set{f_i: f_i(x) = 0}\\) at \\(x\\). Inactive constraints: \\(f_i(x) < 0\\) at \\(x\\).

##### Strict feasibility
x is strictly feasible if \\(x \in int(D)\\): ie all ineqalities \\(f_i(x) < 0\\) hold strictly.

#### Active constraints and their gradient
##### Constraint surface, gradient
The level set \\(h_i(x) = 0\\) is a d-1 dimensional (possibly closed) surface. For any \\(x\\) in this constraint surface, \\(\gradient h_i(x) \perp\\) the tangent to \\(\set{x: h_i(x) = 0}\\).

##### Direction of the gradient
Consider level-set \\(f_i(x) = 0\\). \\(\gradient f_i(x)\\) will be oriented towards increasing \\(f_i(x)\\), that is, away from the interior of \\(\set{x: f_i(x) \leq 0}\\). See derivatives of functionals section in vector spaces survey.

##### Intersection of constraint surfaces
So, for any \\
\\(x:h_i(x) = 0 \forall i\\), \\(\sum l_i \gradient h_i(x) \perp\\) the tangent to \\(\set{x: h_i(x) = 0 \forall i}\\).

Want \\(\min f_0(x)\\) in this contour (constraint surface); or find \\(\inters\\) of constraint surface with the smallest contour of \\(f_0\\).

### Optimality criteria
#### Optimal x
\\(x^{*}\\) is optimal if \\(f_0(x^{*}) = p^{*}\\). Similarly, locally optimal \\(x\\) is also defined: optimality when \\(x\\) constrained to some small ball in feasible set.

#### Connection with gradient
x optimal iff it is feasible and \\(\gradient f_0(x)^{T}(y-x) \geq 0 \forall y\\) feasible.

#### Unconstrained fn
##### Differentiable f
If f differentiable, \\(x\\) is a local minimum only if, \\(\forall y \in N_\eps(x): \gradient_{(y-x)}f(x) = \dprod{(y-x), \gradient f(x)} \geq 0\\). Similar case for local maxima.

So, \\(x\\) is a local extreme value only if \\(\gradient f(x) = 0\\): else, could move a little bit and decrease/ increase f(x). \\(x: \gradient f(x) = 0\\) is a critical point.

###### Solving for x
Conditions like \\(\gradient f(x) + l\frac{b+x}{\norm{b+x}} = 0\\) need some clever algebra. Example, try the change of variables \\(e = b+x\\) to simplify the above.

##### Local extreme point
Using 2nd order expression for \\(f(x + u) = f(x) + u^{T}D^{2} f(x+su)u\\); so if \\(D^{2} f(x) \succeq 0\\), \\(x\\) is minimum; if \\(D^{2} f(x) \preceq 0\\), \\(x\\) is a maximum; else \\(x\\) is a saddle point.

##### Extension to convex non-differentiable f
Take subdifferential \\(\subdifferential f\\); \\(x\\) is an extreme point only if \\(0 \in \subdifferential f\\), as it implies that \\(f(x+d) \geq f(x)\\).

#### Gradient of objective, the active constraint surface
Suppose that optimal \\(x\\) occurs on the active constraint surface. What is the relationship of \\(\gradient f_0(x)\\) with \\(\gradient h_i, \set{\gradient f_j}\\), where the latter is the set of active constraints?

\\(\gradient f_0(x)\\) \\(\perp\\) to constraint surface at optimal \\(x\\): else could move short distance along contour and decrease \\(f\\). In other words, if you take any curve \\(g:R \to R^{n}\\) in the constraint surface, passing through \\(x\\), \\(f_0(g(t))\\) would attain a minimum when \\(g(t) = x\\); so can apply \\(\gradient f_0(g(t)) = \gradient f_0(x) Dg(t)= 0\\) for any such curve \\(g\\); so \\(\gradient f_0(x) \perp\\) tangent to the active constraint surface at \\(x\\).

So, want to achieve \\(\gradient f_0(x) + \sum_i m_i \gradient h_i(x) + \sum_j l_j \gradient f_j(x) = 0\\).

###### Extension to  non-differentiable f
The above reasoning and optimality condition can be generalized to non differentiable \\(f_i(x)\\): we just need to interpret \\(\gradient f_i \in \subdifferential f_i(x)\\). If this condition were violated, we could still move slightly along \\(\gradient f_0(x)\\) and reduce the objective, while staying in the feasible region.

##### Direction in case of active ineq constraints
If \\(x\\) is optimal, as \\(f_0(x)\\) is being minimized, \\(\gradient f_0(x)\\) - the direction of increasing \\(f_0\\)- points towards the interior of the constraint surface; unlike \\(\gradient f_i(x)\\).

So, \\(l_j \geq 0\\) for active inequality constraints. \\(\gradient f_0\\) is not constrained in this manner by inactive inequality constraints: So, for all inactive \\(f_i(x)\\): can use corresponding \\(l_i = 0\\).

As earlier, this condition and the reasoning behind it can be generalized to non-differentiable convex \\(f_i\\).

##### General condition
\\(\gradient f_0(x) + \sum_i m_i \gradient h_i(x) + \sum_i l_i \gradient f_i(x) = 0\\), with \\(l_i \geq 0\\), \\(h(x) = 0, f(x) \leq 0\\).

Equivalently, \\(D f_0(x) + \sum_i m_i Dh_i(x) + \sum_i l_i Df_i(x) = 0\\). \exclaim{This can be used when \\(f\\), h are matrix functionals, as in SDP's!}

###### Extension to convex non-differentiable f
Take subdifferential \\(\subdifferential f_i\\); \\(x\\) is an extreme point in the feasible region only if the general condition holds, using the notation \\(\gradient f_i(x) \in \subdifferential f_i(x)\\). Reasons for this were explained elsewhere.

##### Optimality in special cases
If problem is constrained only by linear equalities \\(Ax = b\\), you get the condition: \\(\gradient f_0(x) + A^{T}m = 0\\).

#### Sufficiency for local optima
Consider \\(x'\\), a local optimum. \\(x'\\) is a local optimum iff the optimality condition holds. So, can enumerate feasible \\(x'\\) which satisfy the optimality conditions, and pick the lowest to be the global optimum!


#### Conic inequality constrained problems
Some constraint qualifications, like Slater's conditions for convex programs, guarantee strong duality. So, \\(\exists l^{*} \succeq_{K^{*}} 0, m^{*}: g(l^{*}, m^{*}) = \inf_x L(x, l^{*}, m^{*}) = f_0(x^{*})\\). If L is differentiable, this yields the optimality criterion: \\(\gradient_x L(x, l, m) = 0, h(x) = 0, f(x) \prec 0\\).

### General strategies
For solution strategies for particular cases, like linear, quadratic, convex, non-convex programming: see elsewhere.

#### Hardness of finding global optimum
In general, there are many local minima. Even when you have an expression for f(x), listing its minima is often not possible with analytic methods. Eg: f'(x) may be a quintic polynomial, for which there is no closed form expression for the roots.

In general, cannot find a global optimum in reasonable time: So, one must be satisfied with a local optimum or search for a long time.

Only in certain special cases, you can get arbitrarily close to the global optimum in reasonable time.

#### Bisection method: using feasability solvers
Take problem in epigraph form. \\(\min_{x,t} t: f_{0}(x) \leq t, \set{f_{i}(x) \leq 0}, \set{h_{i}(x) = 0} \\). For any fixed t, this becomes a feasability problem. Can use binary search to find the lowest value of \\(t\\) for which the feasability problem is satisfied.

Can do multi-parameter bisection similarly, when many parameters specify the objective.

## Constraints in the objective
### Constrained and unconstrained formulations: equivalence
#### Lagrangian functional
The Lagrangian functional \dfn \\(L(x, l, m) = f_{0}(x) + \sum m_{i}h_{i}(x) + \sum l_{j}f_{j}(x)\\).

##### Definition motivations
you can rewrite the constrained optimization problem in the standard form as an unconstrained optimization problem. Also, you can define the dual problem.

#### Unconstrained program from constrained problem
As seen while considering the geometry of the problem, optimality criterion: \\(\gradient f_0 + \sum l_i' \gradient f_i + \sum m_i' \gradient h_i = 0\\) for certain \\(l'\geq 0, m'\\), where \\(\gradient f_i\\) are represent subgradients in the case of convex non-differentiable \\(f_i\\).

So, take \\(L(x, l', m') = f_{0}(x) + \sum m_{i}'h_{i}(x) + \sum l_{j}'f_{j}(x)\\) for this \\(l', m'\\); see that the optimality criterion is satisfied when \\(\gradient_x L(x, l', m') = 0\\).

So, there exists an equivalent unconstrained problem \\(\min_x L(x, l', m')\\) for every constrained optimization problem. 

This analysis holds for conic (in)equality constrained problems too.

##### Objective - constraint tradeoff
\\(L(x, l, m)\\) looks like the scalarized form of a vector optimization problem, with \\(l\\) and \\(m\\) representing the tradeoff between the various parts of the objective.

#### Lagrangian multipliers and tightness of constraints
\\(l, m\\) are called lagrangian multipliers. 

Suppose that \\(f_i(x) \leq 0\\) is changed to \\(f_i(x) \leq 5\\): \\(f_i\\) now allows a greater degree of freedom, so minimizing \\(f_i\\) is now a less critical part of the objective. Similarly, Consider any inactive constraint \\(f_i\\): the corresponding multiplier will be 0.

Also explains why \\(l_i \geq 0\\) should hold for the problem \\(\min_x L(x, l, m)\\) to make sense: higher values of \\(f_i\\) should be penalized.

#### Constrained program from unconstrained problem
Consider the problem \\(\min_x L(x, l, m)\\) for \\(l\geq 0\\). Considering the continuous relationship \\(c()\\) between \\(l_i\\) and the tightness of constraints \\(f_i(x) \leq c(l_i)\\), we can conclude that there is an constrained problem equivalent for every unconstrained problem.

## Dual problem
### Dual functional
#### Definition
Take \\(g(m, l) = \inf_{x} L(x, m, l)\\). For convex L(), do this by setting \\(\gradient_x L(x, m, l) = 0\\).

\\(g\\) is always concave: inf of linear functions in \\(m\\) and l.

##### Uniqueness
Observe that optimization problems differing only in RHS of equality and inequality constraints have distinct lagrangian functionals, and thence distinct dual functionals.

#### Connection with conjugate of the objective
##### Linear constraints case
Consider \\(\min f_0(x): Ax \leq b, Cx = d\\). \\(g(m, l) = -f_0^{*}(-A^{T}l - C^{T}m) - b^{T}l - d^{T}m\\).

This holds in many other cases too. So, simplifies derivation of dual if conjugate is known. Also, simplifies derivation of the conjugate if the dual is known.

#### As intercepts of supporting hyperplane to an image of the domain
Consider \\(G = \set{(f(x), f_0(x)) \forall x \in dom (f_0) }\\). Then, \\(g(l, m) = \inf_{(u, t) \in G} (t + l^{T}u) = \inf_x L(x, l, m)\\). \\(t + l^{T}u = k\\), for fixed k is a hyperplane. So, for fixed l, m: the hyperplane \\(l^{T}u + t = g(m,l)\\) is the supporting hyperplane for G; and g(m, l) is the intercept of this hyperplane on the \\(f_0\\) axis. \exclaim{Interpretation fails if hyperplane is vertical!} This is used in proof of slater's condition.

As we are interested in \\(f(x) < 0\\), we consider only supporting hyperplanes which support G in that half-space. The convex dual problem tries to find the top intercept of all hyperplanes.

This view of dual variables is useful in proving strong duality from constraint qualifications like \\(x \in relint(F)\\), where F is feasible set.

##### Epigraph view
Can consider \\(G' = \set{(u, v): \exists x \in dom(f_0): f(x) \leq u, f_0(x) \leq v}\\); so \\(G \subseteq G'\\).

#### For perturbed problem
\\(g'(m, l) = g(m, l) - u^{T}l - m^{T}v\\).

#### Lower bounds on solution to the primal
\\(g(m, l) \leq L(x, m, l) \leq f_0(x)\\) for all dual feasible \\(m\\) and l and primal feasible \\(x\\); as \\
\\(\sum m_{i}h_{i}(x) = 0; \sum l_{j}f_{j}(x) \leq 0\\): as \\(l \geq 0, f(x) \leq 0\\).

So, as \\(x^*\\) is primal feasible, \\(\forall l \geq 0\\): \\(g(m, l) \leq f_0(x^{*}) = p^{*}\\).

Good way of showing if the problem is infeasible: \\(d^{*} = \infty\\).

\exclaim{Applies to the case of conic inequalities}: just use the fact that \\(l \succeq_{K^{*}}0\\) to see \\(l^{T}f_i(x) < 0\\).

### Convex Dual problem
\\(\max g(m, l) : l \geq 0\\). Often, implicit constraint \\(m, l \in dom(g)\\) made explicit.

Generalizable to primals constrained by conic inequalities: just use \\(l \succeq_{K^{*}} 0\\), using dual of the cone K used to specify conic inequality constraints f().

Gives information about the sensitivity of the solution to perturbations in the input.

Solution notation: \\(m^{*}, l^{*}\\), optimal value: \\(d^{*}\\).

#### Picking the right primal
Equivalent formulations of the primal can lead to very different duals. Some duals can be hard to analyze, or useless (eg: constant); so reformulation of the primal (eg: by making implicit constraints explicit or vice versa) is a good trick.

#### As finding top intercept of supporting hyperplane
See dual function section.

### Duality gap b/w primal, dual solutions
\\(p^{*} - g(l^{*}, m^{*})\\) is the duality gap. As shown while considering the properties of the dual function, this quantity is non-negative.

#### Strong duality
When this is 0, strong duality holds: Eg: Many cases in Convex optimization.

Strong duality can also hold for non-convex problems.

#### Strong duality: optimality conditions
##### Optimality conditions using strong duality
Aka KKT conditions. Necessary conditions. Also sufficient when solving convex optimization: Certificate of optimality.

###### Primal and dual feasability
Primal feasibility: \\(f(x^{*}) \leq 0, h(x^{*}) = 0\\).

Dual feasiblity: \\(l^{*} \geq 0\\).

###### Complimentary slackness
\\(\forall j: l_{j}^{*}f_{j}(x^{*}) = 0\\). Pf: \\(f_0(x^*) = g(l^{*}, m^{*}) \leq f_0(x^*) + \sum m_{i}^{*}h_{i}(x^{*}) + \sum l_{j}^{*}f_{j}(x^{*}) \leq f_0(x^*)\\). So, as \\(l\geq 0, f(x) \leq 0\\): \\
\\(\sum l_{j}^{*}f_{j}(x^{*}) = 0;\ \forall j: l_{j}^{*}f_{j}(x^{*}) = 0\\).
 
If \\(l_i ^{*}> 0, f_i(x^{*}) = 0\\), if \\(f_i(x^{*})<0, l_i^{*} = 0\\): one of these is 0, hence the name.
 
At this point, \\(f_0(x^{*}) = L(x^{*}, l^{*}, m^{*}) = g(l^{*}, m^{*})\\).
 
###### Optimality/ stationarity
As \\(p^{*} = g(l^{*}, m^{*})\\), \\(x^{*} = \argmin_x L(x, l^{*}, m^{*})\\): \\ we have \\(\gradient_{x^{*}}L(x, l^{*}, m^{*}) = 0\\). See geometric view of relationship between gradients of \\(f, h, f_0\\) at optimal \\(x\\) for why this should hold for some \\(l, m\\) in general, when some nice conditions are met. With this condition, we are identifying \\(l, m\\) as being none other than the solution to the dual problem.

This can be extended to the case where \\(L(x, l^{*}, m^{*})\\), that is \\(f_0\\) or \\(f\\) or \\(h\\) are not differentiable: in such a case, we just use some sub-gradients from the corresponding subdifferential set instead of gradients while writing the conditions.

\subparagraph{Extension to nondifferentiable convex f}
Applying the optimality criterion for convex non-differentiable functions we see that the same optimality criterion applies to problems involving non-differentiable convex constraint functionals: one just needs to interpret \\(\gradient f_i(x) \in \subdifferential f_i(x)\\).

##### Primal dual solvers
They try to solve both the primal and dual problems simultaneously - maybe one of them gets solved quickly!

#### Strong duality: Meaning of dual variables
##### As weights in lagrangian form
Take problem in standard form, get dual function \\(g(l, m) = \min_x L(x, l, m)\\); from strong duality, get: \\(\max_{l, m} g(l, m) = \max_{l, m} \min_x L(x, l, m) = p^*\\). Note that \\(L(x, l, m) = f_0(x) + \sum_i l_i(f_i(x) - u_i) + \sum_i m_i(h_i(x) - v_i)\\) if constraints are of the form \\(f(x) \leq u, h(x) = v\\) : the constants u and v are included.

This gives a way to get the 'constraints in the objective' form of the optimization problem, by solving the hard-to-solve problem of finding the saddle-point corresponding to \\(\max_{l, m} \min_x L(x, l, m)\\) in order to get \\(l^*, m^*\\).

##### Sensitivity analysis
Using weak duality, for perturbed problem described earlier, get: \\
\\(p^{*}(u, v) \geq g(l^{*}, v^{*}) - l^{T}u - m^{T}v = p^{*}(0, 0)- l^{*T}u - m^{*T}v\\), using strong duality.

So, for +ve \\(l_i\\), large -ve perturbations in \\(u_i\\) cause \\(p^{*}\\) to increase.

Also if \\(p^{*}\\) differentiable: \\(\gradient_u p^{*}(u, v) = -l, \gradient_v p^{*}(u, v) = -m\\).


#### Constraint qualifications to ensure strong duality
See Slater conditions in convex optimization section. Others exist. Can derive some from the geometric/ supporting hyperplanes view of the dual problem.

## Vector optimization
The objective function is a vector to vector function. Comparison among vectors could be wrt any pointed cone.

Objective often written as \\(\min (f_{01}(x), f_{02}(x) ..)\\).

### Multicriterion optimization
Special case where inequalities are wrt the non-negative orthant cone.

### Solutions
#### Optimality
Feasible \\(x\\) is pareto optimal if \\(f_0(x)\\) is the minimal value of feasible region. If \\(f_0(x)\\) is the minimum value, then \\(x\\) is optimal.

#### Scalarization
Replace the objective with \\(l^{T}f_0(x)\\): defines a set of trade-offs among the various measures of goodness which form the vector \\(f_0\\).

#### Visualiztion: tradeoff curve
Visualize the image of the feasible region in the range of \\(f_0(x)\\), where the axes are various dimensions of the image of \\(f_0\\).

Pareto optimal points lie in the lower border of this image; for them, no dimension of \\(f_0(x)\\) can be reduced without hurting other dimensions of \\(f_0(x)\\): these are the minimal points of this set.

These correspond to different scalarizations of \\(f_0\\). The endpoints correspond to the case where 0 weight is assigned to some dimension(s) of \\(f_0(x)\\).

This curve is actually helpful for the enduser to pick a good scalarization.

## Prove properties of solution
### Motivation, Notation
Suppose that one wants to solve a problem or some special case of it, \\(Q\\). One often wants to claim that a solution to \\(Q\\) can be obtained by looking at the solutions of the optimization problem \\(P\\) which is often easier to solve.

One then needs to be able to rigorously show that the solution to \\(P\\) is also the solution to \\(Q\\).

#### Example
In compressive sensing, \\
\\(Q \dfn \argmin \norm{x}_0 : Ax = b\\) and \\(P \dfn \argmin \norm{x}_1 : Ax = b\\).

##### Uniqueness
If one can either show that there is a unique solution to \\(P\\), or if we can show that one can efficiently search the small number of solutions to \\(P\\) in order to find a solution to \\(Q\\), we have now have an efficient algorithm to solve \\(Q\\).

### General proof technique
Specify the 'optimality' properties \\(C_P(x)\\) (certificate/ witness) which are satisfied exactly by solutions to \\(P\\). Do the same for \\(Q\\) and specify \\(C_Q(x)\\). The idea is to show that \\((\exists x: C_Q(x) \land C_P(x))\\).

Construct a candidate solution \\(x\\) to \\(P\\) which simultaneously satisfies some subset of \\(C_Q(x) \union C_P(x)\\). Show that this candidate then satisfies the remaining properties in \\(C_P(x) \union C_Q(x)\\).

#### Possible computational intractability
Even though construction of the solution to \\(P\\) and \\(Q\\) described above is a valid proof technique, it often does not imply that we have an efficient algorithm to solve \\(Q\\) using just the conditions \\(C_Q\\) and \\(C_P\\). This is because, to completely specify \\(C_Q\\), one needs to know the solution to \\(Q\\)!

Eg: In the compressive sensing example, for \\(C_Q(x)\\) to be completely specified, one needs to know not just \\(\norm{x}_0\\), but also the coordinates \\(\set{i: x_i \neq 0}\\).

