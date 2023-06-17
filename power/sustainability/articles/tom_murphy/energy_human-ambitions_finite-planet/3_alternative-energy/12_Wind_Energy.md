+++
title = "12 Wind Energy"

+++
188

[^11]: Now it may be easier to understand why hurricanes can be so destructive, if their power scales as the cube of wind velocity, and velocities exceed 50 m/s.

[^12]: A recent derivation is in [^71].
[^72]: Betz (1926), "Wind-Energie und ihre Ausnützung durch Windmühlen"
[^73]: Glauert (1993), The elements of airfoil and airscrew theory
1 Betz' limit
0,6
2 Glauert
0,5
0,4
4
0,3
0,2
0,1
00
3 3-bladed rotor
7
4 2-bladed rotor
5 1-bladed rotor
6 Vertical axis wind turbine (Darrieus) 7.Dutch tower mill
8
American windmill
9 Savonius-Rotor
0
0
2
4
8
10
λ
12
14
16
18
Figure 12.4 shows these theoretical limits, along with design limits from various rotor configurations. Curves reflect an optimum rotor speed for each design: speeding up produces more generator output until it gets fast enough that air drag on the blades starts to dominate. The most common modern turbine is the 3-blade design,[^13] able to get roughly 50% of the energy out of the wind. Notice that the tip speed can be quite high: 6-8 times the wind speed. This can be quite alarming to birds in the area, whose cruising speed is nearer wind speed, and they
Figure 12.4: Theoretical and practical wind turbine efficiencies (e, or cp in the plot), for various designs. The parameter A is the ratio of tip speed to wind speed: higher A means a faster tip speed [^74]. All designs must be below the Betz limit (horizontal line near top). At slower speeds, the Glauert limit confines performance to occupy the region to the right of the curve marked 2. Each of the 7 designs shown have arched curves, achieving maximum efficiency at a particular tip speed. Too slow, and the turbine is not transmitting much energy; too fast and drag/friction begins to dominate. Adapted from ©2010 WIT Press.

[^13]: Not only is the three-blade design the most efficient, its lower tip speed is less dangerous than for 2 or 1-blade designs, according to Figure 12.4.

12 Wind Energy
189
have never met something so fast before. For a modern derivation of the Betz limit and how efficiency depends on tip speed, see [^71]. The largest turbines having 150 m diameter rotors are rated for up to 10 MW of electrical power production.
Example 12.2.1 How much power could you expect a small (4 m diameter) 3-blade wind turbine situated atop your house to deliver in a respectable 5 m/s breeze?
The radius is 2 m and we'll pick a middle-of-the-road efficiency of 45%; P=0.45
0.45. (1.25 kg/m3) 7 (2m)2. (5 m/s)3 comes to about 450 W 14
Besides the limit on how much power can be pulled out of the air by a single turbine, we also find limits on how densely they may be populated in a given area: how much space is required between turbines so that one does not disrupt the other. Obviously, it would not serve to put one turbine directly behind another, as they would at best split the available power arriving as wind. Even side by side, it is best to leave room between windmills so that additional rows are not deprived of wind power. A rule of thumb is to separate turbines by at least 5-8 diameters side-to-side, and 7-15 diameters15 along the (prevailing) wind direction. For the sake of illustration, Figure 12.5 shows a spacing on the denser side of the range, but otherwise we adopt the more recent recommendations and use 8 diameters side-to-side and 15 diameters deep [^75]. This works out to a 0.65% "fill factor," meaning that 0.65% of the land area contains an associated rotor cross section."
rotor (viewed from above)
prevailing wind direction
10D
16
5D
In order to compare to other forms of renewable energy, we can evaluate
a power per unit land area (in $W/m^2$) by the following approach:
[^71]: Ragheb et al. (2011), "Wind Turbines Theory - The Betz Equation and Optimal Rotor Tip Speed Ratio"

[^14]: Not too impressive: hard to get much wind power on a household scale, although 10 m/s would give 3.6 kW.

[^15]: An older "rule of thumb" was 5 side-to- side and 7-8 deep, but newer work suggests as much as 8 diameters side-to-side and 15 diameters deep.
120D2


