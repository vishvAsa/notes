+++
title = "0 Problems"
+++

Aka supervised learning. There are a variety of prediction problems depending on the combination of problem components described below.

## Core problem
### Input and response variables
A label/ target/ response/ dependent \\(L\\) depends on some predictor/ input/ independent variable \\(X\\) (a set of features/ covariates).

### Range of X and L
Input space is \\(D\\) dimensional.

\\(range(L)\\) may be a subset of a vector space. It may be continuous or discrete.

### Labeling rule sought
The agent/ decision rule produced by the learning algorithm must label \\(L\\) some unlabeled test point(s) \\(X\\), after some observations/ examples/ training points \\(S\\). As for decision theory in general, such a labeling rule may be randomized or deterministic.

## Action space
\\(range(L)\\) constitutes the action space in a decision theoretic view of the problem. It is possible for the action space to be expanded to include stating indecision about a label.

## Actual phenomenon
### Randomized function
In general, the labeling process can be seen a randomized function \\(c:ran(X) \to \\) the set of RV's over range(L).

### Volatility in form
IN some problems, the randomized labeling process \\(c\\) changes with previous labelings of the labeling process ( and therefore with observations \\(S\\)). Eg: Predicting the position of a plane 5 seconds in the future, given its positions in the past few seconds.

In many other problems, the labeling process \\(c\\) remains independent of observations.

### Deterministic Labeling function
For simple phenomena, a deterministic function \\(c\\) suffices to relate \\(X\\) and \\(L\\), so that \\(L = c(X)\\).

If \\(ran(L)\\) is discrete, \\(c\\) is a discrete function, aka discriminant function: \\(c: dom(X) \to \set{C_{k}}\\).

#### Features
The labeling function can often be expressed using a feature mapping function \\(\ftr(X)\\). The various dimensions of \\(ran(\ftr)\\) aka features of the input.

### General noise model
#### Using a randomized noise function
Usually, the following model can be used to described the phenomenon: \\(Y = f(X), L = g(Y)\\), where \\(f\\) is a deterministic labeling function, \\(g\\) is a randomized function, called the noise function, which maps \\(ran(f)\\) to a random variable \\(L\\).

\\(g\\) is usually considered to be symmetric around the expectation.

#### Using a Noise variable
Dependence of \\(L\\) on \\(X\\) can be written in terms of a deterministic noise application function \\(h\\) and a random noise variable \\(N\\), \\(L = h(f(X), N)\\), where \\(f\\) is a deterministic labeling function.

### Noise in case of vector labels
Let \\(L = h(f(X), N)\\) describe the dependence of \\(L\\) on \\(X\\), as described above. If \\(ran(L)\\) is part of a vector space, \\(h()\\) can often be described arithmetically.

#### Additive noise
An additive noise application model is common: \\(L = f(X) + N\\), and \\(N\\) is usually has a symmetric (usually normal) distribution centered around \\(0\\).

#### Multiplicative noise
Multiplicative noise models of the form \\(h(Y) = NY\\) are also interesting. In this case, \\(N\\) is centered at 1.

## Example/ training points
The general properties/ peculiarities of a sample (eg: correlatedness, completeness, online vs offline learning) in general is considered elsewhere; here we are concerned with peculiarities associated with samples in case of the prediction problem.

### Labeled
Given \\(N\\) example points \\(S = \set{(X_{i}, L_{i})}\\). When such labeled examples are provided as part of the problem, the problem is called supervised learning.

### Unlabeled
It is possible that we are additionally given a set \\(U\\) of unlabeled points. In such a case, the problem is called 'semi-supervised learning'. The reason maybe that sometimes, easy to get data points, but expensive to label them; or maybe labels are noisy.

### Alternative labels
For some data points belonging to the input space \\(ran(W)\\), labels \\(K_i\\) may be provided. So, examples are pairs \\((W_i, K_i)\\). Let the underlying labeling functions be \\(f_K: ran(W) \to\\) RV's with range \\(ran(K)\\) and \\(f_L: ran(X) \to \\) RV's with range \\(ran(L)\\).

When the two input spaces and labeling functions are related, this additional data helps in predicting \\(L\\). Aka transfer learning problem. Eg: Such examples may help deduce relevant features.

In case of cross domain learning, \\(ran(K) = ran(L)\\), but possibly \\(ran(W) \neq ran(X)\\). Eg: search query result relevance identification.

In case of cross category learning, \\(ran(K) \neq ran(L)\\).

In some applications both the label range and the input space may be the same, but the classificaiton functions may still be different. Eg: Netflix movie ratings by various people.

Eg application: Robot learns to stand using new legs faster using lessons learned when learning to stand using old legs.

## Distribution on test points
This is an essential factor in calculating the risk of labeling rules.

This 'test distribution' usually usually is close to the training data distribution.

### Transduction vs induction
If the test points are known during training: transduction; eg: semi-supervised learning: the labeling problem is called transduction.

Otherwise, the labeling problem is called one of induction. This is a harder problem.
