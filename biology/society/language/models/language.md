+++
title = "Language"
+++

## Definition
A language model models the probability of every possible string being a sentence spoken by a human.

## Applications
Language models are useful in speech recognition, machine translation, handwriting recognition, machine translation, speech generation, (context sensitive) spelling correction etc..

## Multi-set of words model
This very simple model ignores word order - a very important information. It models $Pr(w_{1:m}) = \prod Pr(w_i)$; and the parameters of this model - the word occurrence probabilities - are easily estimated; and it is known to follow the Zipf's law, which is a heavy tailed distribution. This is actually the 1-gram model, a member of the n-gram model family described elsewhere.

## n-gram model
See Probabilistic models survey.

### Performance
A trigram model is very commonly used. Google, as of 2011, seems to have built a good 5-gram model.

## Finite state transducer (FST)
### Definition
These are Finite State Automata (FSA described in the boolean functions survey) extended to include production of outputs corresponding to each state transition.

It is specified by a state set $S$, a subset of initial and final states, a state transition relation: $S \times I \to S \times O$ - where $I, O$ are the input and output alphabet.

Because of the non-deterministic nature of the transitions, multiple output strings may be produced for a single input string. A probabilistic version of an FST produces probability scores along with the output strings.

Depending on whether a non-empty output string is produced by the operation of the FST on a given input string $s$, it may be declared to be accepted or rejected.

### Transition graph
As in the case of a FSA, FST can be written as a transition graph - except that each edge is labelled by both an input and an output character.