[^16]: ...one $πR^2$ rotor area for every 8D X 15D
120 x (2R)2 = 480R2 of land area
Figure 12.5: Overhead view of wind farm turbine locations, for the case where separa- tions are 10 rotor-diameters along the wind direction, and 5 rotor diameters in the cross- wind direction a geometry that yields 1.6% area "fill factor." Current recommendations are for 15 and 8 rotor diameters, which is significantly more sparse than even this de- piction, leading to 0.65% area fill. Note that most wind turbines can turn to face the wind direction, for times when its direction is not the prevailing one.
power
area
=
εРair TR23
480R2
π
εPair 73, 960
(12.3)
employing the rule-of-thumb 8 x 15 turbine placement scheme. Using an efficiency of 40% and v = 5 m/s,[^17] we get 0.2 $W/m^2$-which is 1,000 times smaller than solar's ~200 $W/m^2$ insolation (Ex. 10.3.1; p. 167).
A final general note about wind generation is somewhat obvious: the

[^17]: Recall that this choice gave sensible global wind power estimates lining up with Table 10.2 (p. 168).

12 Wind Energy
190
wind is not always blowing, and its speed varies over wide ranges. this sense, wind is an intermittent power source. Just as for hydroelectric installations, wind resources are characterized by a regionally-dependent capacity factor, which is the ratio of energy delivered to what would have been delivered if the generation facility operated at full capacity at all times. Typical capacity factors for wind in the U.S.18 are around 33%, and Figure 12.6 provides a visual sense for how this manifests in the real world: pretty erratic.
0.5
1
01-Oct-2007
M
08-Oct-2007
15-Oct-2007
MM MMA J
22-Oct-2007
29-Oct-2007
For very low wind speeds,[^19] wind turbines do not have enough wind to turn at all and sit still at zero output. Furthermore, a turbine is rated at some maximum power output, which occurs at some moderately high wind speed,[^20] beyond which the generator risks damage-like "redlining" a car's engine. When the wind climbs above this maximum- rated speed, the turbine is pegged at its maximum power-no longer following a v3 relation and deliberately twists its blades21 to be less efficient as the wind speed grows so that it maintains constant (maximum) power output. When the wind speed becomes large enough to endanger the turbine, it will twist its blades parallel to the wind to allow the air to pass without turning the rotor at all, so that it no longer spins while it "rides out" the high winds.[^22]

[^18]: Capacity factors for wind are smaller than for hydroelectricity due to wind being more variable than river flow.
Figure 12.6: One month of wind generation from a 20 MW wind farm, illustrating the intermittent nature and why capacity fac- tors are low [^76]. The facility saturates at maximum power late in the month, self- limiting to avoid damage to the turbines. ©2010 Springer.

[^19]: . less than about 3 m/s; called the "cut-in" velocity

[^20]:... usually around 12-15 m/s

[^21]: The blades are like long airplane wings and are mounted so that they can be rotated on an axis running the length of the blade, allowing them to engage the wind at any angle, thus varying efficiency.

[^22]: A typical shut-off wind speed for tur- bines is 20-30 m/s.
1500
2000
Electrical power [kW]
1000
500
0
T
0
5
10
Cp=16/27
■ Cp=0.44
Wind speed [m.s1]
Builder curve
15
20
Figure 12.7 shows a typical power curve for a 2 MW turbine, on top of which are drawn a cubic function of velocity at the theoretical Betz limit (red curve), a cubic (blue) at 44% efficiency (ε = 0.44), and the green manufacturer's curve [^77]. Notice that the turbine performance

Figure 12.7: Actual data (thickly-clustered black circles) of power delivered by a tur- bine rated at 2 MW, as a function of wind velocity. The red curve represents the the- oretical Betz limit of 59%, appearing as a cubic function of velocity-as Eq. 12.2 dic- tates. The better-matching blue curve corre- sponds to an overall efficiency & =
Cp = 0.44 (44%), and the green curve-which rolls over from the cubic function and saturates at higher velocities-is the manufacturer's expectation for the unit [^77]. The "cut-in" velocity for this turbine is around 3.5 m/s: note the small step up from zero output in the green curve. This turbine saturates around 12 m/s: the green curve flattens out and no black circles appear above the cutoff. From ©2017 Wiley.
[^77]: Fischer et al. (2017), "Statistical learning for windpower: a modeling and stability study towards forecasting"demonstrates the aspects covered in the previous paragraph: "cutting in" just above 3 m/s and maxing out (saturating) beyond about 12 m/s. In between, it closely follows a cubic function at an overall efficiency of 44% (blue curve).
12 Wind Energy
191

## 12.3 Wind Installations
24
Global wind installations are rising rapidly, currently (as of 2020) above 600 GW of installed capacity.[^23] Table 12.2 lists the major players, in terms of installed capacity, average generation, fraction of total energy, capacity factor, and share of global wind generation. The amount of wind energy in each country depends on a combination of how much wind is available in the country, how fast electricity demand is growing, electrical infrastructure, and political interest in renewable energies.

