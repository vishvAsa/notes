+++
title = "Graphs in nature"
+++

## Examples
May be directed or undirected. Citation graph can be considered directed. Coauthorship graphs. Query graphs. Online social network websites

### Affiliation networks
A bipartite graph G'=(A,C,E) of actors A, communities C and edges E. Can implicitly define social network amongst A: by folding G'/ forming edges between actors depending on shared memberships in \\(c \in C\\).

## Static patterns
### Small diameter
Small world phenomenon in social networks: remarkably short paths connect very unrelated people. Eg: A certain developmental psychologist has Erdos number 3. 6 degrees of separation idea.

Two randomly selected web pages are connected is around .35.

So, effective diameter of the graph is small.

### In and out Degree distribution
Heavy tailed distributions. Folks look at shape of the graph, and observe a distribution pattern.

May follow power law distribution over a large degree-range; observed in online social networks, citation graphs. So, number of nodes with degree d \\(\propto d^{-\gb}\\). \\(\gb\\) may or mayn't vary over time.

Else DGX distribution.

Else log normal distribution.

In-degree distributuion is more skewed, usually.

### Scree plot
Plot of ew vs rank using log vs log scale. Approximately obeys power law: You see a straight line.

### Clustering coefficient
In social networks, most new edges form to close triangles. Let degree(v)=d. Clustering coefficient \\(C_{d}(v) = \frac{\Del(v)}{\nbd(v)(\nbd(v)-1)/2}\\), where \\(\Del(v) = \triangle\\) centered at v: the fraction of potential \\(\triangle\\)'s centered at v which actually exist.

\\(C_{d} = avg_{v:deg(v)=d}(C_{d}(v))\\). Gets smaller with increasing degree. Follows power law distribution: \\(C_{d} \propto d^{-1}\\).

Global clustering coefficient \\(C = avg_{v}(C_{d}(v))\\). It is a measure of transitivity in the network. C in real networks is significantly higher than for random networks, conditioned on same degree distribution.

Indicates some degree of hierarchial and community structure. The low-degree nodes belong to very dense sub-graphs and those sub-graphs are connected to each other through hubs.

### Community structure
#### 2 meanings
Communities amongst V observed in real world G, due to homophily. In the internet, many dense bipartitite subgraphs observed (Border).

Communities in the social networking websites often don't correspond to dense subgraphs of the social network.

#### Hierarchical structure
Found in social network, internet: a scale-free self similar structure observed.

#### Fractal or onion structure
Similar structure observed as you keep zooming in on a part of G.

#### Communities in the social networking websites
Group size: Power law distribution. Number of affiliations of nodes of a certain degree: exponential distribution. \cite{zhelevaSocialAffiliationNw} Group membership: a high fraction of singletons: especially in small groups, decreases with group size. With groups size, highest degree of member nodes increases.

### Core-periphery structure
found in internet autonomous systems.

### Network motifs
Basic building blocks of complex networks. Frequency of occurance compared to random graphs, function then hypothesized. Graph isomporphism checks feasible only for motifs of size \\(\leq 5\\).

Eg: gene regulatory networks.

### Microscopic properties
Most (70 to 90\%) edges are bidirectional \cite{leskovecThesis}..

## Other properties
Eigenvector components distribution skewed.

Resilience to random node attacks, but suceptibility to high degree hub node attacks.

Stress.

## Temporal evolution patterns
% See \cite{LeskovecThesis}.

### Densification
Polynomial densification: \\(|E(t)| \propto |V(t)^{\ga}|\\) with \\(\ga >1\\). So, avg degree increases with time.

#### Relationship with power law degree distribution
\\(\gb \in (1,2) \implies \ga = 2/\gb\\).

\\(\gb >2, \ga \implies\\) \\(\gb(n) = \frac{4n^{\ga-1}-1}{2n^{\ga-1}-1}\\) changes in a certain way over time.

Both observed in actual graphs \cite{leskovecThesis}.


### Shrinking diameter
Diameter shrinks over time, asymptotically levels off.

Densification alone doesn't not result in this (experiment on \\(G_{n,p}\\)). Densification with particularly evolving degree sequence result in this. Nothing special about edge attachments: make random graphs with same degree sequences. \cite{leskovecThesis}

### Node arrival function
N: time \\(\to \set{0,1}\\). High variation among networks: exponential to sublinear.

### Edge initiation process
#### Node lifetime L
After a certain time, node does not form new edges. Spike at L=0, as many people join the network and never visit the networking website again. Best modelled by \\(Pr(L = l) = ke^{-lk}\\): exponential distribution.

#### Age
Edge initiation rate seems to stay constant accross ages.

Graph shows spike at age=0, as many people join the network and never visit the networking website again.

#### Time gap G between edges
G follows power law with exponential cutoff. \\(p(x) \propto x^{-\ga}e^{-x\gb}\\). \\(\ga\\) stays constant with time, but \\(\gb\\) grows linearly.

### Edge (u, v) destination selection process
Most (30 to 60\%) new edges close triangles: local. Pr(v is k hops away) \\(\propto e^{-ck}\\); Pr(certain v: k hops away) is doubly inverse exponential as number of verteces k hops away itself grows exponentially. \cite{leskovecThesis}

For the creation of the first edge: \\(Pr(degree(v) = d) \propto d^{t}\\), where t = 1 or 0.9 etc..

## Computer networks
Eg: Internet.

### Important matrices
Matrices showing delay, traffic etc..

#### Matrix completion problems
Often these have missing values. So, use matrix completion approaches.

##### Peculiarities
Maybe try to embed network: but often triangle inequality and symetry doesn't hold.

Missing values tend to be highly structured. But many matrix completion methods assume that missing values tend to be uniformly distributed.
