+++
title = "Why Blockchain?"
date = "2024-05-24"
+++

A blockchain like Ethereum[^1] provides a collectively owned programmable substrate, allowing us to build more decentralized "onchain" applications where the consumers have more agency over how things behave.

Let's break it down "collectively owned programmable substrate":

## Collectively Owned

The Ethereum consensus is a communal mechanism which enforces certain rights for anyone who chooses to use it.

Primarily, it is designed to enforce the right to deploy code that is guaranteed to be executed correctly without relying on an empowered intermediary (someone who can choose to break the rules we've established). These rights are extended to everyone equally: regardless of which country or jurisdiction you live in, whether you're a person or corporation or even a program.

Anyone can read the state of the Ethereum blockchain, but the requirement to write is to pay for the cost of the execution[^gas].

## Programmable Substrate

Building _on top of_ a programmable substrate inverts many of our traditional assumptions:
- We can create programs that are immutable (permanent and unchangeable) yet flexible.
- We can create programs that give up all owner control, giving all of the power to the consumers.
- We can build composeable components that can be reused safely (because they're immutable).

### Programmable Security
Traditionally, services we use have concrete security flows: Choose an email and password; Add a phone number for a second factor; Upload a photo of our driver's license to verify it's us. If our bank doesn't support Authy for a second factor, there's nothing we can do but complain. If our email provider doesn't support team logins, there's nothing we can do but share the password with the team.

The blockchain ecosystem flips this dynamic: The application does not need to care how the consumer secures their accounts. Every account can provide a cryptographic signature, and that's enough.

With smart contract wallets like [Safe{Wallet}](https://safe.global/), we can customize every aspect of our own security. We can add multiple devices, we can add spending limits, we can add various recovery schemes like [Social Recovery](https://safe.mirror.xyz/WxKSxD9J1bRI-SDOuDvAAIezwVrvWWkpuwuzcLDPSmk). This allows us to dramatically innovate on our security practices as an independent industry.

### Programmable Identity
Traditionally, we have identity cards issued by our local government, or domains managed by ICANN, or a profile managed by LinkedIn. These are all empowered intermediaries: They can choose to deny changes, or outright ban us from their systems. 

With the Ethereum Name Service ([ENS](https://ens.domains/)), we can have a collectively owned identity resolving system that is also fully programmable. We can set it up an ENS that routes one way on weekdays, and other ways on weekends. There is no centrally managed "API" that can be sunset and prevent me from using it like before. By using programmable security, we can abstract the ownership of our ENS to be managed by an individual, or a team, or a democratic collective, or anything else that can be expressed as a program.

### Programmable Banking
Traditionally, banks require us to pay bills from a Checking Account, but encourage us to hold money in a Savings Account through modest interest rates. Autopay Bills can only be paid out of Checking Accounts. If the Checking Account drops below zero, we get charged an Overdraft Fee (even if money is available in the Savings Account), and we'll also get hit by a Late Fee from the bill provider. Not to mention the whole system shutting down outside of business hours, out of network ATM fees, excessive foreign exchange fees hidden in the price spread, over a billion people blocked out of the banking system at large. Why do we tolerate these anti-consumer constraints?

Banking in a collectively owned programmable substrate is quite different: There are no limits to how accounts must behave, we can automatically split incoming payments (e.g. [splits.org](https://splits.org/)) among our collaborators; we can setup a cascading system that pays for our services however we want--even complex vesting or payroll payments streamed down to the second (e.g. [superfluid.finance](https://www.superfluid.finance/), [sablier](https://sablier.com/)); we can completely abstract multitudes of currencies and assets (e.g. [cowswap](https://swap.cow.fi/)), allowing us to pay with whatever we prefer while being confident that we're receiving the most competitive rate that anyone else would too.

### Programmable Everything?
If you're a web developer, how many times have you built the same signup/login flow?

What would we build if we didn't have to re-implement standardized "smart" components that are collectively owned? What if your consumers could be responsible for their own...
- Login security and recovery
- Identity details
- Payment processing
- Social network audiences
- Cosmetic assets (picture profiles, avatars, item skins, colour schemes and themes)
- Privacy-preserving attested facts (whether they're over some age, or have some amount of income, or a citizen of some jurisdiction, or a unique human)
- Governance processes for how communities make decisions
- ... What else?

What if all of those components kept getting better and better, while our application could stay the same?

The question is not "why can't we build this without a blockchain?"

The question is: **Why would we want to build things without a collectively owned programmable substrate?**

---

_Disclosure_: I work on projects in the Ethereum ecosystem and hold ETH.

[^1]: There are many blockchains today with varying credibility and decentralization properties. Very few of them prioritize decentralization in the same way that Ethereum does, so that is my primary example for talking about what's possible.

[^gas]: The fee for executing a transaction on Ethereum is referred to as the "gas fee", and it is denominated in Ether. It is designed to closely proxy the real cost of the transaction to the Ethereum consensus and network, in order to prevent denial of service attacks. Any time something costs more on one side than another side, this can be an attack vulnerability or a potential externality which can be profitable to extract. Spam is a great example of this: To be effective, spam must cost far less to produce it than the profit that can be extracted from the externality it creates.
