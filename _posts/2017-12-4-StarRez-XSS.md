---
layout: post
title: StarRez XSS - Messaging Portal
---

<p></p>

Founded in 1992, StarRez has been and developing, delivering, and supporting housing software solutions to higher education for over 25 years.  With over 600 customers worldwide, StarRez offers the most comprehensive housing solution on the market, and is the market leader in providing housing software solutions to universities and colleges around the world.

This XSS was found within the messaging system post-authentication (think email but directly within the application.)

Originally the devs wanted some functionality that allowed users to enter formatted messages, however after some back and forth and a simply bypass to their proposed patch, the functionality was pulled. StarRez was prompt to respond after initial disclosure and easy to work with; props to them. The issue was discovered in Feb 2016, and a hotfix released in September of the same year (after some internal delays.)

---

The app itself allowed users to insert full HTML as part of messages sent to other users. It was found that no filtering was taking place, despite being built in .NET (so it had been purposely disabled, naughty!) Originally the idea was that administrators could send students flashy formatted messages in HTML, however after the report it was realised this posed a significant point of weakness within the app.

#### Proof of Concept

In the messaging area, compose a new message to an account you have control over.
In the message body enter ```<script>alert(1)</script>```<br>
Send the message, and in the 2nd account, view the new message, complete with the pop-up.

![alt text](https://raw.githubusercontent.com/nmbshiva/nmbshiva.github.io/master/_posts/starrez_xss.jpg "StarRez XSS")

Additionally, lack of CSP meant loading external javascripts was A-OK without errors.

This could have opened up the door for a lot of potential nastiness (session hijacking leading to disclosure of private info etc.) so great to see the devs come to the table and fix the holes.

##### Discovered and reported: 02/2016
##### Final patch: 09/2016