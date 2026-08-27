+++
title = "Authentication"
+++
## Using assymetric key cryptography
One simple way of authentication is to encrypt and return a challenge message using one's secret key.

## Using a password
This is very common - eg: it is used over to log into terminals.

To beat snooping, passwords are transmitted over a secure channel (eg: ssh vs rsh).

### One-time passwords
Passwords may be spoofed - even over a secure channel by an adversary who jumps into a session and replays the password message to, for example change the password. To guard against this, a one-time password can be used. These are often based on a one way function \\(f\\) with an initial point \\(p\\), which can be used to  generate a sequence \\(f^i(p)\\). To do this, people are often provided with a special physical device.

## Signing public messages, and their authentication
setup(l): SK, PK, s = sign(m, SK), verify(m, s, PK). Algs use hash fn: H.

Not all PK cryptosystems can be converted to signature schemes: security proof can fail.

### Existantial unforgeability under chosen message attack
Challenger (A) vs attacker (B) game. A to B: PK. B gets many msgs \\(\set{m_{i}}\\) signed by A. Finally, B forges a \\(m^{*} \notin \set{m_{i}}\\).

#### Main challenges in proofs
A, B, C game. Generation of signatures by B; Use of C's forgery to break A.

#### Weak signature scheme
B tells A list \\(\set{m_{i}}\\) he wants signed before B sees PK.

#### One-time signature scheme
Attacker allowed to make only one signing query. Maybe after seeing PK.

#### Unforgability using weak and one-time signatures W, O
setup(l): Run \\(setup_o(l)\\) poly(l) number of times. Get vector \\(((OSK_{i}, OVK_{i}))\\). Run \\(setup_w(l)\\) and get \\(VK_w, SK_w\\). Sign all \\(\set{OVK_{i}}\\) with \\(SK_w\\) to get the vector \\((SOVK_i)\\). Set \\(PK = PK_w\\).

sign(m): Pick \\((OSK_{i}, OVK_{i}, SOVK_i)\\) triple \\
not used eariler. Get \\(s_1 = sign_o(m, OSK_{i})\\). Set \\(s = s_1, SOVK_i, OVK_{i}\\). verify(m, s): \\(verify_w(SOVK_i, OVK_{i}, VK_w) \iseq 1\\) and \\(verify_o(s_1, m, OVK_{i}) \iseq 1\\).

### Schnorr signature
Setup: Take G of prime order p; Pick g, a; PK: g, \\(g^{a}\\). SK: a. \\(H:\set{0, 1}^{*} \times G \to Z_{p}\\). Sign(m, SK): Pick random \\(g^{k}\\); \\(e = H(m, g^{k})\\); t = k + ae mod p; \\(s=(g^{k}, t)\\). Verify(m, s, PK): Know \\(e, g, g^{a}, g^{k}\\); chk \\(g^{t} \iseq g^{k}(g^{a})^{e}\\).

#### Unforgeability under random oracle assumption
A: DL challenger; B: DL attacker; C: Schnorr attacker. B gets g, \\(g^{a}\\) from A, passes it on to C as PK. When C asks for sign(m, SK), B picks random e; want t = k + ae mod p, pick k = r - ae; fill up random oracle table \\(H(m, g^{k}) = e\\). B knows random bits used by C. When C forges, it uses some query \\(H(m, g^{k})\\); random oracle gives \\(e_{1}\\), set up by B for \\(g^{k_{1}}\\): so B, given the forgery, knows \\(t_{1} = k_{1} + ae_{1}\\). Then B rewinds C to the same point and instead supplies \\(e_{2}\\), finds \\(t_{2} = k_{1} + ae_{2}\\), finds a.

### RSA signature
Use RSA SK to sign: \\(H(m)^{d} \mod n\\) = s. Use RSA PK to verify: \\(s^{e} \mod n \iseq H(m)\\). e chosen to be small: like 3: faster verification. Can't have d too small: attack can try all small numbers.

#### Unforgeability under random oracle assumption
Not based on DL. A: RSA assumption challenger; B: RSA attacker; C: RSA forger. A gives B: \\(N, e, h^{e}\\). Game mostly same as Schnorr. When B must sign m, it picks y, sets \\(H(m) = y^{e}\\), returns y. When C forges using query H(m), it is given \\(h^{e}\\).

### Signature from GHR
Setup: PK: N = pq, u, w; SK: p, q. Sign(m): pick prime \\(e < \phi(N)\\); \\(s = (u^{m}w)^{e^{-1}}, e\\). Verify: \\(s^{e} \iseq (u^{m}w)\\).

