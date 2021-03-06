+++
title = "+Population model"
+++

## Approaches
- Process based, open ended "theory"
- Fitting a model to a specific dataset/ outcome.

## General framework
Let \\(N_t\\) be reproducing individuals at time \\(t\\). Let \\(b\\) be offspring per individual per generation, who survive to become reproducing adults. Let d = death probability per individual per generation.   
Then, number of individuals one generation hence is \\(N_{t+1} = N_t + Births - Deaths = N_t +b N_t - d N_t = N_t (1 + b - d) = R N_t \\).  So, \\(N_{t+1} = R^t N_1\\)


## Constant R cases

- \\(R < 1 \implies b < d\\) and \\(N_{t} → 0\\) as \\(t → \infty\\).
- For R = 1, b=d and \\(N_{t+1} = N_t\\)
- \\(R < 1 \implies N_{t} → \infty\\) as \\(t → \infty\\).

## R linearly reducing with population
Model: \\(R = R_0 (1-\dfrac{N_t}{k})\\) for \\(N_t \leq k\\), leading to \\(N_{t+1} = R_0 N_t(1-\dfrac{N_t}{k})\\). Taking \\(x_t = N_t/k\\) (aka rescaled population to get "population density"), this can be simplified to \\(x_{t+1} = R_0 x_t (1-x_t)\\).