+++
title = "04 Mechanism design"

+++
## Mechanism design
Engineer / implement social choice function. Mech design in making protocols for computer network problems: algorithmorithmic mechanism design. Electronic market design: mech design in electronic markets.

Set of alternatives A. L: set of all linear orders over A. Preference order of \\(p_{i}: >_{i}\\).

### Social welfare function
\\(F:L^{n} \to L\\).

#### Properties
Unanimity: \\(F(<^{n}) = <\\). Dictatorship. Independence of irrelevant attributes: \\(F((<_{i}))\\) between alternatives \\(a_{1}\\) and \\(a_{2}\\) depends only on \\(\set{a_{1}<_{i} a_{2}}\\).

(Arrow): Every social welfare fn over A with \\(|A|>2\\) that satisfies unanimity and independence of irrelevant alternatives is a dictatorship.

### Social choice function
\\(f:L^{n} \to A\\). Eg: Elections; markets: allocation of goods and money; auctions; government policy; runs of network protocols.

#### Voting methods
Ways of finding outcome of multicandidate (\\(>2\\)) elections.

Majority vote won't work: Condorcet paradox. Strategic voting: \\(p_{i}\\) lies about his preference in order to get some one to win.

#### Strategic manipulation
Incentive compatible mechanism: No \\(p_{i}\\) can be better off by lying about his prefs.

### VCG mechanism
Maximizes social welfare: \\(\sum_{i} u_{i}(a)\\). A general scheme: fix specific functions to suit need.

## Auctions
1st price auction. 2nd price auction. Generalized 2nd price auction: winner pays a price between 1st price and 2nd price.

### Combinatorial auctions
Each \\(p_{i}\\) has a utility for every subset of goods: \\(u_{i}(S): S \subseteq A\\).

### Search auctions
How to order the list of ads? Payment per click \\(u_{i}\\). Clicks \\(p_{i}\\) get: \\(n_{i}\\). Find \\(argmax_{i} u_{i}\\). Or find \\(argmax_{i} n_{i}u_{i}\\).

\tbc

## Prediction markets
Markets whose purpose is to find a probability. People who buy low and sell high are rewarded for improving the prediction, those who buy high and sell low are punished for degrading it.