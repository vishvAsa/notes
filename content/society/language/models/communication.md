+++
title = "Communication"
+++

## Speech generation
Speech generation involves the following tasks:

-   Intention: Generating the thought to be spoken in the internal
    language of logic.

-   Generation: Translating the logical language into natural language.

-   Synthesis: Speaking the generated words with appropriate stresses,
    accents etc..

## Speech comprehension
### Tasks
Speech comprehension involves the following tasks:

-   Perception: Translating the sounds heard or symbols seen to words or
    tokens; this is akin to lexical analysis by compilers.

-   Analysis: Inferring a logical sentence equivalent to the spoken
    words. This involves the following tasks:

    Parsing/ syntactic tasks: Understanding the phrasal structure, for
    example using parse trees. As part of this process, the following
    tasks may be done: Part of speech tagging may be done. Phrase
    chunking: In this task, words are chunked to form entities such as a
    noun phrase and a verb phrase, by collecting together qualifiers
    (adjectives/ adverbs) and prepositional phrases.

    Semantic interpretation: Translating the words spoken to the
    language of logic. As part of this, the following tasks show up:
    Word sense disambiguation. Semantic role labeling: Here, a noun
    phrase’s relation to the verb is decided. In case of Indic languages
    (esp Sanskrit), doing this is simplified due to the kAraka system.

    Pragmatic interpretation: Understanding what was meant as opposed to
    what was said. Eg: Detecting sarcasm.

-   Incorporation: Relating the inferred logical statement to the
    knowledge base, and judging whether should be incorporated into the
    knowledge base and doing so if appropriate.

    A common task is resolving what entity a given common noun or
    pronoun refers to. Depending on whether the referred entity is
    within the corpus or whether it should be judged from deep
    understanding of the context, one classifies these into endophora
    and exophora.

There is ambiguity in every subtask above.

### Comprehenders: Manual vs automatic building
#### Manual design
In this approach, a group of people use their knowledge of the language to build an expert system to comprehend a language. But, it is very hard for a group of people to encode all the rules of a language, for which there are a huge number of exceptions. Eg: 'is' in different tenses. An exception to this is probably pANini's grammar for saMskRRita.

Also, even people, in the face of ambiguity, make use of statistics/ probability in comprehension, eg: 'What do people commonly mean by this sentence?'

#### Automatic learning
Here, the computer learns the rules for comprehending a language by looking at statistics learned from annotated corpora.

### Non-Modularity
Consider the various tasks involved in speech comprehension. These tasks may be viewed as happening in a sequence. In reality, however, they are intertwined: For example, one uses the syntactic structure to determine that the words in a sound correspond to 'I ate a rabbit', rather than 'Eye eight arab it.'.

## Part of speech tagging
### Problem
The task is to label all words in a sentence with the most appropriate part of speech. The set of appropriate parts of speech is usually fixed. It either taken to be the set defined by classical grammars of the language or produced more dynamically (supertagging?).

### Purpose
Once part of speech tags are produced, they can be used as a feature while building parse-trees.

It is also useful in word sense disambiguation.

### Approaches
This is an instance of the sequence label prediction problem. So, the approaches described for that general problem in the probabilistic models survey apply here as well.

#### Performance ideal
Given the same text, due to ambiguity in natural language, even taggings produced by human taggers don't agree with each other fully. For example, in english, the level of agreement is around 97\%. So, this forms an ideal for tagging algorithms.

### Using a tagged sample
#### Results
Consider the following for the Portuguese-boscque corpus from CoNLL 2006.

Simply labeling every word with the most frequent tag (noun) yields around 60\% accuracy. Labeling each word with the tag most likely to correspond to that word yields around 92\% accuracy. Using HMM yields around 95\% accuracy.

OpenNLP's implementation of MAXENT model with event threshold 5 and 100 iterations yields around 96.5\% accuracy.

