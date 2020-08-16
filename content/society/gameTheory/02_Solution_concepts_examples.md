+++
title = "02 Solution concepts: examples"

+++
## Dominant strategy solution
\\(\forall i\\), \\(best(s_{i})\\) unique, independent of \\(s_{-i}\\): \\(u(s_{i}, s'_{-i}) \geq u(s'_{i}, s'_{-i}) \forall s'\\). Eg: Prisoner's dilemma; not: Battle of sexes. So, players individually select strategies. May not lead to optimal payoff for any \\(p_{i}\\).

### Prisoner's dilemma
Cost matrix \\(C = \mat{(4, 4) & (1, 5)\\(5, 1) & (2, 2)}\\). s = (2, 2) best for both, but unstable: If \\(p_{1}\\) sets \\(s_{1} = 2\\), \\(p_{2}\\) tempted to set \\(s_{2} = 1\\). \\(s = (1, 1)\\) stable. Optimal selfish strategy of \\(p_{1}\\) independent of \\(p_{2}\\)'s actions. Can be extended to multi-player game.

### Tragedy of commons
n players; 1 common bandwidth. Strategy about demanding a portion. So, \\(\infty\\) strategies for each: \\(s_{i} \in [0,1]\\). If \\(\sum s_{i} > 1\\), payoff for all 0; As \\(\sum s_{i}\\) increases, utility decreases for all; so utility \\(u_{i}(s_{i}) = s_{i}(1-\sum_{j\neq i}s_{j})\\). So, maximizing, best strategy: \\(s_{i} = (1-\sum_{j\neq i}s_{j})/2\\). Unique stable soln: \\(s_{i} = (1+n)^{-1} \forall i\\). \\(\sum u_i = \frac{n}{(1+n)^{2}} \approx n^{-1}\\); so tragedy. A cartel would be better!

### 2nd price auction
Aka Vickery. 1 shot Auction of an item: \\(p_{i}\\)'s value for item is \\(v_{i}\\); bids \\(s_{i}\\); if \\(p_{i}\\) looses, \\(u_{i}\\) = 0; wins if \\(s_{i} = max_{j}s_{j}\\). If \\(p_{i}\\) wins, \\(u_{i} = v_{i} - s_{j}\\), where j's bid is next highest. Dominant strategy: \\(s_{i} = v_{i}\\)! Item auctioned to \\(p_{i}\\) who values it most: 'socially optimal outcome'.

#### Revelation principle
All \\(p_{i}\\) can give Game Designer (GD) \\
valuation function, let GD play game. Maybe need exponential communication for value function. Also, security needed.

## Iterated elimination of str dominated strategies
Take\\ game matrix. For each player: Amongst the strategies left, eliminate all dominated strategies.

Sometimes left with many incomparable strategies.

Elimination for weakly dominated strategies could lead to elimination of Nash equilibrium strategies.

## Nash equilibrium

Defn: D or \\(\set{D_{i}}\\) where even if all \\(p_{i}\\) know all \\(D_{i}\\), no treachery profitable. Maybe D not unique. So each \\(p_{i}\\) can decide \\(D_{i}\\) if he knows \\(D_{-i}\\).

### Pure strategy
s is Nash equilib if \\(\forall i, s': u_{i}(s_{i}, s_{-i}) \geq u_{i}(s'_{i}, s_{-i}) \\). Eg: Battle of sexes. Includes dominant strategy solns.

#### (Anti) Coordination games
Battle of the sexes: \\(p_{1}, p_{2}\\) gain when \\(s_{1} = s_{2}\\). Players select strategies together. \\(C = \mat{(4, 5) & (1,1)\\(2, 2) & (5, 4)}\\). Multiple equilibria; Eg: \\(Pr(s = (1,1)) = 1\\).

### Randomized (mixed) strategies
Not Pure strategy s, but distr D. Risk neutral \\(p_{i}\\) maximize \\(u_{i}(D) = E_{s \distr D}[u_{i}(s)]\\), with \\(Pr_{s \distr D}(s) = \prod_{i} Pr_{s_{i} \distr D_{i}}(s_{i})\\).

