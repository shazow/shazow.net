---
title: Decentralization
date: 2021-12-27
subtitle: Peer-to-peer, trustless, permissionless, non-custodial, credibly-neutral...
  What do we mean by these words?
tags:
- Decentralization
- Open Source
- Philosophy
- Technology
categories:
- Featured
---
As technological advancements march on, we're having a lot of very important conversations about what we want out of the platforms we use day to day. We often talk about "decentralization" since it carries so much meaning, but it's also easy to talk past each other because we may be thinking about different components of decentralization in different contexts.

If we have two systems where one is more trustless and the second is more permissionless, can we say that one is decentralized but the other is not? Can we even say that one is _more_ decentralized than the other? Or does each simply have different points of centralization across different dimensions?

Perhaps we need a clearer vocabulary to use when we discuss decentralization. Peer-to-peer, trustless, permissionless, non-custodial, credibly-neutral... What do we mean by these words?

## Vocabulary
Let's break down some of the properties that are found in some of our fantasy decentralized systems, and imagine that each of these properties exists on a scale of 0 to 10:
- **Peer-to-peer:** We can participate in the system by connecting directly with another peer, without going through a designated intermediary.
- **Trustless:** We can independently verify that all of the components of the system are behaving correctly.
- **Permissionless:** We can be equal participants in the system without requesting access from another entity that can act as a gatekeeper. This is also related to preventing censorship.
- **Non-custodial:** We can participate in the system without giving up or delegating any control (or power of outcome) to a provider.
- **Credibly-neutral:** The system is not systemically biased towards a specific sub-class of participants.
- **Legitimate:** The system is behaving in accordance to the rules that we collectively decided are desirable.
- **Open Source**: Anyone can read the source code of a system, and fork the development of the software if there is disagreement with its development.

This is not a comprehensive list, but it helps to discuss concrete properties that fall under this umbrella.

**We must be mindful that changing the _scale_ of one of these properties does not make a system entirely centralized or decentralized!** By changing the design of our system, we can add or remove points of centralization across specific dimensions.

## Why are these properties important?
We can acknowledge the obvious reasons: When we give disproportional power to specific individuals, it can lead to abuse of that power.

But there is a more interesting property:

**It's easy to build centralized systems on top of decentralized systems, but it's hard to build decentralized systems on top of centralized systems.**

This asymmetry means that there is a larger possible _solution space_ in decentralized systems than in centralized systems. One is a superset of the other.

Let's explore each component within this context:
- **Peer-to-peer:** We can build a client/server relationship on top of peer-to-peer systems, but we can't directly connect to a peer if we're only allowed to connect through a designated server.
- **Trustless:** We can write a verifiable smart contract that lets an opaque box unilaterally control it. We can't build a verifiable smart contract on top of a opaque box.
- **Permissionless:** We can deploy a smart contract on a permissionless system that controls who can interact with it.
- **Non-custodial:** We can always delegate our secret private key to a custodian, like a spouse or a bank.
- **Credibly-neutral:** We can create a smart contract on a neutral system that gives preferential treatment to public keys that are on a special list.
- **Legitimate:** We can create a smart contract on a legitimate system which advertises one desirable behaviour, such as "price always goes up", but ultimately exhibits an undesirable behaviour, such as "creator stole all the money."
- **Open Source**: We can deploy a closed-source service that uses open source underneath. In fact, almost all closed-source software today relies on open source. Not hard to imagine.

This is similar to how we can easily build an insecure system within a secure system, but it's extremely hard to build a secure system within an insecure system. Secure systems have a larger and more interesting solution space within them.

It's clear that we can take something completely decentralized in every respect, and easily build on top of it something that defeats every desirable property. Many "scams" take this shape: They exploit the intuition that a system with desirable properties would only be a host to other things with desirable properties.

## Turtles all the way down
Our lives are composed of a mishmash of systems that are centralized or decentralized in different ways.

It can be convenient to point at one piece like TCP/IP exclaim "the internet is decentralized!" Or we can point at ICANN (or Amazon AWS or Facebook) and exclaim "the internet is centralized!"

When we realize how it's easy to build centralized systems on top of decentralized systems, it's unsurprising that we can find so many conflicting examples.

In many ways, our political systems fall on these axes, too: We value *legitimate* democracies, and eschew corrupted authoritarianism. We fear that people in positions of power will abuse them without "transparency" and "checks and balances". We want to have private and personal relationships with people. We like the idea of living in a society that allows us to do creative things without asking for permission, and we would prefer a future where a small class of people doesn't have disproportional power and wealth over everyone else.

Other interesting examples to contemplate within this framework: In what properties and scales is our legal system decentralized? What about realestate ownership? Modern medicine?

## What does decentralization solve?
Ask not what decentralization can do for you, but what you can do for decentralization. 

Decentralization can remove the surface area for problems that are _created_ by centralization, such as those caused by added intermediaries and custodians. 

