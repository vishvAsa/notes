+++
title = "Computer vision"

+++
## SLAM (Simultaneous localization and mapping) problem
The objective is to localize one's position relative to those objects. There are two important subproblems: a] object or feature detection, b] measurement of position (distance and orientation) relative to a given feature.
Solution approaches depend on the available tools - which may vary with situation. 

### Tools and approaches
Localization using bounced light from lasers is essentially a solved problem; but lasers are expensive. Localization using light detected by passive sensors (eg: visible spectrum cameras) is harder.

### Features
Features, for the purpose of vision problems, are actual phyisical locations/ regions (not their image representation). Examples: Corners, edges, spots with different contrasts. Feature detection and extraction are major themes in vision research. Important feature detection toolkits include SIFT and SURF, which include feature detectors like edge detectors and contrast detectors.

### Feature detection
Finding features whose detectability is robust to illumination and view-point changes is a challenge. An edge between two parallel surfaces is easy to detect only when they contrast each other. Identification of robust features requires gathering images from multiple view points and illumination conditions. Eg: a robotic arm rotating around a scene with a fixed light source.

This is closely related to the object recognition problem considered elsewhere.

#### Scale invariant feature transform (SIFT)
It includes a feature/ point-of-interest detector, and a feature descriptor. An important feature descriptor used is pixel orientation: the gradients in pixel intensity within a certain patch (say of size 4*4) of pixels, another is location. Having extracted a feature, the algorithm stores it at different scales, enabling mapping to corresponding features in different scaled images.

Features/ points of interest are often visually marked by colored dots on images.

### Feature matching
Even when the same features are detected in two images, matching identical features is a problem. A visual tool for comparison involves placing two images next to each other and drawing lines connecting features thought to be identical. An important subproblem here is finding good feature descriptors/ representations.

## Visual object recognition
Got set of n photographs \\((p_{i})\\): perhaps of repeated subjects. Want to identify person in photo. Each \\(p_{i}\\) is a \\(1\times m\\) pixel vector.

### Eigenfaces
One can use the PCA technique to find the the subspace S of greatest variability \\((p_{i})\\). When query image p comes, project it to S, then do \\(\dprod{p, p_{i}}\\) to find closest match.