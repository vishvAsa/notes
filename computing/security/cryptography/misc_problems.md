+++
title = "Misc problems"
unicode_script = "devanagari"
+++


## Code obfuscation
Hide the intent of the code. Security with auxiliary input useful here. \\(M \to O(M)\\) with polynomial blowup in size, run-time. M, O(M) compute the same function: or maybe approximately. Virtual black box property: \\(\forall\\) polytime algs A, \\(\exists\\) simulator \\(S^{M}\\) with black box access to M: \\(|Pr(A(O(M)) = 1) - Pr(S^{M}(1^{|M|}) = 1)| \leq \eps\\): \\(1^{|M|}\\) bounds run-time; whatever property of M A can grok by looking at the code, S can grok just by looking at its behavior.

If you can exactly learn C, \\(c \in C\\) can't be obfuscated.

### Point functionss
Eg: password, cd key. Point fn can be obfuscated.  \why

## 0 knowledge proofs
Prover P, Verifier V. P proves statement s to P wihtout giving away the proof. Eg: convince V that N=pq, a product of exactly 2 primes without giving away p, q. Useful in many crypto protocols.

### 0 knowledge proofs of membership (\\(x \in L?\\)) for NP complete languages
Take graph G = (V, E), \\(|E|=m\\); P wants to show V that \\(G \in 3-COLOR\\); P knows valid coloring C. P commits to C by sending encrypted \\
\\(enc(C(x)) \forall x\in V\\) (example of cryptographic commitment protocol); Let V pick any \\(e = (u, v) \in E\\); P reveals colors of u, v in C by sending keys to only \\
\\(enc(C(u)),\ enc(C(v))\\); P permutes colors in C; the cycle repeats. If C invalid, P will will fool V with prob \\(\leq (1-m^{-1})\\); so after \\(m^{2}\\) repeatitions, P is very unlikely to have been fooled. 

3-COLOR is NP complete; so can translate any NP complete language membership problem to this and use 0-knowledge prover.

## Oblivious transfer OT
Sender \\(S \to R\\); S has information p,q. R wants some info x = p or q from S, x must be oblivious to S. \tbc

