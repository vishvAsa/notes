+++
title = "Approximation algorithms"

+++
## LP based Approximation algorithms
Rephrase (maybe NP hard) problem as Integer Programming problem; Make LP relaxation; solve in polytime; translate solution by rounding; make \\((\del, \eps)\\) approximation guarantees. Rounding choices: To closest integer, or randomized rounding.

### Vertex cover problem
G=(V,E). IP: Vars \\(v_{i}\\) = 0 or 1, \\(\forall (i,j) \in E, v_{i}+v_{j} \geq 1\\), \\(\min \sum v_{i} = ?\\); LP relaxation: \\(\hat{v}_{i} \in [0,1]\\); solution \\(\sum \hat{v}_{i} \leq opt \leq \sum v_{i}\\); round to nearest int to get approx soln \\(\set{v_{i}}\\); as \\(v_{i} \leq 2 \hat{v}_{i}\\): \\(\sum v_{i} \leq 2 opt\\).

Max SAT.

\tbc

## Semidefinite programming based approximation algs

\tbc
