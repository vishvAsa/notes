+++
title = "Document classification and clustering"
unicode_script = "devanagari"
+++

Aka text mining. Corpus of documents. Usually position of document in corpus ignored in modeling, just like bag of words assumption.

## Feature extraction
Document is a string of words; but want a simpler representation.

Maybe just the set of words which appear is most important: use word-counts. Maybe number of occurances is also important.

#### Burstiness
First time a word appears, it is very informative; but its second occurance is much less surprising/ informative. Rarer the word, the more this is true.

### Bag of words assumption
Aka word exchangability. Each document modeled as just a bunch of words. Ignore stopwords, words with low I(word; document).

## Dimensionality reduction
Results in noise reduction: good way of tackling synonyms. Considers the entire corpus.

### Approaches
Can look at the feature vs item matrix, and try to find a low rank approximation for it. This yields the latent factors behind features and items.

Or, can describe a parametrized process which creates a vector in the feature space (an item), and find the parameters which generated each item. This yields the latent factors behind items.

## Model class distribution using word counts
Can take word counts, then use multinomial distribution to model class distr. But this ignores burstiness; so it is appropriate only for common words.

#### DCM distr
Better model to utilize avg rare, very rare words. Draw document specific multinomial distribution.

## Classification
Documents naturally belong to many classes.

## Clustering
Coclustering useful. Clustering words also useful in query enhancement.

Coclustering : Can view as a bipartite graph clustering problem (Dhillon).

