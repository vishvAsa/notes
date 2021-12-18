---
title: Portfolio
---

## Summary

Also see [implementation summary](../implementation).

- Pick a simple asset allocation model, stick to it, rebalance occasionally.
  - Possibly put a small portion of money in high-risk high-reward places. (NN Taleb's barbell strategy.)
- Initially, be equity heavy. But put some money in bonds (negatively correlated with equity).
  - USA - TSM core 5/8, SV tilt 3/8.
- Switch to fixed income heavy portfolio when retiring.
    - "Let us call the first set ensemble probability (concerned with a collection of people) and the second one time probability or ergodicity (concerned with one person through time). When you read investment recommendations based on long term returns of market - beware... they're conflating the two. If the investor has to reduce exposure to the market due to big expenses, his returns will be divorced from the market, period." - NN Taleb paraphrased.

More in [CV](https://checkvist.com/checklists/113019/tasks/7086822).

### स्थानानि
- USA
  - स्वेतिहासात् सौकर्यम्
- India
  - मुम्बायि-नाशाद् निवेशनाशस्यापायः

## Measurement
### USA
Performance
- [portfoliovisualizer.com](https://www.portfoliovisualizer.com/backtest-portfolio?s=y&timePeriod=4&startYear=1985&firstMonth=1&endYear=2019&lastMonth=12&endDate=08%2F25%2F2016&initialAmount=10000&annualOperation=0&annualAdjustment=0&inflationAdjusted=true&annualPercentage=0.0&frequency=4&rebalanceType=1&showYield=false&reinvestDividends=true&symbol1=VTI&allocation1_1=50&allocation1_2=68&allocation1_3=50&symbol2=VEU&allocation2_3=20&symbol3=VBR&allocation3_1=30&allocation3_2=32&allocation3_3=30&symbol4=BLV&allocation4_1=20)
  - compounded annual growth rate - 8.5%, inflation adjusted - 6.8%
- [Mint](https://mint.intuit.com/investment.event)
- [morningstar](https://www.morningstar.com/portfolio.html?requestUrl=/RtPort/Reg/AllView.aspx?viewpage=1&dt=45#468-hidenews)

Asset correlations
- [portfoliovisualizer.com](https://www.portfoliovisualizer.com/asset-correlations?s=y&symbols=VTI+BLV+VBR&endDate=12%2F14%2F2018&timePeriod=4&numTradingDays=120)

## Equity: Everything + small value approach

Abbreviations: Total Stock Market: TSM, SV: Small Value.

Principle: "Fama French three factor model of US fund returns explains the risk and return of diversified equity portfolios across three risk dimensions: market risk, size risk and value risk. Investors who employ a Fama-French tilt in their portfolio believe that overweighing small-cap stocks and value stocks provides a different return path than holding only the capitalization-weighted market itself. Fama and French view any excess return from tilting is a payoff for taking additional risk." - Rick Ferri [RF2014](https://www.forbes.com/sites/rickferri/2014/07/17/to-tilt-or-not-to-tilt/#54ba6f4d4986), Fama [IMG](https://i.imgur.com/6RjBwEY.png). This analysis was made popular by the morningstar.com chart \[eg. [IMG](https://www.bogleheads.org/wiki/File:Three-Factor_Model_-_Morningstar.png)\].

Preferred Implementation:

- TSM core 5/8, SV tilt 3/8. Repeat internationally. The allocation was checked with FF factors published on Ken French’s website .
- References:
    - Rick Ferri [here](http://www.bogleheads.org/forum/viewtopic.php?t=798), [here](https://www.bogleheads.org/forum/viewtopic.php?t=154130), [RF2014](https://www.forbes.com/sites/rickferri/2014/07/17/to-tilt-or-not-to-tilt/#54ba6f4d4986) ( TSM 3/4, SV 1/4.), [RF2011](https://www.bogleheads.org/forum/viewtopic.php?t=79966): (2/3, 1/3)

See krayaNa-vikalpAH .

## Equity vs negatively correlated items - balance.

- Allocating some portion to items negatively correlated with equity is a good way of dealing with years when the stock market is down (Eg. 2008, or the lost decade 2000-2010).
- Equity and bonds are negatively correlated (~ 0.33 - [PP](https://www.portfoliovisualizer.com/asset-correlations?s=y&s=y&symbols=VTI+BLV+VBR&endDate=09%2F18%2F2017&timePeriod=4&numTradingDays=120)). So, sometimes when the stock market goes down, bonds might go up (or at-least not as down) and vice versa.
- Negative ETF-s are an option.

## Broad investment in chosen sectors

### Picking a sector

Different sectors show different patterns of growth over a long period of time.

- Cyclical: Real estate, basic materials, consumer items like cars, financial services.

- Sensitive: Energy (including petroleum), technology, communication services, industrials. These show greater variation depending on current macroeconomic circumstances.

- Defensive (Monotonically small growth): Healthcare, essential consumer items (like food), utilities (electricity, water).


### ETF investing

One can invest in ETF’s tracking index funds. Similarly, one can invest in ETF’s tracking the bond and real-estate markets. To pick an ETF, consider its portfolio and deduce its potential profit/ risk.

## Bonds

Some allocation to bonds, through an ETF perhaps, reduces volatility. Bonds are specially susceptible to the interest-rate-increase risk.

#### Bond ladder

Bonds have a fixed maturity date. So, investors often build a ladder of bonds such that one bond or the other matures in a given time slot. This brings greater liquidity to the investment.

## Value investing

One judges the intrinsic value of a security, and buys it if the market value is less than this by a significant ’margin of safety’. One particularly focuses on value - rather than growth - businesses.

#### Identifying value securities

This can be difficult, despite the use of comparative measures of value, like P/E. Thus, it is advantageous to invest in areas which you understand - Or one can copy investments by reputed value-investor funds.

Usually, equities of small companies not yet discovered by the market fit this description.

One can ask the question: ’Will I be willing to privatize this business?’

#### Focus on differentiation

In addition, one may focus on well-differentiated, rather than generic, companies: this ensures that the underlying product retains an advantage in capturing customers even if competitors catch up. This was exploited by Warren Buffet, when he invested in Coca Cola.
