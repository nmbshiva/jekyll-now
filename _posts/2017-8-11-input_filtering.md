---
layout: post
title: Input Filtering
---

This post will likely be the first of a few regarding some fundamentals I consider to be fairly basic, but in my recent time testing web apps seem to be somewhat overlooked. The posts come from a personal belief that the core of securing web applications is simple, and hasn't changed and won't change going in to the future.

**``` Input Filtering ```**

The first thing I want to talk about is input filtering.

Just about every application we use in the modern age takes some sort of user input and does something with it. Applications encourage users to register, and personalise preferences. They have search functionality to find existing content.

The problem a lot of the time (although it's vastly improving) is that this input doesn't get handled correctly.

Let say for example, that you have search functionality on your website. This uses a SQL query to interact with the database to allow users to search content on your website. When building this query, you failed to use (parameterised queries) and whatever a user searches for gets put straight in to the query. Now, what if someone comes along and searches for ``` ' or '1'='1 -- ```? Yup - that will terminate your current query and exact a search where 1=1. Your website is vulnerable to SQL injection... Bad news!

Alternately, you have a website where users can register and enter their display name. Your application takes that display name, and returns it on the page when they log in. Have you taken steps to stop someone setting up ``` <script src="" ``` and now exploiting cross-site scripting on your website?

Sometimes it may be worse. Your website may take input from a user, and have the server do something with it. If you do not handle this input correctly, it may lead directly to command execution and a full compromise of the server!

Input filtering/validation/sanitisation aims to combat this, by treating all input as untrusted, potentially malicious input, and handling it accordingly. Wherever possible, validation should be performed server-side, as when done on the client it can be trivial to bypass.

A lot of the modern frameworks now come with input validation enabled by default, and while these methods do not guarantee anti-compromise, they do take a lot of the manual work out of handling input correctly (just make sure you use them!)

OWASP has a fairly decent cheat sheet on getting started with input validation, and if you are not sure where to start, it's a good read - (OWASP Input Validation Cheat Sheet)[https://www.owasp.org/index.php/Input_Validation_Cheat_Sheet]

Input validation really is one of the fundamentals of web application security, and when implemented correctly makes it a lot more difficult for an attacker to compromise your site.