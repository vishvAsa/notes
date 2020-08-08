+++
title = "Link prediction"
+++

Graph G = (V, E). Every edge has this label: t(e): The time during which interaction represented by e took place. Given \\(G[t_{0}, t_{0}']\\) (training interval), output a list of edges not presented in it, but present in \\(G[t_{1}, t_{1}']\\) (testing interval). Maybe want to output top n most likely-to-appear edges.

## Motivation
Security. Improving organizational efficiency by going beyond official hierarchy. Inferring missing links from observed network.

## Observations about link prediction
Small world problem: tenuous short links exist between otherwise unrelated nodes: noise wrt to the link prediction problem.

\cite{dln:link-prediction} observed that in their data-sets, new links are 3 or 4 times more often formed at distances \\(\geq 3\\). They compared performance of prediction methods at predicting new links between nodes at distances \\(\geq 3\\).

## Using similarity measures between nodes
\cite{dln:link-prediction} experimented. Performance compared against a random predictor. Katz measure, and variants with added noise reduction performed well. \cite{dln:link-prediction} found that Katz, common neighbors in low rank approximation of G, Adamic/ Adar are similar in terms of common predictions. \tbc

## Reducing noise
Low rank approximation: Take adjacency matrix M; use SVD to get rank k approximation \\(M_{k}\\) of M wrt various norms. Can then use other similarity measure based techniques. Usually, intermediate rank approximation performs best \cite{dln:link-prediction} .

Clustering: Remove tenuous edges.

## Enhance similarity measure for nodes with similar neighbors
Adaptation of 'unseen bigrams' technique from language modelling: word pairs which occur in test corpus but not in training corpus. Take \\(S_{x}^{d}\\): the top d nodes related to x under a similarity measure; get modified score(x,y) = \\(|\set{z: z \in \nbd(y) \inters S_{x}^{d}}|\\).

## Model evolution of E
### Using a linear model
Split E into 2 parts \\
thence get adj matreces A and B. Use various F like \\(F(A) = e^{aA}\\); find parameters a of F to get \\(\norm{F(A) - (A+B)}\\). Take \\(A = U\EW U^{*}\\): \\(\EW\\) decomposition; if \\(F(A) = UF(\EW)U^{*}\\), this becomes: \\(\norm{F(\EW) - (A+B)}\\): this is a least squares curve-fitting problem like \\(\min \sum (e^{a\ew_{i}} - (A+B)_{i,i})^{2}\\).

## The experimental setup
### The problem
Perhaps you have different snapshots of the graph for different times: test set will be the latest snapshot - previous snapshots. Perhaps you have a single snapshot of the graph: test set will be some random split of the graph into training and test edges. n edges to be predicted.

Often compare against a random predictor. The random predictor: What is the expected number of edges you get right if you pick n edges randomly?

To see understand behavior of a single set: Plot precision curve, recall curve.

#### The sparse case
If data is too sparse, there is not enough signal, and similarity measures such as Katz do worse than random. To compare various methods in this case: one picks many mn edges and then compare 'recall': the correct edges in the prediction set.

## Open problems
\oprob \\
Discover better performing link prediction algorithms. Make link prediction algorithms based on distance metrics more efficient.

\oprob Include more data in the social network (eg: paper titles, areas) and improve link prediction performance.

\oprob Improve link prediction performance by giving greater weight to more recent collaborations.

\oprob View training-period collaborations as samples drawn from a distribution on pairs of people; Try to use work on estimating distribution support in link prediction. \oprob You only have +ve labelled examples; see if machine learning provides better learning heuristics in such cases.

