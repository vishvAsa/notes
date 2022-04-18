+++
title = "+Distributed computing"
+++

## Themes
Coordinating and orchestrating a bunch of processes. There is no tight coordination amongst processes. Coming to an agreement.

Usually don't care about efficiency: just try to prove safety and correctness.

Parallel programming paradigms-  These are considred in the programming languages survey.

## Characterization of research effort
### Safety and correctness: Use of formal methods
Makes heavy use of formal methods of proving program correctness. With formalism, proofs tend to be shorter and more elegant than 'intuitive' proofs.

Once you axiomatize the system well, you don't make much use of intuition. You make heavy use of theorems that are not intuitive.

### Efficiency: Implementation, Engineering
Design and implimentation of good API's.

## Problems
### Agreement on public randomness
n players with n random coin-tosses; communicate by broadcasting. t bad players broadcast last. How to calculate public coin toss while tolerating mischief of bad players?
