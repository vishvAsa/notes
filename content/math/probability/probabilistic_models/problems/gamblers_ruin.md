+++
title = "Gambler's ruin: biased dice"
+++

## Problem
Say you start with a capital of 25. Then you fight your rival. If you win you add 1 to what you have, if you lose you subtract 1 from what you have. If you reach 0 you're extinct. If your probability of winning is 49.5% calculate ~ the median number of fights you will last before going extinct. This will teaches you something about survivorship, background extinction and the fate of empires.

## Notation
- P(increase by 1) = P(+1) = .495
- P(decrease by 1) = P(-1) = .505
- C(n) = capital at step n. C(0) = 25.
- \\(C(n) → 0)\\ is an event where at step n, capital becomes 0 but not before.

## Expected number of turns to ruin
- E[capital after 1 turn] = 25 -.01
- E[capital after n turns] = 25 - .01n
- For n=2500, ruin in expected.

## Median
### Simulation
- R code [here](https://github.com/vvasuki/misc-R/tree/master/probability/gamblersRuin).

### Theoretical bound attempt
- Statement: Find n such that Pr(capital C(n)=0) = 1/2.
- For n<25, Pr(C(n)=0) = 0
- For n=25, \\(Pr(C(n)=0) = P(-1)^{25}\\)
- For n=25+k where k is odd, \\(Pr(C(n) → 0\\) is impossible. <div class="proof">Beyond 25 losses, it is impossible to have exactly k/2 wins as it won't be a whole number.</div>
- At n=25+2k, C(n) becomes 0 only if there are k wins and 25 + k losses, and if for any t<n, C(t) was not 0. An upper bound on the number of such events is \\(\binom{n}{k} = \frac{n!}{k!(n-k)!}\\). We consider this n=25+2k case below. 
- \\(P(C(n) → 0) \leq \binom{n}{k}P(-1)^{25+k}P(+1)^{k}\\)
- \\(P(C(n) → 0) \geq P(-1)^{25+k}P(+1)^{k}\\)
  - Find m for which \\(\sum_{m}^{k=1} P(-1)^{25+k}P(+1)^{k} = 0.5\\). 
- TODO: incomplete