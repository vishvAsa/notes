+++
title = "03 Averaging using the pdf"

+++
Consider the real valued random variable \\(X: (S, B) \to (R, B_r, m)\\), whose pdf is \\(f_X\\) defined relative to the reference measure \\(m\\).

## Mean/ Expectation of real valued RV
Aka Expected value. \\(E:\set{RV} \to R\\). \\(E[X] = \mean = \int_{X} x f_X(x) dm = E_{X}[X]\\).

This is the weighted average of \\(range(X)\\). \\(E[X]\\) is actually a convex combination of points in range(X).

### Subscript notation
See probability section.

### Conditional Expectation
Conditional expectation of X wrt event A: \\(E_{X}[X|A]\\) is computed  using the conditional pdf \\(f_{X|A}(x)\\). Sometimes, this is considered as a function of variable \\(A\\).

For events with non-0 probability measure, this is \\(= \frac{E[X I_A(X)]}{Pr(A)}\\).

## Expectation: Properties
\\(E_Y[E_{X}[X|Y]]= E_Y[f(Y)] = E_{X}[X]\\).

### Connection to probability measure
\\(Pr(B) = E_{X}[Pr(B|X)]\\).

If \\(X\\) is an indicator RV, E[X] = Pr(X = 1).

### Products of independent RV
If expectations are finite: \\(I(X,Y) \equiv E_{X, Y}[XY]=E_{X}[X]E_Y[Y]\\) as \\(I(X,Y) \equiv f_{X, Y}(x, y) = f_X(x)f_Y(y)\\).

### Linearity properties
\\(E[k]=k\\).

#### Linearity in X
This follows from the linearity of integration.\\ \\(E[\sum_{i} X_{i}] = \int_{X} (\sum_{i} x_{i}) f_X(x) dm = \sum_{i} \int_{X} x_{i} f_X(x)dm\\ = \sum_{i} \int_{X_i} x_{i} f_{X_i}(x)dm = \sum_{i}E[X_{i}]\\)

Expectation is linear, even if the summed RVs are dependent.

\exclaim{E[X] is convex!}

#### Importance
\exclaim{Powerful, unintuitive!} 10 folks go to a ghoShTi, leave their hats; retrieve some random hat after the ghoShTi. What is the expected number of people to retrieve the hat they came with? Linearity greatly simplifies calculation.


#### Linearity in pdf
Consider \\(E[X]\\), where \\(f_X(x)\\) is a convex combination of \\((f_i(x))\\) with coefficients \\((a_i)\\). Because of the linearity of integration, \\(E[X]\\) is linear in the pdf components: \\(E[X] = \sum_i a_i E_{f_i}[X]\\).

### Convex function of E[] inequality
Aka Jensen's inequality.

If f is convex, \\(E[f(X)] \geq f(E[X])\\):  

<details><summary>Proof</summary>

E[X] is actually a convex combination of points in range(X). So, follows directly from definition of convexity (see vector spaces ref).
</details>



So: \\(E[X^{2}]-(E[X])^{2} \geq 0\\).

## Expectation: Analysis tricks
If \\(X\\) and Y are not independent, fix the factor in \\(X\\) and Y which causes the dependence, and ye may have independence.

The fact that \\(\max X \geq E[X]\\) is useful in getting lower bounds on some quantities.


## Variance from mean
\\(Var[X] = \stddev^{2} = E[X-E[X]]^{2} = E[X^{2}]-(E[X])^{2}\\). Weighted avg of square deviation from mean of function over points in sample space.

### Concavity in p
Consider discrete distributions; let x be a vector of values \\(X\\) takes. \\(var[X] = p^{T}x - x^{T}pp^{T}x\\).

### Other properties
\\(Var[\sum a_{i}X_{i}] = \sum a_{i}^{2}Var[X_{i}]+2\sum_{i}\sum_{j}a_{i}a_{j} Cov[X_{i},X_{j}]\\): using linearity of expectations on \\(E[(\sum_{i} (a_{i}X_{i} - a_{i}\mean_{i}))^{2}]\\).

#### Translation invariance
var[X + c] = var[X].

## Moments of RV X
### kth moment
\\(E[X^{k}]\\) is the kth Moment of X. Empirical kth moment is \\(\frac{\sum_{i=1}^{n} X_i^{k}}{n}\\)

### kth moment about the mean
kth Moment of \\(X\\) about 0 : \\(E[X^{k}]\\) vs moment of \\(X\\) about \\(\mean\\) aka central moment: \\(E[(X - \mean)^{k}]\\).

Normalized moments: \\(\frac{E[(X - \mean)^{k}]}{\stddev^{k}}\\).

### Important moments
Central moment immune to translation; describes shape of pdf. 2nd central moment, aka variance, measures fatness.

Skewness: \\(\gamma = \frac{E[X - \mean]^{3}}{\stddev^{3}}\\): putting more weight on farther points; pdf has left skew if \\(\gamma<0\\).

Kurtosis: measure tallness/ leanness vs shortness/ squatness: \\(\frac{E[X - \mean]^{4}}{\stddev^{4}} - 3\\): 3 term ensures that Normal distribution has Kurtosis 0.

Can easily determine statistics corresponding to these parameters from a sample.

The moments of \\(X\\) completely describe pdf of \\(X\\) \why. \\(N(\mean, \stddev^{2})\\) has only 2 moments \chk.

### Moment generating function
\\(M_{X}(t)=E[e^{tX}]\\). \\
\\(\frac{dE[f(x,t)]}{dt} = \frac{d \int f(x, t) dx}{dt} = lt_{\del\int (f(x, t+\del t) - f(x, t))dx \to 0}\frac{}{\del t} = E[\frac{df(x,t)}{dt}]\\). So, use to find nth moment of \\(X\\) about 0, \\(E[X^{n}]=d^{n}M_{X}(t)/(dt)^{n}|_{t=0}\\): can also use Taylor series for \\(e^{tX}\\) with linearity of expectations.

It is unique: If \\(M_{X}(t) = M_{Y}(t)\\), \\(X\\) and Y have same distribution: as it generates all possible moments of \\(X\\) and Y identically. \why

\\(M_{\sum X_{i}} = E[e^{t \sum X_{i}}] = \prod M_{X_{i}}\\) if \\(\set{X_{i}} \perp\\).

### Characteristic function of X
\\(f_{X} = E_{X}[e^{itX}]\\). Useful as sometimes, the moment generating function is not well defined.

### For Poisson trials
\\(M_{X_{i}}(t)=1+p_{i}(e^{t}-1) \leq e^{p_{i}(e^{t}-1)}\\). So, if \\(X = \sum X_{i}, \mean = \sum p_{i}; M_{X} \leq e^{\mean(e^{t}-1)}\\).
