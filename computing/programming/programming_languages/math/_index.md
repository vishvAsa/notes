+++
title = "+Math"
+++

## Fundamental concerns
When doing mathematical computations - especially while using the floating point hardware representation, concerns dealing with overflow and underflow arise. These problems and various methods of dealing with them are described elsewhere.

## Linear algebra libraries
### Tuning to fit memory, processor
Matrix factorizations, matrix vector multiplications etc.. are tuned specially to the hardware, in order to achieve maximal speed-up. For example, they may break matrices up to fit the cache and combine the results.

### Dense linear algebra
BLAS, LAPACK: fortran routines. clapack provides c interface to some lapack routines. atlas implements blas and some of lapack.

### Sparse linear algebra
UMFPACK, SPOOLES. The standards for these computations is yet to be finalized, and it is an active area of engineering.