#### Unforgeability under weak signauture scheme
A: Flexible RSA challenger; B: FRSA attacker; C: GHR forger. B gives A set \\(\set{m_{i}}\\); A replies with \\(\set{s_{i}}\\) with \\(\set{e_{i}}\\). A gives B PK depending on 2 cases. Case 1: Guess that forgery on \\(m_{k}\\); pick \\(g = h^{m_{j} - m_{k}}\\), set \\(w = g^{\prod_{i}e_{i}}h^{-m_{k}\prod_{i \neq k}e_{i}}, u = h^{\prod_{i \neq k}e_{i}}\\); answer sig query for \\(m_{j}\\) with \\(h^{\Del m  \prod_{i \neq k, j}e_{i}}g^{\prod_{i\neq j}e_{i}}\\); get forgery \\(s = g^{\prod_{i} e_{i}/e'}\\); use KS with \\(x=h, a = \Del m \prod_{i \neq k}e_{i}, y = s, b = e_{k}\\) \chk. Case 2: Pick \\(a, w = h^{\prod e_{i}}, u = h^{a \prod e_{i}}\\) \chk. \tbc

KS Lemma: If \\(x^{a} = y^{b} \mod p; gcd(a, b)=1\\), can find z: \\(z^{b} = x\\) \why.



### Signature from BF IBE
(BLS) BF IBE uses full domain fn H. SK: y. PK: \\(g, g^{y}\\). Encrypt: \\(Keygen(m) = H(m)^{y} = s\\). Verify: \\(e(s, g) \iseq e(H(m), g^{y})\\).

#### Unforgeability using random oracle
A: CDH challenger, B: BLS challenger, C: BLS attacker. A to B: \\(g, g^{a}, g^{b}\\). B: SK = b (not known to b), PK:\\(g, g^{b}\\). B guesses that C forges kth query to random oracle, sets \\(H(m_{k}) = g^{a}\\); for other i, picks random n, sets \\(H(m_{i}) = g^{n}\\). B replies to sign requests by picking x, setting \\(H(m) = g^{x}\\), \\(g^{xa}\\). B uses forgery to break CDH.

### Signature from any IBE
Setup(l): Get PP, MSK. Set PK = PP; SK = MSK. Sign(m): s = Keygen(H(m), MSK). Verify(m, s): Pick some other msg n. Get c = Encrypt(n, PP, H(m)), then get n' = decrypt(c, s), do \\(n \iseq n'\\).

### Aggregate signatures
Eg: petition signing, BGP. Verify n msgs with n PK's: \\(m_{1} .. m_{n} s_{agg}\\). Algorithms: Setup: (PK, SK); \\(Sign(SK_{i}, m) = \sigma_{i}, m\\); \\(aggregate(s_{1 .. k}, \sigma_{k+1}) = s_{k+1}\\): \\
ordering should not matter; \\(verify(\set{PK_{i}}, m_{1}, .. m_{n}, s_{1 .. n})\\).

#### Unforgability of aggregate signatures
A: Agg sign challenger; B: attacker. A to B: PK'. B gets many messages signed using SK'. B forges; forgery: \\
\\(\set{m_{i}, m'}, \set{PK_{i}, PK'}, s\\): B not told \\(sgn(m')\\) earlier.

#### Aggregate signature using BLS
\\(s_{agg} = \prod H(m_{i})^{y_{i}}\\) would fail: B can tell A: \\(s_{agg} = H(m')^{y_{1}}H(m')^{-y_{1}} = 1\\). Instead use: \\(s_{agg} = \prod H(m_{i}, PK)^{y_{i}}\\).

### Applications
Proof of storage.

#### Certificate chains for PK's
PK often accompanied by certificate: something signed with the SK of certificate authority (CA). This signature often accompanied by another certified PK. This continues recursively until the trusted root CA's signature.


## Proof of storage
Owner stores something on storer; who proves storage using a protocol. Owner calls Store(D) \\(\to\\) Verification Key VK, Storage File SF; owner keeps VK, gives storer SF. Audit interactions: prove(SF) \\(\leftrightarrow\\) verify(VK). Correctness condition: verify(VK) convinced wnnp iff \\(\exists\\) extractor: E(p) = D.

Performance measures: Audit speed, bandwidth between owner and storer during audit, verifier storage, prover storage.

Store(D): SF = D; \\(VK = \set{(h_{i} = H(K_{i}, D), K_{i})}\\). Disadvantage: Verification works n times. Usually use random oracles for extraction.

### Based on Erasure code
Code expands m blocks (D) to n blocks; if ye have n/2 blocks, can recover D. SF is the n blocks, with signatures \\(\set{sgn(block_{i}, i)}\\); VK = signature keys. Verify() wants to check that storer has n/2 blocks whp: Verify asks for k random blocks; storer gives these blocks; verifier checks signature in response; if storer has \\(< n/2\\) blocks, Pr(Audit succeeds) \\(\leq 2^{-k}\\).

