+++
title = "Loss functions: labeling multiple data points"

+++
## Confusion matrix
Let  For qualitative evaluation, make k*k confusion matrix \\(C\\) with \\(C_{i,j}\\) as number of points belonging to class i predicted as belonging to class j.

A 2x2 example:

|          | Predicted T | Predicted F |
|----------|-------------|-------------|
| Actual T | 12          | 3           |
| Actual F | 31          | 13          |

{{< figure src="../images/positive-negative-predictive-value.webp" title="">}}

## Notation
\\(U \dfn \\) set of all points. \\(y(c) \dfn\\) points belonging to class c. \\(\hat{y}(c) \dfn\\) set of points predicted to belong to class c.

## True and false positives
True positives: \\(tp(c, \hat{y}) \dfn |y(c) \inters \hat{y}(c)|\\). Points correctly labelled as positive.

False positives: \\(fp(c, \hat{y}) \dfn |\hat{y}(c) - y(c)|\\). Points incorrectly labelled as positive.

False negatives: \\(function(c, \hat{y}) = |y(c) \inters (U - \hat{y}(c))|\\).  Points correctly labelled as negative.

True negatives: \\(tn(c, \hat{y}) = |(U - y(c)) \inters (U - \hat{y}(c))|\\).  Points incorrectly labelled as negative.

## Metrics

{{< figure src="../images/Precision-recall.svg" title="" class="thumbnail">}}

### Precision
#### Positive label precision
Aka Precision. true positives/ predicted positives. Aka Positive predictive value.

In multiclass case: 

- macro-averaged precision \\(= P(\hat{y}(c))/|C|\\) - Simple arithmetic mean
- weighted average precision
- Micro averaged precision : \\(P(\hat{y}) = \frac{\sum_{c}tp(c, \hat{y})}{\sum_{c} (fp(c, \hat{y})+tp(c, \hat{y}))}\\).

#### Negative label precision
Aka Negative predictive value. True negatives / Predicted negatives.

### Completeness metrics
#### Recall / sensitivity
Recall = true positives/ actual positives. Aka completeness or sensitivity or true positive rate.

In multiclass case:

- macro-averaged recall = simple arithmatic mean of recalls of various classes.
- weighted average recall
- micro-averaged recall \\ \\(R(\hat{y}) = \frac{\sum_{c}tp(c, \hat{y})}{\sum_{c} (function(c, \hat{y}) + tp(c, \hat{y}))}\\). Measures ability to identify items belonging to class c.

#### Specificity
- Measures ability to discard items not belonging to class c.
- Fraction of true negatives
  
\\(S(c, \hat{y}) = \frac{tn(c, \hat{y})}{tn(c, \hat{y}) + fp(c, \hat{y})}\\). \\(1 - S(c, \hat{y})\\) is false positive rate.

### Aggregate measures
F-measure, the harmonic mean of precision and recall, is also used to evaluate success.


### Sensitivity - specificity tradeoff
Ideally, want to increase both sensitivity and specificity. But to increase sensitivity, the classifier often needs to take more risks in classifying an entity as 'positive'. There will be many cases where -ve entities are declared +ve: there is decrease in specificity.

{{< figure src="../images/sensitivity-vs-specificity-tradeoff.png" title="" class="thumbnail">}}


Visualize two normal curves over 1-D feature: one for the -ve case and one for the +ve case. On observing a feature, a classifier uses a cutoff to identify +ve cases. Compare with tradeoff between type-1 and type-2 errors in hypothesis testing.

### Sensitivity vs 1-specificity curve
Aka Receiver operating characteristic (ROC) curve. 

TP rate vs FP rate curve.

{{< figure src="../images/ROC-explanation.png" title="" class="thumbnail">}}


Take a parametrized family of predictors/ tests to identify +ve cases; the predictors are distinguished by the cutoff they choose in making classifications using the same scores for items. ROC considers the sensitivity vs specificy tradeoffs of various tests belonging to this family.

So, for all tests, you plot sensitivy and 1- specificity on a graph, and join these points by a straight line : a piecewise linear function starting at 0, and ending at 1; not a step function.

#### Area under curve (AUC)
Ranges of sensitivity and 1-specificity are [0, 1]. All curves startat 0, where every item is classified -ve, and end at 1, where every item is classified +ve.

A good test (family) is as close as possible to the left axis: parameters can be tuned to increase sensitivity without sacrificing specificity too much. An ideal test has area under the curve (AUC) 1. The higher the AUC, the better the test family. A random predictor has AUC 0.5.

So, AUC measures the test's discrimination, or the ability to separate +ve cases from the -ve cases.

### Precision/ recall tradeoff
Recall monotonically increases with number of points classified as +ve. Precision monotonically decreases with the number of false positives. Often precision and recall have inverse relationship: if you classify all points as +ve, you have very high completeness but bad recall.

{{< figure src="../images/precision-recall-tradeoff.svg" title="" class="thumbnail">}}


Often want to see how these change with classification parameters: so draw plots.
