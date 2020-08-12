+++
title = "01 Function space"

+++
## Notation
Consider a function class \\(C\\) defined on the input space \\(X\\). Let \\(p\\) be a probability measure on \\(X\\).

## Euclidean Vector spaces
The definition of standard inner product and \\(l_p\\) norms can be extended to work with function spaces, when they are regarded as vector spaces with dimensionality equal to \\(|X|\\); while also considering the \\(p\\). These are described in the vector spaces survey.

## Metric space using Disagreement probability
One can define a metric space using the norm \\(d(f, g) = Pr_p(f(x) \neq g(x))\\).

## Measuring size of function class C
If \\(C\\) is finite, we can simply use \\(|C|\\). If \\(C\\) is not finite, we can consider the metric space defined using the 'probability of disagreement' metric. In this space, one can use covering and packing numbers to measure the size of \\(C\\). These concepts are described in the topology ref.

If \\(dom(f), \forall f \in C\\) is the boolean hypercube, we can use some other ways of measuring complexity of \\(C\\), these are described in the boolean functions survey.

### For smooth functions: just measure size of the input space
For functions which satisfy Holder continuity generalized to sth derivative: (see topology ref): \\(\norm{f^{(s)}(x) - f^{(s)}(y)} \leq c \norm{x-y}^{a}\\): \\(\log (N(\eps, \\)C\\(, \norm{})) \approx (\frac{1}{\eps})^{\frac{D}{s+a}}\\). \pf: Take \\(\norm{f(x) - f(y)} \leq c \norm{x-y}\\); \exclaim{now in input space, rather than in the function space!}; thence any \\(\eps\\) covering of parameter space will define corresponding cover in the fn space.

### Relationship with vcd of related binary classifiers
Let \\(G = \set{g:R^{D} \to [0, B]}\\). Take set \\(G_t\\) of binary classifiers defined by supergraphs of g: see boolean fn ref; let \\(d(G_t)\\) be its VCD. Let \\(M\\) be the packing number. \\(M(\eps,G, \norm{.}_{L_p(v)}) \leq 3(2e (\frac{B}{\eps})^{p} \log(3e(\frac{B}{\eps})^{p}))^{d(G_t)}\\). So, \\(M \approx O((\frac{1}{\eps})^{d(G_t)})\\). \why
