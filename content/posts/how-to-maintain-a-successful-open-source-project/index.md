---
title: How to maintain a successful open source project
author: Andrey Petrov
date: 2013-06-27 21:47:59.378000+00:00
lastmod: 2020-05-14 12:26:51-04:00
description: ''
subtitle: Lessons learned from five years of maintaining one of the most-used Python
  libraries.
image: /posts/how-to-maintain-a-successful-open-source-project/images/1.png
images:
- /posts/how-to-maintain-a-successful-open-source-project/images/1.png
- /posts/how-to-maintain-a-successful-open-source-project/images/2.png
- /posts/how-to-maintain-a-successful-open-source-project/images/3.png
categories:
- featured
aliases:
- /how-to-maintain-a-successful-open-source-project-aaa2a5437d3a
tags:
- Community
- Open Source
- Project Management
- Python
- urllib3
---
![image](/posts/how-to-maintain-a-successful-open-source-project/images/1.png)

### Lessons learned from five years of maintaining one of the most-used Python libraries.

I’ve published dozens of open source projects over the years, mostly in Python and JavaScript. Few are old and stable, others are new and immature, some are wildly popular with a constant stream of contributors, but most linger until one day a trickle of users suddenly discover them. This is a guide on how to traverse these waters and foster your project into something you can be proud of.

## Instructions

