+++
title = "Random walks on G"
+++

## Markov process with state graph G
Take a Markov chain with probability matrix \\(P_{u, v} = \frac{1}{deg(u)}\\). \\(\pi_{v}=\frac{d(v)}{2|E|}\\). \chk

## Hitting and cover times
Hitting time \\(h_{u,v}\\): expected time to get to v from u. Commute time: \\(C_{u,v} = h_{u,v} + h_{v, u}\\). \\(h_{u,v}<2|E|\\) \why.

Cover time C(G) = \\(\max_{v}\\) E[time to hit all nodes starting from v]. \\(C(G) < 4|V||E|\\) \why.

## Connection with resistive electric networks
Let every \\(e\in E\\) have resistance 1, thence get n/w N(G). \\(R_{u,v}\\): effective resistance between u, v. \\(C_{u, v} = 2m R_{u, v}\\) \why.