---
layout: post
title: Onmouseover XSS POC
---

__Or, bypassing custom blacklist filtering of <.* tags__

A recent web app engagement required simple PoC that their blacklisting was ineffective in preventing script injection (they had turned off ASPX filtering in favour of a custom blacklist solution.)

The app allowed users to insert a custom link to an offsite URL, injecting it in to sourcecode and providing a "correctly" formatted link.

The HTML source code was as follows:

```<a href="http://example.com" onclick="javascript:window.open('http://example.com');return false;">http://example.com</a>```

Where *example.com* is user supplied and the provided URL is returned back to the user as *http(s)://* text.

Testing showed that filtering was in place for `<anything` so a conventional XSS injection was out of question. Inserting simply `alert(1)` failed, as it came back as `http://alert(1)`. `javascript:alert(1)` fails due to syntax.

Some messing around came up with the following simple alert PoC:

```" onmouseover=javascript:alert(1);"```

Which becomes:

```<a href="http://" onmouseover="javascript:alert(1)  " onclick="javascript:window.open('http://" false;"="">http://" onmouseover=javascript:alert(1);"</a>```

The first *__"__* closes the HTTP attribute while *__onmouseover=javascript:alert(1)__* pops an alert when the mouse cursor moves over the link.

While the PoC is kind of ugly and unable to dupe users in to clicking it, it works as a simple PoC to show the developer's idea of a custom blacklist to prevent XSS fails.