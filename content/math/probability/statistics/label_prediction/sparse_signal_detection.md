+++
title = "Sparse signal detection"
+++

## Problem
### Generating process
Suppose that the \\(p\\) dimensional 'observation vector' \\(Y\\) is generated from \\(Y_i \distr N(\gth_i, \stddev^2) = \gth_i + N(0, \stddev^2)\\). \\(\stddev\\) is known.

In addition suppose that \\(\gth\\) is sparse. The set \\(K = \set{i: \gth_i \neq 0}\\) is called the signal set.

\\(n\\) observations \\(\set{Y_i = y_i}\\) are made. Usually \\(n << p\\).

### Decision rule sought
The problem for the decision rule, given \\(Y_i\\) (the observation), is to estimate \\(\gth_i\\). More simply, one might seek decision rules to estimate the indicator variable \\(I[\gth_i \neq 0]\\) given \\(\gth_i\\).

### As a classification problem
This is essentially a classification problem with some peculiarities. It is an abduction problem (the test points are known beforehand), and no labeled training set is provided.

Framing it as a classification problem is a good way to state the final goal, but one can not apply solution ideas typical of classifiers naturally. So, this view is not very informative.

### Peculiarities
If the number of signals, \\(|K|\\) were known beforehand, the problem would be trivial: one would just select the top \\(|K|\\) elements of \\(\hat{E}[Y]\\).

## Risk
Identifying non-signals as signals often carries an especially high penalty. Eg: In case of gene-expression data, in response to certain conditions, the expression (ie, signalness) of each gene identified as being a signal is verified using laborious wet-lab experiments.

So, it is often hard to express a formula for evaluating the actual risk of a decision procedure, yet one can make qualitative statements about it. Yet, one can define a simpler risk function and show that a decision procedure chosen using a certain process will be low risk. \tbc

## Hypothesis classes
### Desired qualities
#### Sparsity
The main point in modeling \\(\gth_i\\) is to ensure that the model results in sparse \\(\gth\\): that is \\(\gth_i\\) should often be close to 0.

#### Adaptability to different sparsity levels
The hypothesis class should include \\(\gth\\) of different sparsity levels.

#### Robustness to large signals
The hypothesis class should include \\(\gth\\) with arbitrarily large components.

### Probabilistic models
\tbc

#### Scale mixture models
Scale mixture models for \\(\theta_i\\) say: \\(\gth_i|\gl_i = N(0, \gl_i^2)\\). 

