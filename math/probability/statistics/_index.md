+++
title = "+Statistics"
unicode_script = "devanagari"
+++

Statistics is the study of the collection, organization, and interpretation of data.

## Statistical inference
Aka inductive statistics, inferential statistics.

### Inference from data subject to randomness
This is the process of drawing conclusions from data that are subject to random variation, for example, observational errors or sampling variation. Probability theory provides us a way of handling this uncertainty.

Also see the Inference survey for other scenarios where random variation is lesser.

### Modeling problems
Some problems are very closely tied to particular applications; eg: many vision problems, etc.. Here, the art is often in picking the right model; ie in proper abstraction. Eg: Is it better to use linear dimensionality reduction or manifold learning? Is it better to cast it as a regression problem or a classification problem? Often, simple models work surprisingly well. Also see comments in the `probabilistic models' survey.

The decision about what you model and what you don't is important. Often, prior work is advanced by designing a model which modeled more aspects of the problem than previous models.

Once the problem is modeled, one must find a suitable estimation algorithm.

See also comments

### Solving Modeled problems
This is algorithm design and analysis. See algorithms survey too.

Here, you take already-modeled well-specified problems, and try to find upper and lower bounds on resources (time, sample points, memory, randomness .. ) required for various estimation tasks.

Note that finding upper bounds on resources often involves designing new estimation algorithms to solve the problem. This is often done by modifying an algorithm for a closely related model.

Eg: Pattern recognition in a Stream: very limited memory and processing time. Eg: sensors in bridges.

#### Degrees of abstractness
##### Domain specific models
Usually solutions tied to particular domains tend to have short term, shallow impact. But, sometimes the general modeling technique and the estimation algorithm in them can be generalized to other domains, leading to greater impact. Also, the problem solved itself may be very important from a non-data-mining point of view; like the astrophysics or biology points of view.

##### Abstract models
Impact is often intangible: it improves the intuition/ understanding of problems by practitioners. Good solutions to important abstract problems tend to have long-term, deep impact.

## Research effort
Read many papers; Critique the problems posed and the solutions presented; alter problems and argue why it is interesting; criticize solutions, develop better solutions for original problem.

### Analysis of efficiency and complexity
For learning theory research, see colt ref. Statistical learning theory: find convergence rate in estimating parameter.

### Modeling and Experimentation
#### Purpose
Modelling the problem often requires exploration and experimentation.

Show that the techniques, even if mathematically well motivated, works well in practice. If it fails, in what cases does it fail?

#### Avoiding unnecessary work
One must approach the problem in a mathematically principled, disciplined manner. Doing so can avoid expending much unnecessary effort. One must take advantage of prior research and predetermined thought patterns.

#### Degree of experimentation
This depends highly on abstractness of the problem. If the problem is very specific to some domain, eg: vision or social network analysis etc; experimentation is much. One has to check the goodness of one's model with the ground truth.

#### Data preparation
Relevant mainly in case of domain-specific research; Usually not present in the case you try to answer more abstract questions.

Huge effort often involved in data-preparation.

### Following research
ICML, KDD, NIPS. Application conferences: CVPR etc.. Theory: archiv, colt.

Data mining conferences tend to be more about applications and clustering than machine learning conferences.


## Software
Rapidminer, R, Matlab are frequently used.

Keep up with developments in efficient software to solve common problems: for example, by joining the R package mailing list.

