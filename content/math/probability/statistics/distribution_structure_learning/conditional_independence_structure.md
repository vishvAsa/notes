+++
title = "Conditional independence"
+++

## Problems
In all of the following, we suppose that \\(f_X(x)\\) is given by a graphical model.

### Model Estimation
The most ambitious goal is to estimate the parameters associated with the distribution. This can often be accomplished by minimizing the log loss associated with the conditional distribution \\(f_{X_i|X_{\nbd(i)}}\\), once the structure of the underlying graphical model has been estimated (ie feature selection is done).

### Edge recovery
Deduce the graph encoding the conditional independence relationships among features.

#### Ising models: Signed edge recovery
Take the ising model. Deduce not just the edge, but also the sign of the correlation/factor for interaciton between the nodes. Eg: Maybe want to deduce relationship voting patterns of legislators.

### High dimensional case
Often have few (f(d)) samples from high-dimensional (d-dim) data, so \\(f(d) << d\\).

#### Measuring performance
Redefine statistical consistency: let both \\(d\\) and f(d) tend to \\(\infty\\).

## Approaches
### Learn closest tree
(Chow, Liu).
#### Aim
Here, the aim is to learn a tree structured graphical model which is closest to the underlying distribution in terms of KL divergence.

#### Algorithm
Construct a complete graph, where each edge is labeled with the mutual information estimated from the given sample. Then, run the minimum spanning tree algorithm over this graph.

## Learn neighborhoods
### For ising models
Consider for each node the conditional probability distributions \\(f_{X_i|X_{\nbd(i)}}\\), suppose that in the underlying graphical model, each edge is associate with a parameter \\(\gth_{ij}\\). Suppose that the log loss is \\(l(X, \gth) = \hat{E_x}[-log (f_{\gth_i}(x_i| x_{\nbd(i)}))]\\). We can use log-loss minimization with l1 regularization : \\(\min_{\gth_i} l(X, \gth_i) + \gl \norm{\gth_i}_1\\) to learn the (sparse) neighborhood of each node (ravikumar et al). This \\(l_1\\) regularized logistic regression problem, in the case of exponential family distributions (including binary distributions) is a convex problem and can be efficiently solved.

#### Results
For signed edge recovery, in case the distribution satisifies certain special conditions, signed edge recovery and good parameter estimation are guaranteed. The l1 regularization ensures that \\(n = O(d\log p)\\) samples suffice to get a good model-estimate, where \\(p\\) is the number of nodes and \\(d\\) is the max-degree of the underlying graphical model.

Otherwise, \\(O(p)\\) samples would be required, which is not feasible for high-dimensional model-selection.

#### Caveats
However, experiments suggest that picking the right choices of \\(\gl\\), and thresholding after optimization can be very tricky. The \\(\gl\\) suggested may be applicable only for models with large \\(p\\).

#### Analysis technique
To prove the guarantees, one considers the optimality criteria of the convex optimization problem mentioned earlier, which says \\(\gradient l(X, \gth_i) + w = 0\\) for some subgradient vector \\(w\\). Then, we can begin to construct a solution \\(\gthEst_i, w\\) satisfying this condition, based on knowledge of actual parameters \\(\gth^*_i\\). One then shows that the remaining optimality conditions  and the claimed properties are satisfied.

### For discrete graphical models
In this case, each edge is associated with \\((m-1)^{2}\\) parameters \\(\gth_{ij}\\), and each node is associated with \\(m-1\\) parameters, where \\(m\\) is the size of the state-space. The algorithm for the Ising model case can be extended to the case of discrete graphical models, except that we will need to use \\(l1/l2\\) regularization: \\(\norm{\gth_{ij}}_{2}\\).

This is multi-class logistic regression with l1/l2 regularization, which is a convex program. The same caveats and advantages as earlier apply.

