+++
title = "urllib3 Origin Story"
date = "2025-05-21"
categories = [ "featured",]
tags = [ "History", "Open Source", "Python", "urllib3",]
+++
{{< notice title="Syndicated" class="note" >}}
This post was featured on [opensource.org/maintainers/shazow](https://opensource.org/maintainers/shazow)
{{< /notice >}}

My first big open source project was [urllib3](https://github.com/urllib3/urllib3/). Today it’s used by almost every Python user and receives about a billion downloads each month, but it started in 2007 out of necessity.

I was working at [TinEye](https://tineye.com/) (formerly known as Idée Inc.) as my first “real” job out of university, and we needed to upload billions of images to Amazon S3. I wrote a script to get processing and estimated how long it would take to finish… two months! Turns out in 2007, HTTP libraries weren’t reusing sockets or connection pooling, weren’t thread-safe, didn’t fully support multipart encoding, didn’t know about resuming or retries or redirecting, and much more that we take for granted today.

It took me about a week to write the first version of what ultimately became urllib3, along with workerpool for managing concurrent jobs in Python, and roughly one more week to do the entire S3 upload using these new tools. A month and a half ahead of schedule, and we became one of Amazon’s biggest S3 customers at the time.

I was pleased with my work. I was just months into my role at TinEye and I already had a material impact. Reflecting on this time almost two decades later, I realized that doing a good job at work was not what created the real impact. There are many people out there who are smarter and work harder who move the needle further at their jobs than I ever did.

The real impact of my work was realized when I asked my boss and co-founder of TinEye, Paul Bloore, if I could open source urllib3 under my own name with a permissive MIT license, and Paul said yes. I did not realize at the time how generous and rare this was, but I learned later after having worked with many companies who fought tooth and nail to retain and control every morsel of intellectual property they could get their hands on.

It’s one thing to write high impact code that helps ourselves or our employer, but it’s another thing to unlock it so that it can help millions of other people and organizations too.

Choosing a permissive open source license like MIT made Paul’s decision easy: There was no liability or threat to the company. TinEye had all the same rights to the code as I did or any other contributor did. In fact, Paul allowed me to continue improving it while I worked there because it benefited TinEye as much as it benefited everyone else.

Releasing urllib3 under my own name allowed me to continue maintaining and improving the project even after leaving, because it was not locked under my employer’s namespace and I felt more ownership over the project.

Hundreds of contributors started streaming in, too. Nobody loves maintaining a fork if they don’t have to, so it’s rational to report bugs upstream and supply improvements if we have them.

The growth of urllib3 since the first release in 2008 has been a complicated journey. Today, my role is more of a meta-maintainer where I support our active maintainers (thank you Seth M. Larson, Quentin Pradet, Illia Volochii!) while allowing people to transition into alumni maintainers over time as life circumstances change. It’s important to remember that while funding open source is very important and impactful ([please consider supporting urllib3](https://urllib3.readthedocs.io/en/latest/sponsors.html)), it’s not always about money. People don’t want to work on one thing their whole life, so we have to allow for transition and succession.

I learned many lessons from my first big open source project, and I continue to apply them to all of my projects since then with great success. I hope you’ll join along!
