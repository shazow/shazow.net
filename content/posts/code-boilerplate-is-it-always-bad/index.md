---
title: 'Code boilerplate: Is it always bad?'
author: Andrey Petrov
date: 2017-05-01 16:47:49.595000+00:00
lastmod: 2020-05-14 12:26:58-04:00
description: ''
subtitle: A case study between Python and Go.
tags:
- Golang
- Philosophy
- Programming
- Python
- Software Design
categories:
- Featured
aliases:
- /code-boilerplate-is-it-always-bad-934827efcfc7
---
> A case study between Python and Go.

In Go, a common complaint from newly-minted gophers who come from another language is the error handling pattern:

```
result, err := DoSomething()
if err != nil {
    return nil, err
}
```

```
another, err := SomethingElse(result)
if err != nil {
    return nil, err
}
```

```
// We can be a bit more terse if we don't need to save any
// variables outside of the if-scope:
if err := MoreWork(another); err != nil {
    return nil, err
}
...
```


Any time we write similar-looking code over and over, that’s considered _boilerplate_.

A key principle of programming that we all learn is [Don’t Repeat Yourself](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) (DRY). In a way, that’s the entire point of programming: To automate a task that we keep repeating manually. Who wants to keep artisanally sorting text files each morning when we could have a program do it for us faster and more reliably? Similarly, why should we keep writing some code pattern over and over when we should be able to abstract it away into some terser syntax?

## Proportional work

After writing Python code for over a decade and becoming quite proficient at it, I’d take any opportunity to write terse code. It feels good to be clever and [more code means more bugs](https://www.mayerdan.com/ruby/2012/11/11/bugs-per-line-of-code-ratio), right?

One thing I didn’t notice until I switched to writing Go as my primary language: The _proportionality of work_ done in Python code is hugely variable.

**What do I mean by proportionality?** Consider these two lines:

```
a = some_variable + 42
b = sum((j if j % 2 else 0) for (j, k) in results if k)
```


The second line does _a lot_ more work than the first line. The first line is a simple integer addition, while the second line has a loop and a variable split and two conditional branches and an accumulator on a generator.

In Python (and many other languages), it’s very easy to unintentionally hide _tons_ of work in a single line of built-in syntax. Some lines do almost no work, other lines do a moderate amount of work, other lines do what I’d describe is tens of lines worth of work—a lot of work. It varies a lot, even in beginner code.

In Go, I’ve found that this variability is much more diminished. A loop is always a loop, an error check is always an error check (rather than implicit exception propagation), a logic branch is always a branch.

This is the most reasonably-terse way I could write the above in Go:

```
b := 0
for _, r := range results {
    j, k := r[0], r[1]
    if !k || j % 2 == 0 {
        continue
    }
    b += j
}
```


Is this good? I believe it is. I believe this code is more proportional to the complexity of the work that it’s doing. It’s also possible to write Python in a similar level of proportionality, why don’t I?

When reading proportional code, it’s easier to notice where the interesting bits are. It’s easier to notice where the bulk of the work is being done, and focus our review on that. Maybe this is subjective but I posit that the code’s _shape_ looks more like what it is.

We can continue to argue that it’s easier to _understand_ what the work is actually doing, but that’s not a point I want to make. Instead, I want to make a different point: It’s easier to tweak what the code is doing.

## Opportunity for correction

After writing _a lot_ of code in Python, and writing a moderate amount of code in Go, I noticed an interesting phenomenon: I tweak code very differently in Go.

Programming is a very iterative process. As we implement our solution, our mental model of the problem evolves. We often go back and change some assumptions, tweak our data structures, remove obsolete crutches and stubs, make error handling more robust, and so on.

I noticed that when I wrote Python code, I would often _go out of my way_ to avoid messing up a beautiful terse set of lines by moving logic to places other than where it might naturally belong. I would unconsciously move complexity from where it belongs to a tangential place that made the tweak more complex than it should have been.

For example: Rather than refactoring a try/except block into separate appropriately-layered method calls or multiple try/except phases, I’d introduce a variable to maintain error state that gets handled in a finally block. ([An example of this pattern in urllib3](https://github.com/shazow/urllib3/blob/1f53dcaafa0adae65e0902b5a419dd244e853a91/urllib3/connectionpool.py#L656-L668).)

When I write Go, I noticed that my tweaks almost always go exactly where they naturally belong. **My boilerplate doesn’t stay untouched!**

For example: I’ll usually write lots of Go boilerplate in my first iteration, but by the time I look at my code closer to release I notice that it’s no longer looking like boilerplate. By the time I’m done—adding more recovery scenarios, better logging, augmenting errors with more context, handle more edge cases—most of my boilerplate gets a lot more interesting. I did not realize that good boilerplate could be fertile ground for iteration.

When a friend was reading through the [source code for ssh-chat](https://github.com/shazow/ssh-chat), he was surprised that I implemented my own _Set_ type. I explained that while Go doesn’t have a built-in _Set,_ it’s just a few lines of boilerplate to make your own on top of a _map_. In fact, I noticed that [my version of Set](https://godoc.org/github.com/shazow/ssh-chat/set) evolved to be fairly specific to how it was being used. In retrospect, I’m glad that I was tweaking my own implementation iteratively rather than spending time working around whichever limitations a generic library might have had.

I realize now that disproportional code makes me unintentionally dance _around_ it like tiny black holes of complexity. Having _proportional_ boilerplate helps balance out the ease of modifying it with the amount of work that code is actually doing—whether it’s error handling or looping or whatever else.

## Proportional code creates less complexity

I am not claiming that more lines of proportional code is less buggy than fewer lines of disproportional code.

I am not claiming that all boilerplate is good: boilerplate can be disproportional in the other direction, too—where it’s doing far _less_ work than we’d expect.

My claim is: For non-trivial projects, **proportional code is not cumulatively more lines than disproportional code.**

When we write disproportional code (or code that varies a lot in proportionality), we shift natural complexity into unnatural places which is an unexpected sacrifice. Our beautiful one-liners are short indeed, but the rest of the project suffers in other places to pay off that purchase.

By the time we’re done iterating and fleshing out our project, we might not be winning as much as we’re losing from getting rid of boilerplate indiscriminately. _Proportional_ boilerplate can help us iterate in a less constrained way.
