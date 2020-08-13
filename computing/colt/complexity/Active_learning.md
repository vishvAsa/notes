+++
title = "Active learning"

+++
## mq only model
Finite attributes around. Exact learning using only membership queries (mq). Scenario: Robot explores labyrinth.

Constrained instance oracle for f: Takes partial assignment P and prediction b, if possible, extends P to a complete assignment A such that f(A) = 1-b.

Lower bound: By information theory, atleast \\(\log |C|\\) mq needed.

### ae learning
#### Monotone functions
Learnability in mq only model does not always imply ae learnability for deterministic algorithms.

But, implied for monotone functions. Pf: Let constrained instance oracle be simulated using \\(t(\\)n\\(,r, |c|)\\) mq. Make mq only algorithm with \\(q(\\)n\\(, |c|)\\) bound, get mq algorithm with \\(2(r+1)t(\\)n\\(,r, |c|)q(\\)n\\(, |c|)+r(\log n +1)\\) bound. Use the MBQ algorithm to aeMBQ algorithm conversion, but use this trick to find relevant vars: When mq is made on partial assignment P to N, extend P to A, find c(A), use constrained instance query oracle to find an assignment B with \\(c(B) \neq c(A)\\). t(\\(n\\),r, |c|) for monotone functions is a constant.

#### Parity fn
To learn any parity fn f, n linearly independent mq are both necessary and sufficient: Consider the \\(GF_2\\) representation of parity funcitons and assignments in Boolean fn ref.

But, rand algorithm can strongly ae learn: Simulate constrained instance oracle by uniformly sampling assignments to unassigned variables and making mq's with them.

## mq and eq model
### Learning DFA with membership queries
Keep / update a binary classification tree: leaves are states in actual DFA denoted by access strings; internal nodes are distinguishing strings which lead to accptence from one bunch of states and rejection from another. Make hypothesis DFA thence: sift access string + alphabet + dist. string; Use equivalence queries to get counterexample; simulate prefixes of counterexample in both hypothesis DFA and using membership queries with distinguishing strings in classification tree to distinguish some new state; repeat.

(\textbf{Myhill-Nerode}) So, minimal DFA unique!

#### Learning without reset, using homing sequence h
Only strongly connected component learnt. Run algorithm in parallel with many start states; For every membership query, execute h first to return to some state; awaken the right algorithm; run the reminder of the pending membership query and other processing.

#### Find homing sequence h
\textbf{Homing sequence in a DFA}: A string executed on DFA gives a sequence of outputs (+/-); if homing sequence, output sequence determines destination state irrespective of output.

Start with empty h; run no-reset learning algorithm to get a generalized binary classification tree (root can be one of states corresponding to some output sequence for h); if tree outgrows size(DFA) use randomization to find equivalent states: access string1 + dist str and string1 + dist str yield same result (accept / reject); append their distinguishing string to h; repeat.