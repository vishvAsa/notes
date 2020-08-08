+++
title = "Important fields"
+++

## General properties
For algebraic properties etc.., see algebra ref.

For Open balls, interior points, connectedness etc.. See topology ref.

## Numbers
Natural numbers. Integers.

### Supremum (GUB) vs infimum (GLB)
See properties of ordered sets in algebra ref.

### The field of Rational numbers
Q; irrationality of \\(\sqrt{2}\\); \\(\sqrt{2}\\) as limit of rationals.

Q is an ordered field. Q is countable, as \\(Z^{2}\\) is countable.

#### Absence of least upper bound
\\(\set{x \in Q, x^{2}< 2}\\) does not have supremum in Q.

## The field of Real numbers
### Supremum property
R is a field containing Q, with the supremum property. Every \\(S \subset R\\) has supremum, infemum.

### As Cuts from Q
Set elements of R as (Dedekind) cuts: \\(a \subset Q\\) which split Q into 2 parts in any way such that: if \\(x \in a\\), any y: \\(x > y \in a\\), it has some upper bound in Q, it has no max element. Eg: \\(\set{x \in Q, x^{2}< 2}\\). Define \\(a<b\\) by \\(a \subset b\\), \\(a + b\\) as \\(\set{u + v| u \in a, v \in b}\\) etc; map \\(q \in Q\\) to \\((-\infty, q)\\).

### Archimedian property of R
If \\(0<x<y\\), \\(\exists n \in N : y<nx\\). Else, take LUB l of \\(\set{nx}\\), so \\(\exists n: l-x<nx\\), then \\(l<(n+1)x\\): \\(\contra\\).

### Misc Properties
Decimal representation; its weakness: \\(.\bar{9} = 1\\). There is a real between any 2 rationals. So: There is a rational between any 2 reals: also by archimedian property.

There is a real number between any two rationals: scale \\(\sqrt{2}\\) as needed.

### Extended real number system
\\(R \union \set{\infty, -\infty}\\): not a field.

### Irrationals
Irrational numbers. Algebraic numbers: roots of polynomials with rational/ integer coefficients. Transcendental numbers: non algebraic; eg: \\(e, \pi\\). R dense in irrationals: Rationals are countable, but R is not. R dense in transcendentals: algebraic numbers countable.

### Topological properties k cell in \htext{\\(R^k\\){..}}
Closed interval in R; Extend to hypercuboid in \\(R^{k}\\). Also see topology ref.

#### Nonemptiness of telescoping \htext{\\(\inters\\){intersection} of cells}
If \\(\set{I_{n} = [a_{n}, b_{n}]}\\) closed intervals in R with \\(I_{n} \supset I_{n+1}\\) (as if diminishing), \\(\inters_{j} I_{j} \neq \nullSet\\): take \\(E = \set{a_{n}}\\); E bounded above by every \\(b_{n}\\); so has sup E = x; this is in \\(\inters I_{n}\\).

#### Compactness of k-cells in \htext{\\(R^k\\){..}}
Take k-cell K definted by k closed intervals. K compact: For \\(\contra\\), take open cover \\(\set{G_{i}}\\) sans finite subcover. Halve these intervals to break it into \\(2^{k}\\) k-cells. If K is not compact: atleast one of these pieces, \\(K_{1}\\) is not compact. Repeat the procedure with \\(K_{1}\\) recursively ad infinitum. But, by theorem about diminishing intervals \\(I_{n}\\), \\(\exists p \in \inters I_{n}\\); as p interior pt of \\(G_{i}\\),  \\(\exists r, i: N_{r}(p) \supset K_{i}\\): so \\(K_{i}\\) has finite cover: \\(\contra \\).

So, Bounded and closed intervals in R are compact.

#### Compactness in \htext{\\(R^k\\){..}}
S closed and bounded \\(\equiv\\) S Compact \\(\equiv\\) C: Every \\(\infty\\) subset E of S has a limit point of S: If S closed and bounded, it is in some k-cell, so compact. If S compact, C is true. If C true: S is closed by defunction. If C true: S is bounded: else \\(\contra\\): \\(\set{x_{n}: |x_{n} - x_{0}| > n}\\) wouldn't have lim pt in S.

