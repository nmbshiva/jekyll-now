---
layout: post
title: Using UPX packer to bypass AV
---
<p></p>
**The Signature Problem**

Traditionally, AV has always been about signatures. Malware is released, AV companies reverse it, signatures are created and released, AV now detects malware (lag time between malware release and DAT update can vary) and all is well with the world.

This has always been OK for penetration testers, as they could simply pack or crypt or write their own malware for each engagement. (Metasploit is detected by just about everyone these days).

**Machine Learning AV?**

However, in recent years there has been a recognition that signatures aren't entirely effective, which in turn has resulted in a change in the industry to move from traditional signature based AV to what is being coined as "machine-learning" (next-gen AV), where detection is based on algorithms and behavioural analysis, and sandboxing in a cloud based VM. This change has been seen from a lot of the big players in the AV industry, as well as some other newcomers looking to make their own mark. A lot of marketers and sales people originally tried claiming that their product stopped all variants of malware - claims that were quickly proved wrong.

**Pack it Up**

A packer essentially works by compressing a file (in broad terms). In regards to a PE (executable) file, which would no longer be executable if fully packed, certain parts of the executable are packed; the headers are left intact, and as the file is executed the rest of the file is unpacked. This can be OK in terms of stymieing anyone attempting to reverse engineer the file (although probably won't get past experienced REs), but also has the added benefit of changing the properties of the file. This means it would also work in defeating signature based AV as the existing signatures would be based on the vanilla version of the file.

It seems, in particular to UPX, that it also causes an executable to become "undetectable", even where the next-gen AV employs advanced machine learning and behavioural analysis (if you believe the marketing). Of the 4 "next generation advanced endpoint protection" products I tested recently, a packed version of Cerber ransomware that was well known (41/52 vendors on virustotal for the unpacked sample) was able to successfully complete execution against 2 vendors. I also received confirmation from a 3rd party we work with that it defeated a 3rd vendor claiming big things in the behavioral analysis sector.

I haven't explored if this is something particular to UPX, or whether any packer will produce the same result, but I guess the behavioural analysis gear isn't quite what they are claiming. As such, it is fair to expect that your executable packed using UPX, will sail past both traditional and "advanced next generation signatureless endpoint protection".

Alternatively, I guess if packing your reverse shell fails, you could just run something in memory such as Powershell Empire... ;)

..................

###### _nb. This post refers to packing executables using UPX packer; the same technique may also work using other commercial packers. It also doesn't go in to bypassing application whitelisting._
[UPX](https://upx.github.io/)