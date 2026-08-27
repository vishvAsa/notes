+++
title = "Public key to ID matching"
+++

Usually trusted key-servers are used.

## Identity based encryption (IBE)
IBE Authority (Auth) publishes public parameters (PP), has master secret key (MSK). \\(Setup(l) \to (PP, MSK)\\). c = E(PP, ID, m). \\(SK_{id} = K(MSK, ID)\\). \\(m = D(SK, c, PP)\\).

### Security
#### Semantic security under CPA
Challenger C, attacker A. C sends PP to A. A sends C \\(\set{ID_{i}}\\). C returns \\(\set{SK_{i}}\\). A chooses target \\(ID^{*}\\), sends it to C. A sends C \\(m_{0}, m_{1}\\). C randomly picks g and sends \\(c = E(PP, ID^{*}, m_g)\\). A sends C \\(\set{ID_{i}}\\). C returns \\(\set{SK_{i}}\\). If A returns correct g wnnp advantage over random guessing, attack is successful.

#### Security under the random oracle model
If Hash fn H is used. Adversary assumed not to have access to H code, but only oracle access to H used in the protocol. H returns a random group element when queried.

Used in SSL, PGP security proofs.

#### Selective security under CPA
Adversary must choose target before seeing PP.

Can be selectively secure without full security: take any fully secure scheme X with algs Setup, KeyGen, Encrypt, Decrypt. Make selectively secure but not fully secure scheme Y by saying keygen'(id) = keygen(id) if id = tid, and keygen(oid).

#### Main challenges in proofs
Make keys for \\(id \neq tid\\); use attacker's response to break assumptions. Usually met in Setup, hash fn oracle.

### Applications
If recipient is not online, can't get public key directly from him. IBE: No need to look up public key. Also, auth can grant SK at a future date, enabling messages which can be opened at a future date,

### Disadvantages
Auth can decrypt anything. If CA is compromised, it will be noticed. But if auth is compromised, this may not happen.

### Boneh Franklin (BF) system
Setup(l): \\(MSK = y \in Z_{p}\\); PP: \\(g, g^{y}, H: \set{0,1}^{n} \to G\\). Collision resistant hash fn H can handle long ID's. Bilinear map \\(e: Z_{p} \times Z_{p} \to G\\) with order p. Encrypt: Pick \\(m \in G\\), find \\(e(H(ID), g^{y})^{s}\\); \\(c_{1}= g^{s}\\), bf \\(e(H(ID), g)^{ys}\\). Keygen: \\(SK_{id} = H(id)^{y}\\). Decrypt: \\(e(SK_{ID}, c_{1})\\) to get bf.

#### Security against CPA under Random Oracle model
DBDH challenger A, DBDH attacker/ IBE challenger B, IBE attacker C. C makes q oracle queries. Before attack starts, B guesses C's target id tid, fixes H so that \\(H(tid) = g^{b}\\), random element in G otherwise. B aborts if C queries H(tid). Account for this probability in proof.

### Boneh Boyen
Setup: Pick \\(g, h \in G; a, b \in Z_{p}\\). Bilinear map e. \\(PP: g, h, u = g^{a}, e(g,g)^{ab}\\). \\(f(id) = u^{id}h\\). \\(MSK: g^{ab}\\).

Randomized keygen: new key each time: Pick \\(r \in Z_{p}\\); \\(k_{1} = g^{ab}.f(id)^{r}\\); \\(k_{2} = g^{r}\\): like encrypting MSK. If r were not random, could query 2 SK's, divide, find \\(u^{r}\\) and then find anyone's SK.

Enc(PP, M, ID): pick \\(s\in Z_{p}\\), \\(c_{1} = g^{s}\\), \\(c_{2} = f(ID)^{s}\\), \\(c_{0} = m.(e(g,g)^{ab})^{s}\\).

Dec: \\
\\(e(k^{1}, c_{1})  = e(g^{ab}.f(id)^{r}, g^{s}) = e(g^{ab}, g^{s}) e(f(id)^{r}, g^{s}) = e(g, g)^{abs} e(k_{2}, c_{2})\\): bf for bf!.

#### Selective security under CPA
DBDH challenger A, DBDH attacker/ IBE challenger B, IBE attacker C. A: \\(g, g^{a}, g^{b}, g^{s}, T\\). C: Attacking tid. B. Setup: \\(g, u = g^{a}, e(g, g)^{ab}, h = g^{-a(tid)}g^{y}\\). So  B's view of f: \\(f(tid) = g^{y}, f(id) = g^{a(id-tid)}g^{y}\\); but in C's view f is as random as it would be if u and h were picked randomly from G: C is guaranteed to succeed wnnp only in such a case.

Keygen: pick \\(r = \frac{-b}{id-tid}\\), so \\(k_{2} = g^{\frac{-b}{id-tid}}, k_{1} = g^{\frac{-y}{id-tid}}\\). For tid, \\(k_{1} = k_{2} = 1\\). But C is not guaranteed to work in such a distribution: so rerandomize the key: pick rand \\(t \in Z_{p}\\); set r := r+t; get \\(k_{1} := f(id)^{t}k_{1}, k_{2} := g^{t}k_{id}\\). \chk

B sends cyphertext: \\(c_{0} = m_{g}T, c_{1}=g^{c}, c_{2} = g^{cy} = f(tid)^{c}\\).

### Waters cryptosystem
Instead of guessing tid as in BF, guess 1/q of the space of id's as possible targets. Setup: \\(g, e(g,g)^{ab}, h, u_{1}, .. , u_{n}\\); \\(f(id) = h \prod u_{i}^{id_{i}}\\) where \\(id_{i}\\) = ith bit of id.

Fully secure. Selective id proof led us in the right direction.

### Non pairing based IBE cryptosystems
Based on learning parity with noise hardness assumption by Vaikuntanathan et al.

