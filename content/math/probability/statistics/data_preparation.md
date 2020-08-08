+++
title = "Data preparation"
+++

## Motivation
Data preparation often involves massaging attribute values to fit the requirements of operators/ models. For example, some operators cannot handle continuous values, others cannot handle polynomial values, some have problem with missing data.

## Changing the range
Ploynominal features can be converted to binomial features using a binary representation.

Binominal features can be treated as numeric inputs.

Continuous valued features can be converted to discrete valued features by binning them. The bins may be defined by a regular grid on the range, or irregularly to ensure roughly equal cardinality.

## Dealing with missing values
Continuous missing values can be replaced with average values  or with 0's as appropriate under the circumstances. Nominal missing values can be replaced with the mode.
Or missing value may be imputed using various predictive models.

## Scaling, centering, allowing bias
### Motivation
To interpret the model parameters learned using the training data (eg: to see which input component has more predictive value, and to deduce its bias), it is often beneficial to apply a transformation to the input vector.

In the discussion below, we assume that the input has undergone this transformation.

### Centering to 0
Let \\(\mean\\) be the mean of the given training points \\(\set{\hat{X^{(i)}}}\\). Thence derive the transformation \\(X = \hat{X} - \mean\\).

### Scaling
Let \\(S\\) be a diagonal matrix with diagonal elements \\(1/\stddev_i\\), where \\(\stddev_i\\) is the standard deviation of the input component \\(i\\). Thence, get the transformation \\(SX\\). 

### Constant variable
We assume that the input RV \\(X\\) includes the constant 'variable' \\(X_0 = 1\\). 

