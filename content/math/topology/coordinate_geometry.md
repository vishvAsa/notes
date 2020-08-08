+++
title = "Coordinate geometry"
+++

## Vector spaces
(See linear algebra ref). Vector and scalar product of 2 vectors; effect of Left vs right handedness of coordinate system.

## High dimensional objects
Get vector equations from geometric properties. Use linear transformations like scaling, rotation, projection to describe effects.

### Hyperplane
Hyperplane \\(\perp w\\) through 0 : x such that \\(w^{T}x = 0\\); shift c from 0: \\(w^{T}(x-c) = 0\\). For halfspace, replace '=' with \\(\leq\\).

### Polyhedron
\\(\set{x: Ax \leq b}\\): The intersection of halfspaces.

### Simplex/ hypertriangle
n-d triagle. Construct from (d+1) hyperplanes with linearly independent w's.

### Hypersphere surface
\\(x^{*}x = r\\). Sift from 0: \\((x-c)^{*}(x-c) = x^{*}x - 2c^{*}x = r'\\).

### Hyper-ellipse surface E
#### Aligned with std basis
##### Skewed norm-ball form
E aligned with the standard basis: diagonal \\(\SW \succeq 0\\). \\(\set{x: x^{*}\SW x = r^{2}}\\) is hyper-ellipse aligned with the axes, skewed as per \\(\SW\\). After rescaling: \\(\set{x: x^{*}\SW x = 1}\\).

##### Matrix image form
Take \\(\SW^{1/2} x = y\\), assume \\(\SW \succ 0\\). This is \\(\equiv\\) \\(E = \set{M y: \norm{y} = 1}\\), where \\(\SW^{-1/2} = M \succ 0\\).

##### Radii along major axes
\\(\set{\sw_i^{-1/2}e_i} \subset E\\). So, radii are:\\ \\(\set{\sw_i^{-1/2}} = \set{\sw_i(M)}\\).

#### Aligned with arbitrary basis
Rotate previous ellipse. Take orthogonal rotator U and apply it to previous ellipses (do \\(y = U^{*}x\\)): major axes of E will then be aligned with U's columns.

Radii along major axes remains the same.

##### Rotated Skewed norm-ball form
\\(\set{x: x^{*}U\SW U^{*}x = 1}\\).

##### Matrix image form
Take: \\(E = \set{M' y: \norm{y} = 1}\\), rotate to get: \\(M = M' U^{*} \succ 0\\). \\(E = \set{M y: \norm{y} = 1}\\)

#### Shifted away from 0
Just use y = x-c.

Radii along major axes remains the same.

##### Shifted Rotated Skewed norm-ball form
\\(\set{x: (x-c)^{*}U\SW U^{*}(x-c) = 1}\\).

Using unscaled \\(M'=U\SW U^{*}\\), the equation is : \\((x-c)^{*}M'(x-c) - r^{2} = x^{*}M'x - r^{2} - 2x^{*}M'c = 0\\).

##### Shifted Matrix image form
\\(\set{c + My | \norm{y} = 1}\\) for \\(M \succ 0\\). This can be reparametrized as: \\(\set{x | \norm{M^{-1}x - M^{-1}c} = 1} = \set{x: \norm{Ax + b } = 1}\\).

#### Volume
Take the general expression for E: \\(\set{c + My | \norm{y} = 1}\\). \\(vol(E) \propto \prod r_i\\), where \\(r_i = \sw_i(M)\\) are the radii along the major axes of the ellipsoid E. \why

So, \\(vol(E) \propto det(M^{-1}) = det(A^{-1})\\).

For 2-D ellipsoids: \\(vol(E) = \pi\prod r_i\\).

## Other coordinate systems
Cylindrical and spherical coordinates: \\(x=r \cos \theta\\).

## Graph drawing
Find axis meeting points, maxima/ minima, \\
inflection points.

For visualization of functionals over vector spaces, their gradients: see linear algebra ref.

## Manifold
Take any small enough area in a manifold: it resembles a euclidian space of a certain dimension, aka the manifold's dimension. 0 dim manifold: A point. 1 dim manifold: line, arc. 2 dim manifold: sphere surface.

