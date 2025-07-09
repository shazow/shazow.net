---
title: "Permissive vs Copyleft Open Source"
date: 2025-07-09
tags: ["Open Source"]
categories: ["Featured"]
aliases: []
---

The premise of copyleft licenses is attractive: Create more open source!

With permissive licenses, someone can take the code and make proprietary modifications to it and sell it to other people without releasing the modifications. We want people to publish their improvements, right?

With copyleft, we can force people to publish their improvements to copyleft code. Businesses will want to use our code because creating it was so much work in the first place. We need copyleft if we want more contributors, more open source, more code re-use, more freedom.

Right?

Wrong.

In this post, I break down all the ways copyleft licenses fail to achieve their stated goals, and explain why permissive licenses succeed where copyleft fails.

## Background

(Skip this if you already know the difference between permissive and copyleft licenses.)

Open source licenses were created for important reasons: To protect the author, to protect the contributors, and to protect the consumers. This is achieved through codifying rights regarding redistribution, derived works, discrimination, and disclaimer of liability/warranty. Perhaps most importantly, an open source license is designed around allowing us to "fork" a project while retaining all the rights in the license.[^4]

When picking an open source license, there's two camps: Permissive licenses (like BSD, MIT, Apache-2.0) and copyleft licenses (like MPL, GPL, AGPL).

Permissive licenses give the author the same rights as the contributors and consumers. Everyone can do anything as long as the license is not removed from where it is. If you want to use permissively-licensed code in a proprietary program, go wild.

Copyleft licenses are different--they were created as an exploit of our intellectual property and copyright system, a kind of "virus" to combat our proprietary rights-reserved-by-default legal system. With copyleft licenses, derivative work is required to perpetuate the same license. The boundary of derivation varies between licenses. For example: MPL constrains at the "file" level, GPL is at the binary distribution level which can be bypassed with dynamic linking, AGPL is at the "network" level specifically to target SaaS usage.

There are many downstream repercussions of these details that I'll discuss below.

## Copyleft is asymmetric

(Please bear with me as I take a brief detour to explain this not-very-intuitive point that comes up again and again. It turns out the asymmetry of copyleft is a critical flaw relevant in many scenarios.)

