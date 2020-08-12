+++
title = "06 Continuous response variables' prediction"

+++
Aka regression.

For overview, see Statistics survey. Here one models a (set of ) response random variable \\(Y\\) in terms of input variables \\(X\\).

## Data preparation and assumptions
Saling, centering, addition of bias variables is assumed below. That, along with motivation, is described in the statistics survey.

## Generalized linear model
### Linear models
Here, we suppose that \\(L|X \distr XW + N\\), where \\(N\\) is a 0-mean noise RV. Then, \\(E[L] = XW\\), which is linear in parameters \\(w\\).

Correpsonding to the constant variable \\(X_0 = 1\\), we have bias parameters \\(W_{0,:}\\).

### Generalization
One can extend the family of linear models so that \\(E_{L|X}[L] = g^{-1}(XW)\\) and \\(var[L] = f(E_{L|X}[L])\\). Note that the variance is then a function of the predicted value.

A distribution from the exponential family must be used.

#### Log linear model
Aka poisson regression. \\(\log(E[L]) = XW\\).

#### Logistic model
Aka logit model, logistic regression. A generalized linear model. See 'discriminative models of response' section.

#### Perceptron: step function
Here \\(E_{L|X}[X] = I[XW > 0]\\).

## Multi-layer generalized linear model
Aka Artificial Neural Network, multi-layer perceptron (a misnomer given that the activation function described below is not the non-differentiable step function). 

### Model
Suppose one wants to predict \\(Y=y\\) using the input \\(X^{(0)}=x^{(0)}\\) (aka input layer). The model \\(Y = h(X^{(0)})\\) is hierarchical.

One can obtain layer upon layer of intermediary random variables \\(X^{(j)} = \set{X_i^{(j)}}\\), where \\(X_i^{(j)} = f(\dprod{w_i^{(j)}, X_i^{(j-1)}} + w_{i, 0}^{(j)})\\). Suppose one has \\(k\\) such intermediary layers. One finally models \\(X_j^{(k+1)} = h(\dprod{w_j^{(k+1)}, X^{(k)}})\\) (aka the output layer).

#### Component names
The intermediary layers are called hidden layers. Neurons in the hidden/ 'skip' layers are called hidden units. Neurons in the output layer are called output units.

\\(a_i^{(j)} = \dprod{w_i^{(j)}, X_i^{j-1}} + w_{i, 0}^{(j)}\\) is called the activation.

#### Activation function
\\(f\\) is usually a non-linear function - the logistic step function with the range [-1, 1] and the tanh function are commonly used in case of classification problems being solved by relaxation to regression problem. In case of regression problems or in case of 'skip' layer variables, the final \\(f\\) is just the identity function - or a sigmoid function which approximates it. 

#### Visualization as a network
There is the input layer, hidden layers and the output layer. Directed arrows go from one layer to the next. This is a Directed Graphical Model except that the intermediary dependencies are deterministic, not stochastic.

#### Nomenclature
Depending on preference, a model with \\(K\\) layers of non-input (intermediary + output ) variables is called a \\(K+1\\) or \\(K\\) layer neural network. We prefer the latter.

2 layer networks are most common.

### Connection to other models
\tbc

### Model training
One can write \\(Y = h(X)\\) where \\(h\\) is a differentiable, yet non-convex function. One can fit model parameters to training data \\(((x_i, l_i))\\) by minimizing (possibly regularized) empirical loss.

#### Gradient finding
Given an error fn \\(E(y)\\) for a given data point \\((x, t)\\), various optimization techniques require one to find \\(\gradient_{w} E(y)\\). This gradient can be found efficiently using the error back-propagation algorithm.

The idea is that the parameter \\(w_{k, j}^{(f)}\\) only affects \\(E(y)\\) through the output : \\(X_k^{(f)}\\), so one can apply the chain rule for partial derivatives.

For output unit, \\(\frac{dE(X_1^{(t)})}{dw_{1, j}^{(t)}} = \frac{dE(X_1^{(t)})}{dX_1^{(t)}} f'(a_1^{(t)}) X_j^{(t-1)}\\). Denote \\(d_1^{t} \dfn \frac{dE(X_1^{(t)})}{dX_1^{(t)}} f'(a_1^{(t)})\\) - the quantity multiplied with \\(X_j^{(t-1)}\\) in the expression. This is aka 'error'.

Assume that \\(\frac{dE(X_1^{(t)})}{dw_{i, j}^{(f)}} = d_i^{(f)} X_j^{(f-1)}\\) holds for neurons in the levels \\(f:t\\). We can see that a similar expression holds for level \\(f-1\\) too.

For symbol manipulation convenience, set \\(i\\)th input to \\(k\\)th neuron in layer \\(f\\): \\(Z_{k, i}^{f} = X_i^{f-1}\\). Using chain rule for partial derivatives:

\\(\frac{dE(X_1^{(t)})}{dw_{i, j}^{(f-1)}} = \sum_k \frac{dE(X_1^{(t)})}{dZ_{k, i}^{f}} \frac{d X_{i}^{(f-1)}}{dw_{i, j}^{(f-1)}}= \sum_k d_k^{f} f'(a_i^{(f-1)})X_{j}^{(f-2)}\\) .

Setting \\(d^{(f-1)}_i = \sum_k d_k^{f} f'(a_i^{(f-1)})\\), we see from mathematical induction that \\(\frac{dE(X_1^{(t)})}{dw_{i, j}^{(f-1)}}\\) can be calculated for all neurons given the 'error' for the layer ahead.

So, the back propagation algorithm to find the gradient is: First run the neural network with input \\(x\\) and record all outputs \\(X_j^{k}\\). Starting with the output layer, determine the error \\(d^{(f-1)}_i\\) and thence the appropriate gradient components.

#### Weight initialization
Starting point for (stochastic) gradient descent is done as follows. Weights can be initialized randomly with mean 0 and standard deviation \\(1/m^2\\), where \\(m\\) is the fan-in of a unit.



### Flexibility
There are theorems which show that a two layer network can approximate any continuous function to arbitrary accuracy - provided a sufficient number of intermediary variables are allowed!

The flexibility of the multi-layer generalized linear model derives from the non-linearity in the activation functions.

### Disadvantages
Objective function minimized during training is non-convex.

Large diversity in training examples required. The model learned is not accessible for use in modeling the process producing the data realistically, though it may be effective.

It can be inefficient in terms of storage space and computational resources required.

The brain by contrast solves all these problems because: its hardware is tuned to the neural network architecture; its training examples have suffiencient variety.

## Deep belief network
Extending the idea of neural networks, adding structure to it and using a sort of L1 regularization to make the network sparse, one gets deep belief networks. These have proved to be very successful in many applications since 2007.

\tbc