[^23]: A small fraction of this is realized, due to the capacity factor.

[^24]: To compare wind to total energy, we follow the thermal equivalent convention discussed for Table 10.3 (p. 170)

Table 12.2: Global wind installations in 2018 [[^78] [^79] [^80] [^81] [^82] [^83] [^84]]. The top six countries capture 85% of the global total.

Country
GW installed
GW average
cap. fac. (%)
energy fraction (%) global share (%)
China
184
41.8
22.7
3.0
33
U.S.
97
31.4
32.4
2.7
25
Germany
59
12.7
21.4
8.3
10
India
35
6.5
18.5
2.3
5.2
Spain
23
5.4
23.5
8.3
4.3
UK
21.7
6.5
30.0
6.9
5.2
World Total
592
125
21.1
2.0
100
0
2
8
4 6 Wind generation (GW)
In 2018, the U.S. had about 94 GW of installed wind capability.[^25] This number has recently surpassed hydroelectric installed capacity (about 80 GW). Both are impacted by capacity factors, which for wind averages 33% in the U.S., while hydropower is just over 40%. The net effect is that the generation for the two is pretty comparable.[^26] Where is the wind power in the U.S. installed? Figure 12.8 shows that Texas wins, at 8.7 GW. Oklahoma is a distant second at 3.2 GW, Iowa at 2.5 GW. California is in fifth place at 1.6 GW.
Figure 12.8: Wind power by state, in terms of average generation, in GW, in 2018. The color scale may seem unhelpful, but the unavoidable truth is that many states don't have a lot going on, and Texas is so dom- inant as to render other states almost in- significant. A logarithmic color scale could help, but then the important lesson on the gross disparity might go unappreciated.

[^25]: From tables 1.14.B and 6.2.B in [^85]

[^26]:
... as we also saw in Table 10.3 (p. 170)

0
5 10 15 20 Wind density (m$W/m^2$)
12 Wind Energy
192
Figure 12.9: Average wind power by state, divided by state area to indicate a density of the developed resource, in milliwatts per square meter (based on 2018 data). We might expect some resemblance to Figure 12.2, based on where the resource is most favorable.
Following the flow we used in Sec. 11.3 (p. 178), we show wind generation as a function of area (Figure 12.9), to get a sense for how concentrated the installations are. Oklahoma and Iowa jump in front of Texas by this measure. Texas has more total generation than all others, but is a very large state in terms of area. Iowa, for instance produces about 30% as much wind power as Texas, but at only 20% the size. The numbers, reaching about 0.017 $W/m^2$ are a bit smaller than those for hydroelectricity, where two states exceeded this value. We can compare these numbers to the 0.2 $W/m^2$ fully-developed potential we estimated in the paragraph following Eq. 12.3 to conclude that in principle we could expand wind by a large factor.[^28]
27

[^27]: ...0.05 $W/m^2$ in Washington; followed by New York at 0.02 $W/m^2$

[^28]:
. about 10 times, in the case of Iowa, but bear in mind the 0.2 $W/m^2$ estimate was based on 5 m/s, while Iowa scores a bit higher, according to Figure 12.2
0
500 1000 1500
Wind power/person (W)
per person, followed
Next, we look at wind generation per capita in states, in Figure 12.10. Now North Dakota blows away the rest, at 1.6 kW by four states at about half of this value. We can put this in context by noting that the average power consumption in the U.S. per capita is around 10 kW.
Finally, Figure 12.11 shows wind capacity factors, indicating where the wind is most reliable. It peaks around 41% in Kansas, but all of the plains states in general do well. The southeastern U.S. has almost no wind development,[^29] as is evident in any one of these figures.
Figure 12.10: Average wind power gener- ation by state divided by state population for an average power per person (based on 2018 data).

[^29]: Lack of wind makes it a poor fit: see also Figure 12.2.

0.1
0.2
0.3
Wind capacity factor
0.4
12 Wind Energy
193
Figure 12.11: Capacity factor for wind in- stallations by state (based on 2018 data).

