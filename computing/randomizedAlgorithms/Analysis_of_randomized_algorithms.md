+++
title = "Analysis of randomized algorithms"

+++
See probabilistic analysis ref.

## General Tricks
Running time of \textbf{MDP-algorithm}: Make Markov chain, make RV \\(Z_{i}\\) steps for going to absorbing state from i, get and solve recurrance eqns for \\(E[Z_{i}]\\).

## Results
2-SAT rand alg needs \\(O(n^{2})\\) time. 3-SAT rand alg (without restart) needs \\(O(n^{3/2}(\frac{4}{3})^{n})\\) time as Pr(moving forward in Markov chain) \\(< 1/2\\). Max load Y when hash function from k-universal family used: \\(Pr(Y > \sqrt[k]{2n})<2^{-1}\\) (bounding expected number of collisions, use Markov).