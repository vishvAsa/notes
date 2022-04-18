+++
title = "Processor"

+++
## Components
Every processor consists of an arithmetic and logic unit/ circuit (ALU), a few memory registers with a few layers of cache, memory and graphics controller circuits in order to be able to perform I/O operations and using extended working memory.

## Tight knit Parallelism
### Multiple cores
Usually multiple cores share memory.

### Pipelines
Aka instruction level parallelism. 

Processing often has pipeline structure; eg: fetch instruction, fetch data, execute instruction, store data. There are usually separate functional units within a single processor which take care of these separate tasks in each clock cycle.

'Superscalar processors' try to parallelize these tasks. Branch prediction problem: how to pipeline if the instruction to be executed is a conditional: multiple choices of what to prefetch to the pipeline.

#### Simultaneous multithreading
Parallelism in use of functional units within processors to execute two instruction threads at once, rather than one instruction thread faster is a feature provided in 'SMT' processors. This is called hyperthreading by Intel.

## Memory cache
There is a tradeoff between latency and miss-rate: the larger the cache, the lower the possibility of necessary data not being cached, but latency is higher because of greater addressing/ accounting needs. Hence, there are multiple cache-levels, denoted L1 .. Lk in increasing order of size.

## Quality
The frequency indicates the speed at which a processor can be operated. Processors also differ in the ability to undertake 16 vs 32 vs 64 bit arithmetic. They also differ in the number of cores to accommodate parallelism.

They differ in the number and sizes of memory-cache levels they offer, and the speed with which they can be accessed.

They differ in the power they consume - for mobile devices, the ability to adjust processing speed (stepping) according to computing needs is important.

### Best and economical
2011: 4-core 64 bit processors running at 2.7 GHz with 4MB L3 cache size by Intel and AMD are available for \\(\approx 110\\\)$.

### Trends
Graphene replacing silicon can lead to continuation of moore's law - enabling smaller and smaller transistors on the Integrated circuit/ IC chip. But smaller communication channels implies greater power costs for pushing electrons across the channels within the chip.

Then, it will be possible to have a thousand-core processor.
