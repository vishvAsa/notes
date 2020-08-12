+++
title = "Information"
unicode_script = "devanagari"
+++

## Self Information of an event
Aka surprisal. Measure of information content associated with event e: rarer the event, more the info, and in case of independence \\(\perp(e, f): h(e, f) = h(e)+h(f)\\). In the latter case, Pr(e,f) = Pr(e)Pr(f); thence get derivation: \\(h(e) = h(X=x) = \log (\frac{1}{Pr(e)})\\).

### As code-length for recording event
#### Coding problem
Suppose that we wanted to record information that an event occurred, but we wanted to use as few bits in expectation as possible. We want to satisfy this: the more common the event, fewer the bits one would need to transmit the event's occurrence.

#### Coding algorithm
We observe that there can be at most \\(1/p\\) events with probability \\(p\\). So, assigning \\(\ceil{\log (\frac{1}{Pr(e)})}\\) bits to communicate the occurrence of an event ensures that we have a way of encoding all possible events, while using fewer bits to encode commoner events.

This is a code with the least expected code-length, as shown in the entropy section.

### Unit
Inspired by the code-length interpretation of surprisal. Depending on whether \\(\log_{2}\\) or \\(\ln\\) is used in definition: bits or nats.

## Entropy of an RV X
### Definition
#### Desired properties
Uncertainty associated with an RV: Should not change if probability rearranged for different values of \\(X\\): symmetry; should increase with number of values \\(X\\) can take; if \\(X \perp Y\\), uncertainty of \\((X, Y)\\) should be sum of uncertainties.

#### As expected surprisal

$$H(X) = E[h(X)] = E_{X}[-log(Pr(X=x))] \\
= - \sum Pr(X=x_{i}) \log (Pr(X=x_{i}))$$; is the only measure which satisfies this \why.

#### Extension to 0 values
Extend definition for \\(Pr(X=x_{i}) = 0\\): \\
\\(lt_{Pr(X=x_{i}) \to 0} Pr(X=x_{i}) \log (Pr(X=x_{i})) = 0\\), so set \\(Pr(X=x_{i}) \log (Pr(X=x_{i})) = 0\\): so expansibility property: No change in entropy due to adding 0 probability events \\(X = x_{i}\\).

### Expected Information/ code-length
Entropy of \\(X\\) is the average amount of information/ surprisal communicated by the corresponding random process.

It is the least expected number of bits required to transmit the value of the random process. \proof: Non negativity of Information divergence.

#### Cross entropy
Even though \\(X\\) may have distribution \\(D\\), an alternative code appropriate for random variable corresponding to distribution \\(E\\) can potentially be used to encode events \\(X=x\\). But, the expected code length is higher if this is done. This inspires a way of measuring divergence between distributions - Information (KL) Divergence/ Code-length divergence \\(KL(E||D)\\). This is described in probability theory survey.

### As cross entropy relative to U
\\(H(X) = \log |ran(X)|\\) if \\(X \distr U\\). \\(KL(X||U) = \log |ran(X)| - H(X)\\); but \\(KL(X,U) \geq 0\\), so \\(U\\) has max entropy, reduction in entropy is \\(KL(X,U)\\).

Non uniform distribution has less entropy than uniform distribution. Can use this to reduce the number of bits needed to transmit information.

### Concavity in case of discrete distribution p
\\(H(p) = \sum_i p_i \log(1/p_i)\\): concave in \\(p_i\\) as \\(\gradient^{2} H(p) \succeq 0\\). Consider RV X \\(\distr\\) bernoulli(p): entropy cup shaped, with max at p=0.5.

### Asymptotic equipartition property (AEP)
Take binary distribution with entropy H, iid sample \\(\set{X_{i}}\\), get sequence \\((X_{i})\\). Then, sequences will either have probability \\(2^{-nH}\\), or \\(\approx 0\\). So, need only nH bits, rather than n bits. Pf: Set \\(Y_{i} = \log \frac{1}{Pr(X_{i})}\\); By law of large numbers \\(n^{-1}\sum Y_{i} \to H\\); so \\(-Pr((X_{i}) = (x_{i})) \to nH\\).

