+++
title = "Stochastic control processes"

+++
## Reinforcement learning setting
### Interaction with the environment
The agent can be in a set of states \\(S\\), and can perform a set of actions \\(A\\).

The effect of an action is given by transition probability distributions associated with each (sate, action) pair \\(P_{s, a}:S \to [0, 1]\\), and by rewards which may sometimes be provided by the environment.


### Policy learning
Agent wants to find the optimum policy \\(\pi':S \to A\\) by trial and error

#### Sub-problems
Looking at occasional reward, agent must assign credit to past actions: credit assignment problem.

Exploration vs exploitation trade-off: can't find high reward states if you try to greedily known best state.

### Reward learning
Aka Inverse reinforcement learning problem.

Sometimes, given the description of the environment (states \\(S\\), actions \\(A\\), transition distributions \\(P_{s, a}\\)) and an agent's policy \\(\pi\\), one wants to learn the rewards which motivated the agent to arrive at the policy.

#### Non triviality criteria
A trivial solution would be a reward function which assigns equal reward to all \\((a, s_1, s_2)\\) triplets - this would make all policies equally desirable. So, one would seek a sort of maximum entropy solution which favors the observed policy as strongly as possible over other policies.

#### Motivation
In economics and biology, the precise mechanism that motivates an animal is interesting. Eg: Are waiters who tend to seat customers outside, do so in order to attract other customers? \tbc

### Reinforcement learning in Animals
Stimulus \\(\equiv\\) belief state; response \\(\equiv\\) action. An inspiration for devoloping reinforcement learning algs.

#### Conditioning
Eg: Pavlov's dog; behaviorist Skinner training dog to jump against wall in 20 minutes. 1st order vs higher order conditioning. Cats escaping a box to get to fish.

Acquisition due to reinforcement during various trials; Extinction due to removal/ change in R(q): Visualize with a salivation level vs number of trials graph. Spaced trials better for acquisition than massed trials: more time for animal to make correlations.

Habituation: Plateau in response level.

Extinction burst: When you stop reward, animal temporarily tries much harder.

Avoidance: Animal avoids certain states/ stimuli after -ve reward, thereby looses chance to sample/ explore the state further.

Reinforcement schedules: Fixed reward: performance ratio, fixed interval (not good: animal learns interval) etc..

Conditioning due to different reinforcers (food, water etc..).

### Learning by simulation
Suppose you wanted to create an intelligent automaton - eg: pilot program for a drone plane. It is very hard to think of all possible cases - a pilot's knowledge is often intuitive and trained by the environment. On the other hand, it could be simpler to specify and thus simulate the environment. Thus, one can train the automaton in the simulated environment.

## Markov decision process (MDP)
### Abstract problem
We consider the reinforcement learning problem, but we consider an immediate reward function \\(R: A \times S \times S \to \Re\\). So the reward is fixed for each \\((a, s_1, s_2)\\) - this can be interpreted as expected reward (which may be determined by an agent from past experience).

#### Limited dependence on history
State transition shows the Markovian property: dependence only on the previous state and action.

#### Representation, notation
For a Diagrammatic representation and summary of alternative terms/ symbols used, see Wiki. 

Essentially, one considers the state transition graph of a Markov chain whose states are given by \\(S \union A\\), where any path between two state-nodes always needs to pass through an action-node (and similarly for paths between action nodes).

The extension is that edges \\((a, s) \in A \times S\\) may be labelled also with a reward value, apart from the transition probability. Edges \\((s, a) \in S \times A\\) are labelled with transition probabilities according to the policy being depicted.

### Policy
A policy is a map \\(p: S \to A\\).

#### Long term reward
One can compare policies by somehow aggregating rewards one would expect over \\(k\\) (aka horizon) time-steps. This is better than a simplistic evaluation of a policy which only considers the immediate expected reward. The horizon considered could either be finite or infinite.

It is logical for the weights corresponding to distant times to be smaller. 

#### Weighted sum: state values
One common way of aggregating reward over \\(k\\) time-steps while assigning lower weights to future rewards is to take a weighted sum of rewards accrued during this period. Often geometrically decreasing weights - powers \\(g^k\\) of the discounting factor \\(g \in (0, 1)\\) are used.

This expected reward for applying policy \\(p\\) over horizon \\(k\\) starting from state \\(s_0\\), aka value of the state \\(s_0\\), is \\(V_p(s_0) = \sum_{t \in \set{0..k}} g^t E_P[R(p(s_t), s_t, s_{t+1})]\\). This is proportional to the geometrically weighted moving average, and hence equivalent to using it where comparing policies is concerned.

#### Best policy
One ideally wants to find a policy which maximizes the value of the current state.

For a finite state MDP with an infinite horizon where rewards are aggregated using geometrically decreasing weights, one only needs to solve the following linear program to find the policy vector \\(p\\):

$$\argmax_{p(s)} \sum_{s'} P(p(s), s, s')(R(p(s), s, s') + gV(s'))$$ subject to $$V(s) = \sum_{s'} P(p(s), s, s')(R(p(s), s, s') + gV(s'))$$ (which is aka the Bellman equation).

#### Solution techniques
Besides linear programming, one can use various iterative dynamic programming techniques.

The policy iteration starts with an arbitrary vectors \\(p\\). It then does the following repeatedly until convergence: a] compute corresponding value vector \\(V\\) by repeatedly computing \\(V_p(s_0) = \sum_{t \in \set{0..k}} g^t E_P[R(p(s_t), s_t, s_{t+1})]\\) until convergence, b] improve \\(p\\) using current estimate of \\(V\\). As each step improves the solution, and because there is only one minimum, this is guaranteed to converge.

### Dealing with large state spaces
Dealing with large state-spaces. One can deal with large state spaces by collapsing similar state together. Eg: In the case where the state space corresponds  to the 3-dimensional coordinates of an aircraft relative to a target, one can use an alternative state space defined instead by distance to the target.

One can do Q-learning: There is no need to specify explicitly the transition probability P or list the states. This is advantageous when the state space is huge.

## Partially observable Markov decision process (POMDP)
### Problem setting
As in case of MDP's, we have sets of states \\(S\\), actions \\(A\\) and transition probabilities \\(P\\). 

#### Observations
But, the states are not necessarily fully observable. So, we have a set of observations \\(O\\), and observation probabilities \\(P_O\\).

#### Simplified rewards
The reward function is simpler than in MDP (possibly at the expense of a bigger state space): \\(R: A \times S \to \Re\\).

### Belief states


\tbc
