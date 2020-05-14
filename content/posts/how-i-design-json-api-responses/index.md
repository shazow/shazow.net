---
title: "How I design JSON API responses"
author: "Andrey Petrov"
date: 2015-11-17T21:34:42.923Z
lastmod: 2020-05-14T12:26:55-04:00
tags:
 - API
 - JSON
 - REST Api

aliases:
    - "/how-i-design-json-api-responses-71900f00f2db"

---

The goal of designing a public API response layout is to balance ease of use for consumers with commitment of stability from the provider. We can bolt on all kinds of crazy metadata and embedded values that we’ll regret having to maintain years later, like complex pagination schemes that don’t scale for evolving domain spaces or when we’re finally _Web Scale_ and wasting millions on extra bandwidth from that emoji soup we thought would be hilarious to wrap each entry with.

Let’s keep it simple and direct.

```
{
    "status": "ok",
    "code": 200,
    "messages": [],
    "result": {
        "user": {
            "id": 123,
            "name": "shazow"
        }
    }
}
```


### result

The hard-coded name of “result” could be anything—like _payload_ or _response_ or whatever sounds sensible—but the keys inside are important. Each key helps us double-check our expectations of what is inside:

```
data["result"]["user"] == (a user object)
data["result"]["users"] == (a list of user objects)
data["result"]["post"] == (a post object)
```


This distinction is a valuable tool for the consumer. If I’m skimming the docs and expecting some API endpoint to return a _user_ object but instead it returns a _member_ object which is similar but subtly different, then trying to access the _user_ key will reveal the problem immediately.

Imagine an alternate scenario, where we return each type inlined in the result:

```
data["result"] == (a user object)
data["result"] == (a list of user objects)
data["result"] == (a post object)
```


My code might seem like it’s working but it might seem like it by accident. I might treat a _post_ id as a _user_ id and get all kinds of weird results without realizing why. Maybe the inline result includes a handy “type” field, but who knows if I’ll bother checking against it every single time.

Bonus feature: Having the result objects keyed by their types allows you to return multiple things in a single result. Maybe it’s most efficient for the consumer to return a post _and_ a user in the same response? It’s nice to keep our options open.

### status

As a consumer, when I get a response from this API, first thing I do is check the status value. Is it “ok”? Great, carry on as expected. Is it an “error”? I’ll need to handle it.

This key only has two possible values, so it’s nice and simple for the consumer’s code.

### code

When I get an error, this is where I’ll go to differentiate it and maybe handle it programmatically. We can use HTTP-like codes, or just incremental codes, or whatever makes us happy as long as it’s well-documented. Errors should be obvious and/or well-documented with what each endpoint could return and how we should handle it.

Why not just use HTTP response codes instead of embedding a _code_ value in our JSON? Three reasons:

1.  Consumers don’t like checking response codes, it’s a lazy thing. All of my code is already dealing with JSON values so why not one more. Also some HTTP libraries make it somewhat difficult to get at the value.
2.  HTTP response codes are unreliable. Some poorly-implemented proxy code could override the code, or your cache will kick in and serve that one buggy response which might be inconsistent with the values inside.
3.  No reason to tightly couple with your transport protocol. By all means, mirror your codes in HTTP but if you include it in the encoded response then you can just as easily switch the API to straight-up TCP or even something crazy like [an SSH RPC API](https://medium.com/@shazow/ssh-how-does-it-even-9e43586e4ffc)!

We could skip the _status_ field by saying “code 200 is a success” or similar, but I like the binary nature of _status._ The API is less intimidating if I don’t need to learn about what which codes mean until I’m diving into actually handling specific errors.

### messages

This one is purely for debugging or informational purposes. If there’s an error, then we’ll get some messages here telling us what went wrong—along the lines of _“user id does not exist: 4”_

We could add some user-friendly success messages in there, too—like _“post created: My JSON API response.”_ I’ll often use the same API for my frontend client-side handlers as I do for backend stuff, so I can flash these messages as they appear.

Some APIs call this field _errors_, but I like that it can be used for non-errors.

### Extra stuff?

*   It can be fun to include a _stats_ object with performance information.
*   A _pretty_ request parameter should indent our JSON and sort the keys, very handy for being human-readable and for comparing test output in a deterministic way.
*   Pagination can be done with something like data[“result”][“offset”] and the offset value passed back in with the next query. This can be an arbitrary token or a page number. Not all responses make sense to paginate, so I prefer to include it as part of the result when it makes sense rather than making it a root-level value that is often ignored.

## Patterns Avoided

There are lots of complicated standards that have evolved, like [jsonapi.org](http://jsonapi.org) and [HATEOAS](https://en.wikipedia.org/wiki/HATEOAS) (remember SOAP?). Some of those ideas can be safely avoided, especially if we’re not building ENTERPRISE SOFTWARE (TM).

### api links

```
    ...
    "user": {
        "id": "1",
        "name": "shazow",
        "links": {
            "self": "https://example.com/api/v1/user/1.json",
            "posts": "https://example.com/api/v1/user/1/posts.json"
        }
    }
```


Some APIs include a pre-generated API request URLs, such as for pagination or querying sub-relationships. This never made any sense to me. To get to this response, my consumer code already needs to know how to compose the URL in the first place. Suddenly I’m supposed to switch from using my URL-building code to using pre-built URLs returned in the response? This leads to all kinds of bugs:

1.  More branching in the code, toggling between my own URL-building logic and pre-built URL logic.
2.  API response might be normalizing URLs in a way that is different than I intended. Or maybe I’m accessing an API through a proxy like [Runscope](https://www.runscope.com)? _“Ugh why is my first request working but the rest fail, WHY??!_ 😡🐚♨️_”_

This also breaks if you’re trying to avoid coupling with HTTP as a transport, or if you need to multipart-encode a large request and url-encoded variables don’t get merged.

On the other hand, including URLs for downloading or frontends to navigate to is fine: Images, browser links, whatever. We’re talking strictly about API endpoints here.

### generic data lists with types

```
{
    "data": [
        {
            "id": "1",
            "name": "shazow",
            "type": "user"
        }
    ]
}
```


It’s not any more expressive than our _result_ layout above, and we’d be requiring our consumer to check the _type_ field for every object they touch to make sure they’re not mistreating it. They won’t. Bugs will ensue.

## Other cans of worms

I have _feelings_ on other API-related topics like REST vs RPC, language-native SDK wrappers, versioning, transport protocols, XSS security strategies, and more.

Let me know what interests you at [twitter.com/shazow](https://twitter.com/shazow).
