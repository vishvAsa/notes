+++
title = "Bounding techniques"
+++

Also see functional analysis ref.

Effectively bound one function with another.

## General ideas
Use convexity of functions! See proof of AM/ GM inequalities, for example.

### Bound f over [a, b] with a constant c
Show that \\(f\\) is monotone over \\([a, b]\\), perhaps by taking derivative; take \\(c\\) to be value at \\(a\\) or \\(b\\).

## Asymptotics
Asymptotic notation: o, O, \\(\Theta, \Omega, \omega\\).

### Hierarchy of growth of functions

$$c, \lg^{*} n, \log n, n^{k}, n^{\log n}, \\
n^{n^{1/3}} = e^{n^{1/3}\ln n}, e^{n}, n! = \theta(\sqrt{n}(\frac{n}{e})^{n}), n^{n}$$.

### Iterative logarithm
\\(\lg^{*} n\\): 0 if \\(n\leq 1, 1+\lg^{*}\lg n \\) otherwise. Very slow growing.

