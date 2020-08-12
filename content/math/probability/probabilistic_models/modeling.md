+++
title = "Modeling"
+++

## Model/ hypothesize for predictive ability
Many natural phenomena are not deterministic. We often want concise explanations for observed phenomena. This will grant us great predictive ability. Probability theory aims to model and understand uncertainties such phenomena.

### Realism vs conciseness
The more the model reflects reality, the better it is. Yet, as we want to avoid overfitting to limited data, we seek conciseness.

So, the art here is to define more and more general/ concise models, which also manage to model reality closely, whose parameters turn out to be easy to learn in practice.

For details about the modeling process and its use, see the statistical inference survey.

### Frequentist vs Subjective interpretations
There are two ways of modeling uncertainty (or conversely, 'interpreting' probabilities).

Physical/ empirical/ frequentist probability reflects frequency with which it occurs, which is itself unknown in advance. In its view, probability is embedded in the universe - as exemplified by Quantum physics.

Subjective/ evidential/ epistemological/ Bayesian probability instead reflects uncertainty in an entity's estimation of the frequentist probability - so it is in a sense more honest.

These models of uncertainty lead to different but overlapping approaches to statistical inference - see statistics survey for details. But, in either case, the mathematical theory/ axiomatization is identical.

### Sampling mechanism
Often the probability measure is fully defined using the sampling mechanism (modeled to suit the application domain). A few probability puzzles and paradoxes rely on ambiguity in the description of the sampling mechanism.

Counting is also often fundamental to the definition of probability mechanisms. That is considered in the probability theory survey.

#### Possible errors
When analyzing sampling mechanisms and probability errors, one should be rigorous in order to avoid errors - particularly when dealing with conditional probabilities. This is illustrated with examples elsewhere.

## Using the models
For ideas about actually doing feature extraction (maybe using kernels), using these model families, selecting the right model(s) based on training data while avoiding overfitting, see statistics/ pattern recognition survey.

### Effectiveness of simple models
It is a very good idea to start with the simplest models - despite the lack of sophistication, they yield surprisingly good results. Eg: Naive bayes model in classification, sequence independence assumption in sequential labeling tasks (eg: Part of speech tagging.)

