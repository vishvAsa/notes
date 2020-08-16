+++
title = "03 Games: classes"

+++
## 2 player games
Aka bimatrix game. Row and column players: \\(p_{r}, p_{c}\\); their Prob distr over \\(S_r\\) and \\(S_{c}\\) as vectors :\\(D_{r}, D_{c}\\). Utility matrix wrt \\(p_{r}\\) and \\(p_{c}\\): R, C.

### 2 - Player 0 sum games
Utility matrix \\(A_{i,j} = u_{r}(..)\\). (Nash) Eg: Matching pennies.

Value paid by \\(p_{c}\\) to \\(p_{r}\\): \\(v_{r} = D_{r}^{*} AD_{c}\\).

Knowing \\(D_{r}\\), \\(p_{c}\\) always selects \\(min(D_{r}^{*}A)\\) or finds \\\\(v_{c} = \min_{k_{1}} \max_{D_{r}} E_{k_{r} \distr D_{r}}[u_{1}(k_{1}, k_{2})] = \min_{k_{1}} \max_{D_{r}} u_{1}(k_{1},D_{r})\\). So, best strategy for \\(p_{r}\\) is to maximize (Maxmin) \\(min(D_{r}^{*}A)\\).

#### Solution by linear program
\\(v_{r} = max\ v; D_{r}>0; \sum_{i} D_{r,i} = 1; (D_{r}^{*}A)_{j} \geq v \forall j\\).

Dual of this LP finds \\(v_{c} = -v_{r}\\) and \\(D_{c}\\): aka Minmax / minimax theorem (Neumann).

#### Reduction from constant (k) sum 2 player games
Use a equivalent utility matrix \\(A_{i,j} = u_{r}(..)\\). So, any constant sum game has well defined value: \\((v_{r}, k-v_{r})\\).

### Symmetric two player games
R, C are same. \\(D_{c}\\) is the best response to itself. \\(D_{c} = D_{r} = D\\).

#### Finding Nash Equilibrium
(Lemke - Howson). Consider inequalities \\(Ax \leq 1\\), \\(x \geq 0\\); visualize 2d case like an LP: intersecting halfspaces in a plane with axes \\(\set{x_{i}}\\). \\(\binom{2n}{n}\\) verteces in n-d polytope.

Solution pt must lie in some vertex where payoff is maximum; at solution pt, \\(\forall i\\): \\(A_{i}x = 1\\) and \\(i \in D\\) by prop of Nash equilib, or \\(x_{i} = 0\\) and \\(i \notin D\\). To get the final strategy, take x, and scale it so that \\(\sum x_{i}=1\\). Move from vertex to vertex by relaxing constraints and moving along edges.

Almost always runs in poly time. (Smoothed complexity.)

#### Reduction from general 2 player games
R and C are \\(m\times n\\). Make symmetric game \\(\mat{0 & R\\C^{T} & 0}\\); Find solution distribution \\(\mat{x\\y}\\): now, x and y best responses to each other, so solution to original game.

## Games with n turns
### Casting as a simultaneous move game
Each \\(p_{i}\\) picks full strategy from \\(S_{i}^{n}\\). But, \\(|S_{i}^{n}| = |S_{i}|^{n}\\); so games with turns are a compact representation. Extensive form: Game tree with payoffs at leaves.

### Subgame Perfect Nash Equilibria
Nash Equilib with notion of order of moves: Strategy should be Nash even if any prefix of the game is already played.

#### Ultimatum game
\\(p_{1}\\), \\(p_{2}\\) split money m; 1 turn each: \\(p_{1}\\) offers n; \\(p_{2}\\) accepts or reject. \\(p_{2}\\)'s interest to accept whatever offered. Cast to a simultaneous move game. Many Nash equilibria: If \\(p_{2}\\) rejects if \\(n < o\\), \\(p_{1}\\) must offer o. 1 subgame perfect nash equilib.

## Games with partial info about utilities
Work with beliefs about others' properties and preferences. 

