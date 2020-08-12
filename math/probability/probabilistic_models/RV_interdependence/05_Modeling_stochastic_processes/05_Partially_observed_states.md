+++
title = "05 Partially observed states"

+++
## Observations, states
\\((X_i)\\) are called features/ covariates/ predictor/ input/ observed variables. \\(\seq{L_i}\\) is the unobserved response/ state variable sequence. \\(X_i\\), being a partially dependent of \\(L_i\\), can be viewed as a partial observation of the state \\(L_i\\).

The state space is \\(ran(L_i)\\), while the observation space is \\(ran(X_i)\\).

### Use
These models are not only used for deriving models for \\(f_X\\), but also for determining the state sequence \\(L\\) given \\(X\\).

### Applications
Spelling corrector, where X stands for the observed typed word and L stands for unobserved dictionary word. 

Predicting part of speech is a classic application of HMM's.

## Model classes
### Generative model of Pr(X, L)
As in the case of general models of response variables, one may use these models to derive models for \\(f_{L|X}\\) if needed.

This class of models includes HMM's.

### Model L given X
Aka Conditional random field (CRF). Here, one uses a discriminative model \\(f_{L|X}\\); so no effort is wasted in modeling \\(f_X\\). The most common CRF is just a chain among \\(L_i\\).

#### Ignoring sequentiality
One can model \\(f_{L|X}(l |x) = \prod_i f_{L'|X'} (l_i|x_i)\\). This model works surprisingly very well: Eg: In part of speech tagging, it yields around .95 correctness, while HMM may yield perhaps .02 more accuracy.

Note that this is not entirely same as Naive Bayes because \\(ran(X_i)\\) may be multidimensional, and the  model \\(f_{L'|X'}\\) need not assume that these features are independent. So, any of the wide variety of classifiers may be used.

## Partially observed state chain
Aka Bigram Hidden Markov Model (HMM).

### Graphical model
The graphical model of the observation and label sequences has the following structure for \\(i = 2:N\\) :

{{< figure src="../images/bigram_HMM.svg" >}}


### Representations
Parameters of a bigram HMM are the state transition probabilities \\(f_{L_t|L_{t-1}}\\) and observation generation probabilities: \\(f_{X_t|L_t}\\). As in the case of fully observed state chains, the state transition probabilities can be represented using a transition matrix or as labels of edges in a state transition graph which could now be expanded to include vertices corresponding to various observations.

### Decoding/ filtering
#### Problem
We want to find the most likely state sequence \\(X_1:X_N\\).

#### Message passing algorithm
Viewing the state-chain as an equivalent undirected tree-structured graphical model, we can solve the problem using the divide and conquer max-product algorithm. When the messages passed during this computation are done in an order similar to that described in case of the forward-backward algorithm for finding marginal state distributions, we have the Viterbi algorithm.

### Online label distribution inference
#### Problem
Unlike the decoding problem, one is not satisfied with finding the most likely state sequence, the task is to find \\(f_{L_N|X_{1:N} = x_{1:N}}\\) at time \\(N\\).

#### Forward algorithm
One can use a node elimination/ message passing \\
algorithm applied to find the marginal probability distribution in the equivalent undirected tree structured graphical model. The node elimination ordering is: \\(1 .. N\\). So, this is aka 'forward' algorithm.

This algorithm can be described inductively. At step \\(t\\), suppose that one has determined \\(f_{L_{t-1}, x_{1:t-1}}\\), one simply does: 

$$f_{L_t, x_{1:t}}(l_t) = \sum_{l_{t-1}} f_{L_{t-1}, x_{1:t-1}}(l_{t-1}) f_{L_{t}|L_{t-1}}(l_t|l_{t-1}) f_{X_t|L = l_t}(x_t)$$.

The base case is when \\(t = 1\\), and \\(f_{L_1|x_1} = f_{X|L_1}(x_1)f_{L_1 = l}\\) can be easily determined. So, by induction it follows that we are able to determine \\(f_{L_N, X_{1:N} = x_{1:N}} \propto f_{L_N| X_{1:N} = x_{1:N}}\\).

