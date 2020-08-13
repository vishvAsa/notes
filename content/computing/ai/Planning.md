+++
title = "Planning"

+++
## Specifying decision algorithm
An agent may have several (sub)objectives it can act towards.

Eg: An navigation agent that wants to know the user's destination may have to decide between asking for a nearby landmark, or for the street name or for a clarification of prior utterence.

### Rule based vs utility computation
So, the agent needs some way of prioritizing various sub-objectives/ actions. It may do this using some rigid rules.

An alternative technique computes utilities - various actions are mapped to integers, and the action with the highest utility is executed. This can take into account probabilities. Eg: a navigation agent very sure of the street may want to assign low utility/ weight to the 'ask street name' action.

Some decision algorithms incorporate both techniques in a hierarchy.