## 12.4 Upshot: Wind is not Overblown
Wind has surged tremendously in the last decade (Fig. 7.5; p. 108), proving to be an economically viable and competitive resource. But how much could we expect to get from wind?
Putting a few of the previous results together, If the entire contiguous U.S. (area ~1013 m2) were developed for wind at an estimated power density of 0.2 $W/m^2$-which was based on a 5 m/s average wind speed-and a capacity factor of 33%, the U.S. could theoretically produce 0.7 TW30 from wind-roughly 20 times what is produced today. We should take this crude estimate as an extreme upper end, since it is inconceivable that we would develop wind so fully as to never be more than a few hundred meters- -a few rotor diameters-away from a wind turbine, no matter where we go. Also, many areas are sub-threshold and would not support investment in wind development.
Even so, the inflated 0.7 TW estimate falls short of the current 3.3 TW energy demand in the U.S., has major intermittency problems, and is not in a form that can be well-used in all sectors, like transportation and industrial processing. While wind alone cannot replace fossil fuels at the current level of demand, it can doubtless be a significant contributor.
Globally, estimates for wind potential tend to be in the few-terawatt range, though can be as low as 1 TW for a number of practical reasons [^70]. As was the case for hydroelectricity, wind is a viable player in the renewables mix, but is unable to shoulder the entire load.
Wind energy is not free of environmental concerns, disturbing landscapes and habitats. Its impact on birds31 and bats is most worrisome, as the rotors move far faster than anything to which the wildlife is habituated. Still, compared to the environmental toll from fossil fuels, it is fairly clean similar to the impact of hydroelectric power.
A pros and cons list will help summarize. First, the positive attributes:
► Wind is replenished on the planet daily by solar illumination;

[^30]: We're fudging things a bit here for the sake of simplicity. If turbines are built for 12 m/s, the capacity factor already has some averaging built in, so using 5 m/s and a capacity factor of 0.33 is unfair. On the other hand, much of the country spends substantial time below the cut-in speed for turbines, and the cruel cubic function of velocity greatly suppresses much of the land area as impractical for wind development. So the approach is a compromise that might balance out reasonably.
[^70]: Castro et al. (2011), "Global Wind Power Potential: Physical and Technological Limits"

[^31]: Domestic cats turn out to kill far more birds than wind turbines do, currently.

12 Wind Energy
194
► Harnessing wind is relatively low-tech and straightforward; Wind has decent efficiency-typically 40-50%-in extracting en- ergy from the oncoming wind;
Life-cycle CO2 emissions for wind is only 2% that of traditional fossil fuel electricity [^68];
Growth in the wind sector points to economic viability;
▸ Wind is able to scale up to cover a meaningful fraction of energy
demand.
And the downsides:
Wind is intermittent: power when nature allows, not when people demand;
Wind is regionally variable: many places do not produce enough wind to support development;
▸ Wind can cause environmental disruption to habitats especially
dangerous to birds and bats;
Esthetic objections to noise and degradation of scenery hamper expansion.
[^68]: (2020), Life Cycle GHG Emissions

## 12.5 Problems
1. A modest slap32 might consist of about 1 kg of mass moving at
2 m/s. How much kinetic energy is this?
2. A hard slap might consist of about 1 kg of mass moving at 10 m/s. How much kinetic energy is this, and how much warmer would 10 g of skin33 get if the skin has the heat capacity properties of water, as in the definition of a calorie (Sec. 5.5; p. 73 and Sec. 6.2; p. 85 are relevant)?
3. A 10 kg bowling ball falls from a height of 5 m. Using the convenient g≈ 10 m/s2, how much gravitational potential energy does it have? Just before it hits the ground, all of this potential energy has gone into kinetic energy.[^34] What is the speed of the bowling ball when it reaches the ground, based on kinetic energy?
4. Did the final answer for the speed of the bowling ball at the end of its drop depend on the mass?35 Write out the math symbolically36 and solve for velocity, v. Does the result depend on mass?
5. Thermal energy is just randomized kinetic energy on a microscopic scale. To gain some insight into this, consider one liter (1 kg) of water, and figure out how much energy it would take to heat it from absolute zero temperature37 to 300 K assuming that the definition of the calorie (Sec. 5.5; p. 73) applies across this entire range. If this same amount of energy went into kinetic energy-hurling the water across the room-what would the corresponding velocity be?
32:... how painful can a few Joules be?
33: ... corresponding to a volume of 10 mL appropriate to a slap area of 10 cm by 10 cm and to a depth of 1 mm
34: ... neglecting any energy flow to air resistance
35: Try it using a different mass.
36: ... using variables/symbols
37: ...0 K, when the kinetic energy is effec- tively frozen out, or stopped
As large as the number is, it is represen- tative of the speeds of individual molecules within the water, and is, not coincidentally, similar to the speed of sound in water.

