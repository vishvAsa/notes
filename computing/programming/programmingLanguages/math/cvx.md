+++
title = "CVX"
+++

## Distinctive features
### Disciplined convex programming framework
Makes specification easy. Abstracts away the mathematical and methodological details (like what underlying solver to call?).

Tries to mimic the way people formulate convex programs: drawing from a library of convex functions, combining them in various valid ways to preserve convexity. Similarly, it has a rich, expandable library of functions with known properties, plus it specifies valid ways of composing and combining them.

Good way to check convexity of the problem!

### Defects
A generic solver. Not suitable for large problems.

### Other features
It is closely integrated with matlab.

Possible to specify the underlying solver used.

## Help
See cvx manual on website, many examples, quickstart file.

## Specification structure
```
cvx_begin
    variable p(numParams);
    minimize norm(A*p - ones(numRows,1), Inf);
    [[or minimize(a + b), not minimize a + b]]
    subject to
    p >= 0;
    p <= 1;
cvx_end

Other modes:
cvx_begin sdp : interprets matrix inequalities as conic.
cvx_begin gp
```

All constraints and optimization function for minimization should be convex - else, cvx will reject the problem and try to provide a helpful message trying to explain the reason for the rejection.

### Matrix variables and constraints
Multiple constants/ variables are specified using matrices.

```
Matrix variables:
variable X(n, n) symmetric;

Semidefiniteness constraints:
X == semidefinite(n);
```

## Error reporting and dimensions
To stop verbosity: \verb cvx_quiet(true) .

### Scalars and 1*1 matrix
If you try to add a scalar and a 1*1 matrix lke $a^{T}b$, cvx fails with a cryptic error message.


#### Assuming dimensions of variables automatically
If you declare variable b intending for it to be a scalar; but then try to add it to a vector in the constraints, cvx does not report an error.

## Solution, program variable
### Datatype of the program variable
The program variable is different from matlab variables. While the optimization is underway, p is a cvx object. After optimization is done, p is the optimal solution - just a normal matlab variable.

### Solution variables
opt\_val, tolerance etc..


# Matlab optimization toolbox
Built into matlab.

## Unconstrained minimization
### fminsearch
Solves unconstrained optimization problem, where objective is assumed to be continuous. fminsearch can often handle discontinuity, particularly if it does not occur near the solution.

fminsearch uses the simplex search method. This is a direct search method that does not use numerical or analytic gradients as in fminunc.

### fminunc
fminunc does the same thing, except it cannot handle discontinuities. \chk

## fmincon
Finds a local minimum of a constrained nonlinear multivariable continuous function. Solves $\min f(x): c(x) \leq 0; c_{nl}(x) \leq 0; Ax \leq b; A'x = b'; l \leq x \leq u$.

It uses finite difference approximation of the gradient when the gradient is not available.

```
[x,fval,exitflag,output,lambda,grad,hessian] = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options,P1,P2, ...)
```

Parameters to ignore can be specified by passing [].

## Other functions
fminbnd : minimizes $f:R \to R$.

## Options
A structure with options.

```
options = optimset('Display','iter','TolFun',1e-2);
options = optimset(options,'TolX',1e-2);
```