#### Analysis
This is an \\(O(|T|^{2})\\) operation at each time step, where \\(T\\) is the state space.

If there are \\(N\\) time steps, the algorithm yields the correct result for \\(f_{L_N|x_{1:N}}\\). But for \\(k < N\\), \\(f_{L_k|x_{1:k}} \neq f_{L_k|x}\\). This can be remedied by using the forward backward algorithm described below.

### Past Label Distribution inference
#### Problem
Aka Smoothing. One wants to find the sequence of distributions \\((f_{L_k})\\). This is a particular type of inference.

#### Algorithm
One simply uses the node-elimination/ message passing sum-product dynamic programming algorithm to find marginal probabilities \\(f_{L_k}\\) of tree structured graphical models.

This is aka the forward backward algorithm when done for all \\(k\\), and when computation is done in the following order: upchain 'messages' (\\(m_{t-1 \to t}\\)) are passed first (in the forward step) and then down-chain 'messages' (\\(m_{t+1 \to t}\\)) are passed (in the backward step).

#### Analysis
The first step corresponds to the forward step described earlier, so \\(f_{L_i, x_{1:i}}\\) is computed, at each node \\(i \in 1:N\\).

In the backward step, at each node \\(i \in N:1\\), \\(f_{x_{i+1:N}|L_i}\\) is calculated. This can be described iteratively: suppose that \\(f_{x_{i+1:N}|L_i}\\) is available, then one can find: \\(f_{x_{i:N}|L_{i-1}}(l_{i-1}) = \sum_{l_i} f_{x_{i+1:N}|L_i}(l_i) f_{L_i|L_{i-1}}(l_i|l_{i-1})\\). So, it is in a way symmetric to the forward step.

Then, \\(f_{L_i, x} \propto f_{L_i| x}\\) can be found by multiplying these.

### Learning given (X, L) examples
Aka Supervised HMM learning. The basic idea is to use the empirical transition/ observation generation probabilities in order to estimate the HMM parameters.

#### Smoothing
Especially in the case of observation generation probabilities, some smoothing is required: otherwise the distribution model would assign a probability of 0 to every state sequence \\(l\\) which might generate the observation sequence \\(x\\) containing a word not seen among the labeled examples. Also, it may be desirable to ensure that the observation generation probability \\(f_{X'|L'}(x'|l') > 0\\) for any pair \\((x', l')\\).

#### Reestimation using observation sequences
Suppose that one also has access to samples of \\(X\\), one can improve the parameter estimates by applying the EM algorithm described elsewhere for the case where only samples of \\(X\\) are provided.

### Learning given observation samples X only
To do this, starting with an initial guess about the parameters \\(\param^{(0)}\\), one can iteratively produce parameters \\(\param^{(i)}\\) with greater likelihood values \\(f_{X|\param}(x)\\) from \\(\param^{(i-1)}\\) using the EM local optimization algorithm.

Two steps of the algorithm: 1] For each sample \\(x\\): using \\(\param^{(i-1)}\\) with the forward-backward algorithm, infer distributions \\(f_{L_i| x}\\); 2] Use this distribution to update maximum likelihood estimates [ie expectations] of the number of occurrences of \\(k \in ran(L_i)\\), \\((k_1, k_2) \in ran(L_i)^2\\), \\((k, x)\\); using which \\(\param^{(i)}\\) is computed as in the supervised case (: empirical emission and transition probabilities, possibly smoothed).

## k-gram HMM
One can extend the notion of bigram HMM's to allow the current state to depend on previous \\(k-1\\) states. Analogous the case of k-gram Markov chains, these can be reduced to bigram HMM's by expanding the state space to \\(ran(L_i)^{k-1}\\). Thus, inference and learning algorithms for bigram HMM's can be adapted to work on k-gram HMM's.
