+++
title = "+Numerical Analysis"
+++

## Themes
Here, we are concerned with algorithms for the problems of continuous mathematics, especially solving them on a computer, and doing so in a way so as to tolerate round-off errors (which are inevitable due to limited availability of memory and the floating point architecture).

Using insights about stability of algorithms and conditioning of problems: The general theme may be summarized as: Finding fast and stable algorithms for well conditioned continuous mathematics problems: Eg: solving Ax = lx and Ax = b problems, finding SVD.

## Characterization of research effort
### Identify problems
Talk to scientists; identify clean problems faced in scientific calculations; develop geometric intuition, Formulate a problem; see if it is well conditioned.

### Algorithm design
This is specialized and extended algorithms research: so general comments described there apply.

#### Common techniques
A frequently used trick in algorithm design is: Divide and conquer. 

Try to parallellize it.

Keep up with new techniques. 

#### Prototyping
Prototyping is very important. Play with a fast prototyping language (eg: matlab). Try it out on toy problems and note actual performance; implement it and let it have an impact on science.

### Algorithm analysis
Often, besides evaluating evaluate time and space complexity, after having proved that the problem is well conditioned, we prove that iterative algorithms have a fast convergence rate, that the algorithm is stable.

#### Common tricks
##### Time space analysis
Use Integration to count flops. Counting flops of an alg using geometry: Convert the loop into a solid and find its volume.

#### Error analysis
(Problem condition and algorithm Stability analysis.) Show error term goes to 0.

## Abused notation
\\(y = O(\epsilon) \implies  \exists c = f(m,n), \forall x \lim_{\eps_{M} \to 0} y \leq c\epsilon_{M}\\).

Extra definition: If \\(y = \frac{a(x)}{b(x)}\\), at \\(b(x) = 0\\), \\(y = O(\epsilon)\\) means \\(a(x) = O(\epsilon b(x))\\).

