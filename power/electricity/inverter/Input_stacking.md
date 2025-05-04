+++
title = "Input stacking"

+++
- For general intro, see [battery](../battery) page.

## Series connection
- String inverters are also known as ‘central inverters’. For example, they treat the solar array as one single solar panel.
- Disadvantage is that failure of one power source (solar panel shading) would cause a relatively big drop in voltage (possibly below the minimum starting voltage of the inverter) - MPPT may compensate to some extant. Shading of 9% of the solar array results in about 54% decrease in its power output (MPPT use unknown)!
  - Can be overcome with per panel DC optimizers. [YT](https://www.youtube.com/watch?v=oiBw6USlm8U)


## Microinverters
- Here, per inverter inputs are not stacked. Each power source may have its own inverter
- Costlier than central inverters (when you add up).
- Lower power eliminates many problems.
- Allow mounting PV modules on different surfaces and facing different directions.
- Can optimize performance and monitor better.
- Safer, both to install and maintain, since avoiding wiring lots of panels in series (60V max DC voltage vs .6-1kW) eliminates the need of high voltage DC wiring. Lower probability of lightening strikes?
- Durability and replacement
  - Longer durability than central inverters due to the fact that they are not exposed to such a high power and heat like central inverters. Enphase india warranty - 10 yrs vs string inverter 5-10 yrs.
  - Replacement load higher - If you have 8 panels, in a couple of decades all will need to be replaced.
- High rated microinverter manufacturers include: 
  - Enphase
    - (american company, albeit manufactured in China).
    - IN resources [here](https://www.caresrenewables.com/enphase-resources).

### Micro parallel inverters
- A micro parallel inverter is a smart device containing four individual channels that can be connected to four separate solar panels. Each channel acts as a single micro inverter and can track the performance of its solar panel by using MPPT.