Let's setup a fantasy strawman scenario to illustrate this:

Imagine Twitter starts requiring a new kind of intermediary for posting on their service: Moving forward, everyone has to tweet through another Twitter employee. That person will get your username and password, and you'll need to phone them up and dictate your tweet for them to post on your behalf. What are some things that can go wrong here?

For one, we're going to have all kinds of communication issues--literally a game of broken telephone! Tweets are going to get miswritten due to bad phone reception, or misunderstanding of accents, or the intermediary having a bad day, or maybe they're working with a political figure that they despise. We'll need to hire thousands or maybe millions of intermediaries to do this job, and this also opens up an opportunity for the intermediary to leak our password, or outright hijack our account and post unauthorized tweets. Perhaps we can discourage it with a licensing scheme and harsh penalties.

Admittedly Twitter was not very decentralized to begin with, but let's work through our framework:
- Peer-to-peer? We now have _another_ designated intermediary that we're required to use in the chain, so this got worse.
- Trustless? Another intermediary in the trust chain that we can't audit, this got worse.
- Permissionless? Even if we made it through Twitter's original gatekeeping, the new intermediary can decide to block us.
- Non-custodial? This new intermediary has our username and password, and they can do what they want with it. We've given up all control over our Twitter accounts to this custodian.
- Credibly-neutral? Perhaps the licensing scheme and penalties could keep most of these intermediaries in line, but ultimately that's one more point where bias can be exercised to dis-empower classes of people. Even politics aside, imagine using this phone system with a speech impediment. If Twitter was 6/10 on this property before, it's more like 4/10 now.
- Legitimate? This one is more interesting here. If we as a society decide that these intermediaries are ultimately doing a great service to us by exercising their judgement and reducing content that we don't want anyway... it's possible that this fantasy could end up _more_ legitimate than original Twitter?
- Open source? Since this is already a closed system, this reduces to the Trustless property. One more opaque step that we can't audit.

Now imagine we remove this added intermediary, and suddenly all of these new problems disappear from that particular point. Other points of centralization still exist as they did before, and perhaps we can work towards removing them too someday.

Clearly this is not a serious example, but it illustrates important points:
1. **We can always add more intermediaries**, it's very easy! This changes the decentralization properties of our system.
2. **We can remove intermediaries**, but it's harder as they become integrated into our institutions. Imagine if it's wildly profitable to be a Twitter Intermediary due to bribes, or the contrary: the thousands of underpaid and overworked employees form a union that becomes too difficult to bargain against. How can we conscionably take away jobs from so many people?
3. Since they're so easy to add, intermediaries exist everywhere. How do we evaluate which ones are worth doing the hard work of removing? Can we even anticipate what the outcomes will be?

This is again similar to security: Removing components that don't have the necessary guarantees is the best way to improve security, but it can be hard to remove components without sacrificing their features that we've become dependent on. On the other hand, how many times have we found fragile dependencies in our systems that we don't need anymore?

## Decentralization is not a panacea
We have many challenges in modern society that are orthogonal to whether they're expressed by a centralized system or decentralized system.

For example, consider ownership: We can have a centralized physical ledger on our Mayor's desk, with entries of who owns what. Or we can have a decentralized digital ledger, with the very same entries. In either case, it does not change what policy on ownership we enact as a society. It does not change what taxes we choose to collect, or what kind of construction zoning we allow, or if we decide to disregard that ledger and start anew.

Some other social challenges worth noting: **Decentralization does not solve wealth inequality**, it does not solve local law enforcement, it does not solve the ability for people to create centralized systems within it (and all of the problems that are created from them).

## When is centralization useful?
Most properties of centralization are about concentrating control or power in a specific component, this can make it very easy to make quick unilateral changes in policy. To decentralize is to give up power or control.

When we imagined the fantasy Twitter scenario, the added intermediaries acquired a powerful position: They gained control of what tweets were being posted. To remove them, they would need to give up that power.

We can imagine scenarios where having ultimate power and control can be vital, such as a military chain of command. When facing dire threat and every moment is a life-or-death decision, having competent leadership with full control over their domain is crucial.

Centralized properties can be very convenient and powerful, and some of their harm can be mitigated by placing them within structured decentralized process--like giving a representative partial control over an organization, while still being able to vote them out. More harmful parts of centralization are amplified when they approach permanent capture, when we become too dependent on them and we're no longer able to exercise any mitigations for misbehaviour.

It is up to us to choose whether we allow more and more parts of our lives to become captured in centralization, or if we want to pursue the dream of decentralizing things that were not possible to decentralize before and see where that takes us.

---

[_Appendix with additional notes and links_](https://github.com/shazow/shazow.net/issues/41#issuecomment-1000555663).

_Thanks for feedback on early drafts to Benjamin, Ezzeri, Harper, Jenny, Max, Phill._
