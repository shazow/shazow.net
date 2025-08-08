---
title: Choosing a new master password
author: Andrey Petrov
date: 2017-01-13 16:35:23.510000+00:00
lastmod: 2020-05-14 12:26:57-04:00
description: I’ve been meaning to change and improve my master password for years.
  I knew the steps but I really wanted someone to spell it out for me anyways, so
  I’ll spell out the concrete steps for you…
subtitle: 'You’ve been meaning to pick a better master password and this article is
  your excuse: Step by step, the best practices are spelled out.'
tags:
- Passwords
- Security
categories:
- Featured
aliases:
- /choosing-a-new-master-password-cdefe31dff3c
---
I’ve been meaning to change and improve my master password for years. I _knew_ the steps but I really wanted someone to spell it out for me anyways, so I’ll spell out the concrete steps for you.

Popular password managers work by maintaining an encrypted database of many secrets, protected by a combination of the _master password_ and access to the encrypted database file that is synchronized across your devices. Picking a strong master password is crucial in case one of your devices is stolen or the cloud storage that is hosting your password file is compromised.

## 1. High-entropy memorable pass phrases

I recommend this generator:
[https://github.com/redacted/XKCD-password-generator](https://github.com/redacted/XKCD-password-generator)

It’s written in Python, it has good defaults, and a sensible built-in word dictionary (65,355 words). You can install it using 
```
pip install xkcdpass
```

You can tweak the length and formula with various command-line flags. I recommend getting a whole bunch of passwords and visually picking one from the list.

```
$ xkcdpass --count=100
jewelweed cruzeiro scrawny preempt edgeways ceramist
vendor sacker someone elevator jeweled croaky
ammonia American bunk bed rhymer velleity drenched
linger largesse plain thoraces withered big deal
Rolland wheelie empanada repossess colic hosteler
....
```


Make sure to pick from the list rather than making up your own, because humans are much worse at being random than we might intuitively think we are.

## 2. Write it down

Yes, you should write it down — **but make sure it’s written on something that can be reliably destroyed** and won’t be discovered before it’s destroyed. A piece of paper that you can mangle or burn will do the trick. Make sure to keep it safe until you’re ready to destroy it.

**Totally optional:** If you’re feeling ambitious, this is the time to augment it a bit by adding a few random symbols and numbers. **Avoid common letter substitutions like** [**l33t speak**](https://en.wikipedia.org/wiki/Leet) because every password cracking tool automatically tries these out of the box. Pick a couple of random numbers and symbols and litter them in the middle of some of your words.

It’s okay to add randomness to your already-random password, but avoid removing randomness by replacing your random words with ones that you chose on a whim or by simplifying the phrase in general.

If you’re not sure what to do, then just keep the passphrase as it came out from xkcdpass. It’s fine as it is and you don’t want to make it too hard to remember.

## 3. Memorize and practice

Make a text file with a short message and encrypt it using your new password. I like to use [scrypt](https://www.tarsnap.com/scrypt.html) which is available in popular package managers:

```
$ brew install scrypt  # or apt-get install scrypt
$ echo "I remembered my password" > pwtest.txt
$ scrypt enc pwtest.txt > pwtest.enc
Please enter passphrase:
...
$ rm pwtest.txt  # Don't need this anymore
```


Now that we have our encrypted test file, we can practice unlocking it until we memorize the password:

```
$ scrypt dec pwtest.enc
Please enter passphrase:
...
I remembered my password
$ scrypt dec pwtest.enc
Please enter passphrase:
...
I remembered my password
$ scrypt dec pwtest.enc
Please enter passphrase:
...
I remembered my password
```


If you prefer to use GPG instead of scrypt:

```
$ echo "I remembered my password" > pwtest.txt
$ gpg -c pwtest.txt
Enter passphrase:
...
$ gpg pwtest.txt.gpg
Enter passphrase:
...
I remembered my password
```


## 4. Adopt the new master password

After a few days of practicing your new password, it’s time to adopt it: Destroy the paper you wrote it onto, change your password manager’s master password, and remember: **Never use your master password anywhere else.**

The master password is there to keep your other passwords safe. It should never be used as a password for another account, even if it’s your bank or iCloud or whatever. **The master password is for your password manager**, and you must use your password manager to generate and save passwords for the rest of your accounts.

If you’re not using a password manager yet, I recommend [Bitwarden](https://bitwarden.com/). It's free, open source, has a great paid plan for families and teams, and works on all platforms.

If you insist on something closed source and more expensive but with 5% more polish, [1Password](https://1password.com/) is also a good option.

## Good security hygiene

*   Use a strong randomly-generated passphrase as your master password.

    **Done, good work.**

*   Use a password manager.

    **Hopefully already done?**

*   Enable encryption for all of your devices and services.

    **Especially portable devices that you can lose, like phones and laptops.**

*   Choose to use applications that come with good security defaults out of the box.

    **Not all security or encryption is made equal:** an application with bad security is like an account with a bad password. Sometimes bad security can be worse than no security if it manages to lull you into false expectations.

You won’t regret good security hygiene, especially as the cyber continues to intensify.