In the construct of our society's intellectual property law[^6], the author retains copyright by default. If I write some code and don't explicitly release my rights to it, then it is considered proprietary and owned by me by default. _[I don't even need to write "all rights reserved"!](https://www.copyright.gov/help/faq/faq-general.html)_

Having copyright over my code gives me the right to license it however I want. I can keep it proprietary, or I can make a custom contract to sell to a customer or another publisher, or I can release it under a common license template like an open source license.

When I commit code to a code repository with some open source license, I am consenting to include my code under the project license (which usually lives in the root of the repository and applies to the whole thing unless said otherwise). **But because I still own the copyright to my work, I can _also_ release the same code under a different license in a different repository.**

This means as an author of some copyleft code, I have special rights that my users don't have: I am allowed to use my code for proprietary purposes, but my users are not.[^3]

Permissive licenses don't have this asymmetry by virtue of giving everyone the right to use the code for proprietary purposes.

Okay, why is this important?

## Custom-licensed copyleft code is a liability

Some projects choose copyleft licenses as a way to convince businesses to pay for a custom license.

On paper, this sounds rational: The code is available to review and even prototype against, but deploying to customers may cross the viral copyleft boundary and a business would choose to pay for a custom license from the maintainer to avoid relicensing their entire product.

For every dependency that a business pays for a custom license, it adopts a liability and creates another point of failure. Each dependency has the power to rug the business: They can choose not to renew the license next year, or they can choose to pivot the project in an incompatible direction, or they can refactor in a way that increases the copyleft boundary.

Most importantly, the business has no recourse![^5]

Recall that with permissive licenses, we all have the same rights: If a maintainer does something that doesn't work for me, I can simply fork and continue using the code as I was before. I don't lose any rights even if I was depending on a custom license before.

**It is safer for a business to do a custom license deal with a permissively licensed project!**

With copyleft and a custom license, I don't have the protection of retaining my rights if something goes awry. If my business model or infrastructure architecture is incompatible with the copyleft nature of the dependency, then my entire business is at risk.

Now imagine how much worse this could be at scale: Naively, it seems like a great idea "if all dependencies were copyleft and we automated licensing them" then these liabilities would compound exponentially.
## Code is not a whole

There is a common assumption from copyleft-licensed projects that the consumer will use the project as a whole. This is incorrect on two fronts:
1. It's very common for programmers to get stuck on a problem, see how another project solves it, and adopt their solution if the license permits. In many cases, this can be as small as a 20 line function that has a clever optimization. This is how much progress is made in software, rather than always reinventing the wheel poorly.
2. When a consumer uses a project wholesale, they're not depending on 100% of the code in the repository. For example, I may only be using 20% of the features a project implements, and I may never run the unit tests, or validate the formal verification, or access the modding interfaces, etc. **This is important because it represents the "replacement value" of a project to the consumer**, which we'll discuss next.
## Copyleft licenses create more duplicated effort

The stated goal of copyleft is to create more copyleft source code, but in practice it does the opposite: Copyleft creates more proprietary code.

When a business finds a dependency that they'd like to use, but notice that it's copyleft-licensed, the business has three choices:
1. Open source and relicense all internal code that would be impacted by integrating this dependency.[^7]
2. Rewrite the dependency inhouse. (Or find another permissively licensed substitute, if such exists.)
3. Request a custom license from the copyright holders, see: [Custom-licensed copyleft code is a liability](#custom-licensed-copyleft-code-is-a-liability). (This is also logistically difficult if the project has many contributors without a consolidated copyright holder, as each contributor would need to consent.)

I've been working as an open source maintainer and contributor 20+ years and not a single time in my life have I seen a business willingly[^1] make public and relicense their internal code to comply with a dependency they were considering using. Not once!

On the other hand, I've personally witnessed _many_ cases where a business would do a clean room rewrite of copyleft-encumbered code to avoid touching it. In fact, I've done work like this myself on several occasions and have been lucky to convince my employers to allow me to do it under a permissive MIT license. By default, rewrites stay locked up in an internal repository that no one else gets to benefit from.[^8]

Why rewrite the code? Because it's **wildly easier** to rewrite code after the design boundaries have been established.

If you have a mature codebase that your team spent a person-year building, ask them: "Given everything we've learned, how long would it take for us to rewrite this in a different language?" The answer to this is often around 10× faster. Much of the time spent building the first version is finding and avoiding all of the "wrong decisions", iterating with user feedback, reframing features to make more holistic sense, testing them, polishing them, arguing over button colours, etc.[^9]

Second, consider the "replacement value" of the project (from the previous section). If we only need 20% of the functionality, we don't need to rewrite 100% of the code.

If you spent 52 weeks building 100% of the functionality and supporting infrastructure, and I just need 20% of it that I can rewrite 10× faster... that's just a couple weeks of work![^2]

Why would a business pay for an existential liability that when they could just have a half-decent programmer do an in-house rewrite of the relevant component in two weeks?

## Permissive licenses create more open source

While copyleft claims (but fails) to create more open source code, _permissive_ code actually achieves this by default.

When a business uses permissively licensed code and runs into a bug or needs to patch an improvement, they have two choices:
1. Maintain an internal downstream fork with modifications, dealing with rebase conflicts with every update.
2. Send a pull request upstream with the modifications, and have the community maintain it for free.

No one wants to maintain and rebase an internal fork, it's frustrating and grueling work with negligible benefits unless this one modification is the very core differentiator of your business--and this is extremely rare, especially considering most software businesses have hundreds or thousands of dependencies.

By default, businesses tend to contribute more to permissive open source code in their own self-interest.

## Copyleft reduces the contributor pool

Most software businesses outright ban their employees from touching strong copyleft licenses like AGPL. For example, [Google's document on allowable licenses for third party dependencies](https://opensource.google/documentation/reference/thirdparty/licenses#banned).

Some proponents of copyleft claim that this is a feature, not a bug: Why should we benefit businesses at all, when we could only benefit individuals?

Unfortunately, this exclusion is counterproductive because nearly every programmer in our capitalist society is employed by such a business. At minimum, these projects miss out from people who would upstream fixes and improvements during work hours, but also many employment agreements have much influence over what people do in their personal time (if not practically then at least emotionally).

And it's not just businesses!

I am an independent open source developer who is passionate about permissively licensed code (could you have guessed?) and I create a lot of it. **I will not even read AGPL code** because I don't want to risk possibly contaminating some of my many other projects.

## Copyleft nuances and complexity

I can write Python that has a copyleft GPL dependency without relicensing my project to match, but I can't write Go that has a GPL dependency without relicensing. Why?

Python is interpreted and the code is linked dynamically, whereas Go produces a statically linked binary so the copyleft "infects" the rest of the code.

Does anyone actually understand these implications and how they vary across languages? Of course not!

But wait, what if I split out the GPL dependency into a dynamically linked c-shared object? Oh, that's totally fine.

What about other copyleft licenses like LGPL? MPL? AGPL?

What if I wrap an AGPL dependency in a network-isolated container which batch-processes input from a proprietary component in my system? That's totally fine.

Did we really improve anything or are we just asking people to create complex infrastructure and deployment workarounds?

I liked this quote from [David Chisnall on lobste.rs](https://lobste.rs/s/ezfkac/why_we_picked_agpl#c_7436dr) (the rest is worth reading too):
> [...] And this is reason #3742648 why I don’t contribute to AGPL things: They place a compliance burden on good-faith actors that are trivial to bypass for bad-faith actors.

## Permissive licenses create public goods
While copyleft licenses have several exclusionary clauses (e.g. can't use this code if you're statically linking against other code that has a different license), permissive licenses do not. Copyleft licenses give special rights to the author, permissive licenses do not. Strong copyleft licenses are practically banned from large subsets of consumers and contributors (we'll debate if this is justifiable), permissive licenses are not.

Permissively licensed code is a better fit under the "both non-excludable and non-rivalrous" definition of public goods.

## Copyleft fails to prevent corporate capture
A common complaint is that Amazon AWS exploits open source by profiting from it without sufficiently contributing back, and that the only solution is strong copyleft like AGPL.

Until 2018, MongoDB was copyleft AGPL licensed, and Amazon AWS happily provided a hosted service for MongoDB. MongoDB didn't like that Amazon was profiting from their work, so on October 2018, MongoDB changed their license to a commercial source-available license called SSPL--specifically to exclude Amazon being able to use it this way. By January 2019, just 2.5 months later, Amazon built and released a **proprietary** API-compatible version called DocumentDB.

MongoDB was being developed since 2009, for 9 years. Did it take Amazon 9 years to rewrite the "replacement value" of their service? No, it took 2.5 months.

Did AGPL save MongoDB? No.

**Did copyleft AGPL create more open source code?** No, Amazon did a proprietary internal full rewrite and never published the code as open source.

Did relicensing to an even more restrictive license force Amazon to give MongoDB more money? No.

This has happened again and again. Elasticsearch relicensed from permissive Apache-2.0 to commercial SSPL in 2021, which resulted in the previous Apache-2.0 version being forked and maintained as OpenSearch. Amazon contributed code to the permissively licensed version, but Elasticsearch did not succeed at extracting more money from Amazon by using a more restrictive license. In 2024, Elasticsearch changed their mind and [relicensed to copyleft AGPL](https://www.elastic.co/blog/elasticsearch-is-open-source-again), but AWS continues to use and contribute to OpenSearch.

**Did permissive Apache-2.0 create more open source code? YES!** Unlike the copyleft AGPL example, Amazon forked the permissively-licensed project and continued to maintain it in public, allowing everyone else to benefit too.

In 2024, Redis (permissively licensed under BSD) relicensed to a Source Available license, same story: Redis failed to extract more money from customers, instead a permissive community fork continued under Valkey. In 2025, Redis changed their mind and [relicensed to copyleft AGPL](https://redis.io/blog/agplv3/)! What happened? It's still early, but so far Valkey (BSD) continues to thrive, Redis continues to stagnate.

## How do we make businesses contribute to open source?

I get this question a lot, and my general answer is: They already do, just not exactly in the way we might want.

When we imagine businesses contributing to open source, we imagine them sending money to maintainers of dependencies they use. While this does happen, it's very rare.

What's less rare is businesses increasingly choose to release parts of their code as open source code, and contribute improvements to other projects. While this doesn't help overburdened maintainers, it is otherwise a good thing!

I believe the lowest hanging fruit is to encourage businesses to get _more_ involved with creating and maintaining open source code by empowering their employees to do so.

The best way for maintainers to grow funding from businesses who use their software is to establish relationship with their "customers" and find services that are valuable for these customers. For example, funding to work on features that are important for the customers, or funding for an annual support retainer.

## What license should I use?

If you're optimizing for adoption and impact, I suggest the most permissive license that is popular in your community. Usually that's MIT or Apache-2.0.

If you're trying to create a self-sustaining silo of code that doesn't get reused outside of a comparatively small ecosystem, then copyleft licenses achieve this.

If you're trying to exclude groups from using your code, like for-profit businesses or the military industrial complex or people with disagreeable political alignments, then open source is probably not for you because that would violate the [Open Source Definition](https://opensource.org/osd).

## Conclusion

In the past couple of decades, permissive licenses (like BSD, MIT, Apache-2.0) have succeeded at creating more open source code, more collaboration and mutual participation from businesses, more code-reuse, and more public goods.

This wasn't always true: In the 90s, copyleft was king. Businesses were very skeptical of open source and security through obscurity was a popular mentality. In many ways, businesses considered themselves at war with open source. [Recall this 2001 interview quote from Steve Ballmer (Microsoft CEO at the time)](https://web.archive.org/web/20011211130654/http://www.suntimes.com/output/tech/cst-fin-micro01.html):

> Q: Do you view Linux and the open-source movement as a threat to Microsoft?
>
> A: Yeah. It's good competition. It will force us to be innovative. It will force us to justify the prices and value that we deliver. And that's only healthy. The only thing we have a problem with is when the government funds open-source work. Government funding should be for work that is available to everybody. **Open source is not available to commercial companies. The way the license is written, if you use any open-source software, you have to make the rest of your software open source. If the government wants to put something in the public domain, it should. Linux is not in the public domain. Linux is a cancer that attaches itself in an intellectual property sense to everything it touches. That's the way that the license works.**

Of course this was a misinformed and naive view, but the seed of the concern was real as discussed in the [Custom-licensed copyleft code is a liability](#custom-licensed-copyleft-code-is-a-liability) section.

In 2025, the landscape is very different. Businesses have found a mutually-aligned interest with permissive open source, and the ecosystem has exploded thanks to that.

Is this the best we can do? I hope not!

Let's continue to find more [Schelling points](https://en.wikipedia.org/wiki/Focal_point_(game_theory)) of collaboration and aligned interests, so that the public can benefit from a larger portion of private effort.


[^1]: There were several cases where businesses "accidentally" used copyleft code and were later forced to relicense parts of their proprietary code to comply retroactively, but this was a mistake insofar that they would not have made this choice if they knew of the impending outcome. For example: [Linksys](https://en.wikipedia.org/wiki/Free_Software_Foundation,_Inc._v._Cisco_Systems,_Inc.)

[^2]: Yes these numbers are made up and sound a little wild, but they're closer to the truth in the vast majority of cases than is comfortable to admit. There are of course examples of copyleft projects like the Linux kernel which contain tens of thousands of person-years of effort, such that even a 100× improvement is still very costly--perhaps this was a lesson that Google Fuchsia learned.

[^3]: The special right of the copyright holder is made even more dangerous when a project requires an IP assignment agreement (also known as a Contributor License Agreement). These agreements assign all the copyright to a single owner (often the maintainer or a holding entity), so that they can unilaterally relicense the work without requiring individual consent from every contributor.

    OSS licenses were designed to leverage the logistic hurdle of requiring consent of all contributors.

[^4]: The Open Source Initiative maintains [The Open Source Definition](https://opensource.org/osd) and [the sets of licenses which comply with it](https://opensource.org/licenses).

[^5]: We can imagine a very specific contract that outlines all the ways the project codebase must continue to be compatible with the business's needs for a long duration, but is this actually plausible? We don't know what we don't know, both businesses and open source projects continually evolve. Plus, it's incredibly hard to negotiate bespoke agreements between every combinatorial pair of business and dependency.

[^6]: Our intellectual property construct goes back all the way to the [Berne Convention](https://en.wikipedia.org/wiki/Berne_Convention), first adopted in 1886. Today, 181 countries have ratified it.

[^7]: I cannot understate how expensive it is to take a private legacy codebase and make it public. When a codebase is private, every choice is made with that context: Secrets are littered in the commit history, assumptions are hardcoded, proprietary business details are exposed.

    The longer we wait, the more expensive it gets. All of those micro-decisions add up, sometimes to the point where it's cheaper to just rewrite the whole thing in public from scratch.

[^8]: Example: When Amazon AWS rewrote their MongoDB (AGPL) service as DocumentDB (internal/proprietary). Discussed more below in [Copyleft fails to prevent corporate capture](#copyleft-fails-to-prevent-corporate-capture).

[^9]: It was 10× faster before AI-assisted tooling, who knows how much faster it will be in the future! It's certainly not getting slower. Again, AWS DocumentDB was created as a replacement for MongoDB in just 2.5 months, and this was in 2019.