## Joint and cross entropy
### Joint entropy
\\(H(X,Y) = E_{x,y}[-log(Pr(X=x, Y=y))]\\).

Additivity, as requried: If \\(X \perp Y: H(X,Y) = H(X) + H(Y)\\); subadditivity: \\(H(X,Y) \leq H(X) + H(Y)\\).

### Cross entropy
\\(H_{C}(X,Y) = E_{x}[-log(Pr(Y=y))]\\): avg bits required to transmit X using protocol designed for \\(Y\\). Compare with information divergence: that is the number of extra bits required to transmit X using a protocol designed for \\(Y\\).

## Conditional entropy of X given Y
\\(H(X|Y) = E_{y}[H(X|Y=y)] = E_{y}[E_{x}[-log(Pr(X=x|Y=y))]] = H(X,Y) - H(Y)\\): Aka equivocation; Avg uncertainty in \\(X\\), after seeing \\(Y\\).

## Mutual information of X wrt Y
\\(I(X;Y) = E_{x,y}\log[\frac{Pr(X=x,Y=y)}{Pr(X=x)Pr(Y=y)}] = H(X) - H(X|Y) = H(X) + H(Y) - H(X,Y)\\) - visualize with a venn diagram!: reduction in uncertainty about X due to knowledge of \\(Y\\). It is symmetric.

This is the expected value of the information gain / code-length divergence: \\(E_x[H(Y) - H(Y|X=x)]\\); and is therefore loosely called information gain when considered in the context of classification problems in machine learning.

### As deviation from independent distribution
\\(I(X;Y) = K(Pr(X=x,Y=y)||Pr(X=x)Pr(Y=y))\\); so \\(I(X;Y) \neq 0\\) iff \\(X \perp Y\\). So, it is non negative.

### Conditional Mutual information wrt Z
\\(I(X;Y|Z) = E_{z}[I(X;Y|Z=z)]\\).

## Other information metrics
Hamming weight of x: wt(x). Hamming distance: \\(d(x,y) = wt(x \xor y)\\).



## Communication complexity
### The problem
A talks to B; A knows a; B knows b; want to find f(a, b) with min communication and even \\(\infty\\) local computation. a, b are n bit numbers.

Easy solution is to send a and b. But these may be large. So want to use some protocol depending on f.

### Applications
VLSI, scenarios where communication is very costly.

### The communication protocol tree
\\(A \leftrightarrow B\\) communication can be represented as this: A and B take turns sending messages, the message sent at step i is \\(m_{i} = f_{i}(a, b)\\). Maybe distriubution M over (a, b) specified and want to minimize expected communication, maybe want min worst case communication.

So, can look at all possible communication sequences using a protocol tree.

### Deterministic vs randomized protocols
Bits transmitted by deterministic protocol, for worst possible (a, b) \\(\dfn D(f)\\). If distribution M specified: \\(D_{M}(f)\\): avg bits used.

Randomized protocols may use public randomness or private random bits. Bits used by them for worst (a, b) \\(\dfn R(f)\\). Randomized protocols much more powerful than deterministic ones: See equality testing example.

Having public random bits is not much more powerful: you can replace public random bit using protocol with private random bit using protocol with only \\(+ \log n\\) bits penalty.

### Computing f for k input pairs
Want to do better than \\(k D(f)\\) from trivial algorithm. Deterministic protocol: \\(\Omega(k \sqrt{D(f)})\\). Randomized protocol: \\(\tilde{\Omega}(R(f)\sqrt{k})\\).

### Examples
#### Checking equality
\\(f(a, b): b \iseq a\\). Any det protocol needs n bits. So use fingerprinting (see Randomized algs ref).

A uses rand r, sends fingerprint (F(a, r), r) to B.

To show that F is good: Make \\(\hat{F}(a) = ((F(a, r_{1}), r_{1}), .. (F(a, r_{s}), r_{s}))\\); pick rand element and send. For all \\(a \neq b\\), show Hamming dist \\(\del(\hat{F}(a), \hat{F}(b))\\) large.