So, compact set in \\(R\\) has supremum in it.

### Uncountability of R
\\(\infty\\) sequences of \\(\set{0, 1}\\) uncountable by Cantor's diagonalization. So, [0, 1] uncountable. So, looking at decimal representations, R is uncountable.

If \\(P \subset R^{k}, P \neq \nullSet\\), P closed, every p in P is a limit point of P, then P uncountable: By a sort of diagonalization: As P has limit pts, P is \\(\infty\\). For \\(\contra\\) let sequence \\(\seq{x_{i}} = P\\); take \\(V_{1} = N_{r}(x_{1}) \inters P \neq \nullSet\\); take \\(cl(V_{1})\\): is compact; make \\(V_{2} =  N_{r}(p) \inters V_{1} \neq \nullSet\\) with \\(x_{1} \notin V_{2}\\); do recursively; \\(\inters cl(V_{i}) \neq \nullSet\\), but \\(\inters cl(V_{i}) \inters P = \nullSet : \contra\\).

#### Cantor set
Take \\(E_{0} = [0, 1]\\); remove middle third; do this recursively; \\(P = \inters E_{i}\\). P is bounded and closed: so compact; also every pt is a lt pt: so uncountable; has no interval!

P has 0 measure. \why

#### Cardinality of \htext{\\(R^{k\\)}{..} is same as R}
Take \\(p = (a_{1}, .. a_{k}) \in R^{k}\\), represent it in binary system; map it to x such that \\(x_{1:k}\\) has first bits of p, \\(x_{k+1:2k}\\) has second bits of p, etc..

## The field of Complex numbers C
Set of ordered pairs over R, with +, * redifined to form a field: more than the complex plane \\(R^{2}\\). An algebraic closure of R due to fundamental theorem of algebra.

### Spherical form
\\(z=a + ib = r (\cos \theta + i \sin \theta)\\).

Use Taylor series around 0: \\(\sin x = x-\frac{x^{3}}{3!}+\frac{x^{5}}{5!} \dots = \frac{e^{xi}-e^{-xi}}{2i}\\); \\(\cos x = 1-\frac{x^{2}}{2!}+\frac{x^{4}}{4!} \dots = \frac{e^{xi}+e^{-xi}}{2}\\). So, \\((\cos \theta + i \sin \theta) = e^{i\theta}\\).

So, \\(z = re^{i\gth}, y = r'e^{i\ga}\\) related by \\(y = \frac{r'}{r}e^{i(\ga-\gth)}\\).

### Powers of z
(De Moivre). So, (Also by induction) \\([r (cos \theta + i sin \theta)]^{n} = r^{n} e^{ni\theta} = r^{n} (\cos n\theta + i \sin n\theta)\\). So, \\(\bar{z^{n}} = \bar{z}^{n}\\).

### Other Properties
Magnitude \\(|z| = \sqrt{a^{2} + b^{2}}\\). \\(\sqrt{a+ib} = e+ih\\). C has multiplicative inverse: \\(\frac{1}{a+ib}=\frac{a-ib}{a^{2}+b^{2}}\\) (Realify the denominator).

### nth roots of 1
Divide the unit circle into \\(n\\) sectors: Integer powers of \\(w=e^{2i\pi/n}\\). \\(w^{-1}=w^{n-1}=e^{-2i\pi/n}\\). As \\(1+w+ \dots + w^{n-1} = w(1+w+ \dots + w^{n-1})\\), \\((1+w+ \dots + w^{n-1}) = 0\\): Also for any \\(w^{x}\\). \\((a+ib)^{n} = re^{ni\theta}\\) and \\((a-ib)^{n} = re^{-ni\theta}\\) are complex conjugates like \\((a+ib)\\) and \\((a-ib)\\).

## Quaternions
Can't turn \\(R^{n>2}\\) into a field \chk. In quarternions, you loose commutativity. In Octanions, you loose associativity.
