+++
title = "Working Memory"

+++

## Memory hierarchy
Memory access could be 100 times slower than flops: this is an important consideration when optimizing algorithms. Hence, there is a hierarchy of memory:

Registers in the processor \\(>\\) On chip Cache: many layers \\(>\\) main memory \\(>\\) secondary memory located on the hard-disk for example.

## SDRAM
- Working memory is capable of random, rather than serial, access. 
- Also, it is dynamic - it retains data only when supplied electricity to periodically refresh its memory. 
- It is commonly Synchronous - synchronized with the system bus.

## Speed
- For final latency considering data rate, clock rate, latency, see "true latency" comments below. Actual data transfer speed  = true latency * read width.

### Data rates
- SDR - Single data rate. 1x signals per clock clycle. 64 bit channel.
- DDR1 - Double data rate. 2x signals per clock cycle. So, DDR set with max 1600 clock cycles is advertised as DDR 3200. 64 bit channel.
- DDR2 - Read width (prefetch buffer) double relative to DDR1. 128 bit channel.
- DDR3 - Read width double relative to DDR2. 256 bit channel. 
- DDR4 - Same read width as DDR3. 256 bit channel. But lower power.
- DDR5 - Read width double that of DDR4. 512 bit channel.
- QDR - Quad data rate - 4x signals per clock cycle.
- RDRAM - failed.

### Signal frequency
- Aka module speed.
- DDR4-3200 RAM has module speed/ advertised frequency 3200MHz (actually 1600 cycles per sec).
- clock rate (Eg: DDR-333 > DDR-200). DPC4-xxxx denotes clock speed (with the last two digits truncated).

### Latency / CL
- RAM clock cycles (Not advertised frequency!) needed to get data. 
- Example: 16-18-18-38 (CL/CAS, tRCD: RAS to CAS Delay, tRP: RAS Precharge, tRAS: Active to Precharge Delay.) and CL14-14-14-34 (CAS 14). ACT (Activate), RAS (Row Access Strobe), CAS (Column Access Strobe), and WE (Write Enable)
- Two RAM kits may have the same data transfer rate (example: DDR4-3200), but different latencies. DDR3 RAM usually has a CAS latency of 9 or 10, while DDR4 will have a CAS latency of at least 15. However, because of its faster clock speeds, the newer standard has better performance overall.
- Note: This is latency per cycle, not per advertised signal frequency! DDR3200 will have 1600M cycles per second. So, (1/(advertised frequency/cycle data rate)) * latency per cycle = true latency. 
  - DDR4-3200 RAM with latency 16 will have true latency - 10ns.
- Latencies have gradually increased over the years with the physical distance that signals have to travel (the speed of light is a hard limit)

## Interface Size
- Interface size is a bit dependent on read width. 256 bit read requires atleast 256 pins!
- DDR SDRAM modules come in different interface sizes; the number of pins can be different: laptop units are smaller. Vostro 1000 laptop accepts DDR2 PC2-5300 RAM, even 2GB DDR2 800MHz/PC2-6400 200-pin SODIMM. 
- Desktops accept 288 pin modules.


### Power efficiency
- In terms of power efficiency, DDR4 (1.2V) > DDR3 (1.5V). 


## DDR SDRAM tech

### Read phases
bitline precharge, activate, row access, column access. Row access is the heart of a read operation, as it involves the careful sensing of the tiny signals in DRAM memory cells; it is the slowest phase of memory operation. However, once a row is read, subsequent column accesses to that same row can be very quick.

## Buying tips
Some motherboards support dual channel memory, which theoretically doubles the throughput if both SDRAM-slots in the contain identical memory modules.

### History
- As of 2011: 2*2 = 4GB RAM modules were economical - sometimes insufficient for programming and surfing the web simultaneously - some website/browser combos consume much memory! Macbook pro comes with 8GB RAM.

## SDR SDRAM
- Typical SDR SDRAM clock rates are 66, 100, and 133 MHz (periods of 15, 10, and 7.5 ns)