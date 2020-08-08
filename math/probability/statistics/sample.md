+++
title = "Sample"
+++

A statistical population exists. Thence, a sample of \\(N\\) points is drawn, from which we attempt to infer properties of the population.

## Properties
Sample statistics are considered elsewhere.

### Sample bias
Pick 2 people: he is either Indian or Chinese; but there exist over 180 other countries.

### Completeness, accuracy of examples
It is possible that, some points are not completely specified. For a certain point \\(X\\), the component \\(X_j\\) may not be specified. This ambiguity allows optional auxiliary data to be considered.

### Independence of data points
In some cases, \\(\set{X_{i}}\\) are usually iid \\(\distr D'\\).  Eg: Predicting whether a visitor to a store is likely to be a customer or a criminal.

In other cases, the input points \\(\set{X_i}\\) are not identically distributed.

#### Sequential
Firstly, sequential data points can be ordered: \\((X_i)\\). In addition, \\(X_i \nperp X_{i-1}\\).

So, data points need not be considered sequential merely because of the presence of a Time/ Position feature. Eg: Identifying words with spelling mistakes in a sentence.

#### Adversarial
Or they may be chosen adversarially : See game theory ref.

#### Active choice
Or, as in the case of active learning problems, the learner can take actions to change input distribution. Reinforcement learning is considered in the AI survey.

### Labeling of the data.
Some features, aka the label, may be a (unknown) function of the others. Thence, deducing dependence of label on other features is the prediction problem.

### In case of small sample
Usually insufficient data to guess shape of distribution; can only see large effects: so need large sample to see small effects; only extreme outliers stand out remarkably.

#### Few high dimensional data-points
\\(D >> N\\): so the parameter space to explore is huge: maybe 1 parameter for each feature. Yet want to be able to estimate the parameters generating the observations. This is only possible as there is low dimensional intrinsic structure in the data; can do well using a small hypothesis space.

#### Examples
Take the brain activity vs neuronal activity matrix. Activity-levels of millions of neurons is feature for each data-point. Brain activity is highly defined by a very small number of spiking neurons.

Gene expression vs exterior condition matrix.

Social networks: Individual activity vs group action matrix.

## Exploration
Whatever the statistical problem is, exploratory analysis is often the first step in solving the problem.

One often studies the empirical distribution of the data and estimates the central tendency, range, median, mode, characteristics of outliers, number of missing values. It is further described in the distribution structure learning part.

One may also cluster the data.