D or \\(\set{D_{i}}\\) is mixed strategy Nash equilib if \\(\forall i, D': u_{i}(D) \geq u_{i}(D'_{i}, D_{-i})\\). (Check) Eg: Matching pennies. Generalizes pure strategy equilib.

#### Matching pennies \\(C = \mat{(1, -1) & (-1,1)\\(-1,1) & (1, -1)}\\). A 0 sum game; so \\(p_{i}\\) selects strategy independently. No stable s; so, \\(p_{1}\\) randomizes \\(s_{1}\\) to thwart 2.

### Existance of Equilibria
(Nash) Any game with \\(|P|, |S_{i}|\\) finite, \\(\exists\\) mixed strategy Nash equilib. \why

Some games don't have Nash equilibrium.

### Properties
If \\(D_{i}\\) part of Nash equilibrium,\\
 every \\(t \in D_{i}\\) is a best response to \\(D_{-i}\\): \\(E_{D_{-i}}[t, D_{i}]\\) is maximum: else there could've been 0 wt on t.

### Time Complexity
Finding Nash equilibria is PPAD complete.

Games representable by digraphs with indegree, outdegree \\(\leq 1\\); problem is to find source or sink other than a 'standard source'. Like Lemke - Howson polytope.

\tbc

### eps Nash equilib
A special case: \\(\forall i, D': u_{i}(D) \geq u_{i}(D'_{i}, D_{-i}) - \eps\\)

## Correlated equilibrium D
(Aumann). Coordinator has distr D, samples s from D, tells each \\(p_{i}\\) its \\(s_{i}\\). \\(p_{i}\\) not told \\(s_{j}\\), but knows it is correlated to \\(s_{i}\\); so knows all \\(Pr(s_{-i}|s_{i})\\). D known to every \\(p_{i}\\). D is correlated equilib if it is not in any \\(p_{i}\\)'s interest to deviate from s, assuming other \\(p_{i}\\) follow instructions: \\
\\(E_{s_{-i} \distr D|s_{i}} [u_{i}(s_{i}, s_{-i})] \geq E_{s_{-i}\distr D|s_{i}} [u_{i}(s'_{i}, s_{-i})] \\).

Mixed strategy Nash equilibrium is the special case where \\(D_{i}\\) are independently randomized (with diff coins).

Not well motivated in some games.

Coordinator picks correlated equilibrium by optimizing some fn (Eg: total payoff or avg payoff).

### Regret defn
\\(f_{i}:S_{i} \to S_{i}\\), regret \\(r_{i}(s,f) = u_{i}(f_{i}(s_{i}), s_{-i}) - u_{i}(s)\\):\\
 \\(E_{s \distr D}[r_{i}(s,f_{i})] \geq 0\\).

### eps correlated equilibrium
\\(E_{s \distr D}[r_{i}(s,f_{i})] \leq \eps\\).

### Traffic light/ Chicken \\(C = \mat{(-100, -100) & (1,0)\\(0,1) & (0, 0)}\\). s = (1, 2) and (2, 1) stable; so coordinator picks one randomly. This correlation increases payoff as the low expected utility mixed strategy \\(D_{i} = (101^{-1}, 1-101^{-1})\\) is avoided.

### Reduction to LP
Unknowns: concatenation of vectors \\(\set{D_{i}}\\). If n players, m strategies each, mn unknowns. Make inequalities: \\(U_{i}(D_{i}, D_{-i}) \geq U_{i}(D_{i}', D_{-i})\\); \\(\norm{D_{i}}_{1} = 1\\); \\(D_{i} \geq 0\\).

\tbc

### Time Complexity
Correlated equilibria form a convex set; so if game specified explicitly, can find one in polynomial time if matrix U given. But finding optimal correlated equilibrium is hard. \tbc
