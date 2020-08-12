+++
title = "04 n-gram model"

+++
## Model
### Subsequence/ prefix probabilities: notation
First, one models the probability \\(Pr(w_n|w_{1:n-1})\\) of a word \\(w_n\\) coming after \\(n-1\\) words \\(w_{1:n-1}\\).

#### Occurrence near sentence terminals
We want to use the notation \\(w_n|w_{1:n-1}\\), with \\(n\\) fixed, for considering the event where \\(w_n\\) appears after the string \\(w_{k+1:n-1}\\) appearing at the beginning of a sentence - distinct from the case where \\(w_{1:k}\\) is some specific string. We accomplish this by setting \\(w_{1:k} = @^k\\), where \\(@\\) represents a special 'sentence terminal' word. This will allow us to write \\(Pr(w_n|w_{1:n-1})\\) without being wrong.

Similarly, if \\(w_{n} = @\\), \\(Pr(w_n|w_{1:n-1})\\) denotes the probability of \\(w_{1:n-1}\\) appearing at the end of a sentence.

Note that \\(Pr(w_1|@^m)\\) actually represents the probability of \\(w_1\\) appearing first in a sentence, and \\(Pr(w_2|@^{m-1}w_1)\\) is the probability of \\(w_2\\) appearing 2nd in a sentence after \\(w_1\\). They are distinct from probabilities of occurrence of \\(w_1\\) or \\(w_2\\) after \\(w_1\\) irrespective of position in the sentence.

### Actual probability
As a sort of necessary preprocessing, ensure that \\(w_m\\), the last word in the string is \\(@\\), and \\(w_{1:n-1} = @^{n-1}\\).

Then, the probability of generating a given \\(m\\) word string is exactly \\(Pr(w_{1:m}) = \prod_{k=n:m} Pr(w_k|w_{1:k-1})\\).

### Markov assumption
If one makes a simplifying nth order Markov assumption, which says that any word depends only on the previous \\(k<=n-1\\) words, we get the approximation: \\(Pr(w_{1:m}) \approx \prod_{k=n:m} Pr(w_k|w_{k-n+1:k-1})\\).

## Estimation
\\(Pr(w_n|w_{1:n-1})\\) are estimated by counting the number of occurrences of strings \\(w_{1:n}\\) and \\(w_{1:n-1}\\).

### n and corpus size
Even in a large sized corpus, for large \\(n\\), n-string sequences \\(w_{max(k-m+1, 1): k}\\) may be very rare; so it becomes difficult to estimate the necessary probabilities accurately.

One way of dealing with probabilities \\(Pr(w_n|w_{1:n-1})\\) for which there is inadequate data is to replace them with \\(Pr(w_n|w_{2:n-1})\\). In doing this, we have locally simplified the n-gram model into an \\(n-1\\) gram model. One can even recursively reduce the model complexity until the data we have suffices to accurately estimate the simplified model. Thus, there is a tradeoff between accuracy/ complexity and estimability.

Also, storage space required to store model parameters grows exponentially with \\(n\\).

### Rare words
With rare words, one again encounters the problem of being able to estimate \\(Pr(w_n|w_{1:n-1})\\) accurately with limited data. To deal with this, one often replaces rare word occurances with a special word UNK during preprocessing.

## Smoothing
\tbc
