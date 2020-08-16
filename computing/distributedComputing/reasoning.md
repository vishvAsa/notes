+++
title = "Reasoning"
+++

## Common assumptions
A channel eventually (maybe at \\(t=\infty\\)) delivers all packets without corruption or dropping, in the correct order.

Processes can run at arbitrary, non 0 speed.

Don't care about efficiency, focus on safety and progress.

Assume you have infinite buffers.

### Synchronized communication
Sometimes, this is needed. Max time to deliver a message is some t.

## Proving algorithm efficacy
Axiomatize the system, and use pure logic.

Usually 2 stages: safety property: you won't fall into a wrong state; and progress property.

### Importance and need
Distributed computation is very hard to debug: bugs are hard to reproduce, very scary for usual programmers; so, proving it correct is essential.

When you have the right theory, a formal proof is much shorter than an intuitive proof.

Also, English sentences are often ambiguous.

### Common tricks
Decompose computation into processes which are independent of network structure.

Use induction.

Often, need to break cycles in the network, to avoid deadlock, livelock. Then, induction is possible.

## Properties of programs
It is easier to reason about properties of a program, rather than its the program text.

'Interplay between safety and progress properties is design.'

### Safety of the computation: problems
Aka rightness property. Claim: The computation will do no harm.

While shared memory may be common in parallel programming, it is uncommon in distributed computing. Shared memory and message passing are two common parallel programming paradigms, of which the latter is necessarily safer.

#### Race conditions: Readers/ writers problem
If memory locations are shared between threads, there can be race conditions.

Usually, many readers can read simultaneously, but only when writer is using the resource, no readers or writers should be allowed: mutual exclusion/ mutex.

### Progress of the computation: Problems
Aka liveness property. Claim: The computation will eventually produce the correct answer.

Safety proofs can be usually done without using progress properties, but not vice versa. Eg: to prove x increases, prove \\(tr(x = m) \land stable(x \geq 5)\\).

#### Deadlock
A is waiting for a resource B is holding, B is waiting for a resource A is holding; neither will release until it acquires both processes.

Solution: Either work under the assumption that this never happens like most OS's, or prevent, detect and break it. So, there is no progress.

##### Expressed as a safety property
\\(\forall i\\) stable waiting(i).

#### Livelock
Eg: A asks B if it, or anyone it can reach has x; B doesn't have it, but asks all nodes connected to it, including A, exactly the same question. If A or B do not break the cycle, there is no progress.

### Maximality
Is this program the most efficient? Or requiring the least communication?

## Action systems
Aka State Transition system.

### Motivation
Highly abstract setup to reason about distributed computing. Many different looking algorithms for the same problem : eg message passing vs shared memory vs token ring based etc.. turn out to boil down to the same logic in an action system.

It is easier to reason about properties of a program, rather than its implementation.

Can 'refine' an action system in various ways to get actual implementations of the algorithms.

### Definition
#### Objects
A program is collection of objects. Every object is a collection of states and actions. If there is communication, it is with shared variables. Usually only one object is the program.

#### States
Specified by some variables. Initial conditions.

#### Transitions or Actions
When in state s, where can you go next?; visualize as a directed graph among states. \\(p \to x=5\\): p is the guard; x=5 is the command. If guard is absent, 'true' is assumed to be the guard. If guard is true, the command is 'active' else it is inactive.

Always, 'skip' or 'noop' command is included.

All actions terminate.

#### Execution rule
##### Minimal progress
Until all guards are false: arbitrary non-skip action whose action is true is executed. So not fair!   

##### Weak fairness
Each action is executed infinitely often; Can think of even inactive actions being executed: they just have no effect.

If the guard of an action remains true continuously, it is eventually executed effectively.

##### Strong fairness
If guard of the action is true infinitely often, then action is executed effectively infinitely often.

So, in a certain recurring state, if k actions are active, they all are executed effectively infinitely often. In weak fairness, they might have been executed when inactive.

##### Termination
No 'termination state' specified: theoretically, 'program' runs for ever; detecting termination is an implementation issue. It happens when all actions are ineffective. Eg: detecting fixed points.

### Reasoning about properties
#### Properties vs predicates, connectives
Safety and progress 'Properties' of a program are defined to be distinct from predicates. Predicates related program variables with logical operators, Eg: \\(p \land r\\) vs \\(p \co q\\). Quantification implicit \\(p \co q \equiv \forall x, S:: \set{p} S \set{q}\\).

But, \\(\land, \implies, \equiv\\) still used with properties to indicate 'both hold' or can be inferred from etc.. But, they are used purely amongst properties or purely among predicates. property \\(\implies\\) predicate: like \\(p \lor (p \co q)\\) illegal.

Quantification: \\((p \co q) \land (stable q)\\) indicates \\((\forall x:: p \co q) \land (\forall x:: stable q)\\).

\\(p \implies q\\) is not a property; but \\(invariant(p \implies q)\\) is.

#### Auxiliary vs program variables
Program variables are variables used in the action system text. Auxiliary variables are extra variables used to reason about the action system, which depend only on the history of program variables. Eg: mx = Max value x has achieved so far.

## Safety properties of Action systems
Usually, use intuition to identify some target property of the action system, express it using co operators, identify the initial conditions, basic properties of the system, thence derive the target property.

