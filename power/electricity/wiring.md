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

## Wire gauge
### Heating circuit 
wire cross section - 4mm². Smaller cross section implies higher resistance, higher heat and consequent damage (melting insulation, plugs etc..). 

### Solar power
- DC cables - use bigger cross sections (4mm²) to minimize losses.
- Inverter to meter cables - at least 6mm². Increase with length.

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


## Fuse box
- Aka Circuit breaker box, fuse box, consumer unit
- Decide fuse rating based on load in the associated circuit.


