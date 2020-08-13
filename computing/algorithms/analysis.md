+++
title = "Analysis"
+++
## Analysis of algorithms
For analysis of randomized algorithms, see randomized algorithms, probabilistic analysis ref.

### Asymptotic behavior
How does the problem scale with increasing input size? See computational complexity ref. Usually care about worst case and average case performance.

### Amortized analysis
Got a sequence of operations performed by a deterministic algorithm. Maybe every n operations, a huge cost is incurred. Then, even though, in the worst case, the cost is high, on average, each operation costs much less.


## Resources and their limitations
### Online vs offline algorithms
Performance/ Competetive ratio of online algorithms, when compared to an offline algorithm given the entire input sequence.

### Randomized algorithms
See randomized algs ref.

### Parallel algorithms
Time taken vs total work done.

2 major frameworks: Message passing vs shared memory. In some models, reading a memory location while another is writing is not allowed.

Parallelize around data, rather than tasks: You will have more processors tomorrow than today.

### Deal with memory limitations
Use external memory algorithms. \tbc

