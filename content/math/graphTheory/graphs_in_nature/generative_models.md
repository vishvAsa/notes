+++
title = "Generative models"
+++

## Applications
Finding patterns and abnormalities in real world networks.

Making either fine or coarse grained hypotheses of graph formation process.

### Making Extrapolations
What will G look like 10 months later?

So, algorithmic benefits of the model important: How easy is it to calculate paths? Eg: A may be queries, C may be retrieved documents, maybe we want to find the closest commercial/ advertisement-carrying queries, so want to find shortest path to commercial query in the network of queries.

### Graph sampling
Deduce information about the graph by sampling a small number of nodes: if the temporal properties of the statistics which result from this sampling.

## Evaluation of models
Does the model produced have desired global static and temporal properties? Are the fine grained node arrival and edge formation processes modelled as a time, or do nodes arrive, form edges and stop?

How likely is the generation of a certain real-world network, or of a network with similar properties by the random processes in the model? Is the edge-formation process likely under it?

How useful is it? Is graph sampling easy to determine its properties?

Is it easy to extrapolate its properties analytically? Can you calculate the likelihood of a model given a real world graph G? If so, ye can pick the max likelihood model and extrapolate what G looks like n years later.

## Achieving various properties
### Strategies
Look at models which achieve certain properties, even if they don't satisfy other properties; combine their best flavor to produce a good model.

Or observe closely microscopic nw evolution properties: edge initiation, edge destination selection, lifetime etc.., mimic them, see if it produces desired global properties.

### Power law
Power laws often appear in combination with self-similar fractal structures.

Naive power law generator: edges come in, pick m from power law, randomly create m edges.

#### Hypotheses
Power law for in-degree is achieved by some flavor of 'preferential attachment' method.

Heavy tails emerge if nodes try to optimize connectivity under resource constraints. So may be humans are engineering things, like the internet, language. Eg: Take a language with n words, cost of word with length j is log j; this leads to power law distribution on word length.

Criticism: But then, monkey typing a keyboard with n letters and a spacebar achieves power-law distribution on word-length.

#### Other factors
A model based on exponential node lifetime distribution and power law with exp cutoff distr for time gap between edges yields power law out-degree distr.

### Acheiving good community structure
Copying model acheives good community structure.

### Edge destination selection
Most edges (u, w) close triangles. Triangle closing: many choices for w, what yields best improvement over random choice of w among 2-hop neighbors: choose \\(v=\nbd(u)\\) by process A; then choose \\(w=\nbd(v)\\) by process B. Biggest improvement yielded when processes A and B are uniform random choice: bias towards w with more 2-hop paths leading to them.

## Models which don't yield heavy tailed distributions
### Random graph generators
(Erdos, Renyi) G(n,p) model. G(n, 0.5) is the uniform distribution over all graphs with \\(|V|=n\\). G(n,N) model. Exhibits phase transition phenomenon. \tbc

Don't produce heavy tailed distributions.

### Stochastic Adjascency matrix
Take adj matrix, replace 1 and 0 with probabilities p and q. If p=q, get Erdos, Renyi graph.

## Preferential attachment generators
New node arrives; draws number of edges m from a distribution; probability of connecting with u \\(\propto degree(u)\\).

Yields power law in-degree distribution with degree 3, low diameters. 'Rich get richer'.

## Edge Copying model
Node v arrives, picks no of edges m, either picks node v and does this m times: a] connects to random \\(u \in \nbd(v)\\) or b] with prob \\(\gb\\) connects to random node. Generates power law distribution with exponent \\((1-\gb)^{-1}\\).

Leads to good community structure.

## Random walk model
New node comes in, does random walk, for each visited node, create edge with some probability. Generates power law distribution.

## Community guided attachment
Represent recursive structure of communities with a tree T of height H. Take perfectly balanced T; leaves will be the nodes; \\(Pr((u,v) \in E) \propto c^{-\del(u,v)}\\), where \\(\del\\) is tree distance.

Leads to densification: \\(E(t) \propto N(t)^{a}\\), as expected. If c near 1, lack community structure; if near 2, get good community struct.

### Dynamic community guided attachment
Start with one node. Keep adding levels to a b-ary balanced tree by adding nodes \\(\set{u}\\), out-edges from each u to v with \\(Pr((u,v) \in E) \propto c^{-\del(u,v)}\\).

Leads to densification: \\(E(t) \propto N(t)^{a}\\); also to power law distribution for in-degrees.

### Defects
Diameter grows slowly. No heavy tailed out degree distr.

## Small world model
Start with lattice; for each edge with prob p, move edge to random node. Low p values tend to yield good community structure.

(Kleinberg) Yields small diameter, easily discoverable paths if long range neighbors chosen in a certain way.

