+++
title = "Decision theory"
+++

Certain elements common to probability density estimation, distribution structure learning (including classification) etc.. can be studied within the abstract framework of decision theory.

## Agents: Actions, policies
How should an agent act in the face of uncertainty, given some observations? Our objective is to find good decision procedures for the agent.

Like a game against nature. See game theory reference for adversarial games.

### State and parameters
#### State space
The state of nature changes, possibly in response to actions made by an agent. The agent must act optimally in some sense in the presence of uncertainty.

#### Parameter space T
Some parameters \\(\gth \in T\\) describe the state of nature (the ground truth), especially as it relates to the action-space of an agent; and they are unknown.

#### State transitions
Some parameters describe state transitions. These are aka population parameters. In some problems, we are to estimate some properties of a population by drawing random samples from it. This unknown parameter/ pattern of the population, \\(t = g(\gth)\\), is a constant. Eg: mean, variance of heights.

### Action space A
Given any change in its knowledge, the agent can act. Its action is chosen from the action space \\(A = \set{a}\\). Actions can change the state of nature and the parameters which specify it.

#### Common examples
In case of density estimation, given the data point \\(x\\), \\(A\\) could be the choice of the density function \\(f_{\hat{t}}(x)\\) as a function of the estimated density \\(\hat{t}\\). In this case, the state of nature is usually not affected by our guess about its parameters.

In hypothesis testing, it could be the probability of the observation \\(x\\), which is a function of the hypothesis chosen earlier.

In case of classification, \\(A\\) would correspond to the various possible labellings of a data point \\(x\\).

### Goodness of actions
#### Loss function L
\\(L:T\times A \to \Re\\). You pick the loss function to best model the situation faced by the agent, and also for mathematical tractability - this is often the modeler's job.

#### Examples
Squared error between prediction and label in case of classification.

\\(-f_{\hat{t}}(x)\\) in case of probability distribution modeling.

### Decision procedure d
#### Mapping observation D to actions
Denote an observation by the random variable \\(D\\). Decision procedures take as input \\(o \in ran(D)\\) and return an action \\(a \in A\\). Their pre-image can be often be replaced with sufficient statistics drawn from observations.

Note that the observation \\(D\\) to which a decision procedure is supposed to respond +++(is different from the training set of prior observations which may have been used to learn \\(d\\)!)+++

#### Deterministic procedures
Deterministic decision procedures make decisions which are a function of the new observation.

A deterministic decision procedure is \\(d:ran(D) \to A\\).

#### Randomized procedures
A randomized decision procedure takes decisions with some randomness, given new observations. So, the randomized procedure is in the convex hull of certain decision procedures.

If the decision procedure randomized, range is the set of random variables with range \\(A\\).

##### Combining decision procedures
Randomized procedures can often be written as a 2-step meta-procedure with step 1: random choice of decision procedures, and step 2: application of the decision procedure chosen.

#### Examples
In case classification, the classification rule can be considered to be a decision procedure.

In the case of distribution estimation, given a point (the observation), the estimated pdf can be considered to be the decision procedure.

In case of hypothesis testing, a certain hypothesis can be considered to be the decision procedure.

## Risk R of decision procedure d
### Motivation and setting
We want to choose a decision procedure from \\(H_n\\) (so named because it is often learned after looking at a sample of size \\(n\\)). We want to pick decision procedure with least expected loss; that motivates the following definition. This is essentially the problem of statistical inference.

### Risk
\\(R:T\times\set{d} \to \Re\\). \\(R(\gth,d) = E_{D}[L(\gth,d(D))]\\). In case \\(d\\) is randomized, the expectation is also over random bits used by \\(d\\).

In case of the estimation or prediction problem, if you use squared distance as \\(L\\), you get the bias - variance decomposition: See estimation section.

### Uncertain ground truth case
#### The need
Suppose that \\(\gth\\) is constant every time you apply the chosen \\(d\\). Even so: When you pick \\(d\\), you don't know \\(\gth\\), the ground truth.

Also, maybe \\(\gth\\), which decides the goodness of response, changes with the actions taken by the decision procedure.

For example, in classification, \\(\gth\\) corresponds to the label \\(y\\) corresponding to the example \\(x\\) seen by the classifier. Even if the classifier knew the distribution \\(f_{Y|X}(y|x)\\) generating the examples, it cannot in general be certain about \\(y\\) given \\(x\\).

#### Frequentist and epistemological approaches
Rooted in the two distinct but overlapping interpretations of probability, we observe two overlapping approaches to statistical inference. The frequentist approach tries to deal with uncertainty by relying on sampling, while only partially restricting the hypothesis space.

Bayesian/ epistemological inference approach tends to posit and quantify prior beliefs about the ideal decision, and use this together with sample evidence to reach a conclusion.

