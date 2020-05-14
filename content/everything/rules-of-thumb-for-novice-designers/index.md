+++
title = "Rules of thumb for novice designers (like myself)"
date = "2010-09-21 15:39:53 -0400"
+++

# Rules of thumb for novice designers (like myself)

My strategy as a novice designer is to keep track of some rules of thumb to reduce the probability of making bad mistakes from lack of experience. If I'm careful enough, then I can often get to a point where just a little polish from an experienced designer is what it takes to get it from the 80% to the 100% mark.

* Keep a **grid**, always align to the vertical columns, but also strive to align to the horizontal rows if possible. For web design, using a CSS framework will help with this. I like [Blueprint](http://www.blueprintcss.org/) but there are many others like [960](http://960.gs/) which is more to the point.
* Pay attention to **rhythm**: Bigger spacing interlaced with small spacing creates two rhythms instead of one. One rhythm is better than two unless there's a good reason.
* Be **consistent**. This includes the chrome, grid, colors, button types (link vs form button vs div), etc.
* Err on the side of more **spacing**. Try more first, if it looks weird then try less.
* Err on the side of **simplicity**. Question the existence of specific elements, get rid of them if they're not absolutely necessary. You're better off having your users not know how to do one obscure task than to be overwhelmed and not do any of the simple common tasks.
* **Blend colors** (use [ColorBlendy](http://colorblendy.com/) or Photoshop equivalent). Colors on top of each other (think foreground/background) look more organic if they have an element of each other within them. I typically pick a background color (e.g. light blue like #abc) and a monochromatic foreground color (e.g. dark grey, #333) and multiply. This gives me the foreground color I should use with the light blue (ie. dark blue with a light blue).
* Avoid too many lines like separators, boxes, containers. Having incoherent details adds complexity and "busy-ness" to the interface. Instead, use empty space and arrangement. This is similar to adding too much punctuation to your writing.
* Focus on one primary user flow you're optimizing for at a time. You rather the user be able to do the most important thing really easily than to be able to do everything kind of difficultly.

It is possible to build a beautiful interface that is completely unusable, and it's possible to build an utilitarian and maybe unbeautiful interface which is very usable. I would aim to do the latter until you're ready to hire a designer. It's likely that the designer will have to rethink a lot of it from scratch as that's just part of the design process, but that's about as much as you can hope for.

These design guidelines have helped me reduce the designed-by-a-programmer effect when building consumer applications.
