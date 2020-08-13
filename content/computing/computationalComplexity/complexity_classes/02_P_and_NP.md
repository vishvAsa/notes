+++
title = "02 P and NP"

+++
## P
P=coP. P completeness. CIRCUIT VALUE is P complete: In P by Spira and \\(DSPACE(log^{k} n) \subseteq P\\); . (Find out more.)

## Non determinism
### NP
Evaluatable by a non-deterministic turning machine. All computation paths end in polytime.

#### Acceptance of x
If \\(x \in L\\), there is at least 1 path which leads to acceptance of x. Else, all paths lead to rejection of x. Thus, assymetry in Acceptance/ Rejection criteria.

#### Other views
Membership queries \\(x \in L ?\\) have poly-size certificates verifiable in poly time; there is a polynomial sized proof of membership. \textbf{OP}: Show \\(P \neq NP\\) :-).

### co-NP
NP: \\(\exists\\) problems (SAT), coNP: \\(\forall\\) problems (UNSAT). \\(NP \inters coNP\\): \\(\exists\\) both membership and disqualifier cert.

### NP completeness
NP hardness vs completeness. TMSAT(TM string, input, time limit) NP compl.

#### SAT(b) is NP compl
(Cook - Levin): \\(SAT \in NP\\); Take L in NP; for \\(x \in L\\), \\(\exists\\) cert u, oblivious 1 work-tape poly-time TM M with M(x,u)=1 of time \\(T'(n) = O((T(n))^{2})\\); make vars for all T'(n) work-tape and input-tape cell visits: if cell is visited t times, there be t+1 vars to track t+1 values over time; make formula f from M!: (state, cells at T=0) \\(\land\\) (deduction of state, cell visit at T=1) \\(\dots\\); u and state sequence is certificate for satisfying f; size of formula is \\(O((T(n))^{2})\\); f efficiently convertible to CNF: each clause takes \\(2^{c}\\) time for constant c. For formula of size \\(O(T(n)\log T)\\), use \\(O(T(n)\log T)\\) OTM with similar trick, cert.

Reduction from k-SAT to 3-SAT: Use this trick repeatedly: \\((a \lor b \lor c \lor d) = (a \lor b \lor z) \land (\sim z \lor c \lor d)\\).

#### coNP completeness
UNSAT is in coNP; Also coNP complete : for any L in coNP, use reduction to SAT used by \\(\bar{L} \in NP\\) to get UNSAT version of L. \textbf{OP}: Is \\(coNP \neq NP\\)?

## Approximation algorithms
Approximate optimal solution to NP hard problem. Performance ratio of approx alg wrt optimal alg. For approximation algs using approximation of IP problem using LP, see randomized algs ref.
