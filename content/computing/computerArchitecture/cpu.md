+++
title = "CPU"

+++
## Gross view
Visualize a processor connected to some working memory and to an input output device. This is aka von-Neumann architecture.

## Motherboard
A mother-board provides suitable interface and circuits for communication and power-supply among/ for the processor, working memory, I/O, persistent storage etc..

The motherboard contains the BIOS memory where the boot-program is located.

### System Bus
The system bus is a common communication channel on the motherboard. It has many different dedicated branches for communication between the different components and certain controller hubs.

A computer bus operating with \textit{double data rate} transfers data on both the rising and falling edges of the clock signal.

### Quality
Important factors determining quality are: the bus clock frequency, the choice of I/O protocols supported.

## Processor
### Components
Every processor consists of an arithmetic and logic unit/ circuit (ALU), a few memory registers with a few layers of cache, memory and graphics controller circuits in order to be able to perform I/O operations and using extended working memory.

### Tight knit Parallelism
#### Multiple cores
Usually multiple cores share memory.

#### Pipelines
Aka instruction level parallelism. 

Processing often has pipeline structure; eg: fetch instruction, fetch data, execute instruction, store data. There are usually separate functional units within a single processor which take care of these separate tasks in each clock cycle.

'Superscalar processors' try to parallelize these tasks. Branch prediction problem: how to pipeline if the instruction to be executed is a conditional: multiple choices of what to prefetch to the pipeline.

##### Simultaneous multithreading
Parallelism in use of functional units within processors to execute two instruction threads at once, rather than one instruction thread faster is a feature provided in 'SMT' processors. This is called hyperthreading by Intel.

### Memory cache
There is a tradeoff between latency and miss-rate: the larger the cache, the lower the possibility of necessary data not being cached, but latency is higher because of greater addressing/ accounting needs. Hence, there are multiple cache-levels, denoted L1 .. Lk in increasing order of size.

### Quality
The frequency indicates the speed at which a processor can be operated. Processors also differ in the ability to undertake 16 vs 32 vs 64 bit arithmetic. They also differ in the number of cores to accommodate parallelism.

They differ in the number and sizes of memory-cache levels they offer, and the speed with which they can be accessed.

They differ in the power they consume - for mobile devices, the ability to adjust processing speed (stepping) according to computing needs is important.

#### Best and economical
2011: 4-core 64 bit processors running at 2.7 GHz with 4MB L3 cache size by Intel and AMD are available for \\(\approx 110\\\)$.

#### Trends
Graphene replacing silicon can lead to continuation of moore's law - enabling smaller and smaller transistors on the Integrated circuit/ IC chip. But smaller communication channels implies greater power costs for pushing electrons across the channels within the chip.

Then, it will be possible to have a thousand-core processor.

## Working Memory
### DDR SDRAM
This is Double data rate synchronous dynamic random access memory. The terms are explained below.

Working memory is capable of random, rather than serial, access; though it may still be efficient to read big blocks of memory together into the CPU cache for processing. Also, it is dynamic - it retains data only when supplied electricity to periodically refresh its memory. It is commonly Synchronous - synchronized with the system bus.

\exclaim{Current bottleneck!}

#### Quality
They mainly vary in the clock/ data transfer rate (Eg: DDR-333 \\(>\\) DDR-200) and in size. PC2-xxxx denotes theoretical bandwidth (with the last two digits truncated).

##### Best and economical
As of 2011: 2*2 = 4GB RAM modules are economical - sometimes insufficient for programming and surfing the web simultaneously - some website/browser combos consume much memory! Macbook pro comes with 8GB RAM.

#### Interface
DDR SDRAM modules come in different interface sizes; the number  of pins can be different: laptop units are smaller. Vostro 1000 accepts DDR2 PC2-5300 RAM, even 2GB DDR2 800MHz/PC2-6400 200-pin SODIMM.

Some motherboards support dual channel memory, which theoretically doubles the throughput if both SDRAM-slots in the contain identical memory modules.

### Memory hierarchy
Memory access could be 100 times slower than flops: this is an important consideration when optimizing algorithms. Hence, there is a hierarchy of memory:

Registers in the processor \\(>\\) On chip Cache: many layers \\(>\\) main memory \\(>\\) secondary memory located on the hard-disk for example.

## Graphics processing (GPU)
GPU's, implementing common graphics tasks on specialized circuits, speed up display tasks involved in personal computing.

### High data parallelism
GPU's follow a dataflow architecture: Highly pipelined, parallel with many small cores - much more than CPU's. Usually, these parallel cores are divided profitably and easily: Like one core for a bunch of pixels.

Earlier these processing elements were specialized for graphics, now these shaders are more programmable.

### For general computing
With GPGPU, one would Disguise program as geometry computation. Now, can do such computation directly: eg: NVidia CUDA.
