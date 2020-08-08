+++
title = "Search"
+++

## Ranking search query results
Queries \\(q \in Q\\): bag of words, Set of documents D: a seq of words. For query \\(q_{i}\\), retrieved relevant documents \\(D_{i} \subseteq D\\); Got full or partial orderings \\(L_{i}\\). Let \\(Q = \set{q_{i}}\\). Maybe want to complete Q vs D relevence level matrix. Or, given docs D' relevant for unseen query q, want to rank D'.

### Feature extraction
\\(\ftr: Q \times D \to X \in R^{D}\\); D is usually \\(\approx 10\\). \\(\ftr_{i}(q,d)\\) could be TF/IDF, common word count etc.. Let \\(f:X \to R\\) be scoring function; it induces a relevance order \\(\set{z_{i}}\\) on D for every query \\(q_{i}\\); let \\(F = \set{f}\\).

### Objectives to optimize
Let \\(y_{i}\\) be ground truth relevance-ordering of D corresponding to query \\(q_{i}\\); let y be induced by \\(g:X \to R\\).

Loss function: \\(L(f, q_{i})\\) measures deviation of \\(z_{i}\\) from \\(y_{i}\\).\\
Risk: \\(R = \int_{Q}L(f,q) f_Q(q)dq\\). Want to find f which minimizes L. But Pr(q) usually unknown; so minimize empirical risk: \\(\hat{R}=n^{-1} \sum_{i} L(f,q_{i})\\). Assume that \\(\abs{R - \hat{R}} \to 0\\).

### Various Loss functions L
#### Pointwise
\tbc

#### Pairwise
Checks if this is violated: \\(y_{i}(d)>y_{i}(d') \implies f(d)>f(d')\\); so \\((y_{i}(d) - y_{i}(d'))(f(d) - f(d')) \geq 0\\). Widely used. Eg: SVM ordinal regression; ranknet (best pairwise function as of 2009); lambda-rank: \\(f(d) = w^{T}d\\).

#### Listwise
Measure badness of a bigger part of the ranking, not just correctness of ranking of pairs of documents. \\(q_{i}\\) uniquely identified by \\((y_{i}, D)\\); so can consider \\(L(f, y_{i},D)\\) or \\(L(z_{i}, y_{i})\\).

##### Using a probability distribution on permutations
Define prob distribution over permutations \\(Pr_{f}(\pi)\\) with good properties: favors permutations rated highly according to f to permutations rated lower, best permutation according to f has max probability. So find f whose \\(Pr_{f}\\) is closest to \\(Pr_{g}\\). Can minimize cross entropy: \\(L(f, g) = - \sum_{\pi} Pr_{g}(\pi) \log Pr_{f}(\pi)\\) (List net); or \\(L(f, g) = - \sum \log Pr(y_{i}|D, f)\\): thereby maximizing likelihood (List-MLE). These Listwise loss calculation is hard: may need to consider n! permutations: so instead consider only ranking of top \\(k\\) docs induced by f. List-MLE known to be best Listwise loss function based ranking method (2009), also better than all pairsise loss function based methods.

