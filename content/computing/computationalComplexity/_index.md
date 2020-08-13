---
title: +Computational complexity
---


## Useful resources elsewhere

- [Complexity Classes' Venn diagram](http://www.cse.buffalo.edu/~regan/ComplexityPoster.pdf), [Inclusion graph](http://www.math.ucdavis.edu/~greg/zoology/diagram.xml).
- [Theoretical Computer Science Cheat Sheet](http://www.tug.org/texshowcase/cheat.pdf).

## Notation
Open problem: OP.

## Research effort
### Themes
#### Motivation: complexity of problems
Give algorithms researchers and engineers better understanding of the difficulty of the problem, if not practical algorithms.

Efficient Computability: Complexity class P. Upper and lower bounds on efficiency of algorithms for various problems; classification of problems into complexity classes. Efficient computation with randomness. Relationship between complexity classes. Approximation algorithms.

##### Limitations of worst case results
Many algorithms which are exponential time for pathological cases, turn out to be highly efficient in practice: Eg: Simplex method for solving linear programs. Usually, can make these costly cases unlikely by the use of randomization: eg: quicksort.

#### Generating and checking mathematical proofs
With interaction. Proof complexity: Minimum length of proof for a statement.

#### Computing with exotic physics
Quantum/ String theory.

### Characterization of research effort
Read many papers/ books, talk to others, know many theorems, understand proof strategies, digest core results into short sentences, note open problems.

Attack open problems by trying out various ideas and strategies, fail many times, get a result, see what it implies, use the same strategy to get more results.

Models: Both the strength and the weakness of theory: sometimes they don't change fast enough.

## Models of computation to solve problems
Decision problems. Function problems.

For grammars and automata, see Boolean Functions ref.

### Turing machine
#### k-tape Turing Machine (TM)
States (Q), Alphabet (S) with start and blank symbols, Transition function (\\(\delta\\)); 1 input tape, k-1 R/W tapes with 1 output tape, termination states. In practice, values assigned to registers represents state.

##### Directional restrictions: irrelevance
Bidirectionally \\(\infty\\) TM  of time T(n) can be simulated by unidirecionally \\(\infty\\) TM in O(T(n)).

#### Measuring complexity of problems
Given input X, time taken by TM to solve it is T(X); practically, this is the number of basic operations, which are commonly taken to be scalar ops: +, -, *, /. \\(T(n) = \max_X T(X)\\).

#### Hypercomputation
Aka super-Turing computation. Computation of non Turing compatible functions. Eg: Precise computation of integrals and limits. Not known to be physically realizable.

#### Random Access Machines (RAM)
Can be simulated by a TM in time \\(O(T(n)^{2})\\). Turing's thesis. Usual assumption: word size is \\(\Omega(\log n)\\).

#### Time and space constructible functions
Time constructible function (Proper complexity fn): \\(T(n)>n\\), \\(T(|x|)\\) computable from \\(|x|\\) in \\(T(|x|)\\).

#### The Universal TM (UTM)
TM's as strings. 3-tape UTM can simulate TM of time T(n) in \\(O(T(n)^{2})\\) naively.

##### Power of 3 tapes
3-tape UTM can simulate TM of time T(n) in \\(O(T(n)\log T)\\): Put contents of k tapes (initially blank / input symbols) in 1 tape, each cell is k sim-cells; make zones \\(L_{i}\\), \\(R_{i}\\) of size \\(2^{i}\\); zones always with 0 or \\(2^{i-1}\\) (half) or \\(2^{i}\\) (full) contents; \\(|L_{i} \cup R_{i}| \leq 2^{i}\\); cursor always at \\(L_{0}\\); tape contents moved to simulate head movement; initially zones half full with contents (blank / input symbols). To simulate right head movement: Find non-empty \\(R_{i}\\); move contents to half fill \\(R_{0} \dots R_{i-1}\\); adjust \\(L_{0} \dots L_{i}\\). So, min \\(2^{i-1}\\) shifts required before \\(2^{i}\\) chars in \\(R_{i}\\) shifted; So, UTM needs \\(O(\sum^{\log T} \frac{T}{2^{i-1}}2^{i}) = O(T(n)\log T)\\).

#### Oblivious TM (OTM)
Head movements same for all inputs of same size, actions may differ. Make 1 work-tape Obl TM of time \\(O(T(n)^{2})\\) from k tape TM of time T(n): Reserve T(n) cells for each of k (unidirecionally \\(\infty\\)) tapes; in simulation, force a visit to each cell, its left and right neighbor; overwrite cell, move simulated cursor as necessary. Make 2 work-tape Obl TM of time \\(O(T(n)\log T)\\) from k tape TM of time T(n): Use the \\(O(T(n)\log T)\\) UTM; mime the worst possible (constant leftward) movement for each sim-tape, but implement useful movement only.

#### Variant TM's
The probabilistic turing machine : has a fair coin.

##### Non deterministic turing machine
\textbf{Configuration} of turing machine. Configuration trees and computation paths.

Given an input, visualize a computational tree.

### Oracle machines
TM with a subroutine call to Oracle. Eg: \\(P^{SAT}\\). \\(P^{NP} = NP\\). \\(NP^{NP}\\) not trivially NP: Can't take \\(NP^{NP}\\) alg L and make new config tree for NP alg L': can't know when all branches of L's config tree yield false.
