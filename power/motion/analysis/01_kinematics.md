+++
title = "01 Kinematics"
+++

## General metrics
- Displacement s: a vector measuring change in position. Time t. 
- Velocity vector \\(v = \frac{ds}{dt}\\). Speed is it's magnitude (a scalar value - without direction arrow).
- Acceleration vector: \\(a = \frac{dv}{dt}\\) 
- Average velocity = \\(\dfrac{\int_{t_1}^{t_2} v dt}{ (t_2-t_1)}\\).

## Linear motion, constant acceleration
- Consider time ranging from 0 to \\(t_1\\).
- \\(v = u + at_1\\)
- \\(s = \int_{t=0}^{t=t_1} (u + at) dt =  ut_1 + \dfrac{at_1^2}{2} = \int_{t=0}^{t=t_1} (u + at) dt =  ut_1 + \dfrac{(v-u)t_1^2}{2t_1} \\)
- Alternately, eliminating \\(t_1\\): \\(2as = 2u(v-u) + \dfrac{(v-u)^2} = v^2 - u^2\\).

## Circular motion
- Let \\(\theta\\) represent angular position.

### Velocity
- Angular velocity \\(\gw = \dfrac{d\theta}{dt}\\).
  - Canonical units are radians/second.
- This has a direction: When looking from above, counter-clockwise is represented by an arrow going up from the plane of rotation, clockwise is represented by an arrow going down.
  - This direction is determined by wrapping fingers of right hand in the direction of motion and stretching thumb up.
  - The descriptions "clockwise" and "anticlockwise" are relative - the exact same circular motion appears clockwise on one side of the plane of motion and anti-clockwise on the other side. The direction of the wrapping fingers being the same, the thumb of the right hand points away from the observer on one side and towards the observer on the other.
- Velocity relation: \\(v = \gw r\\) where r is radius of the circle.

### Acceleration
- Angular acceleration \\(\ga = \dfrac{d\gw}{dt}\\). This will be 0 for "uniform circular motion".
- Acceleration purely due to change in direction has magnitude \\(\abs{a_c} = \frac{dv}{dt} = \dfrac{|v|d\theta}{dt} = \abs{v}\gw = v^2/r = \gw^2r\\)

### Polar coordinate analysis
Position is described by radius R and angle \\(\gth(t)\\).