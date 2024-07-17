---
title: Gambling
---


## Bet contract

### 2 outcomes

Consider an event E. A bet between two people (A and B) is a contract which says that if E comes to pass (usually by a specified time), person A will pay an amount x to B; otherwise if E doesn’t happen, B will pay y to A.

y is called the bet liability.

#### Viability of the bet

Rational B (who is not risk-averse) will enter the contract if according to his evaluation of _a_, _a__x_ − (1 − _a_)_y_ ≥ 0 or @@a \\geq \\frac{y}{x+y}@@. Rational A will similarly enter the contract only if \\(a \\leq \\frac{y}{x+y}\\).

#### Odds

The probabilistic odds is \\(\\frac{Pr(E)}{Pr(\\lnot E)}\\). But Pr(E) is not known beforehand and is only estimated by a certain party to be _a_. So, betting odds is \\(k = \\frac{a}{1-a} = \\frac{y}{x}\\). It is often expressed as _y_ : _x_ = _k_ : 1 against. It can also be denoted by _k_ + 1, the decimal odds.

### Multiple outcomes

Suppose that there is a universal set of _k_ mutually exclusive outcomes:  
{_E_1.._E__k_}. Then, _k_ entities can enter into a betting contract, according to which side _i_ gets _x__i_ if _E__i_ happens and looses _y__i_ if it does not. So, from side _i_’s perspective, it is a binary bet on event _E__i_; for which calculations of viability and odds are explained elsewhere.

### Betting pool contracts

Betting pools involve groups of people entering a bet contract, with every person specifying his share in the earnings/ liability. Winnings are distributed according to the shares specified while entering the contract.

Fixed odds contract has already been explained earlier.

#### Unfixed odds contract

Aka parimutuel betting. This contract does not specify the betting odds in advance, allowing people to enter or leave the betting pool independently at different points in time. Money from the loosing side is distributed to the winning side. Thus, the betting odds depends on the individual bets from groups of people on each side.

### Accounting Infrastructure

Aka Book-keeping. In betting pools, people may enter or leave, and proper accounting is necessary. The book-keeper has to ensure that the people involved honor the bet contract and pay when they loose - so he often collects money owed in case of loss in advance.

#### Fixed odds contract

Quoting fixed betting odds for each outcome, the book-keeper admits peoples’ bets for a certain outcome.

##### Anticipation of bet-placements

∀_i_ the fraction of  
bet-liabilities _b__i_ promised for a given outcome _E__i_ is such that _b__i_ = 1 − ∑_j_ ≠ _i__b__j_ holds. If while deciding on the fixed odds, the book-keeper has perfectly anticipated {_b__i_} and quoted odds correspondingly, the book-keeper does not loose any money irrespective of the outcome. In other words, the winning parties’ earnings at settlement time are matched exactly by others’ losses. The book-keeper does not stand to loose money: infact, promising slightly lower earnings than 1 − ∑_j_ ≠ _i__b__j_, the book-keeper can extract a fee irrespective of the outcome.

But, if the odds quoted by the book-keeper do not match the eventual bet-liability allocations, it is possible in case of certain outcomes that, to honor the contract, the book-maker will loose money. Hence, he may need to maintain reserve capital.

## Binary bet exchange

Such an exchange facilitates bets over an event _E_ happening by time _T_. Eg: Intrade.

### Contracts, final settlement

Pairs of people enter into bet contracts at odds of the form 1 − _x_ : _x_ against _E_. A betting exchange, modeled after the stock market, facilitates such contracts by displaying/ matching offers for entering into bets for and against _E_ at certain odds.

#### Share trade representation

In the betting exchange, these odds are specified in the form of ’share prices’ of event _E_ which lie between \[0, 1\]. Consider a betting contract proposal with odds 1 − _x_ : _x_ against _E_. An offer to enter such a contract on the side of _E_ is denoted by an offer to buy a share of _E_ at price _x_. An offer to enter such a contract against _E_ is denoted by an offer to sell a share of _E_ (which one need not possess at the time of selling) at price _x_. Thus, entering into a betting contract is denoted by a share trade.

At settlement time, of course, the odds of all logical agents are 0 : 1 against _E_ if _E_ has occurred; and 1 : 0 otherwise. These correspond to share price reaching 1 or 0 respectively.

The obligation of the loosing party to pay money to the winning party at settlement time is then represented by a\] the obligation of the seller of the share to buy it at settlement time, and b\] the rise or fall of the share price to 1 or 0.

Offers to enter a contract and the act of entering a contract corresponds to placing limit orders and market orders in the betting exchange.

### Probability evaluation

#### The problem

One can use betting exchanges to answer the question: ’What is the probability that a certain event _E_ occurs by a certain ’settlement’ time _T_?’ The market tries to answer it using bets individuals place on that event.

#### Diversity benefits

The idea is that a large and diverse set of people sometimes evaluate the situation better than a panel of experts.

#### Unfulfilled orders

At any given point in time, and given the conditions of logical agents entering a bet examined elsewhere, _P__r_(_E_) can be judged using the unmatched buy or sell offers on the betting exchange.

An unfulfilled offer to buy at price _x_ says that the market agrees that _P__r_(_E_)≥_x_. An unfulfilled offer to sell at price _x_ says that the market agrees that _P__r_(_E_)≤_x_. So, _P__r_(_E_), according to the market, lies between the lowest unfulfilled sell order and the highest unfulfilled buy order.
