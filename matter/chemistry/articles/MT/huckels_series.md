+++
title = "Hückel’s series, Carbon rings & life"
+++

Source: [TW](https://x.com/blog_supplement/status/1959476936536687057)

Life exists because benzene ($C_6H_6$) and related rings form and exhibit high stability. At some point in school or junior college, you might have encountered something called Hückel’s series ($4n + 2$), "explaining" why benzene is extrastable. If you were not too physico-chemically aware, you might have wondered where that rule came from. 

<details><summary>विश्वास-टिप्पनी</summary>

For benzene (C6H6), it's 6 π electrons with n=1.
</details>

<details><summary>madhu</summary>

Any molecule following Huckels rule is stable compared to the Anti aromatic molecules. So 4n pi electron molecules are anti aromatic. Anyway for Huckels rule - it is always the pi electrons. Aromaticity is related to the pi bond alone - not the sigma bond. 

Of course all this drama is only for geometrically cyclic planar sp2 carbons - the minute the planarity is gone - everything is par.

Stability is always relative in chemistry - benzene is stable but it doesnt stop it being turned into 100s of other molecules. It undergoes electrophilic substitutions very well due to its electron rich nature - which is pretty much the basis of the chemical industry.
</details>


We asked ourselves the same in our youth and lost ourselves in calculations with a large 6 x 6 matrix for benzene with multiple integrals. Quite heady stuff for a small brain. But we also learnt a simple quantum mechanical trick that gives a simpler explanation for an educated layperson. 

## Smaller rings
If you were curious, you might have asked if there is a smaller homocyclic aromatic ring than benzene. If you wish to know, look below. The smallest aromatic molecule, the cyclopropenyl cation, loses some of the stability it gains from angle strain from a triangular ring. To my knowledge, the cyclopropenyl cation does not exist on earth naturally but has apparently be found on Saturn's moon Titan.

$C_3H_3^+$


## Electron on ring
Consider an electron on a one-dimensional ring defined by its angular coordinate $\phi$; then it would be described by the wave defined by the time-independent Schrödinger equation:

$$
\frac{\hbar^2}{2I} \frac{d^2\psi(\phi)}{d\phi^2} = E\psi(\phi),
$$

where $I \rightarrow$ Moment of Inertia of electron (because it is circular motion described in angular coordinates); $\hbar \rightarrow$ Planck's constant divided by $2\pi$; $E \rightarrow$ Energy of electron.

Its general solution would be a trigonometric wave:

$$
\psi(\phi) = A \cos(k \cdot \phi) + B \sin(k \cdot \phi),
$$

where $k$ is the wave number, and from applying the Schrödinger equation to the solution we get $k = \frac{\sqrt{2I \cdot E}}{\hbar}$.

As the wave function needs to be continuous and single-valued, after one full rotation around the ring (angular change of $2\pi$) the wave function must have the same value as at the start; thus, $\psi(\phi) = \psi(\phi + 2\pi)$. This will hold only if $k$ is an integer ($n = 0, \pm 1, \pm 2, ...$), giving the condition for quantizing energy.

From the above wave-number-energy relationship and writing $k$ as integer $n$, we get:

$$
E = \frac{\hbar^2 n^2}{2I}
$$

For a particle of mass $m$ rotating on a circular ring of radius $r$, the Moment of Inertia $I = mr^2$; hence, $E_n = \frac{n^2 \hbar^2}{2mr^2}$; where $E_n \rightarrow$ nth energy level; $m \rightarrow$ mass of electron.

By Pauli's exclusion each energy level will hold 2 electrons of opposite spin. So, $n = 0 \rightarrow 2e^-$; $n = \pm 1 \rightarrow 4e^-$; $n = \pm 2 \rightarrow 4e^-$...

Thus, we get the Hückel's sequence $4n + 2$ at which the energy levels are full and thereby more stable; We get this for C₃H₃⁺ $\rightarrow n=0, 2e^-$; Benzene $\rightarrow n=1, 6e^-$