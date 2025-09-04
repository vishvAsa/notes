---
title: Implementation
---

## Execution Summary

### समीकरणम् (rebalancing)
- करवृद्धिरहित-लेखासु यथेष्टम् काले काले
- करव्याप्तौ स्थितासु लेखासु वर्षे वर्षे। कराधिक्यम् वारयितुम्।

### अमेरिकेषु
TODO: What about Ch Schwab? 

- TD Ameritrade इत्यत्र my account → portfolio planner प्रयोगः पूर्वतटव्यवहारसमये। Use total money to be invested.

#### Reg T, Good faith violation
- For stocks traded on US exchanges, settlement is currently three business days after the trade.
- Dividend reinvestment (automatic) is technically considered a trade and thus is subject to the same settlement process as a normal trade you would place.

##### Example
- On Monday, Janet holds $10,000 worth of XYZ.
- On Tuesday, Janet sells her entire XYZ position for $10,500, which will settle Thursday.
- Wednesday morning, Janet buys $10,500 of FAHN on good faith that XYZ's sale will settle.
- Wednesday afternoon, Janet sells FAHN for $11,000, making a $500 profit. However, FAHN's original purchase wasn't fully paid for because XYZ's sale hadn't yet settled.

##### TD Ameritrade

TODO: What about Ch Schwab?

- If this happens three times in a 12-month period, a client will be restricted to trading with settled cash for 90 days (TdAmeritrade).
- Avoid by looking at [My Account > History and Statements > Transactions](https://invest.ameritrade.com/grid/p/site#r=jPage/cgi-bin/apps/u/History) , looking at dividend dates, and possibly temporarily freezing [dividend reinvestment](https://invest.ameritrade.com/grid/p/site#r=drip). 

#### Account ownership and transfer TD Ameritrade
> When dealing with a Joint account that has rights of survivorship if the secondary owner passes away all that is needed will be a death certificate to remove the secondary owner. 
> 
> If the primary account owner passes away then we would need a standard account opened and a death certificate to move the assets to for the secondary owner.

Joint accounts only possible with majors, not minors.

### भारतेषु
#### General - Post tax
- Look up symbols in BSE and NSE websites. Sometimes equity is listed in both - only "EQ" is added in symbols to differentiate.
- Can invest in several index funds via mutual fund portals - simpler than trading stocks. Can set up monthly "SIP" investment.
- upstox order tips: [EV Note](https://www.evernote.com/u/0/client/web#?n=f9a8ba31-ac3a-4c70-a836-4ead7b16439b&).

#### General - Tax saving
- Explore funds on morning-star : see 5 yr returns, expense ratio
- https://upstox.com → mutual-funds login


#### dhan
Fairly good support as of 2025. 0 AMC promised.

No joint account as of 2025.

#### FundsIndia
- Easy account opening, support. Excellent UI.
- Tax reporting - Investments over 10L shows up in both joint holders' IT form as of 2022!

#### Other providers
- fisdom (202207)
  - No charges in moving money. Joint account can be opened with offline support.
  - UI not very good. Poor customer support (Bank account change took well over a week on email).
  - demat for mutual funds - account opening 299, AMC 0
  - demat trading  - annual maintenance 250
- IDFC - No joint account. Can hold MF jointly - but need to go the branch and fill a form for each folio.
- Groww
  - 0 AMC, 0 account opening fees.
  - No joint account as of 2022.
- Paytm Money
  - No transaction fee on investments & withdrawals. 0 fees.
  - No joint account as of 2022.


<details><summary>History - Upstox</summary>

Promised lifetime 0 AMC and then reneged in 2025.

- Tax reporting - As per agent 202208 - "No high value transactions (HVT) reported to IT department." 
- Customer support - Despite rough patches in the past, ok customer service as of 202208.

**Dormancy**

> As per Exchange guidelines, if no trades/investments/transactions have been made from your Upstox Trading and Demat or MCX account in the last 12 months we make it inactive/dormant.

Consequence - 

- You can’t place any new trades in Equity, F&O, Commodity or Currency segment
- You can’t sell any existing holdings
- You can't add or withdraw funds
- You can invest in IPOs but will not be able to sell the IPO allocated shares
- Can get dividents etc..

Reactivation 

- Post 12 months - can do it on app.
- Post 24 months - must redo KYC

**Transfers**

- Deposit via NEFT - no fees.
- Withdrawal (post Mutual fund sales, not stock sales) via NEFT/ RTGS - no fees. See transfers section [here](/notes/economics/financial_services/banking/01_Operation.md).

**Mutual funds**

- funds for buying Mutual Fund units will be deducted directly from your registered bank account. And on redemption of these units they will be credited to your registered bank account. Not brokerage pool account.
- A DP (Depository Participant) charge of ₹18+ GST is applicable on the redemption of Mutual Fund units. This will be deducted from your Upstox wallet and not from your bank account.

</details>
 


## Discipline

If you don't have much time to research, don't time the market (applies to most people).

### Common under-performance

In a large study in 1991-1996, active traders (avg portfolio turnover was 75%) performed much worse than the market returns (5% difference ); they tended to trade mostly common stocks (with very few value stocks). Some individuals did much better, others did much worse, but the large majority of individual investors would have done better by taking a nap rather than by acting on their ideas. It is the cost of trading and the frequency of trading, not portfolio selections, that explain the poor investment performance. One model to explain this is that this excessive trading emanates from investor overconfidence.

## Rebalancing

- Rebalance as often as you like in tax free (retirement) accounts \[considering trading fees\], and perhaps annually on taxed accounts (short term gains tax is higher).
- When the market is down, you might want to buy more stocks - not because you want to "time" the market, but because your holdings don't match the target portfolio because of devalued equities. 

## Purchase and selling

### Using options

Selling put options is a profitable way of investing in a certain security at a low enough price. Thus, one can try to buy the equity at the desired price, while simultaneously collecting the premium for selling the option.

Similarly call options can be used while selling an equity.