### Bayesian Games
Eg: Card game: \\
Only distribution of others' cards known.

#### Bayesian first price auction
\\(\set{p_{i}}\\) have values \\(\set{v_{i}}\\) for item. If all info available; best strategy for \\(p_{i}\\): choose \\(s_{i}\\) = \\(v_{j}\\) next lower to \\(v_{i}\\). If only distribution of \\(v_{k}\\) for other players known, \\(p_{i}\\) bids second E[\\(v_{j}\\) next lowest to \\(v_{i}|v_{i}\\) is max]. \why

## Cooperative games
Groups (G ..) can change strategies jointly.

### Strong Nash Equilibrium
In s, \\(G \subset P\\) has \textbf{joint deviation} if \\(\exists s'_{G}| u_{i}(s) \leq u_{i}(s'_{G}, s_{-A})\forall p_{i} \in G\\), and for some \\(p_{j} \in G, u_{i}(s) < u_{i}(s'_{G}, s_{-A})\\).

s is strong Nash if no \\(G \subset P\\) has joint deviation. Similarly, mixed strategy Nash equilibria. Few games have this. Eg: Stable marriage problem.

### Stable Marriage problem
\tbc

### Transferable utility
\tbc

## Market equilibria
### Pricing and Allocation game with linear utility
Aka Fisher's linear case. Bipartite graph G = (I, B) of goods and buyers: edges indicate interest of \\(b \in B\\) in \\(i \in I\\). Quantity of i scaled to 1; price vector for I: p; money vector for B: m. Utility of i for b: \\(u_{b, i}\\).

Want to find optimal p (pricing) and partition items among B: allocation x. Equilibrium properties: all money, goods exhausted.

Best bang per buck for b: \\(a_{b} = max_{i}\frac{u_{b, i}}{p_{i}}\\): a linear function: so 'linear case'.

Primal dual approach: Start with arbit p = 1; find x; find \\(\set{b}\\) with excess money; adjust price; repeat.

Finding x by reduction to network flow problem: add source s and sink t; connect s to all I and t to all B; set capacities of edges in original graph to be \\(\infty\\) and on new edges to match a(i) and m(b); thence find c.

### Find best allocation
(Arrow Debreu) Agents come in with goods portfolio, utilities for various goods, leave with goods: money only inbetween. Generalizes Fisher's linear case: .

Auction based approx algorithm solves it: Market clears approximately.

## Repeated games with partial info about utilities
\\(p_{1}\\) in uncertain environment (\\(p_{-1}\\)); utilities of \\(p_{-1}\\) not known. Eg: Choosing a route to go to school.

### Model
Same game repeated T times; At time t:
\\(p_{1}\\) uses online algorithm H to pick distr \\(D_{H}^{(t)}\\) over \\(S_{1}\\). \\(p_{1}\\) picks action \\(k_{1}^{(t)}\\) from \\(D_{H}^{(t)}\\). Loss/ cost function for \\(p_{1}\\): \\(c_{1}:\times_{i}S_{i} \to [0,1]\\). \\(c_{1}^{(t)}(k_{1}^{(t)}) \dfn c_{1}(k_{1}^{(t)}, D_{-1}^{(t)})\\), \\(c_{1}(D) \dfn E_{x \distr D}[c_{1}(x)]\\).

#### Model with full info about costs
H gets cost vector \\(c_{1}^{(t)} \in [0,1]^{|S_{1}|}\\), pays cost \\
\\(c_{1}(D_{H}^{(t)}, D_{-1}^{(t)}) = E_{k_{1}^{(t)} \distr D_{H}^{(t)}}[c_{1}(k_{1}^{(t)}, D_{-1}^{(t)})] = E_{k_{1}^{(t)} \distr D_{H}^{(t)}}[c_{1}^{(t)}(k_{1}^{(t)})]\\).

Total loss for H: \\(L_{H}^{(T)} = \sum c_{1}(D_{H}^{(t)}, D_{-1}^{(t)})\\).

#### Model with partial info about costs
Aka Multi Armed Bandit (MAB) model.\\
\\(p_{1}\\) (or H) pays cost for \\(k_{1}^{(t)}\\): \\(c_{1}(k_{1}^{(t)}, D_{-1}^{(t)}) = c_{1}^{(t)}(k_{1}^{(t)})\\).

Total loss for H: \\(L_{H}^{(T)} = \sum c_{1}(k_{1}^{(t)}, D_{-1}^{(t)})\\).

#### Goal
Minimize \\(\frac{L_{?}^{(T)}}{T}\\). Maybe other \\(p_{i}\\) do the same. \\(D_{-1}^{(t)}\\) and \\(c_{1}^{(t)}\\) can vary arbitrarily over time; so, model is adversarial.

### Best response algorithm For every i: Start with s; suppose \\(s_{-i}\\) fixed, do hill climbing by varying \\(s_{i}\\).

### Regret analysis
H incurs loss \\(L_{H}^{(T)}\\); \\(p_{1}\\) sees simple policy \\(\pi\\) would have had much lower loss. Comparison class of orithms G. \\(\pi\\) best algorithm in G: \\(L_{\pi}^{(T)} = min_{g \in G} L_{g}^{(T)}\\). Regret \\(R_{G} = L_{H}^{(T)} - L_{\pi}^{(T)} = max_{g \in G} (L_{H}^{(T)} - L_{g}^{(T)})\\).

#### Goal
Minimize \\(R_{G}\\).

#### Regret wrt all policies: Lower bound
\\(G_{all} = \set{g: T \to S_{1}}\\): \\(\exists\\) sequence of loss vectors \\(c_{1}^{(t)}\\): \\(R_{G_{all}} \geq T(1-|S_{1}|^{-1})\\):

For \\(k' = argmin_{k_{1}^{(t)}} Pr_{D_{H}^{(t)}}(k_{1}^{(t)})\\), \\(c_{1}^{(t)}(k') = 0\\), for others, \\
\\(c_{1}^{(t)}(k_{1}^{(t)}) = 1\\); \\(\min_{k_{1}^{(t)}} Pr_{D_{H}^{(t)}}(k_{1}^{(t)}) \leq |S_{1}|^{-1}\\).

So, must restrict G.

### External regret
Aka Combining Expert Advice. \\(G = \set{i^{T} : i \in S_{1}}\\), policies where all \\(k_{1}^{(t)}\\) are the same; \\(\pi\\) is best single action. \\(L_{\pi}^{(T)} = \sum c_{1}(\pi, D_{-1}^{(t)})\\).

If H has low external regret bound: H matches performance of offline algorithm. \why  H comparable to optimal prediction rule from some large hyp class H. \why

#### Deterministic Greedy (DG) algorithm
\\(S_{1}^{(t-1)} = \set{i: argmin_{i \in S_{1}} L_{i}^{(t-1)}}\\),\\
 \\(k_{1}^{(t)} = \min_{i \in S_{1}^{(t-1)}} i\\). \\(L_{DG}^{(T)} \leq |S_{1}| min_{i}(L_{i}^{(T)}) + (|S_{1}|-1)\\): Suppose \\(c_{1}^{(t)} \in \set{0,1}^{|S_{1}|}\\). For every increase in 
\\(\min_{i} L_{i}^{(t)}\\), max loss \\(|S_{1}|\\): For \\(L_{DG}^{(t)} = L_{DG}^{(t-1)} + 1\\) but \\(\min_{i} L_{i}^{(t)} = \min_{i}L_{i}^{(t-1)}\\): \\(S_{1}^{(t)} \subseteq S_{1}^{(t-1)}\\); so count num of times \\(S_{1}^{(t)}\\) can shrink by 1.

#### Deterministic algorithm Lower bound For any deterministic online algorithm H', \\(\exists\\) loss seq where \\(L_{H'}^{(T)} = T, min_{i \in S_{1}}(L_{i}^{(t)}) \leq \floor{T/|S_{1}|}\\): \\(c_{1}^{(t)}(k_{1}^{(t)}) = 1\\), for other i, \\(c_{1}^{(t)}(i) = 0\\); so \\(L_{H'}^{(T)} = T\\); some action used by H' \\(\leq \floor{T/|S_{1}|}\\) times; so \\(min_{i \in S_{1}}(L_{i}^{(t)}) \leq \floor{T/|S_{1}|}\\).

So find rand algorithm.

#### Rand Weighted majority algorithm (RWM)
Suppose \\(c_{1}^{(t)} \in \set{0,1}^{|S_{1}|}\\). Treat \\(S_{1}\\) as a bunch of experts: Want to put as much wt as possible on best expert. Let \\(|S_{1}| = N\\). Init weights \\(w_{i}^{(1)} = 1\\), total wt \\(W^{(1)} = N\\), \\(Pr_{D_{H}^{(1)}}(i) = N^{-1}\\).

If \\(c_{1}^{(t-1)}(i) = 1\\), \\(w_{i}^{(t)} = w_{i}^{(t)}(1-\eta)\\), \\(Pr_{D_{1}^{(t)}}(i) = \frac{w_{i}^{(t)}}{W^{(t)}}\\). \why Like analysis of mistake bound of panel of k experts in colt ref.

For \\(\eta < 2^{-1}\\), \\(L_{H}^{(T)} \leq (1+ \eta) \min_{i \in S_{1}}L_{i}^{(t)} + \frac{\ln N}{\eta}\\). Any time H sees significant expected loss, big drop in W. \\(W^{(T+1)} \geq max_{i}w_{i}^{(T+1)} = (1-\eta)^{\min_{i}L_{i}^{(T)}}\\). \tbc

For \\(\eta = \min \set{\sqrt{\ln N/ T}, 2^{-1}}\\): \\(L_{H}^{(T)} \leq \min_{i} L_{i}^{(T)} + 2\sqrt{T\ln N}\\). If T unknown, use 'guess and double' with const loss in regret. \why

#### Polynomial weights algorithm
Extension of RWM to \\(c_{1}^{(t)} \in [0,1]^{|S_{1}|}\\). Wt update is \\(w_{i}^{(t)} = w_{i}^{(t)}(1-\eta c^{(t-1)}(i))\\). \\(L_{H}^{(T)} \leq \min_{i} L_{i}^{(T)} + 2\sqrt{T\ln N}\\). \why

#### Rand algorithm Lower bounds
If \\(T <  \log_{2} N\\): For any online algorithm H, \\(\exists\\) stochastic generation of losses: \\(E[L_{H}^{(T)}] = T/2\\), but \\(\min_{i} L_{i}^{(t)} = 0\\): at t=1 let N/2 actions get loss 1; at time t: half the actions which had a loss 0 at time t-1 get loss 1; so, probability mass on actions with 0 = \\(2^{-1}\\).

If N=2, \\(\exists\\) stochastic generation of losses: \\(E[L_{H}^{(T)} - \min_{i} L_{i}^{(T)}] = \Omega(\sqrt{T})\\). \why

#### Convergence to equilibrium: 2 player constant sum repeated game
All \\(p_{i}\\) use algorithm H with external regret R; Value of game: \\((v_{i})\\). Avg loss: \\(\frac{L_{H}^{(T)}}{T} \leq v_{i}\\). \why If \\(R_{G} = O(\sqrt{T})\\), convergence to \\(v_{i}\\).


### Low external regret algorithm in partial cost info model
Exploration vs exploitation tradeoff in algorithms.

algorithm MAB: Divide time T into K blocks; in each time block \\(\tau+1\\): explore and get cost vector: execute action i at random time to get vector of RV's: \\(\hat{c}^{(\tau)}\\), also exploit: use distr \\(D^{(\tau)}\\) as strategy; pass \\(\hat{c}^{(\tau)}\\) to full info external regret algorithm F with ext regret \\(R^{(K)}\\) over K time steps; get distr \\(D^{(\tau + 1)}\\) from F.

Max Loss during exploration steps: NK. RV for total loss of F over K time blocks: \\(\hat{L}_{F}^{(T)} = \frac{T}{K}\sum_{\tau}p^{\tau}c^{\tau} \leq \frac{T}{K}(min_{i} \hat{L}_{i}^{(K)} + R^{(K)}\\). Taking expectation, \\(L_{MAB}^{(T)} = E[\hat{L}_{MAB}^{(T)}]= E[\hat{L}_{F}^{(T)} + NK] \leq \frac{T}{K}(E[min_{i} \hat{L}_{i}^{(K)}] + R^{(K)}) + NK \leq \frac{T}{K}(min_{i} E[\hat{L}_{i}^{(K)}] + R^{(K)}) + NK \leq min_{i}L_{i}^{(T)} + \frac{T}{K}R^{(K)} + NK\\).

Using the \\(O(\sqrt{K\log N})\\) algorithm, with \\(K=(\frac{T}{K}R_{K})\\), we get \\(L_{MAB}^{(T)} \leq min_{i}L_{i}^{(T)} + O(T^{2/3}N^{1/3}\log N)\\).

### Swap regret
Comparison algorithm (H,g) is H with some swap fn \\(g:S_{1} \to S_{1}\\).

#### Internal regret
A special case: Swap every occurance of action \\(b_{1}\\) with action \\(b_{2}\\). Modification fn: \\(switch_{i}(k_{i},b_{1}, b_{2}) = k_{i}\\) except \\(switch_{i}(b_{1},b_{1}, b_{2}) = b_{1}\\).

#### Low Internal regret algorithm using external regret minimization algorithms
Let \\(N=|S_{i}|\\); \\((A_{1}, .., A_{N})\\) copies of algorithm with external regret bound R. Master algorithm H gets from \\(A_{i}\\) distr \\(q_{i}^{(t)}\\) over \\(S_{i}\\); makes matrix \\(Q^{(t)}\\) with \\(q_{i}^{(t)}\\) as rows; finds stationary distr vector \\(p^{(t)} = p^{(t)}Q^{(t)}\\): Picking \\(k_{i} \in S_{i}\\) same as picking \\(A_{j}\\) first, then picking \\(k_{i} \in S_{i}\\); gets loss vector \\(c^{(t)}\\); gives \\(A_{i}\\) loss vector \\(p_{i}^{(t)}c^{(t)}\\).

\\(\forall j: L_{A_{i}} = \sum_{t} p_{i}^{(t)}\dprod{c^{(t)},q_{i}^{(t)}} \leq \sum_{t} p_{i}^{(t)}c_{j}^{(t)} + R\\). Also, Sum of percieved losses = actual loss. So, for any swap fn g, \\(L_{H}^{T}\leq \sum_{i}\sum_{t} p_{i}^{(t)}c_{g(i)}^{(t)} + NR = L_{F,g}^{(T)} + NR\\).

Thence, using polynomial weights algorithm, swap regret bound\\ \\(O(\sqrt{|S_{1}| T \log |S_{1}|})\\).

#### Convergence to Correlated equilibrium
Every \\(p_{i}\\) uses strategy with swap regret \\(\leq R\\): then empirical distr Q over \\(\times_{i} S_{i}\\) is an \\(\frac{R}{T}\\) correlated equilibrium. \\(R = L_{H}^{(T)} - L_{H,g}^{(T)} = \sum_{t} E_{s^{(t)} \distr D^{(t)}}[r_{i}(s,g)] = T E_{s \distr Q}[r_{i}(s,g)]\\).

Convergence if all players have sublinear swap regret.

#### Frequency of dominated strategies
\\(p_{1}\\) uses algorithm with swap regret R over time T; w: avg over T of prob weight on \\(\eps\\) dominated strategies; so \\(\eps wT \leq R\\); so \\(w \leq \frac{R}{T\eps}\\).

If algorithm minimizes external regret using polynomial weights algorithm, freq of doing dominated actions tends to 0.
