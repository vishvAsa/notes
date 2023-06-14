+++
title = "Wiring"
+++

## Intro

### Common desiderata
- Separate circuit for high power vs low power appliances.
  - The latter may be powered by UPS systems (inverters backed by DC battery) - by putting them downstream from UPS output.
- Fuses or trip switches at switch boards and even at the plug point.
- 2 way switches for staircase lights, bedroom lights and fans.
- Good placement anticipating appliances like AC, fan, lights.
- Power generated in the household (solar, wind...) may need to be consumed preferentially - or dumped to the grid. 

### Laying
- Types: Concealed (within walls and roofs) vs exposed (within casing).
- In case of concealed wiring in supporting walls, wiring design seeks to minimize horizontal groves within walls (barring above and below windows) so as to not reduce effective wall thickness. Vertical groves are ok.
- Wires are sent in hops from point to point (via pipes which oft drop from the roof) - so that theoretically any point may be connected to any other point via other points. A practical limitation arises from the number of wires vs thickness of pipes.
- Wires are threaded through pipes by pushing in steel springs.

## Circuit types
- Ring circuit
  - live, neutral and earth each have 2 conductors at every socket.
  - reduces the consequences of faults, and enables the use of smaller-diameter wire than would be used in a radial circuit of equivalent ampacity.
- Radial circuit
  - These use a single cable from CU to socket, then a single cable to the next socket along the line etc. 
  - use more copper on most circuits, though less cable on physically long narrow shaped circuits. (More thickness needed.)
- 2 way switches

{{< figure src="../images/home_wiring_ring_radial_2way.gif" title="" class="thumbnail">}}
{{< figure src="../images/ring_circuit.jpg" title="" class="thumbnail">}}

### Series
- \\(V = V_1 + V_2 = I(R_1 + R_2)\\)
- Current accross the loads \\(R_1\\) and \\(R_2\\) is the same. Voltage is split. 

### Parallel
- Voltage in the branches accross the loads \\(R_1\\) and \\(R_2\\) is the same. Current is split.
- \\(V=I_1 R_1 + I_2 R_2)\\)
- \\R=\dfrac{(I_1 R_1 + I_2 R_2)}{I_1 + I_2}\\)


## Fuse box
- Aka Circuit breaker box, fuse box, consumer unit
- Decide fuse rating based on load in the associated circuit.


### Fuse holder
- Have V and A  ratings as well.

### Classes
- Standards - IEC 269 is common.
- gG - will typically blow within 2–5 seconds at five times the rated current, and within 0.1–0.2 seconds at ten times the rated current.
- Voltage rating specifies safe operation limit, beyond which there can be arcing etc..

### High breaking capacity (HBC) fuses
- Aka High Rupture capacity fuse
- The fuse wire or element can carry short circuit heavy current for a known time period. During this time if the fault gets removed, then it does not blow off. Otherwise, it blows off or melts. The enclosure of HRC fuse is either of glass or some other chemical compound.
- inverse time characteristic, which means if the fault current is high then rupture time is less, and if the fault current is not so high, then rupture-time is long.
- Quite reliable - mostly ensures that there will be no arc

### Wire
Fuse wires have low melting point and high resistance (As $P = VI = IR^2$). For high resistance, wires of small cross section are used.

### Other fuse types
- Cartridge Fuse

