---
title: "How can open social protocols fail us in 2025"
date: 2025-03-31
tags: []
categories: ["Featured"]
aliases: []
---

Let's compare the possible failure modes of various open social protocols:
- ActivityPub/Mastodon
- ATProto/Bluesky
- Farcaster/Warpcast

Some scenarios I'd like to consider:

1. **Can my identity be taken away?**
2. **Can my audience be taken away?**
3. **Can my ability to extend it and build on the protocol be taken away?**

Some specific failure modes I'm concerned about:
 
4. **What happens when the most popular app or instance becomes malicious?**
5. **Is there something the maintainer can do that would prompt me to abandon the service/protocol altogether?**

Let's begin:

## ActivityPub/Mastodon
There are two scenarios to consider here: One is for self-hosting and second is accounts that are hosted on a shared instance.

While ActivityPub has many uses outside of social networks and the social network aspects like Mastodon are _capable_ of self-hosting, they are practically designed for shared hosting[^1]: It is practically impossible for everyone to self-host an instance today. Even if I had a magic wand and made every Mastodon account self-hosted, the service as designed today would be unusable.

With that in mind, I will primarily focus on the shared-hosted Mastodon-compatible social network instance case specifically:

1. **Can my identity be taken away?**

   💀 Yes.
   
   The owner of the instance has full control over instance accounts and can do with them what they please.
   
2. **Can my audience be taken away?**

   💀 Yes.
   
   In fact, this happened to me personally. I was on an instance with a few hundred followers, then the admin burned out and abruptly shut down the server and now both the identity and audience are forever gone, impossible for me to recover.
   
3. **Can my ability to extend it and build on the protocol be taken away?**

   💚 No.
   
   ActivityPub is an open and generously permissive protocol built around implicit trust, almost to a fault with some security implications here such as private accounts' posts getting leaked across federated boundaries[^2].
   
4. **What happens when the most popular app or instance becomes malicious?**

   🚨 Worst case scenario is if the largest instance disappears (or gets purchased by a malicious billionaire) then all of those identities are gone, all that audience is gone, the content is gone (some may be recoverable through caches on federated instances, but not robustly attributable). _But_ other instances survive and are largely unaffected except for the reduction in audience, and this is an improvement over something like Twitter.
   
5. **Is there something the maintainer can do that would prompt me to abandon the service/protocol altogether?**
   💚 I don't think so.
   
   There is a huge ecosystem with diverse implementations by varieties of people. There are already apps built on ActivityPub that span every conceivable ideology, including TruthSocial that is owned by the president of the United States. I don't think any of them can say or do much which would severely change my perspective on ActivityPub or Mastodon as a technology.

