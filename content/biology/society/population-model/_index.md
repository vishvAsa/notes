+++
title = "+Population model"
+++

## Criteria to judge models
- Does it answer some clear causal questions? (of the type: "Under conditions A, X leads to Y.") Or does it intend to make quantitative predictions?
- Is it sufficiently abstract (and therefore intelligible), and not loaded down with unnecessary details?
- Is it mathematically elegant (in a way that could contribute to building mathematical theories for their own sake)?

## Approaches
- Process based, open ended "theory"
- Fitting a model to a specific dataset/ outcome.

## Resources
- Vishvesh Guttal 2021 course: [videos](https://www.youtube.com/playlist?list=PLSG8-hBQ2Vg2zs_KhBhEH3rGaZcKNkdGr), [canvas site](https://canvas.instructure.com/courses/2579503).


## General framework
Let \\(N_t\\) be reproducing individuals at time \\(t\\). Let \\(b\\) be offspring per individual per generation, who survive to become reproducing adults. Let d = death probability per individual per generation.   
Then, number of individuals one generation hence is \\(N_{t+1} = N_t + Births - Deaths = N_t +b N_t - d N_t = N_t (1 + b - d) = R N_t \\).


## Constant R cases
- So, \\(N_{t+1} = R^t N_1\\)
- \\(R < 1 \implies b < d\\) and \\(N_{t} → 0\\) as \\(t → \infty\\).
- For R = 1, b=d and \\(N_{t+1} = N_t\\)
- \\(R < 1 \implies N_{t} → \infty\\) as \\(t → \infty\\).

## R linearly reducing with population
Model: \\(R = R_0 (1-\dfrac{N_t}{k})\\) for \\(N_t \leq k\\), leading to \\(N_{t+1} = R_0 N_t(1-\dfrac{N_t}{k})\\). Taking \\(x_t = N_t/k\\) (aka rescaled population to get "population density"), this can be simplified to \\(x_{t+1} = R_0 x_t (1-x_t)\\).

## R exponentially decays
Model: \\(R=e^{r(1−\frac{N_t}{k})}\\), with  \\(N_{t+1}  = R N_t \\). 
\\(e^{r}\\) is the equivalent of \\(R_0\\), the max rate of growth.
If k is \\(\infty\\), \\(N_t\\) grows at max rate. If k is \\(N_t\\), numbers stay constant. So, \\(k\\) is max numbers that the environment can support.