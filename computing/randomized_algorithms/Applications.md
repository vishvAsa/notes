+++
title = "Applications"

+++
For number theory applications, see number theory ref.

## Perfect matchings
### Bipartite graph
G = (U, V, E); \\(|U| = |V| = n\\). Matching: \\(\set{e} \in E\\) not sharing endpoints. Perfect matching (pm) has size n. Naive alg takes \\(O((n!)n)\\) time.

Make symbolic matrix with \\(A_{i,j} = x_{i,j}\\) if \\((u_{i}, v_{j})\in E\\), else 0. Let Q(x) = det(A) : \\(n^{2}\\)-nomial, 'symbolic determinant'. G has pm iff \\(\exists r: Q(r) \neq 0\\). \\(deg(Q) \leq n\\). Take prime \\(p > 2n\\), pick r from \\(Z_{p}\\); by Schwartz Zippel Thm, \\(Pr(Q(r) = 0 | \exists r'|Q(r') \neq 0) < 2^{-1}\\).

If pm unique, find pm in polytime: Repeat: \\(E = E - \set{e}\\); see if G still has pm. (Parallelizable.)

#### If pm not unique
Take uniformly random weight fn \\(w:[1,m] \to [1,2m]\\); let \\(W(S) = \sum_{d \in S} w(d)\\).

##### Isolation lemma
Let \\(S_{i} \in [1,m]\\); take k \\(S_{i}\\). \\(Pr(\exists minWt\ S_{i}, S_{j} | e \in S_{i} , e \notin S_{j}) \leq (2m)^{-1}\\): by principle of deferred decisions: Pick W(e) last to \\(W(S_{j}) - W(S_{i} - \set{e})\\). So, \\(\union\\) bound: Pr(\\(\exists\\) unique \\(S_{i}\\) with \\(W(S_{i})\\) min) \\(\leq 2^{-1}\\).

Get w(e) \\(\forall e = (u_{i}, v_{j}) \in E\\). Get matrix \\(B_{i,j} = 2^{w((u_{i}, v_{j}))}\\). Then \\(det(B) = \sum_{pm\ M} (\pm 2^{W(M)})\\). So find pm by finding highest power of 2 dividign det(B).

### General graph
(Tutte): G = (V, E); Make Tutte matrix: \\(\forall i<j\\) if \\((u_{i}, v_{j})\in E\\), \\(A_{i,j} = x_{i,j}\\) and \\(A_{j,i} = -x_{i,j}\\), else 0. Let \\(|A| = Q(x)\\) multinomial; G has pm iff \\(\exists x Q(x) \neq 0\\): \\(det(A) = \sum_{\pi} sgn(\pi) \prod A_{i, \pi(i)}\\); if some \\(\forall \pi: \prod A_{i, \pi(i)} = 0 \\), no pm. Else, Take prime \\(p > 2n\\), pick r from \\(Z_{p}\\), take Q over \\(Z_{p}\\); by Schwartz Zippel, \\(\exists x\\) where \\(Q(x) \neq 0\\).
