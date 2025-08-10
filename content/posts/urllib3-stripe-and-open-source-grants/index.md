---
title: Urllib3, Stripe, and Open Source Grants
author: Andrey Petrov
date: 2014-07-07 21:01:26.163000+00:00
lastmod: 2020-05-14 12:26:54-04:00
description: ''
subtitle: Helping the future come a little sooner
image: /posts/urllib3-stripe-and-open-source-grants/images/1.png
images:
- /posts/urllib3-stripe-and-open-source-grants/images/1.png
aliases:
- /urllib3-stripe-and-open-source-grants-edb9c0e46e82
tags:
- Funding
- Open Source
- Python
- urllib3
---
### Helping the future come a little sooner

Six years ago, I built [a better Python http library](https://github.com/shazow/urllib3). It had then-novel things like connection pooling, thread-safety, multipart encoding, and more. Today, every Python user depends on it.

Maintaining something for six years on my own time is not easy, even with [a slew of coping strategies](https://medium.com/@shazow/how-to-maintain-a-successful-open-source-project-aaa2a5437d3a). A few hours here and there, every week, and slowly it chugs along—largely thanks to contributors undertaking the bigger tasks that I can’t knock off in a quick afternoon.

Last week completes my two week grant from [Stripe](https://stripe.com/) to work on urllib3 full time, and I’d like to declare that these weeks were a huge success.

### tl;dr:

*   $3,750 for two weeks of full time work at Stripe.
*   51 files changed, 1809 insertions(+), 633 deletions(-).
*   10 merged pull requests, 26 closed issues, 6 new issues.
*   [One major release](http://pypi.python.org/pypi/urllib3#changes) (v1.9).
*   ~6 months worth of progress in two weeks.
*   Tech companies: More like this, please.

## Stripe Open-Source Retreat

In April, Stripe [announced the intent to sponsor a few open source projects](https://stripe.com/blog/stripe-open-source-retreat) for 3 months of full-time work at the office.

I drafted an email proposing a 2 week arrangement for urllib3 instead. I wanted a shorter term because I didn’t want to fully relocate my life to The City, and I felt that urllib3&#39;s backlog would get the most impact out of a few weeks worth of work without hitting diminishing returns.

[Greg Brockman](https://twitter.com/thegdb) responded enthusiastically and worked out the ideal structure for me. Fast forward a couple of months, and the grant was official. We cut the $7,500/mo in half and settled on $3,750 for 2 weeks.

The rest of the experience was a dream. I arrived at Stripe and was basically treated like a new employee. [Kat Li](https://twitter.com/kitchenettekat) happily toured me around the office, introduced me to everyone, and made sure I had people to grab lunch with the first few days. “Python bindings? Talk with Andrew! Into Bitcoins? Check in with Christian!” Really great welcome experience.

Everyone treated me as a fellow Stripe. With new hires starting each week, I may as well have been.

## Progress on urllib3

First few days were all about catching up on low-hanging fruit. Pull requests that have been thoroughly reviewed, easy little bugs or feature requests. I was closing numerous issues per day, and it felt great. Having a full day allocated to _just this_ was empowering, without the distraction of attention-starved pets at home or coffeeshop patrons eyeing my prime seat next to the outlet.

Next up I took on a big feature that has been in the works for more than 8 months by the ever-patient [Kevin Burke](http://twitter.com/kevinburke): [Granular retry configuration](https://github.com/shazow/urllib3/pull/326). Not only did we have to design a sensible interface that we wouldn’t regret maintaining for the next 6 years, but also draw a line among many ambiguous questions like “is it safe to retry a request that has only been partially sent to the server?” For a few days, I learned what Kevin must have felt for months—hitting walls at every step, “why are half the tests suddenly failing? How do we persist this across hosts? There is no way to tell how much of the request we sent so far?”

Ultimately some compromises had to be made, but the feature got merged and the truck kept trucking.

All in all, 10 meaty pull requests were merged and 26 issues closed.

The big win from working full time is that it allowed me to tackle medium-large issues that otherwise I’d have to delegate to contributors. It can be weeks or months between a code review and when the contributor has a chance to iterate on the pull request. Having a contiguous work chunks allowed me to plow through what previously felt like more than six months worth of stuff.




![image](/posts/urllib3-stripe-and-open-source-grants/images/1.png#layoutTextWidth)

urllib3 commits since moving to Github



## More like this

Publishing and contributing to open source is going to continue happening regardless whether I’m getting paid for it or not, but it will be slow and unfocused. Which is fine, it’s how open source work has always worked. But it doesn’t need to be this way.

Sure, there are things [like Gittip](https://www.gittip.com/shazow/) but the gap between an amount that would “move the needle” for me and the $1 I’m tipped per week is just too big to grapple, and I’d rather focus in short concentrated bursts than a long meandering slog.

If you’re a tech company, please allocate a budget for open source grants and sponsorships. Distribute it on Gittip if you wish, or do what Stripe did and fund aggressive sprints towards some high-impact milestones.

Consider this a formal call for sponsorship: **Please help fund urllib3 development.**

If your company uses Python and benefits from urllib3 (which powers Requests, pip, and numerous other tools and libraries) and you’d like to help push the state of HTTP in Python forward, I urge you to [sponsor urllib3](https://urllib3.readthedocs.org/en/latest/#sponsorship).

[Lots of high-value open issues](https://github.com/shazow/urllib3/issues?direction=desc&amp;sort=created&amp;state=open) that could be knocked out with a few more weeks of full-time work, like [adding SOCKS proxy support](https://github.com/shazow/urllib3/pull/284).

If you’re looking for other projects to give a grant to, I would be happy to recommend some other great initiatives.

## Thanks again

A huge cloud-scale heartfelt thanks to [urllib3&#39;s many contributors](https://github.com/shazow/urllib3/blob/master/CONTRIBUTORS.txt) and to [Stripe](https://stripe.com/) for helping the future come a little sooner.
