+++
title = "Discrete Time"
+++

## General framework
Let \\(N_t\\) be reproducing individuals at time \\(t\\). Let \\(b\\) be offspring per individual per generation, who survive to become reproducing adults. Let d = death probability per individual per generation. Then, number of individuals one generation hence is \\(N_{t+1} = N_t + Births - Deaths = N_t +b N_t - d N_t = N_t (1 + b - d) = R N_t \\). So, \\(R ∈ [0, b_{max} + 1]\\).

- Oft, R is a function of \\(N\\).
- Often, \\(d=1\\) - non-overlapping generations.
- At equilibrium, population size remains constant: \\(N_{t+1} = N_t = N^*\\).  
- An equilibrium is stable if any perturbation from the equilibrium dies down. Local extinction (N=0) is an unstable equilibrium - introduce a few individuals and population size starts approaching a different equilibrium N.  

## Constant R cases
- Density independent population growth.
- So, \\(N_{t+1} = R^t N_1\\).  Exponential growth.
- \\(R < 1 \implies b < d\\) and \\(N_{t} → 0\\) as \\(t → \infty\\).
- For R = 1, b=d and \\(N_{t+1} = N_t\\)
- \\(R > 1 \implies N_{t} → \infty\\) as \\(t → \infty\\). 

## R linearly reducing with population
- Model: \\(R = R_0 (1-\dfrac{N_t}{k})\\) for \\(N_t \leq k\\), leading to \\(N_{t+1} = R_0 N_t(1-\dfrac{N_t}{k})\\). Taking \\(x_t = N_t/k\\) (aka rescaled population to get "population density"), this can be simplified to \\(x_{t+1} = R_0 x_t (1-x_t)\\) for \\(x ∈ [0, 1]\\)
- Logistic population growth. Population converges to some finite value.
- Equilibria: \\(x_{t+1} = x_t = x^*\\). So \\(x^*= R_0(1-x^*)\\)
  - \\(x^* = 0\\) for all \\(R_0\\)
  - \\(x^* = (R_0-1)/R_0\\) for all \\(R_0 > 1\\)
  - So, 1 is a bifurcation point, where stability of the population changes.

## R exponentially decays
Model: \\(R=e^{r(1−\frac{N_t}{k})}\\), with  \\(N_{t+1}  = R N_t \\).
\\(e^{r}\\) is the equivalent of \\(R_0\\), the max rate of growth.
If k is \\(\infty\\), \\(N_t\\) grows at max rate. If k is \\(N_t\\), numbers stay constant. So, \\(k\\) is max numbers that the environment can support.