+++
title = "Designing"
+++

## By designing action systems
By specifying the safety and progress properties the distributed computation should have, you can then design a compliant action system. Then you can refine this in various ways to get different looking implementations.

## Coordinating processes
There is always an initiator process.

### General signalling constructs
See programming ref. Callback, polling.

### Synchronization
#### Blocking
Process A may be listening in the channel, and may be blocked until it receives a message.

### Resource allocation
Resource conflicts often arise: resolving them involves giving one process preferential treatment over others.

Important progress conditions: avoid deadlocks, resource starvation.

Fairness: No resource starvation for any process. The process which is chosen to get a resource during a conflict is not always the same. You can't have this without randomization. There should be randomization either in the initial conditions, or in resolving conflicts.

#### Resource starvation
Use timers and priorities.

#### The dining philosophers problem
Models situation where each conflictable resource is shared between no more than 2 processes. So, you got a undirected 'conflict' graph among processes. A process has states: processing/ thinking, hungry/ waiting for a resource, using the rosource/ eating, with possible transitions from one to the next. A hungry process eats when it has all the forks.

Safety condition: Two neighbors cannot eat simultaneously.

Fairness condition: every hungry process gets to eat.

##### Starting from random initial condition
(Chandy, Misra). Overlay some random directed acyclic priority graph among processes. The node at lower level has higher priority access to the shared resource, when there is a conflict. Upon eating, a process always turns the edges inwards/ acceeds priority to neighbors. This ensures fairness. Initially, lower priority process controls the resource.

##### Drinking philosophers problem
A generalization of dining philosophers problem: neighbors can drink together, as long as they drink from different bottles.

#### Semaphores for mutual exclusion
Associated with a resource. Binary semaphore aka lock. A process gets access to resource by 'acquiring' / holding semaphore by executing 'P op', releases it with V op.

Weak semaphore guarantees mutual exclusion but not absense of starvation. Strong semaphore guarantees both.

Usually implemented as a process.

### Call-back
Processes requesting access register with a coordinator process, who will determine when the resource is available, and call back.

### Randezvous
Processes reader and writer. sender must send exactly when reader is ready to receive: unlike usual case where receiver is blocked in channel.get() operation until sender sends.

## Distributed program paradigms
### Central coordination
#### Master slave architecture
You have one master, many slaves to do the actual work.

#### Using coordinator
In master slave architecture, the master is the weakest point in the system. Instead, can replace master with a coordinator, which then chooses one among a set of masters. But, now the coordinator is the weakest point in the system.

### Layered computation
Many different layers of superposed distributed computations happen. The layer above only can look at the state of processes in the layer immediately below.

Eg: can superpose a layer above superposed computation which takes snapshot in order to collate the states at a single process.

### Recursive process networks
A process calling internally spawning a distributed computation which includes a process like itself.

#### Factorial finding
Finding factorial of numbers which come in a channel. Visualize process diagram.
\begin{verbatim}
def processFactorial(channelIn, channelOut, 0) = 1
def processFactorial(channelIn, channelOut, n) = 
 var channelInOut = Buffer()
 var channelInFact = Buffer()
 var channelFactOut = Buffer()

 def processIn(channelIn, channelInFact, channelFactOut) =
    channelIn.get()>n>channelInOut.put(n)
    |processFactorial(channelInFact, channelFactOut)
    |processIn(channelIn)

 def processOut(channelOut, channelInOut, channelFactOut) = 
    channelInOut.get()
    >n>if(n == 0) then channelOut.put(1)>>stop() else 
    (channelFactorialOut.get()>m>channelOut.put(m*n))
    >>processOut(channelOut, channelInOut, channelFactOut)

 processIn()
 |processOut()
 |processFactOut(channelInFact, channelFactOut, n-1)
\end{verbatim}

### Discovering a spanning tree for process network.
Network structure initially unknown. An initiator node is specified as the root node.

Useful in breaking cycles: Needed to avoid deadlocks and livelocks. Useful whenever a process needs to gain information by polling all processes. Eg: Querying a distributed database.

Each process does this:
def process (queryId, 'will you join the tree as my child?') = if it has not committed to being another process's child, return yes; pass on similar query to other neighbors.

The tree is maintained at each process: by each process knowing its parent, and/ or by knowing its children.

## Diffusing computation
### 'Underlying' computation
Many processes. There is a (usually undirected) graph over these, indicating bidirectional communication channels. There is an initiator process. Initiator is initially the only process active in the underlying computation. By sending messages, an already active process may make child processes active. Active processes may turn 'idle', as far as underlying computation is concerned.

### Termination detection
Initiator process must be able to tell whether the underlying computation is terminated. Need superposed computation to see if all processes are idle, all channels are empty.

#### Solution with acknowledgements
Require all messages to be ack-ed: thence see if channel is empty. Each node maintains a variable indicating if it sent messages yet to be acknowledged: msgs sent - acks received. Maintain a tree of nodes which are either active, or have uncknowledged messages, by having each node know its parent. Each node sends an ack to its parent only when it is idle and it has all its messages have been acked: that is, when it is a leaf node. When initiator gets all the acks it expects, it knows that the tree is empty but for itself.

#### Polling for state
Periodically poll all processes (having first discovered a spanning tree) to check if they are idle, received acks for all messages.

#### The uni-directional ring: without acks
Acks suck bandwidth. Instead, periodically, all processes record the number of messages sent, received. A superposed computation checks all processes periodically to see if the channels are empty, the outgoing channel is empty.

## Global snapshot
### Application
#### Checkpointing
Save the state for all processes and channels. Processes may crash: want to recover easily.

#### Census
How many cows are there in a large ranch? Prople in USA?

#### Consistant state
If any event is included, all preceding events should be included.

### Algorithm
Processes are in 2 states: 'snapshot done'/ red, 'snapshot not done'/ white. All messages carry a color: set by the sending process. Every process turns red just before receiving a red message, or any time before that; 'redness' is stable. So a white process recieves only white processes. White messages received by a red process are recorded as state of the channel.

#### Proof of correctness
There exists an logical ordering where all white events precede red events. Proof intuition: Take any logical ordering of the events; observe: if a red event precedes a white event, you can interchange them; can thence decrease the number of red events before the last white event.

## Fault tolerance
### Motivation
Some processes work perfectly, as they are supposed to. Others fail all the time. Diabolical ones fail inconsistently, or adversarially: can say one thing to one process, and another thing to another. Same with circuits: 'stuck at 0' in EE.

### Taking majority
Have k identical redundant circuits. Output the majority.

This is not as good as getting a consensus. \why

### Consensus
#### Byzantine generals problem
There is 1 general (process) and many soldiers. Generals and soldiers may be good or bad. A bad general can tell some soldiers 1 or other soldiers 0. All good soldiers must mutually agree on a common value. If the general is good, good soldiers must agree on the general's initial message.

Isomorphic to consensus problem: the general is the setting of initial values in the consensus problem!

#### Consensus problem
There are g good processes and b bad processes. If all have same initial value, consensus value is m for good processes. Even otherwise, good processes must agree on a common value.

Solvable iff \\(g > 2b\\) and communication is synchronous.

Often algorithms described in terms of 'rounds'.

##### Lower bounds
For deterministic alg: Ye need at least b+1 rounds.

Every good process can't just take majority of values it receives: a bad process may send different values to different good processes, causing them to settle on different values.

##### Upper bounds
Simple alg: in b+1 rounds, transmit \\(n^{n/3}\\) bits.

But, there are polynomial time algs which work in b+1 rounds. Maybe use digital signatures.

Randomized algorithms: do it in 2 rounds.

