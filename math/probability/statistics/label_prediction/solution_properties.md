+++
title = "Solution properties"
+++

## Empirical risk minimization vs expert systems
One way to predict \\(L\\) given \\(X\\) is to learn the process by which \\(L\\) is generated: one can manually create a labeling algorithm by listing out rules which influence labeling: for example by studying expert human animals.

Often, you cannot know enough about how stuff works in order to have explicit rules. Eg: Expert system for handwriting detection can be tougher to make than a training a statistical model. And, repeatedly, in various fields, statistics based automatic learning of rules has outperformed manually developed expert systems. Eg: Natural language processing.

Here, we mainly consider statistical learning.

## Hypothesis classes
General discussion about hypothesis classes described in the Decision Theory chapters applies.

Suppose that the labeling rule, on observing \\(X\\), produces the labeling rule \\(Y\\).

### Probabilistic models
As the hypothesis class, one may choose a family of probabilistic models for \\(f_{Y|X}\\) specified either directly as in the case of discriminative probabilistic modeling, or indirectly by specifying a generative model: that is, modeling \\(f_{X,Y}\\) (which may involve modeling \\(f_{X|Y}, f_Y\\)).

Model/ parameter selection for such hypothesis classes is described in the distribution structure learning part.

### Mean or Mode models
Alternately, rather than modeling the pdf \\(f_{Y|X}\\), one may choose a hypothesis class composed of labeling functions of the form \\(f(X; W) \to ran(Y)\\) where \\(W\\) is the parameter variable.

This may actually correspond to proposing deterministic labeling functions which return either label mode or the mean (in case of vector labels). In the latter case, we may also be interested in specifying or modeling \\(var_{Y}[Y|X=x]\\) to indicate our confidence in the estimate.

#### Comparison to probabilistic models
Depending on the loss functions, the risk of different randomized labeling rules with the same expectation may be different. So, when it is reliably possible to do so, modeling the pdf \\(f_{Y|X}\\) is probably a better as one can then evaluate confidence, risk etc.. involved in making a classification decision.

Yet, task of modeling the expectation or mode of \\(Y\\), being relatively simpler, lends itself to better modeling and learning.

### Probabilistic models: comparison
Often, modeling \\(f_{Y|X}\\), requiring fewer modeling assumptions, may be more easily and accurately done.

But, modeling \\(f_{X,Y} = f_{X|Y}f_Y\\) gives us more expressiveness. For example, in case of unbalanced data it may be important to explicitly model \\(f_Y\\); and it can be estimated easily using the empirical distribution based on \\(\set{(X_{i}, L_{i})}\\).

#### Discriminative model corresponding to generative model
Consider the form of the discriminative model \\(f_{Y|X, W}\\) yielded by the generative model \\(f_{X|Y} f_Y\\), which is parametrized by \\(W\\). When derived using the generative model, the range of \\(W\\) (and therefore \\(f_{Y|X, W}\\)) is restricted by the form of \\(f_{X|Y} f_Y\\). So, the hypothesis class \\(D\\), where \\(W\\) has no restrictions, is atleast as large as the hypothesis class constituted by labeling rules corresponding to the generative mode. So, the pros and cons of hypothesis classes of different sizes, as discussed in the decision theory chapter, apply.

#### Ease in using unlabeled points
Suppose that the distribution family \\(Pr(y, x|w)\\) is parameterized by \\(w\\). Then, in picking the best \\(w\\), one often maximizes the likelihood of observing datapoints \\(\set{(x^{(i)}, y^{(i)})}\\).

If we have unlabeled observations \\(\set{x^{(j)}}\\), as in semi-supervised learning to make predictions: you can then select \\(w\\) which account for these unlabeled points along with labeled points!


## Discrete deterministic labeling rules
### Decision surfaces
One can view discrete labeling rules \\(h\\) as dividing \\(ran(X)\\) into decision regions separated by decision boundaries/ decision surfaces, which correspond to all \\(x\\) such that \\(Pr(Y=y_1|X=x, S) = Pr(Y=y_2|X=x, S)\\) where \\(S\\) is the training data.

### k-ary classifier from binary classifier
k-ary classification reducible to binary classification in many ways.

Can learn many 'one against rest' classifiers; and then assign the class corresponding to the deepest distance the point achieves from the decision hyperplane.

Can learn many one against one classifiers; and then use majority vote for prediction. This approach often results in ambiguous regions.

### Curse of dimensionality
\tbc Exponential increase in volume associated with adding extra dimensions: can't calculate and record \\(f_{X|C_{k}}(x)\\) or \\(Pr(C_{k}|x)\\) for exponential number of cases as you don't have so many examples. More difficult to answer 'How are data points belonging to same class similar?'

See also curse of dimensionality subsection in the clustering problem.

