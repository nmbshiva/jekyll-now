---
layout: post
title: Security Misconfigurations
---

<p></p>

This is post number 2 regarding some common web application security flaws that when addressed can help build a more secure web application and in turn a more secure internet for users. [Post 1 can be found here.](https://nmbshiva.github.io/2017/08/11/input_filtering.html)

## Security Misconfigurations

This post will cover security misconfigurations.

When we are talking about security misconfigurations, we are talking about any incorrect configuration item that would make it easier for an attacker to compromise your application. This could range from default passwords to verbose error messages to world-readable files.

Sometimes, these misconfigurations won't give an attacker direct access, but they will aid in compromising the application. For example, a world readable file that contains a list of usernames and what permissions they have in the application, incorrectly placed somewhere in the web root that ends up getting served with the valid web content.

Unfortunately a lot of vendors tend to have default configurations that are not very secure, and in a hurry to set up an environment they are left at default or sometimes simply missed if they are buried under a mountain of other settings. These configurations, when they are put into a production environment, can result in some pretty serious issues!

Here are a few tips to ensure you keep misconfigurations a non-issue:

  * If default accounts are not required, remove them. If they are, change the default password. Standard password rules apply (longer is better!)
  * Disable verbose error messages. Stack traces and the like give detailed information that can divulge software stacks and versions, and potentially things like usernames and passwords
  * Ensure the application utilises least privilege - users only have enough permissions to perform the activity they are entitled to. This also applies to system files
  * Patch software regularly - patches don't just introduce new features, but also fix bugs (often security related bugs)
  * Keep files with things like API keys, passwords etc. out of the web root so they don't accidentally get served with the site
  * Remove test/sample applications that are not required for the site to run. You can also extend this to any software libraries

  [OWASP Reference](https://www.owasp.org/index.php/Top_10_2013-A5-Security_Misconfiguration)