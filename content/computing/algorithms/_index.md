+++
title = "+Algorithms"
+++
## Research effort
For algorithms to numerically solve problems form continuous mathematics, see numerical analysis ref. For proving lower bounds, see complexity theory ref.

Design algorithms with better space and time complexity, parallelism.

### Characterization of research effort
#### Identifying problems
Discovering/ inventing new and important problems, and designing algorithms/ data-structures to solve them constitutes most of algorithms research. Often the emphasis is more on the former, than the latter.

Match algorithms/ data structures to applications.

#### Working on established theoretical problems
Read many theory papers, pick problem with lots of previous work (evidence it's interesting), (optional) Add extra complications to the problem to derive other potentially interesting problems, Find an algorithm better than all the previous results, Write it up and publish it in theory conferences and journals.

#### Finding problems from experimental areas
Learn about areas outside of theoretical CS, Choose a problem in one of those application areas where faster or more accurate solutions can make a practical difference, Abstract essential features to get new clean theoretical problem, Find an algorithm better than all the previous results, Write it up and publish it in theory conferences and journals, Implement and communicate your results with the community your problem came from, discover related problems, repeat.

#### Experimental algorithm design
Inclusion of two more steps: Build practical systems to find new problems, Prove conjectures either theoretically or experimentally. Man perfected arches and pyramids before theoretically justifying it.

#### Design, then analyze algorithms
Note that these are separate steps; often algorithm design and analysis is an iterative process.

#### Reasoning about resource bounds
After analyzing an algorithm think about the quantities involved and try to see where they are coming from.

Suppose that algorithm $A$ requires $k = d \log p$ samples or time to solve an algorithm. To see if this is close to optimal, one can reason about $p^{d}$: perhaps it represents the objects the algorithm has to search through in solving the problem.

## Problems
### Secretary problem
Best strategy: Sample around 37\% of applicants to get an idea of skill distribution, then select the next applicant with higher skill.

### Graph and network problems
See Graph theory ref.