6. A typical house may have a floor area around 150 m2 (1,600 square feet). If the floor-to-ceiling distance is typically 2.5 m, how much mass is in the air within the house? Could you lift this much mass if handed to you as bags of rocks?
7. Atmospheric pressure is about 105 N/m2, meaning that a 100,000 N weight of air-corresponding to a mass of 10,000 kg-sits atop very square meter of the ground (at or near sea level). If the air density were constant at 1.25 kg/m3-rather than decreasing with height as it actually does how high would the atmosphere extend to result in this weight (mass)?
8. Comparing the pale green region in the southeastern U.S. to the purple region of the plains states in Figure 12.2, how much more power would we expect out of the same rotor placed in the plains than in the southeast (by what factor is it bigger in the plains)?
9. How much more powerful is a hurricane-strength wind of 50 m/s
hitting your house than is a light breeze of 5 m/s?
10. How much power would a moderate-sized 50%-efficient wind turbine produce whose radius is 10 m at wind speeds of 5 m/s, 10 m/s, 15 m/s, and 20 m/s? Express the answers in kW or MW, depending on what is most natural.
11. The Betz limit says that we get to keep no more than 59% of the available wind power. If 59% of the kinetic energy in a lump of air moving at speed 38 v is removed, how fast is it going afterwards,3 as a fraction of the original speed?
39
12. The largest wind turbines have rotor diameters40 around 150 m. Using a sensible efficiency of 50%, what power does such a jumbo turbine deliver at a maximum design wind speed of 13 m/s?
13. A recent news article announces the largest wind turbine yet, measuring 220 m in diameter and having a maximum power output of 13 MW. Using a reasonable efficiency, calculate the velocity of the wind at which maximum power is reached.
14. Compare the tip speed of a three-blade turbine operating at its optimal efficiency (as per Figure 12.4) in a moderate wind of 7 m/s to typical freeway driving speeds in the same units.
15. Traveling down the road, you carefully watch a three-bladed wind turbine, determining that it takes two seconds to make a full revolution. Assuming it's operating near the peak of its efficiency curve11 according to Figure 12.4, how fast do you infer the wind speed to be if the blade length+2 appears to be 15 m long?
42
16. Building from the result in Problem 15, how much power is this
windmill delivering if its efficiency is about 50%?
12 Wind Energy
195
This is called the scale height of the at- mosphere, ho, which you may wish to com- pare to the tallest mountains on Earth or the height at which airplanes fly. The actual density of the atmosphere decreases expo- nentially as a function of height, with ho being the characteristic scale.
38: Make up your own velocity or solve in symbols/variables: same either way.
39: This relates to wind speed just behind a wind turbine
40:
not radius
41: Hint: focus on tip speed.
42: ... corresponding to radius of the rotor
Reflect on the fact that just estimating the rotor blade length and timing its revolution is enough for you to produce an estimate of power being generated!

17. In a way similar to Figure 12.5, replicate the statement in the text that the fraction of land covered per rotor area is 0.65% if turbines are separated by 15 rotor diameters along one direction and 8 rotor diameters along the cross direction.
18. Check that the units of Eq. 12.343 indeed are equivalent to Watts
per square meter ($W/m^2$).
19. Provide a clear explanation of why the area under the blue curve in Figure 12.6 compared to the area of the whole rectangular box is an appropriate way to assess the capacity factor of the depicted wind farm?
20. What capacity factor would you estimate for the wind farm per- formance depicted in Figure 12.6? In other words, what is the approximate area under the curve compared to the entire box area, as explored in Problem 19? An approximate answer is fine.
21. Referring to Figure 12.7, examine performance at 5 m/s and at 10 m/s, picking a representative power for each in the middle of the cluster of black points, and assigning a power value from the left-hand axis. What is the ratio of
power values you read off the plot, and how does this compare to theoretical expectations for the ratio going like the cube of velocity?
22. Figure 12.7 surprisingly has all the information required to deduce the rotor diameter! The turbine appears to produce 1,400 kW when the wind velocity is 10 m/s, and we also know it appears to operate at ε = 0.44. What is the rotor diameter?
23. Considering that wind turbines are rated for the maximum- tolerable wind speed around 12 m/s, and tend to operate at about 30% capacity factor, how much average power44 would a 100 m diameter turbine operating at 45% efficiency be expected to produce?
24. Table 12.2 shows Germany having more than twice the wind capability as Spain, yet each gets 8.3% of its power from wind. What do you infer the difference to be between the countries?
12 Wind Energy
43: ...essentially pv3
196
44: Hint: compute power at 12 m/s then apply capacity factor
Hint: no external research necessary: what do the numbers mean?