## Forest fire model
Node v arrives, chooses preexisting ambassador node u, forms link to u, picks random x and y, selects x out-links and y in-links from u to \\(\set{w_{i}}\\), forms out-links to \\(\set{w_{i}}\\), does the same from each \\(t\in \set{w_{i}}\\) recursively: the fire spreads.

### Good properties
Heavy tailed in-degree: due to 'rich get richer' flavor: highly connected vertices easily reached, irrespective of initial ambassador node.

Community structure, due to 'copying' flavor.

Heavy tailed out-degree: good chance to form many links.

Densification power law: due to 'community guided attachment' flavor: lot of links formed near the community.

Shrinking diameter also observed.

\oprob: Does it have good clustering coefficient distribution?

## Modelling Microscopic network evolution
Parameters: Node arrival fn N(), \\(\ga, \gb\\).

At each time step: check for Node arrival according to N(); every new node samples lifetime and creates first edge according to preferential attachment; nodes \\(\set{u}\\) which are awake create an edge (e, w) by triangle closing by picking random neighbor v and then a random \\(w \in \nbd(v)\\); they then sample sleep time from distr: \\(Pr(G=g) = g^{-\ga}e^{-g \gb}\\); repeat.

When a real graph is evolved with this model, it achieves power law degree distribution, expected clustering coefficient vs degree graph, distribution of shortest paths. Densification, shrinking diameter observed by other authors.

## By evolution of affiliation network G' = (A,C,E')
### Preferential attachment + edge copying
(Lattanzi, Sivakumar).\\
Affiliation nw evolution: Pick \\(d', d'' \in N\\); start with affiliation nw \\(G'_{0}\\) where each \\(a \in A\\) has min degree d', every \\(c \in C\\) has min degree d''. With probability p, evolve A: add an actor a, find a preferentially chosen prototype \\(a' \in A\\), randomly copy d' of its edges. Similarly, with prob (1-p) evolve C.

At each time step, can get social nw G=(A,E) among A by creating an edge (a,b) when they share a community; upon addition of an actor a, can also add edges to s preferentially chosen actors.

#### Good properties
In G': Results in power law degree distribution for degrees of nodes in both A and C. In G: results in power law distribution for A; yields densification of E, shrinking/ stabilizing diameter.

#### Algorithmic benefits
G sparsifiable while mostly preserving distances from a set of relevant nodes.

## Kronecker power graphs
### Kronecker-multiplied graphs
(Leskovec et al). Take adjascency matreces A, B. Edge property: \\(A \kron B\\) is a graph with \\(Edge(X_{i,j}, X_{k,l})\\) iff \\((i,k)\in edges(A) \land (j,l)\in edges(B)\\). So, like placing graph B in stead of every node of A, and then making extra edges. Could be disconnected if no self-loops. Defines Kronecker power graph \\(G_{k} = G^{(k)}\\): \\(G_{1}\\) assumed to have self loops for each node.

Can also use a stochastic adjascency matrix for \\(G_{1}\\).

### Properties
From Edge property: Degree distribution of \\(G_{k}\\) is kth Kronecker power of \\((d_{1} .. d_{n})\\): so multinomial. EW distribution is \\((\ew_{1} .. \ew_{n})\\). Components of each eigenvector follow a multinomial distribution. \why \\(E_{k} = E_{1}^{k}, N_{k} = N_{1}^{k}\\): so follows densification power law.

From Edge property: If A, B have diameter at most d, \\(A \kron B\\) has diameter at most d. If \\(diam(G_{1}) = d\\), \\(diam(G_{k}) = d\\).

For stochastic Kronecker products: Degree distribution, scree plot shown to compare well with real world graphs. \oprob Demonstrate the theoretical connection with the power law degree distribution.

### Defects
Does it have community structure? Does it have a good clustering coefficient distribution? Presumed answer no.

## Other generators
Redirection models: produce constant diameter, logarithmically increasing avg degree. Exponential random graphs

### Variations
Slight tweaks to better imitate real graphs: eg: orphans.

## Evolution of affiliation nw in social nw websites
Extends microscopic nw evolution model thus: At each time step, each awakened node v does this: pick number of groups to join, n from \\(ke^{-kn}\\) with mean \\(k^{-1} = r deg(v)^{g}\\): thus striving for exponential distribution of number of groups of nodes of given degree, polynomial growth of avg number of groups wrt degree; join n groups doing this: with prob t create a new group; else join existing group: with prob \\(p_{v} = \eta deg(v)\\) join a group picked through a friend: \\(\eta\\) represents friend's influence; else join random group.

Yields same properties for social nw evolution\\
 as microscopic evolution model; achieves power law group size distr; suitable fraction of singletons in groups (by tweaking t, \\(\eta\\)); exponential distr for num of affiliations for nodes of given degree.

