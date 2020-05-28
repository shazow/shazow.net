---
title: "Why aren’t we using SSH for everything?"
author: "Andrey Petrov"
date: 2015-01-02T20:56:34.379Z
lastmod: 2020-05-14T12:26:54-04:00

description: ""

subtitle: "Dozens of facts about the SSH protocol and why we should use it for more things."

image: "/posts/ssh-how-does-it-even/images/1.png" 
images:
 - "/posts/ssh-how-does-it-even/images/1.png"
 - "/posts/ssh-how-does-it-even/images/2.png"

categories:
 - Featured

aliases:
    - "/ssh-how-does-it-even-9e43586e4ffc"

---

> _SSH, how does it even?_


A few weeks ago, I wrote [ssh-chat](https://github.com/shazow/ssh-chat).

{{< tweet 543852069417787392 >}}

The idea is simple: You open your terminal and type,

```
$ ssh chat.shazow.net
```

Unlike many others, you might stop yourself before typing “ls” and notice — that’s no shell, it’s a chat room!

While the little details sink in, it dawns on you that there is something extra-special going on in here.

## SSH knows your username

When you ssh into a server, your client shares several environment variables as inputs to the server, among them is the $USER variable. You can overwrite this, of course, by specifying the user you’re connecting as such:

```
$ ssh neo@chat.shazow.net
```

Well look at that, you’re the one. So special. What else can we mess with? By default, the server gets your $TERM variable too.

```
$ TERM=inator ssh chat.shazow.net
```

If ssh-chat was smart, it would recognize that your custom terminal might not support colours and skip sending those extra formatting characters.

You can even push your own environment variables with a _SendEnv_ option flag, but we won’t get into that.

## SSH validates against your key pair

There are several supported authentication methods in SSH: _none_, _password, keyboard-interactive,_ and _publickey_. They each have interesting properties, but the last one is especially handy.

When your SSH client connects to a server, it negotiates an acceptable authentication method that both support (typically the reverse order of the above). If you’ve specified the identity flag or have some keys lying around in your _~/.ssh/_ directory, your client will offer up some public keys to authenticate against. If the server recognizes one of those keys, such as if they’re listed in _authorized_keys_, then a secure handshake will begin verifying that you hold the private key to that public key but without revealing what the private key is. In the process, the client and server securely agree on a temporary symmetric _session key_ to encrypt the communication with.

What does this mean? It means that SSH has authentication built into the protocol. **When you join ssh-chat, not only do I know who you _claim_ to be, but I can also permanently and securely attach an identity to your connection without any user intervention on your part.** No signup forms, no clicking on links in your email, no fancy mobile apps.

A future version of ssh-chat will allow you to create a permanent account which is validated against your key pair, and these permanent accounts might have all kinds of special features like username ownership, always-online presence, and push notifications over Pushover or email.

### SSH connections are encrypted

The server uses the same kind of key pair as a client would. When you connect to a new SSH host, you get a message that presents a “key fingerprint” for you to validate. The fingerprint is the hex of a hash of the server’s public key.




![image](/posts/ssh-how-does-it-even/images/1.png#layoutTextWidth)



What does it mean if you try to connect to chat.shazow.net and you see a _different_ fingerprint hash? You’re being [man-in-the-middle](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)’d.

Your local neighbourhood clandestine security agency could make an SSH server that just acts as a proxy in front of another SSH server you frequent (using something like [sshmitm](http://linux.die.net/man/8/sshmitm)) and log everything that is going on while passing it through. Fortunately, as long as the proxy doesn’t have the original server’s private key, then the key fingerprint will be different.

Once you accept a fingerprint, it will be added to your _~/.ssh/known_hosts_ where it will be _pinned_ to that host. This means if the key for the host ever changes, you’ll be greeted with this appropriately-scary message:




![image](/posts/ssh-how-does-it-even/images/2.png#layoutTextWidth)



A host you’ve connected to previously is advertising a different public key than it did before. If you can’t account for this change (maybe you launched a new VPS on the same IP address as before and it generated a fresh SSH key pair?) then it’s worth being worried. Try connecting to this host from another network, see if the problem persists — if not, then someone is hijacking your local connection rather than the server’s connection.

## SSH supports multiplexing

When your client connects to a server, it opens a _channel_ where it requests a specific feature. There are many fun things your client can request like _pty-req_ (a pseudo-terminal), _exec_ (run command), or even _tcpip-forward_ (port forwarding). [There are many others](http://www.ietf.org/rfc/rfc4254.txt), and there is nothing stopping you from inventing your own type for a custom client/server implementation. Maybe we’ll see a _chat_ channel someday?

The best part is that you can do all of these things concurrently: Start port forwarding while opening a shell while having some command run in the background.

Once your pipeline is opened, you can send _more_ commands within it. When your client opens a _pty-req_, it sends event updates such as _window-change_ whenever your terminal size changes.

## SSH is ubiquitous

“Is it mobile-friendly?” you may joke, but it is! Every platform you can imagine, there is an SSH client available, including iOS, Android, even Windows! OSX and every Linux distro ships with a client. There are even [browser extension SSH clients](https://chrome.google.com/webstore/detail/secure-shell/pnhechapfaindjhompbnflcldabbghjo?hl=en).

SSH is one of the most accessible secure protocols ever, second only to HTTPS of course.

## SSH sounds awesome, and familiar…

Let’s see what we have so far: Binary protocol, mandatory encryption, key pinning, multiplexing, compression (yes, it does that too).

Aren’t these the key features for why we invented HTTP/2?

Admittedly, SSH is missing some pieces. It’s lacking a notion of virtual hosts, or being able to serve different endpoints on different hostnames from a single IP address.

On the other hand, SSH _does_ have several cool features over HTTP/2 though, like built-in client authentication which removes the need for registration and remembering extra passwords.

## More factlets to fill your stockings

*   SSH server and client specification is fairly symmetric. Per the protocol, most of what the client can ask of a server, a server _could_ ask of the client. This includes things like run commands, but mainstream clients don’t implement this (as is recommended against in the specification).
*   Every keystroke is sent over the TCP connection. This is why you might notice lag in your typing.
*   To see what your OpenSSH client is doing, use -v to enable verbose debugging output. Use another -v to see per-keystroke debugging, and another -v to further increase the silliness.
*   There is a protocol called [MOSH](https://en.wikipedia.org/wiki/Mosh_%28software%29) which uses SSH to bootstrap but uses client-side predictive rendering and a UDP state synchronization protocol to remove the effects of latency. I wish there were more third-party implementations of it.
*   Since SSH supports port forwarding and a SOCKS proxy interface, you can build a VPN on top of it by using something like [sshuttle](https://github.com/apenwarr/sshuttle).
*   SSH can authenticate using a certificate authority scheme, similar to x.509 certificates used in TLS. Also, many clients can verify server fingerprints against an [_SSHFP_ DNS](https://tools.ietf.org/html/rfc4255) entry.

## Some provocative SSH ideas

Chat over SSH was fun, but that’s just the tip of what we can come up with.

#### **Multi User Dungeon (MUD)**

Someday, you’ll be able to ssh into _mud.shazow.net_ and you’ll get a little ASCII RPG world to explore. Not yet, but it just might happen.

#### **Distributed Hash Table (DHT)**

This gets technical but the possibilities are striking… {{< tweet 549348566972370944 >}}

#### **Programmatic Data Streams**

Or better yet, ZeroMQ-style sockets with proper security and encryption? Check out [Jeff Lindsay’s Duplex](https://github.com/progrium/duplex). Still a proof of concept, but lots of really cool demos.

#### **RPC API**

SSH’s built-in authentication and encryption makes it _really_ convenient for things like APIs. No complicated OAuth2 handshakes or HMACs and signatures.

```
ssh api.example.com multiply a=4 b=5
```

Someday we’ll have good libraries which make connecting over SSH just as easy as HTTP. At that point, your code will look exactly like today’s run-of-the-mill REST API, but use SSH underneath.

Either way, the days of _curl_ examples in API docs would be behind us.

#### **File Server**

If we have an RPC API, why not serve static files while we’re at it?

```
ssh static.example.com get /images/header.png
```

Remember, SSH supports persistent connections just as well, so your browser could sit there connected to an SSH channel named _get_ for the host and send concurrent _get_ requests for assets. We could even implement ETAGs, and whatever else.

#### **And finally, HTTP**

At this point, there’s no reason we couldn’t build a version of HTTP/1 or HTTP/2 on top of SSH. Let’s add a _header_ channel to specify things like _Host_ for virtual host support, throw in some _Cookie_ headers too. Want to add some method verbs? Why not, let’s make a bunch of channels like _post_ or maybe _http-post_ if we want to be polite.

## Why aren’t we using SSH for everything?

Great question.
