+++
title = "Parallel computing"
+++

General parallel programming concerns are considered in the distributed computing survey.

## Thread abstraction
Parallel programs can be considered in terms of threads of computation. When data is shared, one should take care of race conditions.

### Fork and join
With this paradigm, a thread can fork to form a new thread. \tbc

## Mapreduce
### Computation flow
#### Input preparation
Master splits the input into multiple chunks, as necessary. It collects counter updates from mappers and reducers. May provide a html status page.

If applicable, the master also joins disparate input sources to produce a (key, valueList) pair.

There can be multiple disparate input source tables - each may be fed to a different mapper. Outputs from disparate mappers are combined based on key before reduce stage.

#### General flow per mapper
(key, value) - mapper - ((key, value)), counter updates - [combiner - ([same key], valueList)]

A combiner is a special type of reducer which may combine values from the outputs of a single mapper task before sending them accross the network for combination by reducers.

#### Flow per reducer
There is one shuffler per reducer. One reducer per shard.

(key, value) from various mappers - shuffler - (key, valueList) - reducer - ([same key], valueList), counter updates in output (file) shard.

#### Output storage
A file location in a distributed file system, together with the desired number of shards and output format is usually specified.

#### Thread safety
There is one thread running through the map function generally. So, in case of object oriented programming languages: the mapper object is usually thread-safe, Although class variables are not.

\tbc

