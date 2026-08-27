+++
title = "Secure communication"
+++
over an insecure channel.

## Problem
A and B communicate, E evesdrops. E should not know what is communicated, and E should not be able to cause miscommunication between A and B.

### Unbounded adversary
(Shannon) Theory of perfect secrecy. Adversary assumed to have unlimited computational resources. Secure encryption system exists only if \\(|S|\\) is as large as \\(|m|\\).

#### One time pad
\\(E(pad, m) = m \xor pad\\); \\(D(pad, c) = c \xor pad\\). Unbreakable even by computationally unbounded adversary: Modern cryptography abandons this. \\(\forall m, c: Pr_{pad}(E(pad, m) = c) = 2^{-n}\\): so perfectly secret. But not good for 2 messages: \\(E(pad, m_1) \xor E(pad, m_2)\\) reveals common bits.

### Bounded adversary
Often parametrized by security parameter k.

### Passive adversary
Possibly randomized algorithm which runs in poly(k) time, has passive access to everything on the insecure channel. May know probability distribution over messages.

Is said to break cryptosystem if it succeeds with non negligible probability: \\(\frac{1}{poly(k)}\\).

### Active adversary
Passive adversary with extra powers. Can alter or stop messages, request polynomial number of cyphertexts to be decyphered. 

A common active adversary attack is the replay attack.

### Collusion attacks
Multiple adversaries share info and attack.

## Proving security/ vulnerability
### Security from evesdropping
Prob of predicting m given c = Prob of predicting m without c: seeing c gives no 'information'.


### Specify scheme
Describe Setup(l), encrypt, decrypt, keygen etc.. algs.

### General strategy
Show security of B based on security of A: \\(Secure(A) \implies Secure(B) \equiv attackable(B) \implies attackable(A)\\): The latter form is more convenient to prove.

#### Make security game
Take polytime B attacker, call it Z. Make B challenger/ A attacker, call it Y. Take A challenger, call it X. Visualization: use boxes and arrows to see how Y uses Z to respond to X's challenge.

#### Show success of attack wnnp
Security parameter l: All probabilities and running time are in terms of this. Use cases to analyze probability of success of attack.

### Show equivalence of 2 models of security
Show that a successful attacker in one can be used to build a successful attacker in another.

### Using hardness assumptions to prove security
Take hardness assumption H. Use this as A.

#### Tightness of assumption
Cryptosystem B, assumption A. Show that you can break A given attacker for B. Show that you can break B given attacker for A.

### Security from weaker adversaries
Sometimes, proof of security against CPA is not known. So, security is proved against weaker adversaries. Eg: Security in random oracle model, selective security etc..

A stepping stone in finding proof of security against unhindered adversary.


## Private key encryption
Communicators A and B; Encryption and decryption algorithms E, D; common secret key S; adversary may know (E, D), but not S; cleartext or plaintext message m; ciphertext c = E(m,S).

### Substitution cipher
S = the permutation f. Easy to break by adversary who sees moderately many ciphertexts. \why

## Public key cryptography
Aka assymetric key cryptography.

### Weak definition
Uses trapdoor one way functions. Setup(l) = (PK, SK). Weak defn: E(m, PK) = c; D(c, SK) = m: If A transmits only 2 messages, Attacker could encrypt both messages and say what is being transmitted.

### Strong defnition: blinding messages
So, random r is chosen, m is blinded using r to get m', \\(E(m, r, PK) = c\\). D(c, SK) = m', r; thence unblind to get m.

Blinding and unblinding is often done by computing a blinding factor (bf). Agents agree on bf in a way similar to key exchange protocols.

### Hybrid cryptography
In practice, this is used, rather than pure public key cryptography as it is slow. Public key crypto is used only to share a common secret 'session key' S. S is then used to actually encrypt messages.

### Semantic security: chosen plaintext attack (CPA)
Take challenger C and attacker A.

C sends PK to A. A sends plaintexts \\(m_{0}\\) and \\(m_{1}\\) to C. C picks \\(g \in_{U} \set{0, 1}\\) and sends \\(c = E(m_{g}, r, PK)\\). A surmises and returns g.

If A has non negligible advantage over random guessing, the crypto scheme is broken by A.

### Semantic security from CCA
Same as CPA security game, with extra powers to the attacker: The attacker A can ask for decryption of poly num of cyphertexts in two phases: one before challenger C sends \\(c = E(m_{g}, r, PK)\\), and one afterwards. In second phase, A cannot demand decryption of c. If given an invalide cyphertext, C responds with 'invalid cyphertext' or \\(\perp\\) message.

