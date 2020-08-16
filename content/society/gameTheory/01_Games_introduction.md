+++
title = "01 Games: introduction"

+++
## Players, strategies, utilities
Players \\(P = \set{p_{i}}\\). A strategy is not a move but an algorithmorithm to make moves; compare with decision procedure in decision theory in statistics ref. \\(S_{i}\\): strategy set of \\(p_{i}\\). Strategy vector (strategy profile): \\(s = (s_{1}, .. s_{n})\\). \\(s_{-i}\\): s sans \\(s_{i}\\).

### Mixed/ randomized strategies
Independent mixed strategy of i: a Prob Distr over \\(S_{i}: D_{i}\\).

Mixed strategy profile, perhaps \\(p_{i}\\) coordinated: Probability distribution over \\(\times_{i}S_{i}\\): D.

### Utility
Preference ordering of outcomes for i: Cost, utility of strategy:\\
 \\(c_{i}(s) = -u_{i}(s)\\). Compare with risk in decision theory in statistics ref.

#### eps dominated strategy
\\(s_{i}\\) is \\(\eps\\) dominated by \\(s_{i}'\\) if, \\(\forall s_{-i}\\) :\\
\\(u_{i}(s'_{i}, s_{-i}) \geq u_{i}(s_{i}, s_{-i}) + \eps\\). Stronly vs weakly dominated strategy. Incomparable strategies: \\(s_{i}\\) may be better wrt some \\(s_{-i}\\), but worse wrt some other \\(s_{-i}'\\).

## Simultaneous move game
Here, strategy = move. Maybe \\(\forall i, j, S_{i} = S_{j}\\).

### Standard (Explicit) form
Cost (or utility) matrix: \\(C_{i,j}\\): costs (or utility) to P if they select \\((s_{i}, s_{j})\\). Memory \\(\Omega(|S_{i}|^{n})\\).

### Solution concept
Rule for predicting how game will be played. Prediction is \textbf{solution} or value. Some solution concepts are better than others for certain games.
