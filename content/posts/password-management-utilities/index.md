---
title: "Password Management Utilities"
date: "2011-06-20 19:26:20 -0700"
lastmod: 2024-05-28
---


We live in a time when cleartext usernames and passwords are leaked on a daily basis. In the last couple of months my accounts got compromised on Gawker, Sony, and MtGox. I decided it's time to start using the one-password-per-service technique. These are tools I found in my research.

~~I'm currently using SuperGenPass, but considering writing my own version that uses customizeable multipass sha512, more symbol breadth in passwords, and some other improvements.~~

**Update:** I'm using [Bitwarden](https://bitwarden.com/) now, and you should too.


## Derived Password Algorithm

### [pwgen](https://github.com/jdoda/pwgen)

[@jondoda](http://twitter.com/jondoda) wrote his own simple algorithm for deriving a per-site password based from a master password. I've seen many variations of this, they're all very simple: Given a service name and a master password, concatenate them and run a hash function on it a bunch of times, then base64-encode the result and truncate to the desired length. Jon even wrote an Android version.


### [SuperGenPass](http://supergenpass.com/)

Same idea as Jon's pwgen, but in a JavaScript bookmarklet! This particular implementation uses multipass md5 which is pretty weak but the rest of the implementation is impressive. You go to the login page, enter your username and master password, then hit the bookmarklet and it converts the master password into a site-specific derived password in-place. No data leaves the comfort of your browser for this. There is also a mobile version.


## Proprietary

### [1Password](http://agilebits.com/products/1Password)

1Password is the Lexus of password management tools. It costs $39.99 for an OSX and Windows desktop license and another $11.99 for a mobile app. It lives in one file encrypted by your master password, so it's portable and many people use Dropbox to sync it across devices. No Linux support. (Via [@wolever](http://twitter.com/wolever))

### LastPass
LastPass has been sold to private equity and [leaked their customer data on multiple occasions](https://www.google.com/search?q=lastpass+leak). Many of their users have reported evidence that their vaults have been decrypted by third parties. Do not use LastPass.

## Open Source

### [Bitwarden](https://bitwarden.com/)

It's just the best, hands down. Ignore the rest, use this. It has clients on every platform, with great features and usability rivaling the best proprietary competitors, and it's open source with an active third-party community.

### [KeePass](http://keepass.info/)
Official client is Windows-based but has ports to all desktop platforms (Linux, OSX, mobile). Self-contained binary and database, portable. Actively developed, has a healthy plugin community with extensions for major browsers. (Via [@corbett_inc](http://twitter.com/corbett_inc))

### [Password Gorilla](https://github.com/zdia/gorilla)
Very barebones, self contained binary, actively developed. (Via [@seanpiled](http://twitter.com/seanpiled))

### [pwsafe](http://passwordsafe.sourceforge.net/)
Even more barebones, text-based, no browser integration. (Via [@jpetazzo](http://twitter.com/jpetazzo))

### [SFLvault](https://projects.savoirfairelinux.com/projects/sflvault/wiki/)
Somewhat unrelated but cool project, useful for sharing passwords between teams. (Via [@jpetazzo](http://twitter.com/jpetazzo))
