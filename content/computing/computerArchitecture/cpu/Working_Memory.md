+++
title = "Working Memory"

+++
## DDR SDRAM
This is Double data rate synchronous dynamic random access memory. The terms are explained below.

Working memory is capable of random, rather than serial, access; though it may still be efficient to read big blocks of memory together into the CPU cache for processing. Also, it is dynamic - it retains data only when supplied electricity to periodically refresh its memory. It is commonly Synchronous - synchronized with the system bus.

\exclaim{Current bottleneck!}

### Quality
They mainly vary in the clock/ data transfer rate (Eg: DDR-333 \\(>\\) DDR-200) and in size. PC2-xxxx denotes theoretical bandwidth (with the last two digits truncated).

### Interface
DDR SDRAM modules come in different interface sizes; the number of pins can be different: laptop units are smaller. Vostro 1000 accepts DDR2 PC2-5300 RAM, even 2GB DDR2 800MHz/PC2-6400 200-pin SODIMM.

Some motherboards support dual channel memory, which theoretically doubles the throughput if both SDRAM-slots in the contain identical memory modules.

### History
- As of 2011: 2*2 = 4GB RAM modules are economical - sometimes insufficient for programming and surfing the web simultaneously - some website/browser combos consume much memory! Macbook pro comes with 8GB RAM.

## Memory hierarchy
Memory access could be 100 times slower than flops: this is an important consideration when optimizing algorithms. Hence, there is a hierarchy of memory:

Registers in the processor \\(>\\) On chip Cache: many layers \\(>\\) main memory \\(>\\) secondary memory located on the hard-disk for example.