Every open source project needs three things: A summary of the project’s goal and approach, contribution instructions, and a license. Preferably up-front in [a README file](https://github.com/shazow/urllib3/blob/master/README.rst).

I like to include a section I call _Organization &amp; Philosophy._ This outlines how the project is structured, where everything lives, how the code is written, the kinds of tests required, and what level of performance vs simplicity to aim for. ([See unstdlib.py for an example](https://github.com/shazow/unstdlib.py#organization--philosophy).)

Then, include a _Contributing_ section which outlines how to get started with the project as a developer, and all the steps necessary to get code successfully merged into the project. Here is [an example from urllib3](https://github.com/shazow/urllib3#contributing), which has been adopted by several other projects too:
> 1. [Check for open issues](https://github.com/shazow/urllib3/issues) or open a fresh issue to start a discussion around a feature idea or a bug. There is a _Contributor Friendly_ tag for issues that should be ideal for people who are not very familiar with the codebase yet.  
> 2. Fork the [urllib3 repository on Github](https://github.com/shazow/urllib3) to start making your changes.  
> 3. Write a test which shows that the bug was fixed or that the feature works as expected.  
> 4. Send a pull request and bug the maintainer until it gets merged and published. :) Make sure to add yourself to CONTRIBUTORS.txt.

Finally, every open source project needs to have a _License_. If there is no license, then that means it’s copyrighted by the author and other people need explicit permission to use it. I default to using MIT, but you can read [Jeff Atwood’s _Pick a License, Any License_](http://www.codinghorror.com/blog/2007/04/pick-a-license-any-license.html) post for a decent summary.

## Attitude

It’s incredibly important to have a good attitude towards your users and contributors.

Occasionally a user of your library will stumble into your issue tracker and _demand_ something that is obviously silly or addressed in the documentation. What do you do?

1.  You can berate the user for rudely wasting your time.
2.  You can patiently explain what the user is misunderstanding, and once they understand the problem better, invite them to send a pull request to improve the documentation for other users in their position.

For some reason, many projects choose #1. Perhaps it’s because some of them are sick of their often-thankless job as a maintainer and could afford to lose some contributors. But let’s examine the effects.

When you berate a user, you will almost definitely lose that user, which means you also lose the possibility of that user becoming a contributor, which also means this effect could cascade to other users who witnessed the exchange, told their peers, or stumbled onto the issue years later by Googling their confusion which your documentation _still_ fails to address adequately. Or worse off, you could be wrong (it does happen) and come out of it with egg dripping down your face.

When you’re patient, polite with a user, and encourage them to contribute to the project, they can become more invested. This also cascades to the audience. Every once in a while, [you’ll facilitate a really great relationship with someone](https://twitter.com/Lukasaoz/status/345145330532225024) who makes a significant impact on the project and makes your life easier.

Maintaining the right attitude is possibly the hardest part of it—every maintainer has bad days—but civility, positivity, and progress is crucial. Not only to you and your project, but also to the community as a whole.

## Marketing

You can write the most useful beautiful code in the world and be done with it, but your contribution to society can be disproportionally amplified by allowing people to reuse it _and_ making people aware of it.




![image](/posts/how-to-maintain-a-successful-open-source-project/images/2.png#layoutTextWidth)

PyPI query for “http connection pooling”



**Finding your project.** Think of it like SEO. Pick a relevant name for it which ideally includes an important keyword. _Requests_ is a great name for an HTTP library, and _urllib3_ is less so—people often confuse it with being a standard library, but it still fares decently well when people search for things related to _urllib_ and _urllib2_, which they do often due to the disappointing state of those standard libraries.

Your project description and first paragraph of your README should be a simple summary of your project which hits all the important keywords that people search for.
> urllib3 — Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more.

Python, HTTP library, thread-safe, connection pooling, file post. This is _exactly_ what people search for when they run into a wall using Python’s standard HTTP libraries (_urllib, urllib2, httplib_). You can go into greater detail [in a subsequent _Highlights_ paragraph](https://github.com/shazow/urllib3#highlights).

Once you’ve polished up your README, make sure to generate some documentation. Publishing it on [Read the Docs](http://readthedocs.org/) is a great option. Include some code examples and recipes for easier adoption.

Finally, maintain a thorough CHANGES log and merge that into your long description. Every time a feature gets added or an important bug gets fixed, add it to your log and people will stumble on it. Also [a great place to link to when announcing a release](https://twitter.com/shazow/status/327495369338523648).

**Provide technical support for your audience.** Set up some [StackOverflow alert filters](http://stackexchange.com/filters/new), and maybe even [Google Alerts](http://www.google.com/alerts) for the odd random forum post. If you’re pushing your own software, it helps to add a disclaimer that you’re the author.

**Consider partnerships.** Most code you write will not be completely standalone. Write a plugin for a framework that could use your tool and see if they’ll link to it in their README. Couple of years ago, after chatting with Kenneth Reitz on several occasions, we decided to join forces and have _urllib3_ become the core of the very popular _Requests_ library. At this point, _urllib3_ was already decently well-known, but far behind the incumbent _httplib2._ When Kenneth and I joined forces, both of our projects flourished beyond our expectations. It was important to establish clear roles and boundaries in our partnership, and it helped that our interactions grew into a strong friendship and mutual respect. As a bonus, we have healthy cross-pollination of contributors between the two projects. Everybody won.

**Give it time.** My more popular projects took at least a year to become known. This is the lazy version of marketing, but if you’ve done everything else in this article correctly, then _they will come._ Or if you’re impatient, then start hustling, attending meetups, writing blog posts, buying ads, and bribing the quasi-celebrities in your community to rave about you.

## Community

It’s very hard to do everything alone, especially as more people come to expect things from you.

**Ask for pull requests at every opportunity.** Sometimes one rogue pull request could evolve into dozens of collaborations in the future. Also, I try to ask the opinion of other members in the community whenever possible. Often they’ll know more about some RFC I never heard of, or at least have the time and initiative to research the topic further.

**Don’t be afraid to ask for help.** I try to dedicate a few hours per week on open source work, but sometimes my schedule slips or I forget about a pull request. I encourage people to get involved and ping me when I need to get involved more. In more complicated branches, it helps to ask for a volunteer sub-maintainter to handle the issue until it’s ready to be considered for merging.

**Automate as much as you can.** I don’t think I could have made it this far without unit tests. Last year, [we instituted a 100% test coverage rule](https://github.com/shazow/urllib3/pull/163) for _urllib3_ which made the project much easier to maintain. Any feature must be tested or else it can be removed without notice. This means every pull request must be completely tested before it is merged.




![image](/posts/how-to-maintain-a-successful-open-source-project/images/3.png#layoutTextWidth)

Continuous Integration on Github with Travis CI



What’s better than unit tests? Automated unit tests! We use [Travis CI](https://travis-ci.org/) with Github linking so that every pull request automatically gets all tests run on every platform we support. This removes me from needing to manually pull and run the tests, just to reply with “please fix the tests.” This feature is free for open source projects, and I _highly_ recommend it for any project that receives regular pull requests.

**Maintain** [**a list of contributors**](https://github.com/shazow/urllib3/blob/master/CONTRIBUTORS.txt)**.** Remind and invite contributors to add themselves to the list, even if they just did something small. A few more bytes in the repository doesn’t cost you anything, and the pride they get from being recognized is priceless.

## Have fun

Truth be told, it has been years since I’ve done HTTP-related things which needed _urllib3_. But I continue to maintain it because I like the community and I feel a lot of pride in the project.

When you stop having fun, it may be a good time to hand the project off to somebody else. Find someone who truly depends on the project and cares about it more than you do. Add them as a full-privilege contributor or point to their fork as the official source. [Sometimes it works out alright](https://github.com/sstoiana/s3funnel). Other times the new maintainer drops out like you did, and you might need to pick up the slack again.

Possibly most importantly, **don’t be afraid.** Do your best and take pride in your work. Some people will appreciate it, other people might not. If you try to do the things in this post, then at the very least I will appreciate you for positively and effectively contributing to the Open Source community.

**Thank you for sharing your code.**
