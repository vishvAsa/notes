---
title: Options
---

## Definition

The buyer of an option gains the right (not obligation) to buy or sell (depending on the option type) an underlying security (100 shares in case of a standard option) at a specified strike price per share by a certain expiration day in case of American-style options (which we consider here), or exactly on a certain day in case of European-style options.

The seller of such an option is called a writer.

### Premium

The price paid for buying an option is called a premium: this insurance term being used because one is essentially guaranteeing purchase or sale at a certain price despite risk of loss.

Its size depends on the terms of the contract (due date, underlying security, strike price). An option is worth nothing if it has expired.

The expected market price of the underlying security remaining the same, premium decreases with time as uncertainty decreases with time.

### Expiration day

Option chains expire weekly, monthly or quarterly. Most commonly, in USA, they expire monthly on the third Friday/ Thursday of every month.

A limited number of weekly options are being tried out.

## Notation

The running example below is XOP call option expiring on 20 Aug 2011, with strike price 48.

Most common notation: 48 Aug call (symbol XOP is mentioned elsewhere).

Sometimes a 5 letter alphabetical symbol is used, with letters indicating the stock, the expiry month, the strike price.

Another notation is XOP 110820C00048000.

## Options exchange

All options purchases, sales and exercises are done through the centralized options exchange: Options clearing corporation (OCC) in USA.

## Exercising options

The holder of an option can exercise his right to buy/ sell the underlying security by informing his broker of this intent before a certain deadline agreed between them.

When exercising an option, one usually needs to pay a brokerage for selling/ buying stock.

### Effective time

The option-holder, upon exercising the option, is deemed to have purchased or sold the underlying security at the end of the same trading day: so theoretically he has the right to use the money/ security he gets immediately, and he has the right to any dividend which may be given the next day onwards.

### Settlement type

At exercise, the option contract specifies the manner in which the contract is to be settled: physical (Eg: many equity options) or cash to buy (Eg: index tracking security options).

### Clearing, assignment

This intent is communicated to the exchange by the broker/ clearing agent, which then randomly picks a broker who has sold such an option and decides that this entity must fulfill the obligation. The obligated broker will be informed by next day and the securities/ money is deducted from his account.

The broker in turn internally passes the obligation on an equitably chosen client on whose behalf the option contract was written. This process is called assignment.

### Frequency

Around 12% of all option contracts are exercised: people often prefer to avoid the hassle of exercising options by selling away their options near the expiry date.

People are also motivated to exercise options just before dividend is expected to be distributed.

## Motivation

The motivation for either party to enter the contract is their differing opinions about the price of the underlying security in the stretch of time upto the expiration time.

The seller of a call option believes that with significant probability, the market price during this time will not exceed the (strike-price - premium).

The seller of a put option believes that the price during this time is unlikely to fall below the (strike-price - premium).

## Basic trades

Options which grant the right to buy are called call options; those that grant the right to sell are called put options. Selling or buying an option is, as usual, denotes taking a short or long position on the option.

### Risk and return
On any given day, the market value ($$m$$) of the underlying security at the end of trading on that day, an option (bought with premium $$p$$) is said to be ’in the money’ or ’out of the money’ depending on whether exercising it at strike price s leads to a profit or a loss for the holder of the option $$( \vert s − m \vert −p)$$. Correspondingly, the option writer looses or gains the same amount.

Since the option holder may choose not to exercise the option in case doing so would lead to a loss, the maximum loss he undergoes is p, while the returns can potentially be ∞ in case of call options or  $$\vert s \vert$$  in case of put options. The option writer, correspondingly has limited opportunity for profit $$ \vert p \vert $$ (which happens when the option is not exercised), and a correspondingly big potential loss.

### Covered options

Since the put option writer only stands to loose (is obliged to pay) at most  $$\vert s \vert $$, even risk averse brokerages usually allow cash covered puts. This is usually a good option in case one intends to invest a certain security at a low enough price.

Similarly, brokerages easily allow folks to write call options when they already own the underlying security in sufficient quantities.

## Vertical Spreads

### Definition

Here one buys and sells a put or call option over the underlying security, and at the same expiration date at different strike prices ($$s_b$$ and $$s_s$$), with premiums $$p_b$$, $$p_s$$.

### Exercising strategy

Since an option is both bought and sold, the person holding the spread is obligated in case the sold option is exercised. The idea is to be able to meet this obligation whenever necessary by exercising the bought option, hopefully while making a profit.

This being the case, good triggers for exercising the bought option would be a\] the expiration day, when the bought option is ’in the money’, and/ or b\] the sold option has been exercised.

### Plots: inference

Consider a coordinate system with horizontal axis being time, and vertical axis being price, with 3 curves: two horizontal lines corresponding to $$y = s_b$$ and $$y = s_s$$, and the market value $$m + p_s − p_b$$. From this, one can reason quickly and correctly about a\] the value of benefiting from the option on a certain expiration day (a vertical line in the plot, leading to the name ’vertical’ spreads).

It is also easy to visualize risk and return with a plot of profit against market price.

### Risk and return

One is reducing the investment (and the risked loss) while limiting potential returns.

If both options are in the money, returns are $$ \vert s_s − s_b \vert −(p_b − p_s)$$. If just the purchased option is in the money, returns are $$ \vert m − s_b \vert −(p_b − p_s)$$. If both the options are out of money, loss is $$(p_b − p_s)$$. When only the sold option is in the money, loss is $$ \vert m − s_s \vert −(p_b − p_s)≤ \vert s_b − s_s \vert −(p_b − p_s)$$.

Thus, in all cases, profit and loss are limited. Potential loss is significant only when it happens that only the sold option is in the money: in other cases, loss is merely $$(p_b − p_s)$$. This significant loss eventuality is non existent in case of bullish call spreads and bearish put spreads.

### Types

In case of a call spread, one buys and sells call options; put spreads are similarly defined. Depending on whether $$s_s ≥ s_b$$, call spreads are called bullish or bearish (the reason for which is clear upon considering potential profit and loss). Put spreads are bearish or bullish depending on whether $$s_b < s_s$$.

## Straddles

In a straddle, one buys/ sells put and call options (at a combined premium p) for the same security at the same strike price s, with the same expiry date.

If the options are bought, we have a long straddle. If the options are sold, we have a short straddle. In case of a long straddle, one is essentially betting that the market price will move outside the interval $$[s − p, s + p]$$. In the case of a short straddle, one is betting that the reverse will happen.

### Risk and returns

WIth a long straddle, potential loss is atmost p, while potential returns are ∞. In case of a short straddle, the potential returns are atmost p, while potential loss is unlimited.
