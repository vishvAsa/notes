+++
title = "Number storage formats"

+++
## Design factors
### Words and bits
Suppose \\(b\\) bits are available to store a certain type of number: this is usally expressed in terms of multiples of words (collection of \\(w\\) bits). Because binary logic is used for addressing and processing, \\(w\\) is generally a power of 2. In old days, it used to be \\(w = 2^2\\), now 64 bit words are common.

### Simplicity of computation logic
Some representation formats require simpler and more efficient circuits for performing basic arithmetic operations than others. This is an important factor in choosing the representation format.

### Special numbers
ONe may want to reserve space in representation set for storing special numbers like +Inf, -Inf, NaN (for storing results of illegal operations).

## Integers
Suppose \\(b\\) bits are available to store a number.

### Unsigned
Any \\(x \in \set{0} \union N\\) can be stored in the natural binary representation. So, in \\(b\\) bits, \\(2^b\\) unsigned numbers \\(x \in (0: 2^{b} -1 )\\) can be stored.

### Signed
While storing negative numbers along with positive numbers, one has to distinguish it from positive numbers, one requires a sign bit.

#### Use sign bit + absolute value
A straightforward way to store \\(x \in Z^{-}\\) is to set the sign bit to \\(1\\) and store \\(-x \in N\\) in the remaining \\(b-1\\) bits. In this case, \\(x \in (-2^{b-1}+1: 2^{b-1}-1)\\) can be stored. Note that there is redundancy in possible representations of 0: the sign bit may be 1 or 0 (one of which can then be taken to mean NaN). Thus, a total of \\(2^{b}-1\\) numbers can be stored.

#### Offset/ biased storage
One can take a large natural number called \\(k\\) the bias. Then, one can store \\(2^b\\) (as against \\(2^b -1\\) in another representation) numbers \\(x \in -k:2^b - k-1\\) by simply storing \\(x + k \in \set{0} \union N\\).

#### 1's complement storage
Suppose we use the bias \\(2^{b} - 1\\) to store \\(x \in Z^-\\). This amounts to inverting bits in the binary representation of \\(-x \in N\\), is called (one's) complement representation of \\(x \in Z^-\\).

#### 2's complement bias
Here again, we used biased representation only to store -ve numbers, we store \\(2^{b} + x = 2^{b} - |x|\\): this is the 2's complement of \\(x\\) - we discuss this below.

If b=3, the numbers \\(-4:-1\\) have representations \\(100:111\\).

Note that this representation of \\(x\\) effectively constitutes the use of the most significant (b-th) bit as a sign bit - distinguishing \\(x \in Z^-\\) from \\(x \in \set{0} \union N\\). Thus, we can store \\(x \in -2^{b-1}:2^{b-1} - 1\\): a total of \\(2^{b}\\) numbers.

Addition of -ve and +ve numbers (ie subtraction) becomes slightly easier: the circuit used to add two unsigned numbers will work fine.

## IEEE floating point
### Division of bits
The bits provided for storage are divided into the following components: 1 sign (\\(\pm\\)) bit, \\(M\\) bits to store part of the mantissa, \\(E\\) bits to store a function of the exponent. These components are described below.

### Number stored
This imitates scientific notation of numbers: \\(1.2332 * 10^{-9}\\). Stores \\(\pm (1+f/2^{M})2^{e + 2^{E-1} - 1}\\). \\(\pm (1+f/2^{M})\\):= mantissa, f:= significand or precision; \\(e\\) := exponent stored in the biased representation; \\(k = 2^{E-1} - 1\\) := exponent bias. 

Note that rather than use a sign bit in the exponent, the biased representation is used.

As scientific notation is used, 1 in (1+f) assumed, so the number of bits needed is effectively reduced by 1 bit!

### IEEE standards
\textbf{Single precision}: M= 23 bits, E = 8 bits.

\textbf{Double precision}: M= 52 bits, E = 11 bits.

### Reserved numbers
0 := is stored as \\(\pm 1\ 2^{-k}\\), which amounts setting all non-sign bits to 0: note that -0 and +0 are distinct (to indicate different underflow conditions while performing arithmetic).

\\(\pm \infty = \pm 1.0\ 2^{k+2^{E-1}}\\), which amounts to setting f=0, exponent bits being 1111...

NaN \\(= \pm 1.f 2^{k+2^{E-1}}\\): identical to \\(\pm \infty\\), except \\(f \neq 0\\).

### Range
Allowing for the reserved numbers and considering the range of M and E bits, we can observe the range.

Smallest non 0: \\(\pm 1.0..01\ 2^{-k}\\). Largest num: \\(\pm 1.11...\ 2^{k+2^{E-1}-1} = \pm 2^{2^{E-1}}\\).

So, underflow or overflow rare.

### Increasing gaps in different ranges
In [1,2]: \\(2^{-M}\\); In [2, 4]: \\(2^{-M+1}\\); In \\([2^{j}, 2^{j+1}]\\): \\(2^{-M+j}\\); relative gap only \\(2^{-M}\\). So, 'Floating point'. Matlab eps: (num next to 1) - 1: \\(2^{-M} = 2^{-52} \approx  2.2204\ 10^{-16}\\).

### Representation Accuracy
Let \\(fl:R \to Q\\) be a function which maps any number to its floating point representation.

#### Machine epsilon
In case of floating point representations, we can guarantee that \\(\forall x \in \mathbb{R}\\), given that \\(x\\) in range of floating point number system: \\(\frac{fl(x) - x}{x} \leq \eps\\).

In case of a floating point number system with \\(M\\) mantissa bits, \\(\eps_{M} = 2^{-M -1} = 2^{-53}\\). This is because, in storing the number \\(1.f * 2^t\\): 1] We assume that sufficient bits are available to store the exponent, 2]\\(M\\) bits are available to store \\(f\\).

Yet, note that \\(fl(\epsilon_M) = \eps_M\\).

#### Error guarantee view!
Then, roundoff error [\\(fl(a \odot \epsilon) = a\\)] guaranteed. So, \\(fl(1+10^{-16}) = 1\\). 

### Accuracy of arithmetic operations
IEEE ensures: \\(fl(x \odot y) = (x \odot y)(1+\eps), \eps \leq \eps_{M}\\) if \\(\odot = +-/\times\\). See this by finding \\(x(1 + \eps) \odot y(1 + \eps)\\). \\(fl(x \odot y)\\) is written as \\(\oplus \ominus \otimes\\).

For complex numbers \\(\otimes\\) and div, use \\(\eps_{M} = 2^{-M-2}\\).