## ATProto/Bluesky
[Bluesky](https://bsky.app/) (and the ATProto protocol it's built on) has many optional provisions for improving the sovereignty of users, such as managing signing keys with the _Public Ledger of Credentials_ ([PLC](https://web.plc.directory/))[^3] and running my own _Personal Data Server_ ([PDS](https://docs.bsky.app/docs/advanced-guides/federation-architecture))[^4] that can serve as a source of truth for my data. While this is not the default, and it's unrealistic for everyone to self-host a PDS, the protocol *is* designed for a world where everyone has ownership over their signing key and it does support alternate identity schemes in the future (potentially even fully sovereign and programmable onchain signatures).

1. **Can my identity be taken away?**

   💚 No-ish.
   
   The default onboarding with a `*.bsky.social` identity is controlled by Bluesky and can be taken away, but the protocol facilitates using my own domain for my identity, so I can be `shazow.net` instead of `shazow.bsky.socialf` and that can't be taken away by Bluesky **BUT** it can be taken away by ICANN and my registrar.
   
   Note that this namespace is mostly cosmetic, the actual protocol interactions are mapped to a long-lived public key (a [DID, managed by the PLC](https://docs.bsky.app/docs/advanced-guides/resolving-identities) and the "human readable" identity is simply an alias to it which can be changed without losing the interaction integrity.
   
   Overall, if my handle is taken away, then someone else will show up as me on Bluesky and I will need to register another handle, but I will not lose any of my social graph.
   
2. **Can my audience be taken away?**

   🟠 Sort of.
   
   ATProto messages are designed to be robustly replicated with cryptographic signatures, so there can be arbitrary paths to getting messages to my audience. Unlike ActivityPub, if one replica loses all of my posts then another replica can robustly re-introduce them to the network without risk of forgery.
   
   On the other hand, a core part of Bluesky is their approach to [composable and comprehensive moderation tooling](https://bsky.social/about/blog/4-13-2023-moderation) that is available at many layers (the client via labels, the AppView, the relay, etc). On multiple occasions, Bluesky chose to deplatform users who effectively lost all access to their audience.
   
   It would help if Bluesky leaned more heavily on their excellent community moderation tools and eventually remove global moderation altogether. Additional popular clients and AppViews with their own policies would help, too.
   
3. **Can my ability to extend it and build on the protocol be taken away?**

   💚 No.
   
   I can extend ATProto with my own "lexicons" and create whole parallel functionality within the same infrastructure.
   
   In fact, there are already many interesting use cases being used, like: [WhiteWind](https://whtwnd.com/) for blogging, [Smoke Signal](https://smokesignal.events/) for coordinating events, [Flashes App](https://bsky.app/profile/flashes.blue) for photo sharing, and [many other experiments](https://github.com/fishttp/awesome-bluesky). That said, I suspect some of this will change in the future as more griefing and other attacks on the protocol are explored.
   
4. **What happens when the most popular app or instance becomes malicious?**

   🚨 What happens if Bluesky Social, PBC (the company behind Bluesky) disappears tomorrow? Let's say bsky.app and associated infrastructure they run is gone (bsky.social PDS, AppView, relays, etc), now what?
   
   The good: The [Bluesky App and infrastructure tools are all permissively-licensed open source](https://github.com/bluesky-social), and someone else can fork them and release alternate versions. There are some minor players already trying this. The historic state can be replayed from any archives people have (there are some services who maintain snapshots).
   
   The bad: It's extremely expensive to operate for the current userbase (33M users today), it was [estimated to cost over $500,000/mo in hardware costs](https://lobste.rs/s/gsj2e2/how_self_host_all_bluesky_except_appview#c_9cavzb) when Bluesky was half this size. Assuming double that after bandwidth, human, and other costs, it's prohibitively expensive for a random individual to take on that cost and it's too much to quickly coordinate a grassroots cooperative effort. Frankly, both the protocol (relays feeding an AppView monolith) _and_ culture ("signups should be free") are not designed for a collectively owned/operated ecosystem at scale.
   
5. **Is there something the maintainer can do that would prompt me to abandon the service/protocol altogether?**

   🚨 This is a tricky one.
   
   If the Bluesky team said tomorrow "you know what? we're tired, this isn't working out, we're going to stop working on it" then I'm not confident that someone else would pick up the baton. That could very well spell the end of the social network as it is today. It's not like there's a bunch of companies making good money from it that they'd be compelled to take over to retain their business. If there were more independent and institutionally motivated companies hosting their own instances of the whole stack so that users can trivially switch endpoints on the app, I'd feel more confident.

## Farcaster/Warpcast
[Warpcast (and the Farcaster protocol)](https://www.farcaster.xyz/)  takes a similar portable cryptographically-signed approach as ATProto, except with several important differences: Full identity sovereignty, native payments, and a culture around building an active self-reinforcing economy within the protocol ecosystem. Both third-party services and unique features like mini-apps that take advantage of payments being a native mechanism on Farcaster. Keep this in mind for the final point.

1. **Can my identity be taken away?**

   💚 No.
   
   While the default onboarding flow uses a custodied zidentity similar to Bluesky (Farcaster ID), anyone can set [an ENS identity](https://unchainedcrypto.com/ethereum-name-service-ens/) which is fully self-custodied and can't be taken away even, not even by ICANN. So instead of `shazow.farcaster` I am `shazow.eth`. This also allows for arbitrary programmable collectively owned namespaces, since the ENS can be owned and managed by any smart contract.
   
2. **Can my audience be taken away?**

   💚 Not entirely, but there is still only one main app (Warpcast) that is used by the vast majority of people.
   
   The dominant app can effectively moderate people out of the timeline, indistinguishable from being categorized as spam. This will change very soon as large companies like Coinbase are integrating Farcaster into their apps which would compete in scale with the active audience on the network today. A few more large participants with a variety of timeline/moderation approaches will make audience ownership relatively safe.
   
3. **Can my ability to extend it and build on the protocol be taken away?**

   💚 No.
   
   While the apps do a great job hiding the implementation details, the key management is non-custodial in a smart contract, so I can fully control who gets write access to my namespace and that can't be taken away from me. The Farcaster Hub protocol is similarly cryptographically signed so my messages can be routed in arbitrary ways even with one node censoring.
   
   While lot of development today is happening around [Mini-Apps (formerly known as Frames)](https://miniapps.farcaster.xyz/) which run within the timeline with native access to payment and social functions, there is also a [healthy community building on the Farcaster protocol itself](https://github.com/a16z/awesome-farcaster).
   
4. **What happens when the most popular app or instance becomes malicious?**

   🚨 What happens if Merkle Manufactory (company behind Farcaster) disappears tomorrow, along with the app and all the infrastructure they run?
   
   While [the protocol and hubs to run it are permissively licensed open source](https://github.com/farcasterxyz), the main app is closed source and much of the auxiliary infrastructure required to operate the app is also closed source (algorithmic timeline service, spam moderation, etc). There are some alternate implementations, but it's still early.
   
   On the other hand: It's not wildly expensive to operate the necessary infrastructure ($X00/mo operate a hub), largely in part because [the Farcaster network is still fairly small](https://dune.com/pixelhack/farcaster) (3% of Bluesky right now, at 870K users and 45K daily actives), so it's quite plausible that individuals, small groups, or another company could take on this burden. Plus there is a thriving culture of economic activity on Farcaster. Coinbase is integrating a client, Neynar provides paid API services for developers, a bunch of people are almost making a living through various mini-app activities.
   
   This scenario would be painful, but the proportion of Farcaster's size to the economic activity on the protocol is still promising. This may change as Farcaster grows.
   
5. **Is there something the maintainer can do that would prompt me to abandon the service/protocol altogether?**

   🚨 This one is also tricky. I suspect there is not yet enough momentum if the founders decided to wind down. I ask myself if I would care if a megacorp acquired the team along with the most popular app but committed to maintaining the same design properties... I'm not sure! More independent/open source, and economically motivated apps platforming large audiences would make me feel more confident that moderation won't get abused.

## Takeaway
### Economic balance matters
If it's far too costly to bootstrap infrastructure in a black swan event (censorship, evil billionaire, physical infrastructure failure, whatever) then the efficacy of a robust protocol is lost.

For a given player, the balance is between the cost of correcting a failure and value that is gained from recovering. If a network has a thriving economy and it is comparatively inexpensive to operate it, then we can be more assured that it will persevere.

### Scale matters
Some protocols have desirable properties when the network is small, but lose them at scale:

A few blogs federating ActivityPub remain perfectly robust from capture, but a million user Mastodon instance is a juicy point of failure. Even smaller instances are brittle and risky: perhaps the sysadmin gets burned out and wants to do something else or a security update isn't installed quickly enough.

Similarly, Farcaster seems almost sustainable at today's scale, but will it be off-balance like Bluesky if it grows to tens of millions of users?

### Interdependence matters
We can't expect a single dominant player to resist exercising powers like threats of censorship, even if the underlying protocol is resistant. If one player is platforming 99% of the network, there is nothing stopping them from abandoning the underlying protocol altogether and just replacing it with a private database instead. We must have a multi-polar plurality of interdependent players to protect us from the effects of capture.

## What's next?
I'd like to see each protocol describe what their ideal evolution and adoption looks like a year from today. If everything about the current roadmap goes right and all the relevant partners enthusiastically join forces, what does the world look like for this protocol in 2026?

---

_Thanks to [Boris](https://bmann.ca/), [Boscolo](https://boscolo.co/), and [Leeward](https://warpcast.com/leewardbound) for reviewing early drafts of this post._


[^1]: [The Mastodon fediverse has around 9.5M registered and almost 1M monthly active users across 8700 instances](https://mastodon-analytics.com/). The number of single-user instances out there must be a rounding error over the total number of users across Mastodon. I was only able to find a few dozen instances with 3 or fewer users.

[^2]: There is a fundamental assumption in ActivityPub based social networks that federated instances are trustworthy sources and custodians of data. If another instance misbehaves, [such as accidentally leaking private account posts](https://fokus.cool/2025/03/25/pixelfed-vulnerability.html), then the expected recourse is that instances will notice this and defederate from them. Unfortunately, by that point, the damage has already been done. It's a system that relies on constant vigilance and good behaviour by administrators of instances.

[^3]: Public Ledger of Credentials, the directory for mapping these credentials is currently a service operated by the Bluesky team. It's kind of like a centralized version of an ENS registry.

[^4]: One of my favourite parts about Bluesky's architecture design is that it's very layered with conceptually optional optimizations. At the very bottom sits the Personal Data Server which is itself enough to bootstrap a basic social network from other such people. Above it are the relays, which aggregate many PDS into a composite firehose. Above the relays is the AppView, which creates the timelines that are served to the app's end users. Right now the PDS implementation is coupled with the signing key, but conceptually they could be separate.

