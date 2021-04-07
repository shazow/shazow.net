+++
title = "How does DeFi yield?"
date = "2021-04-07"
+++

[Decentralized Finance](https://en.wikipedia.org/wiki/Decentralized_finance) (DeFi) is a technology that exploded in popularity in 2020, taking place [almost entirely on the Ethereum network](https://defipulse.com/).

There are many things about it that are outright fascinating: Algorithmic stablecoins, automated market makers, flash loans, flash _mints!_ Every month there is a wild new invention that changes the landscape, often increasingly difficult to understand which is both frustrating and intimidating.

I want to talk about one thin slice of this technology that I'm seeing a lot of people have trouble grasping: **Where does the yield come from?**

A big part of the DeFi movement is easy access to pools of high-yielding assets. The highest-yielding assets are leveraged derivatives of other liquidity pools, but at the foundation we have access to an investment vehicle that has impressive returns with _zero economic risk_. How is this possible?

Traditionally, returns on investments come from inflation, inefficiency, speculation/risk, or violation of trust.

We have government bonds that push the interest rate floor that private institutions offer. We have arbitrage opportunities which increase liquidity between markets. We have investors making claims that something is going to be worth more or less in the future, arguably contributing to price discovery. We have institutions giving out debt in hopes that they'll get it back with some interest. We have ponzi schemes where unscrupulous fund custodians provide some clients returns taken directly from the reserves of other clients until it all falls apart.

## How is DeFi different?

Sure, all the same old tricks exist. There's no shortage of scams, there's volatility between markets, there's speculation, there's inflation and disinflation. None of this is new—no one is claiming it is.

Here is what's new:
1. Non-custodial contracts (reducing the reliance on trusting intermediaries)
2. Algorithmic contracts (further reducing trust, introducing determinism, reducing inefficiency)
3. Atomic contracts: The ability to write a series of instructions with the guarantee that either all of it or none of it executes. This is key, and the consequences are most profound.

## Contract Atomicity

If you've ever typed `BEGIN;` and `COMMIT;` then you're familiar with atomic transactions in databases.

ACID-compliant database transactions have been a thing since the 70s, but it's something that has never made it to the global financial system. A single institution might promise that a list of instructions sent to them would be executed as a single unit, but the reality is that anything that spans institutions will have multi-day settlement periods and often involve humans signing off on parts of it. Even within a single institution, operations are often batched and batches are executed periodically. Very little is actually _real time_ in traditional finance.

Let's say we see two marketplaces which value apples differently. We can buy a bunch of apples from one, haul them over to the other market, sell them for a profit. That sounds great in theory, but by the time we arrange the purchase from one market, load them onto our cart, and haul them over to the other market, a few thousand high-frequency trading bots from Wall Street have moved the price of apples a million times and we're probably not going to make minimum wage on our effort.

To make it worth our while, the difference has to be substantial and our capital has to be huge to really take advantage of it. This is why arbitrage hedge funds are typically managing upwards of hundreds of millions of dollars in assets, and a single avid [WSB](http://reddit.com/r/wallstreetbets) reader wouldn't dare compete... Usually.

Imagine we could pull out cash from our bank, buy apples, move apples, sell apples, and get cash back into our back account in a single atomic transaction. Either the whole thing succeeds, or none of it happens. It's _zero risk_ arbitrage (though there are fixed fees for the privilege).

That's great! We can complete with high frequency traders now, but we still can't compete with their capital.

But wait, what else can we do with atomic transactions?

Imagine we could take out a loan for a million dollars, buy _a lot_ of apples, sell the apples, pay back the loan plus a fee, and keep the difference in a single atomic transaction. Either the whole thing succeeds, or none of it happens. It's _zero risk_ loans for _zero time_ (except we pay a fee to the liquidity pools who lock their capital that we loan from). This is called [flash loans](https://medium.com/monolith/understanding-defi-flash-loans-explained-1a5928a4a612).

Now we can compete with wealthy hedge funds, as long as we can afford the modest flash loan fees (these vary, but roughly 0.0X% in fees) and transaction gas fees.

There are other _even wilder_ possibilities with atomic transactions, like flash mints (instead of loan money, create money for zero time), but let's talk about zero time.

## Zero Time

The longer a debt is held, the more unknowns are added to the probability that the debt will be paid out. A mortgage holder could lose their job, a bank could buy debt that represents a bunch of people who lost their jobs, a global pandemic could ravage our local economy. If my friend wants twenty bucks for a second, I'm not too worried about not getting it back unless they're [an illusionist](https://www.youtube.com/watch?v=eYVEvQKfcpM). If my friend wants to borrow twenty bucks for ten years, I doubt I'll see it again. So much can change with time, I'll probably forget about it.

A flash loan does not exist outside of the scope of the transaction. In effect, a flash loan is debt that exists for precisely zero time. Aside from the real-but-tractable likelihood that there is a software bug in the system, there is no risk of an atomic zero-time loan not being paid back.

The idea is sound, even if there have been times when a particular implementation was not. It seems that only people who have trouble grokking zero-time loans are expecting software to be perfect in zero-time. 🙃

In fact, [DeFi exploits are some of the most fascinating users of flash loans](https://coingeek.com/the-defi-hacks-of-2020/), since they're able to amplify market imbalances in unexpected ways with incredible effect. These are not fundamental flaws, and they've all been mitigated in modern DeFi contracts, but I'm sure there will be more before things become completely safe and stable.

That's the big difference with traditional finance: Even after eons of custodial trust violations, from the very first primate to borrow a tool and not return it as promised, we are still struggling with the same fundamental shortcomings. Meanwhile, DeFi on Ethereum has only been alive for a couple of years, and there is a very achievable end point of stability and safety.

## All about that yield

Imagine anyone in the world could have access to a stable currency denomination with non-trivial interest yield?

Today, you can let flash loan bots pay you to use your capital with zero economic risk of not getting your money back:
- https://compound.finance/
- https://aave.com/
- https://dydx.exchange/

Today, you can pool your money into trading pairs and get fees from people who trade between them.
**Note:** This category is affected by [speculative risk in the form of "impermanent loss"](https://uniswap.org/docs/v2/advanced-topics/understanding-returns/).
- https://uniswap.org/
- https://1inch.exchange/
- https://loopring.io/

Today, you can use a collective roboadvisor contract that will automatically rebalance your collective funds into the best performing pools in the most fee-efficient way:
- https://yearn.finance/

There is an evergrowing ecosystem of all of these, I just linked the ones I'm personally familiar with. For more: https://defipulse.com/

The best part? Many of these yields exist completely outside of a world of inflation, inefficiency, speculation/risk, or violation of trust.

In many cases, money is simply earning fees for being made available in a safe way.


## FAQs

> Is this investment advice? 😳🖐️🦋

No.

> Could we implement this on traditional finance infrastructure?

It's possible. Meanwhile, we're still seeing banks sweating to maintain [billions of lines of COBOL running in production](https://www.howtogeek.com/667596/what-is-cobol-and-why-do-so-many-institutions-rely-on-it/) that was written _50+ years ago_. Ask again in a hundred years?

Even if we could wave a magic wand and retrofit all of the world's banking today, the custodial nature of traditional banking is what introduces a lot of the risk. Can a loan across multi-national banking institutions truly be risk-free if each institution has to _trust_ the other side to keep up its end of the deal? Once we move to a trustless non-custodial system that has Turing-complete atomic instructions, we end up where we are today with Ethereum's DeFi ecosystem.

> No risk is never _truly_ no risk!

Of course. Software bugs happen, human error happens, black swan events happen. The goal of these mechanisms is to dramatically reduce the number of intermediaries and cut down on the surface area for risk, in ways we haven't been able to do before.

> Huh, free money with no risk? Wouldn't everyone put their money in this and the returns go to 0?

That's not impossible! But keep in mind, flash loans is just one of a multitude of yield-earning mechanisms, and one with the lowest returns already. There are plenty of other mechanisms that pay far more but involve more hands-on babysitting (like adjusting collateral ratios as prices change) or have more risk (less mature smart contracts that could be exploitable) or are more speculative. Furthermore, as more money enters the ecosystem, more opportunity becomes available for flash-loan trading bots to do their thing.

> How much yield could I get right now? Asking for a friend...

Depends on your risk tolerance and how hands-on you want to be. Many of these rates vary wildly from week to week: https://defirate.com/


> What are flash loan bots _actually_ doing?

Here's a well-documented smart contract bot that takes out a loan from Aave and performs arbitrage between two markets on ETH-DAI: https://github.com/fifikobayashi/Flash-Arb-Trader

More sophisticated bots in production today traverse much more complex paths across many lenders, exchanges, and trading pairs before completing a profitable cycle. All atomically, of course.

---

- Special thanks to Tracy, Charlie, Phill, and others for feedback.
