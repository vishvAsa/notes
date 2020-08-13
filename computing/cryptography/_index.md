+++
title = "+Cryptography"
+++
## Notation
wnnp: with non negligible probability. p assumed to be prime.

Security with auxiliary input: Security is not broken even if functions of SK are revealed.

## Themes
Communication in the presence of an adversary. Encryption; efficiency of encryption: important due to pervasive communication; Batch verification. Authentication. Key distribution. Access control. Crypto-analysis: Break hardness assumptions used in cryptography. Make better proofs of security.

Proving the security of protocols. Code obfuscation: Hide your intent. 0 knowledge proofs.

Oblivious transfer: evaluate a function on many agents' sercrets, without anyone knowing anyone's secret.

### Network protocol security
The security vs functionality tension. How do you design and prove the security of protocols for various purposes, wrt various attacks?

### Applications
Mainly useful for secretive corporations, governments and citizens who care for privacy.

### Characterization of research effort
### General strategy
Finding scenarios with security problems. Informal/ creative thought, understand threat model, formalize security definition, describe solution, prove security using widely accepted assumption.

Typical proof: assume some attacker A can break security; then given access to A, you make an algorithm to violate assumption. Easy to make mistake: Unless you write down proof in complete detail, implicit unwarranted assumptions about A creep in: Use propositional logic to state the thing to be proved.

