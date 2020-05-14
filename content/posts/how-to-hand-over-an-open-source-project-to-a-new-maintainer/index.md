---
title: "How to hand over an Open Source project to a new maintainer"
author: "Andrey Petrov"
date: 2018-02-09T13:16:01.563Z
lastmod: 2020-05-14T12:27:00-04:00

description: ""

subtitle: "After maintaining a project for many years, maybe you’re no longer using it yourself? Or maybe you’re burned out from the grind? Or you…"
tags:
 - Open Source
 - Software Development
 - Community
 - Github




aliases:
    - "/how-to-hand-over-an-open-source-project-to-a-new-maintainer-db433aaf57e8"

---

After maintaining a project for many years, maybe you’re no longer using it yourself? Or maybe you’re burned out from the grind? Or you can’t afford to allocate time to it? Maybe it’s time to pass it on to somebody else.

I feel like there is more to learn from failure stories than success stories, so let’s start with those.

### What not to do

I’ve handed over several projects before, and some didn’t go as well as I’d hoped. Here are some mistakes I’ve made:

#### 1. Don’t transfer the project to the new maintainer’s namespace.
> Once upon a time, I had given up developing _s3funnel_, a multi-threaded S3 client. I just wasn’t using S3 anymore, and I had no desire or need to support new features. I announced that I’m looking for new maintainers, and a contributor volunteered. Great! I transferred the project to his ownership, Github kindly permanently redirected, and the project moved along without me.> Couple years later, the new maintainer also gave up on _s3funnel_ and largely disappeared. I don’t blame him. It wasn’t even his project—it wasn’t his _baby_. A bunch of pull requests piled up, unanswered. I wanted to put in a few hours to merge them, but I couldn’t. This was my mistake.

**Don’t expect the new maintainer to stick around longer than you did.** If the maintainer leaves without finding a replacement, you need to be able to take back the project. You can add new maintainers as collaborators on your repository or move the repository to an organization namespace which can have teams added and removed over time.

#### 2. Don’t micromanage the new maintainer.

I don’t have an anecdote here, but really: The entire point of handing over a project is to release yourself from its burden. Let go, for your own sake.

Similarly, as a new maintainer of someone else’s project: Maybe they’re doing it because they want the responsibility and experience of managing other people—being the boss. They’re certainly not doing it to gain yet another boss. Let go, for your maintainer’s sake.

This doesn’t mean that you need to disassociate yourself entirely, but it does mean you need to defer to the new maintainer’s authority. You are just another contributor now, not the lead. **Respect the new leader and empower them.** I promise that a maintainer who feels respected and empowered will do better and stick around longer.

#### 3. Don’t expect more from the new maintainer than they’re giving.

Unless you’re paying and employing the new maintainer to take over as part of their job description, they don’t owe you anything.

The new maintainer has no obligation to stick around forever. It’s not ideal, but it’s important to respect that the new maintainer is well within their rights to disappear.

Check in once in a while and make sure things are still going okay and their lifestyle permits them to continue as the maintainer. Maintaining open source is hard work, support them if they need to give back the torch/albatross.

### How to do it right

So far, [urllib3](https://github.com/shazow/urllib3) has enjoyed [two successful maintainer transitions](https://github.com/shazow/urllib3/issues?q=label%3AAnnouncement). Here’s what worked well:

#### Finding a new lead maintainer

It can be tempting to put out a public call for new maintainers, but that’s best left as a last resort. The goal is to find someone who is already familiar with the codebase and has shown some commitment to working on it over time. We want to avoid choosing a maintainer who didn’t know what they were getting into and have them abandon the project a week later, forcing us to go through the whole process again.

I’ve found good results in reaching out to specific people who would be good candidates. In both cases for _urllib3_, the new lead maintainers were long time contributors to the project. Even better if they’re already co-maintainers. **Even double-better if their employer allows them to maintain the project as part of their job.** It doesn’t hurt to ask, and it helps _a lot_.

#### Foster a team of co-maintainers

[Additional maintainers](https://github.com/shazow/urllib3#maintainers) are there to help the lead maintainer. They’re the go-to for handling trivial issues, doing code reviews, or taking random tasks when time permits. When it’s time to choose a new lead maintainer, the co-maintainers are a great place to start from. The co-maintainers are there to help with the transition, too. It’s less scary when you’re not alone.

#### Make an explicit announcement for the transition

> [](https://twitter.com/shazow/status/939957174155046913)


Putting everything in [a project issue labelled _Announcement_](https://github.com/shazow/urllib3/issues?q=label%3AAnnouncement) and linking to it everywhere for discussion and transparency has been great.

#### Have a checklist for what that needs to be done

I like keeping this checklist public, alongside the announcement, because it helps raise awareness that this person is now getting access to all these things for the project.

*   Announcement post
*   Update README and documentation
*   Repository collaborator/admin access (e.g. Github)
*   Release publishing access (e.g. PyPi)
*   Docs management access (e.g. ReadTheDocs)
*   Continuous Integration admin access (e.g. TravisCI)
*   Signing key access, or publish the new signing key (e.g. for GPG signed releases)
*   Confirm that the release process is documented and achievable by the new maintainer
*   Subscribe the new maintainer to the relevant StackOverflow tags

Switching to a new maintainer hands over a lot of trust to this person. That’s the nature of the gig. More transparency about the powers that this role comes with helps the users plan their security models accordingly.

### But for now…

I feel like we all hope that our work will outlive us, in one way or another. Handing over the reins of a project is a natural part of a successful project, and something that will become more common as the open source community continues to mature.

When the time comes, let’s do it right._Thanks for reading my draft and providing feedback:  
_[_Nadia Eghbal_](https://medium.com/u/38ef5f0ee2b8)_,_ [_Jesse Shapiro_](https://medium.com/u/3629cca9d86)_,_ [_Cory Benfield_](https://medium.com/u/54cc53487bf9)