### Hybrid proofs
Eg: two public key schemes: X1, X2; new PK scheme X encrypts m to users using both; show \\(secure(X1) \land secure(X2) \implies secure(X)\\). So show \\(\lnot s(X) \implies \lnot s(X1) \lor \lnot s(X2)\\): Consider CPA game where attacker B knows \\(\set{m_{0}, m_{1}}\\), X challenger A picks random bit g, encrypts \\(m_{g}\\); gives B \\(c_{0} = enc(m_{g}, X1), c_{1} = enc(m_{g}, X2)\\); B guesses g'; So \\(\lnot s(X) \equiv Pr(g' = g) \geq 2^{-1} + \eps\\). Take \\(p_{1} = Pr(g' = 1|g = 1), p_{0} = Pr(g' = 1|g = 0)\\); imagine hybrid case: \\(p_{h} = Pr(g' = 1|enc(m_{0}, X1), enc(m_{1}, X2))\\). \\(\lnot s(X) \equiv Pr(g' = g) \geq 2^{-1} + \eps \equiv 2 \eps \leq |p_{1} - p_{0}| \leq |p_{1} - p_{h}| + |p_{0} - p_{h}| \equiv |p_{1} - p_{h}| \geq \eps \lor |p_{0} - p_{h}| \geq \eps \equiv \lnot s(X1) \lor \lnot s(X2)\\).

### RSA
Choose random N=pq with p, q large primes : use rand alg; pick PK: exponent \\(e \in \set{1, .. \phi(N)-1}\\) coprime with \\(\phi(N)\\); choose SK exp d to satisfy \\(de = 1 \bmod \phi(N)\\); PK: (N, e); SK: (N, d). Message of length m; encrypt: \\(c = m^{e} \mod N\\): exponentiation by squaring; decrypt: \\(c^{d} \mod N\\).

Security from RSA hardness assumption. Vulnerable to CCA.

This is the fastest PK scheme.

### ElGamal
\\(PK = (g, g^{y})\\). SK = y. Encr: Pick random r, make bf: \\((g^{y})^{r}\\). \\(c = g^{r}, m.g^{yr}\\). Decr: Recover \\((g^{r})^{y}\\), thence decrypt. Agreement on bf similar to DH key exchange.

#### Security from CPA if DDH hard
If DDH is hard, ElGamal is secure: Consider DDH Challenger DC, DDH attacker DA, El Gamal attacker A. DC picks random t, sets \\(T = g^{ab}\\) if t=1. DC gives \\(g, g^{a}, g^{b}, T\\) to DA. DA gives \\(PK = g, g^{a}\\) to A. A gives \\(m_0\\) and \\(m_1\\) to DA. DA picks random b and gives A \\(c = T, m_b. T\\). If T is a valid bf, A returns g wnnp. Thence, DA can defeat DC wnnp: analyze probabilities of success for the cases where t=0 and t=1.

#### Vulnerability when DDH broken
Can use any DDH atatcker to break ElGamal: show with a security game.

True if there are efficiently computable bilinear maps.

