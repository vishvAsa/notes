+++
title = "Coding"
+++

## Fingerprinting
This codes can also be used as error detection codes.

### Chinese reminder code
Codes which use a mod p, with rand p. \\(\hat{F}(a)\\) elements will use diff fields; so not preferred.

#### Checking equality
A picks rand prime p between 1 and \\(k = n^{3}\\); Sends (a mod p, p) to B; B says '=' if \\(a \equiv b \mod p\\).

\\(Pr_{p}(a \equiv b \mod p|a \neq b) \leq n^{-1}\\): num(p with \\(a \equiv b mod p\\) when \\(b \neq a\\)) or, \\(num(p | (a-b)) \leq n^{-1}\\) as \\(a-b \in [0, 2^{n}-1]\\); so \\(Pr(p|a-b) < \frac{n}{\Pi(n^{3})} = \leq \frac{n\ln n}{n^{3}} \leq \frac{1}{n}\\) Using Prime number theorem.

### Univar polynomial code
(Reed Solomon) Codes which make univar polynomial \\(p_{a}\\) over \\(\mathbb{F}_{p}\\), (\\(deg \leq n\\)), from a, prime p, with a's bits representing coefficients.

#### Checking equality
Fix p. A picks rand r from \\(F_{p}\\), sends \\((p_{a}(r), r)\\) to B, B accepts if \\(p_{b}(r) = p_{a}(r)\\). \\(Pr((p_{b}-p_{a})(r) = 0) \leq \frac{n}{p}\\): max n roots.

### Multivar polynomial code
(Reed Muller). \tbc

## Source coding
Compression. See the example about checking equality.

## Channel Codes
### Code design
In most cases, this is an art, rather than a science. Not many things are proved; instead one runs long simulations to show goodness of a code.

### Modelling a channel
Transmitted x is transmuted to y; want to model this process.

#### Channel capacity
Aka Shannon limit or capacity. The tightest upper bound on the amount of information that can be reliably transmitted over a communications channel.

#### Binary symmetric channel
Pr(\\(x_i \neq y_i\\)) = p.

#### Erasure channel
\\(Pr(y_i  = x_i) = p\\), with 1-p probability, \\(y_i = ?\\) (erased). This can model packet loss.

### Model message distribution
Usually assume uniform distribution over messages.

### Tolerating errors
Design codes and protocols for error detection and correction.

#### ARQ
If error detected, ask for retransmission.

#### Forward error correction
Receiver never sends any message back to transmitter. Error correcting code (ECC) attached with data used to fix errors.

#### Decoding
Set of codes \\(C \set F_{2}^{n}\\). x is received. Select \\(c \in C\\) closest to x.

###### List decoding
Output a list of codes within a certain distance of the mangled code.

#### Joint source-channel coding
Encoding of a redundant information source for transmission over a noisy channel, and the corresponding decoding. \tbc

### Properties
#### Minimum Hamming Distance d
Aka distance of the code, Hamming metric. Closely related to the error correcting ability of the code.

More efficient encoding and decoding. \why

#### Code rate
Code rate k/n. High rate code if this is high.

### Types
#### Block vs Convolutional codes
Block codes: k-bit info to n-bit code. Block length n.

Convolutional code: k bit info to n bit code.

#### Bound on code size of block codes
(Gilbert-Varshamov). Take code with length n, distance d, size (not dimension) of the code \\(A_{q}(n, d)\\). Then \\(A_{q}(n, d) \geq \frac{q^{n}}{\sum_{j=0}^{d-1} \binom{n}{j}(q-1)^{j}}\\) \why.

The best rate vs distance tradeoff.

#### w error correcting code
A code which can correct w erroneous bits.

###### w error correcting linear code
Given n*m generator matrix G and m bit y, find n bit x such that \\(d(xG, y) \leq w\\), if it exists. This is possible only if corresponding \\(d \geq 2w+1\\).

#### Cyclic code
Right shifting a code \\(c \in C\\) also yields a code in C.

## [n, k, d] Linear code C
A type of block code. Block Length n, message length k, min Hamming distance d: encode k bit msg in n bit message.

d is the min Hamming wt of any non zero code vector \why.

### A linear subspace of valid codes
A linear subspace C with dimension k of vector space \\(F_{q}^{n}\\) over finite field \\(F_{q}\\). The channel takes you away from this subspace, find the vector closest to the received message in the subspace.

All vector and scalar ops are in \\(F_{q}\\). For Binary linear codes, use the field \\(F_2\\).

#### Basis codes
Can be represented as span of basis codes. Basis codes form rows of k*n generating matrix G. Standard form of G: G is of the augmented matrix \\([I_{k}:A]\\), with k*(n-k) A. To encode x, find xG.

#### Random [n, k] code
k vectors chosen randomly from \\(\set{0, 1}^{n}\\). Or, full rank G is chosen randomly. Achieves whp Gilbert Varshmov bound on rate vs distance tradeoff.

### Decoding
Check/ parity check matrix H: n*(n-k), with left kernel C; \\(H = [-A^{T}:I_{n-k}]\\) in std form. GH=0. To check y, verify: \\(yH=0\\).

For corrupted y, there is an error vector e with \\(wt(e) \leq \frac{d-1}{2}\\) such that \\(y\xor e = xG\\) for some x. To decode, look at its syndrome: yH = (x + e)H = eH. Then solve for e or look it up in a table. Then find x.

#### [p, q] regular code
Make a bipartite graph: bits in variable x on one hand, and nodes corresponding to parity checks in H on the other. If this is a [p, q] regular graph, you have a [p, q] regular code.

#### Decoding
Avg case hardness unknown. Worst case decoding is NP hard. Even finding d is belived hard.

#### As inference over factor graph
###### Make a factor graph
Make nodes for the transmitted codeword bits x, and for the corresponding received/ corrupted codeword bits y. Make factors corresponding to the parity checks for y: eg: if H contains a check which says \\(\oplus_{i \in S} x_i\\), make a factor \\(f_S\\), such that any x where this is not satisfied has probability 0. Relationship between \\(x_i\\) and \\(y_i\\) can be modelled using a symmetric error: maybe \\(y_i\\) is corrupted with probability p.

###### The inference problem
y is observed, x is unobserved - to be inferred. Can use loopy belief propogation for doing this.

###### Guarantees for [p, q] regular codes
As the block size n increases, can be sure that loopy belief propogation properly decodes: shown using the 'density evolution' argument. Loopy belief propogation gets into trouble because of cycles; but if you consider the computation tree corresponding to a node, maybe convergence achieved well before a cyclical message is received!