#### Prior beliefs about ground truth
We can model the uncertainty in the ground truth using a probability distribution \\(\gth \distr P_T\\) over \\(T\\); so now take\\ \\(R'(d) = E_{D, P_T}[L(\gth,d(D))] = \int_T E_D[L(\gth,d(D))]P_T(\gth) d \gth\\).

As probability theory is being fully used to model uncertainty, this is called Bayesian risk evaluation.

#### Prior beliefs about best d
For every \\(\gth\\), there is a best decision procedure \\(d(D)\\). So, alternatively, one model uncertainty in what the best decision procedure is directly as \\(d \distr P'(d)\\) and look at \\(\gth = f(d_1)\\). Then, one can write the risk \\\\(R'(d) = E_{D, P'}[L(f(d_1),d(D))] = \sum_{d_1} E_D[L(f(d_1),d(D))]P'(d_1)\\).

#### Additive form
Let \\(g(d; d_1) = E_D[L(\gth,d(D))] = E_D[L(f(d_1),d(D))]\\). \\Then, \\(R'(d) = E_{P'}g(d; d_1)\\). If the loss \\(g(d; d_1)\\) had a sharp drop around \\(d\\), or if \\(P'(d)\\) was highly concentrated around \\(d_1\\), we could approximate this as \\(R'(d) = g(d; d_1) P'(d)\\).

For convenience for use in optimization problems, one often takes logarithms on both sides to get: \\(R''(d) = \log g(d; d) + \log P'(d)\\).

This roughly motivates the following form used in practice: \\(R''(d) = R(d) + l r(d)\\), where \\(L\\) is loss function, r() is regularizer. The regularizer, r() ensures that the prior belief about \\(\gth\\) is taken into account while evaluating the risk of decision procedure \\(d\\).

Example: Suppose that we are estimating \\(\mean\\): eg: avg age. But, prior belief is that it is \\(\mean_0\\). Thence a decision procedure: \\(R(\mean, \hat{\mean}(D))  = 0.2 \mean_0 + 0.8 n^{-1}\sum X_i\\).

##### Strict restrictions
Finding \\(\min_d R(d) + l r(d)\\) is same as \\(\min R(d) : r(d) \leq c_l\\). This is a strict restriction on the choice of \\(d\\), unlike a more flexible prior assumption about the pdf of \\(d\\) which is the hallmark of epistemological/ Bayesian inference; where irrespective of a low prior probability assigned to a certain \\(d\\), the weight of evidence could lead to choosing that \\(d\\).

### Geometry of R
Visualize \\(R(\gth, d)\\) with \\(\gth \in T\\). Make a function space, label each dimension with some \\(\gth \in T\\). For any fixed \\(d\\), \\(R(\gth, d)\\) is a vector in this space. Given set \\(S = \set{d}\\), can get set \\(S'\\) of all randomized decision procedures derivable from these. Risks \\(R(S')\\) are points in the convex hull of \\(R(\gth, d) \forall d\in S\\). In 2 d: it is a convex polygon: only straight edges.

### Empirical risk
Aka empirical avg loss. \\(\hat{R}(d;D) = n^{-1}\sum_{x_i \in D} L(\gth, d(x_i))\\). You have: \\(R(d) = E_D[\hat{R}(d;D)]\\).

Where we have prior beliefs about the nature of the best \\(\gth\\) or \\(d\\), empirical risk is used with a regularization function to define an alternate risk function. See Bayesian risk evaluation for details.

### Minimal risk
#### Definition
The lowest (expected) risk any decision procedure \\(d\\) can achieve is often called the Bayes Risk.

It is not necessarily \\(0\\). For example, suppose that we were considering classification of points drawn from the distribution \\(f_{Y|X}(y|x), f_X(x)\\). Even if the decision procedure had complete knowledge of \\(f_{Y|X}(y|x), f_X(x)\\), its risk in general would not be 0 as there is the possibility that \\(\hat{y} = argmax_y f_{Y|X}(y|x)\\) is the wrong labeling for \\(x\\).

#### Risk Consistency of d
Let \\(D_i\\) be data of \\(i\\) sample points. Then does \\(d(D) \to^p \gth\\) [In case of the parameter estimation task]? Or does \\(R(\gth, d) \to^p minRisk\\)?

#### Risk persistence
Ground truth \\(\gth\\). Let \\(\hat{t}\\) be the chosen decision procedure. \\Take \\(\hat{\gth} = \argmin_{t\in H_n} R(t)\\). How close is \\(R(\hat{t})\\) to \\(R(\hat{\gth})\\)?

As \\(n \to \infty\\), usually want \\(\hat{t} \to \gth \\) or better: \\(R(\hat{t}) - R(\gth)\to 0\\). But it may not be possible as decision procedures can't get to it, or maybe \\(\gth\\) changes with n.

Approximation error \\(R(\hat{\gth}) - R(\gth)\\). Then does \\(d\\) at least minimize estimation error \\(R(\hat{t}) - R(\hat{\gth})\\)?

#### In High dimensional setting
Let the dimensionality of data-points be \\(p\\). Suppose \\(p>>n\\) and we still want a decision procedure which works well. What is risk persistence here? Hence a new notion: As \\(n \to \infty\\), we still want check if \\(R(\hat{t}) - R(\hat{\gth}) \to 0\\); while \\(p\\) scales with \\(n\\).


## As a POMDP
POMDP's are well suited to abstract active learning; but it is informative to consider it more generally.

### State and observation
The ground truth, or parameter \\(T\\) corresponds to the state of the world in case of a POMDP. The observation \\(D\\) gives some clue about the current state.

### Transitions
Unlike active learning problems, often the state transitions and observations thereof are independent of the agent's actions. So, the agent often has no control over input distribution. 'Parameters' in decision theory may confusingly include both those describing the ground truth and those describing the transition function.

### Action and Loss
The loss function corresponds to the reward which depends on current state and the action taken.

### Policy
The decision procedure \\(d\\) corresponds to the POMDP's policy; except that the belief state is not explicitly considered for our purposes.

### Risk vs value
In the case of MDP's, it is common to assess policies using the total expected reward over a possibly infinite horizon, so a discounting factor \\(g \in [0, 1]\\) is needed. [Expected] risk of a decision procedure focuses on the expected reward.

