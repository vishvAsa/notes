+++
title = "01 Vectors and combos"
+++

## Definition, basic operations
A sequence of n elements of \\(f\\), v, is a vector.

### Addition, scalar multiplication
Addition of vectors is naturally defined: \\((u + v)_i = u_i + v_i\\). Scalar multiplication is similarly defined.

## Geometric model: coefficient sequence
Can be interpreted as a point in the cartesian space \\(F^{n}\\); but which point? That depends on what the basis vectors model, the units, the inner product between them.

### As a combination of standard basis vectors
Define standard basis vectors: \\(e_i\\) as a vector with 1 in the ith position, 0 elesewhere.

So, v can be viewed as a combination \\(v_i e_i\\) of the standard basis vectors \\(\set{e_i}\\).

### Standard basis models what?
The standard basis are usually considered with the standard inner product: \\(\dprod{x, y} = \sum_i x_i y_i\\). But this need not be the case. Other bases are possible.

### Equivalent representations of the same point
So, the vector representing a point in a coordinate space changes, when the basis chosen is different. Change of basis operation is a linear operation, for details see linear algebra ref.

## Combinations of vectors
### Linear combination
\\(\sum a_{i} v_{i} = p\\).

### Conic/ non-ve combination
Coefficients \\(a_{i} \geq 0\\).

### Affine combination
If coefficients \\(\sum a_{i} = 1\\), this is an affine combination.

##### Colleniearity preserved
Make affine combo \\(p = ax + (1-a)y\\); take vector \\(x - p = (1-a)(x-y)\\); this has same inner product with the basis vectors as x-y.

### Convex combination
Affine combo where \\(a_{i} \geq 0\\): both affine and conic.