#### CCA vulnerability
Attacker demands decryption of \\(c' = g^{r + r'}, hm_{b}.g^{y(r + r')}\\), thence identifies \\(m_{b}\\): cyphertext for \\(hm_{b}\\) used as some challengers may refuse to decrypt a previously sent msg.

### CCA secure scheme from IBE scheme
PK = PP; SK = MSK, SigSK (Signature SK), SigPK. Enc(m) : choose random id, find \\
\\(CT = Enc_{IBE}(PP,ID,m)\\), make CT, id, sigSK(CT). \\
Dec: if \\(sigPK(sigSK(CT)) \neq CT\\) abort; else get \\(Keygen(MSK, id) = SK_{id}\\); do \\(Dec_{IBE}(CT, SK_{id}) = m\\).

#### Speed
1 pairing costs approximately as much as 8 large exponentiations.

### DLA based cryptosystem
Setup(l): \\(SK = \tuple{x, y}. \\
PK = \tuple{g, u = g^{x}, v = g^{y}}\\). Encrypt by selecting random a and b. Come to agreement on BF: \\(v^{a+b}\\).

### Applications
Public key cryptography is highly secure. But, it is often slower compared to symmetric key encryption.

SSL uses public key cryptography for key exchange and symmetric encryption for privacy.

## Key exchange
### Diffie Hellman (DH)
A chooses generator g, prime p, random \\(a \in G\\). Sends \\(\tuple{g, p, g^{a} \mod p}\\) to B. B picks random b, sends \\(g^{b} \mod p\\). Both \\(A\\) and \\(B\\) now find secrect key \\(S = g^{ab} \mod p\\).

### 3 party key exchange
A, B, C pick x, y, z; have bilinear map \\(e: G\times G \to G_{T}\\), generator \\(g \in G\\); publish \\(g^{x}, g^{y}, g^{z}\\); agree upon SK = \\(e(g, g)^{xyz} = e(g^{x}, g^{y})^{z}\\).

## Access control
Server based vs encryption based.

### Role based access control

Functional encryption: Specify access policy (a bool formula) as part of ct.

### Sharing a secret
Want people with 2 attributes to access something: Share secret info \\(m \in G\\) between 2 roles: Turn policy into a infix boolean tree: When you encounter \\(\land\\), split m into r, m-r. Subject to collusion attack: Solve by initially encrypting with requestor's PK.

## Broadcast encryption
Bandwidth limited. Eg: Direct TV, radio, GPS.

Like IBE. Setup(l,n): \\(PP, SK_{1} .. SK_n\\). \\
\\(Enc(PP, m, S\subseteq [n]): c\\). \\(Dec(c, i, SK_i, S \subseteq [n]) = m\\) iff \\(i \in S\\).

Want collusion resistance. t-collusion resistance: \\(|c| \geq t^{2} \log n\\) \why.

### CPA Security
Challenger A, attacker B. A to B: PP; B to A: keygen requests, get \\(\set{SK_{i}}\\); B to A: target set S', chosen messages \\(m_1, m_2\\); A picks random b, returns \\(enc(PP, m_b, S')\\). B can encrypt arbit m himself.

Static security: announce S' first.

### BB IBE based scheme
(BGW) Setup(l,n): Pick random a, g, \\(\set{u_{1} .. u_{n}}\\), \\(\set{r_{1} .. r_{n}}\\). \\(PP: e(g, g)^{a}, \set{u_{i}}\\). \\(SK_{i}: g^{a}u_{i}^{r_{i}}, g^{r_{i}}, \forall_{j\neq i} u_{j}^{r_{i}}\\).

\\(Enc(PP,m,S): me(g,g)^{as}, g^{s}, \prod_{i \in S} u_{i}^{s}\\) for random s: like BB IBE enc \\
to \\(\prod_{i \in S} u_{i}^{s}\\): a SK for every S.

Dec: Want to find bf: \\(e(g,g)^{as}\\); so find \\(e(g^{s},g^{a}u_{i}^{r_{i}})\\), find \\(e(g^{r_{i}}, \prod_{i \in S} u_{i}^{s}) = \prod_{i \in S}e(g^{r_{i}}, u_{i}^{s})\\), divide by \\(e(g^{s}, \prod_{j \in S, j \neq i} u_{j}^{r_{i}})\\).

### Security against q-BDHE
A q-BDHE challenger, B q-BDHE attacker, C BGW attacker.

A to B: \\(g, h, g^{b}, g^{b^{2}}, .. g^{b^{q}}, g^{b^{q+2}} .. g^{b^{2a}}\\):
 no \\(g^{b^{q+1}}\\); see if \\(T \iseq e(g,h)^{b^{q+1}}\\).
 
 C to B: S'. B sets \\(h = g^{s}, a = b^{q+1}\\); picks \\((y_{i})\\), sets \\(\forall i\in S': u_{i} = g^{y_{i}}\\), other i: \\(u_{i} = g^{b^{i}}g^{y_{i}}\\). B answers keygen reqs: need find \\(g^{a}u_{i}^{r_{i}} = g^{b^{n+1}}(g^{b^{i}}g^{y_{i}})^{r_{i}}\\), don't know \\(g^{a}\\), so try cancellation by picking \\(r_{i} = -b^{n+1-i}\\); actually, to make \\(r_{i}\\) look random, must add some \\(x_{i}\\). C to B: \\(m_{1}, m_{2}\\). B to C: picks \\(m_{b}\\), sends \\(m_{b}T, g^{s}, \prod_{i \in S'}h^{y_{i}}\\).

### Piracy of broadcast system
DRM impossibility argument: Can't protect content from leaking out. Can only protect original broadcast stream. Traitor tracing: Who pirated the original stream?

