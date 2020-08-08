+++
title = "Topological properties"
+++

For properties which arise when viewed as metric space, eg: compactness, boundedness, connectedness etc.., see topology ref.

## Properties of \\(R^{n, C^{n}\\)
See properties of k-cells in R in analysis of functions over fields ref.

### Completeness of \\(R^{n, C^{n}\\)
Take vector seq \\((x_{i}) \to x\\). If V is over R or C, \\((x_{i}) \to x\\) iff it is a Cauchy seq wrt norm: from equiv property over R and C.

## Dimension of V
This is the maximal size of any linearly independent set of vectors in V.

## Basis of vector space V
\\(T = \set{t_i}: \forall v\in V: v = \sum a_i t_i\\), such that \\(T\\) is linearly independent. Often written as a matrix T, so that we can write \\(Ta = v\\) for any v in V. Any maximal set of independent vectors in V is a basis. All bases (eg T and T') have the same size: otherwise, you would have a contradiction. So, \\(|T| = dim(V)\\).

### Orthonormal and standard basis
Orthonormal basis: \\(t_i^{T}t_j = 0, \dprod{t_i, t_i} = 1\\). Standard basis: see section on definiton of vectors.

Can get an orthogonal basis using QR making algorithms.

## Subspaces
Aka Linear subspace. For subspaces associated with a linear operator, see linear algebra ref.

### Membership conditions
A vector \\(v\neq 0\\) is in a subspace S iff it is some linear combination of its basis Q; so \\(v = Qx\\).

This happens only if \\(\exists i: v^{T}q_i \neq 0\\): so v is not \\(\perp Q\\) wrt standard inner product.

### Invariant subspace
S is an invariant subspace of A if \\(AS \subseteq S\\).