### The constrains/ co operator
A type of temporal implication. \\(p \co q \equiv \forall t: \set{p} t \set{q}\\). MUST Show \\(\forall (g \to s) : \set{p \land g} s \set{q}\\). If cannot show, the claimed property is false!

So, once p holds, q continues to hold until \\(\lnot p \land q\\) holds.

#### Properties of co
Many properties follow from implication: See inference/ propositional logic ref; F co p. p co T. Can strengthen LHS or weaken RHS; it is transitive. If \\((p \co q) \land (r \co s)\\), Can do this: \\((p \land r) \co (s \land q)\\) or \\((p \lor r) \co (s \lor q)\\).

Any action system includes skip statement; so if \\(p \co q\\), \\(p \implies q\\) should hold.

#### Formalizing safety properties
Take the statement you want to write using proper notation. Set initial state p. After any action, including skip, how can the state possibly change? : list these as \\(\set{q_i}\\), join them thus: \\(p \co \Lor_i q_i\\); then simplify. Note \\(q_i\\) must specify the state fully: else error.

Eg: d does not change as long as c remains true. \\(d = m \land c \co (c \land d = m) \lor (d \neq m \land \lnot c)\lor (d = m \land \lnot c) \implies d = m \lor \lnot c\\).

#### Elimination theorem
If \\(x = m \co q\\) and p does not have any free variables other than x: \\(p \co \exists m:: p[x \assign m] \land q\\).

Very useful in eliminating free variables. Eg: given \\(x = m \co q\\), show stable p.



### Stable predicates
Stable predicate is a set of states outside which no transition can ferry the program. Visualize using a set of states.

stable p \\(\dfn\\) p co p.

### Fixed point x
Once you hit state or state set x, you never get out. Indicates termination.

Holds in any state where all actions are ineffective. So, to compute fixed point predicate, take \\(\land (\lnot guard_i)\\) where i ranges over all actions.

### Invariant p
True initially, and stable. So, show: init conditions \\(\implies\\) p; \\(\forall (g \to s) : \set{p \land g} s \set{p}\\).

#### Substitution axiom
While reasoning about a program, can replace all occurances of an invariant with T; or vice versa.


## Progress properties of action systems
Action system: \\(\set{g_i \to S_i}\\)

### transient p
tr(p): p guaranteed to be falsified by a single action. \\(tr(p) \implies tr(p \land q)\\).

#### Defn Under weak fairness exec rule
\\(p \implies ((\exists i::g_i) \land (\forall i:: \set{p \land g_i} S_i \set{\lnot p}))\\). If you can't show this, p is not transient.

#### Defn Under minimal progress exec rule
\\(\exists i:: \set{p} g_i \to S_i \set{\lnot p}\\); ie \\(\exists i:: (p \implies g_i) \land (\set{p} S_i \set{\lnot p})\\).

### p ensures q
If p holds, it continues to hold until q becomes true, and q will become true. Combines both safety and progress properties.

\\((p \en q) \equiv ((p \land \lnot q) \co (p \lor q)) \land tr(p)\\).

### Temporal logic
\\(p \mapsto q\\): if p holds, q holds now or eventually. If \\(p \implies q\\), \\(p \mapsto q\\). \\(p \en q \implies p \mapsto q\\).

\tbc

## Ordering events in distributed computation
Processes cannot be perfectly synchronized in their evaluation of 'time': clocks drift.

### An irreflexive partial ordering
Independent events cannot be ordered without ambiguity: only causality defines 'order': If \\(a \prec b\\), a can affect b.

Events in a single process are completely ordered. There is no simultaneity. A process is a sequence of events.

For any message, send event preceeds receive event.

\\(\prec\\) is transitive.

Concurrent events: \\(a \nprec b, b \nprec a\\): can't causally affect each other.

#### Impossible orderings
Eg: A happens before B, B happens before A. Can't go back in time and alter events to alter chances of your birth.

Apprears as cycles in time-line graphs. These can creep in when a long sequence of distributed computing, involved sends and receives are involved.

### Time-line graphs
Take vertical line for each process. y axis is time. Directed edges between points in various processes show msg send and recieve events.

Observe causality paths going vertically, diagonally in this graph. They illustrate the ordering to be obeyed by the logical time assigned to each event.

Easiy to identify independent events: points along multi-edges between 2 points in the causality graphs.

### Assign numbers to events: Logical clocks
Contrast with physical clocks. \\(C_{i}\\): clock for process \\(P_{i}\\). Global clock \\(C(x) = C_{i}(x)\\) if x happens in \\(P_{i}\\).

#### Clock condition
\\(a \prec b \implies C(a) < C(b)\\).

#### Implementation rule
\\(P_{i}\\) increments \\(C_{i}\\) between 2 events.

When a message m is sent \\(P_{i} \to P_{j}\\), the \\(C_{i}(send(m))\\) is sent along. Then, \\(C_{j}(receive(m)) = \max(C_{i}(send(m)), C_{j}) + 1\\).

#### Imposing total order
Just break ties arbitrarily.


## Common knowledge
k(A,p): A knows p. \\(k(A,p) \implies k(A, k(A,p))\\).

### Coordinating attack problem
Aka attacking generals problem. 2 generals on top of hills, enemy in the valley in between. If attack executed simultaneously, it succeeds; else it fails. Generals communicate only by sending messengers. No general will attack if he is not sure that the other general will also attack.

So, no attack can be arranged if it was not prearranged. No pre-arranged attack can be called off.

