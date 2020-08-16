+++
title = "2 Formulation & Solution"
+++

## Formulating the problem
### Focus on easily solved forms
Modellers of natural phenomena and engineers formulate optimization problems. They know what classes of problems are easy to solve. So, they often draw on a mental library of functions, composition rules to create, for example a convex program.

### Dealing with strict inequality constraints
Replace with non-strict inequalities.

### Use equivalent formulations (for convexity?)
You can always replace \\(f_0(x)\\) or \\(f_i(x)\\) \\
with a \\(p(f_i(x))\\) if p is monotonically increasing with \\(f_i\\), and if you can translate between \\(\argmin f_0(x)\\) and \\(\argmin p(y)\\) or between \\(f_i(x) \leq 0\\) and \\(p(y) \leq c\\).

Some formulations are more easily solved than others. In fact, it can turn a non convex problem to an equivalent convex problem.

Eg: \\(\min \norm{x}_2 + t\norm{x}_1 \equiv \min \norm{x}_2^{2} + t\norm{x}_1\\).

Also, can use the dual if strong duality holds.

## Problem parameters
### Not variables
These are different from variables. For example, in \\(\min \norm{Ax - b}^{2} + l \norm{x}^{2}\\), while \\(x\\) is a variable, l is a parameter to the optimization problem.

### Picking the best parameter
With problem parameters unspecified,\\
 you have a variety of optimization probems. Then, pick the best problem to solve, ie pick the best parameter.

#### Qualitative judgement
Set various values for the problem parameters, solve them, and pick the parameter whose solution appears best, from the perspective of the application domain.

#### Theoretical constraints
Theoretical analysis of the problem domain sometimes connect the parameter values with desirable traits in the solutions.

## Specification framework engineering
Specification frameworks abstract away from the \\
mathematical details, methodological details (which underlying solver to call), make specification easy. They lead to wide application.

It is a good idea to mimic the way people go about naturally formulating optimization problems for a certain class: eg by drawing on a library of functions known to be convex and rules of composition. Eg: cvx for disciplined convex programming.

