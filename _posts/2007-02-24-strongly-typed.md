---
layout: post
status: publish
published: publish
title: Strongly Typed
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 675
wordpress_url: http://misterblue.com/wwpp/archives/20070224-strongly-typed
date: 2007-02-24 01:54:35
categories:
- Blog
- Misterblue


---
Because my job is changing, I've been spending some time learning some other languages since I've been focused on Java and XML tools for the last few years. So, I'm refreshing my skills in C++ and PERL and trying out JavaScript and LSL.

All my Java programming has been done in <a href="http://eclipse.org/">Eclipse</a> which does a wonderful job of flagging errors as you type. That is, the development cycle of "write, compile, fix compile errors, compile, ..., run" because if Eclipse doesn't show any errors while you're typing, it's sure to compile.

So, what does this have to do with C++, JavaScript and most of the XML tools? After Java and Eclipse, I feel like I'm being thrown back 20 years to using Lint with my C programs. And this leads me to the topic of 'strongly typed' languages.
<!--more-->
One of features of Java is it's 'strong typing'. I don't care about the JVM runtime checking (since code has to be robust and recover from all errors, the overhead of checking rather than just doing and faulting is questionable) but I care about the compiler and, in this case, the editor knowing what I want to happen -- if I say <code>itemCount</code> is a string but then I add one to it something should be flagged; if I define a variable named <code>height</code> and then reference a variable named <code>heigth</code> something should ask me what I was thinking. This feature of the programmer defining something and then the compiler or editor being able to check the implications of that definition.

But, now it is 2007, and Douglas Crockford (in his excellent <a href="http://yuiblog.com/blog/2007/01/24/video-crockford-tjpl/">JavaScript video lectures</a>) recommends style conventions which allow running <code>JSLint</code> to save yourself from wasting time finding problems at runtime. Well, duh. He does mention that this capability is being added to the Eclipse JavaScript plugin, but, after all these years of computer science, couldn't anyone see the language had problems?

I have the same arguement with PERL and most of the XML languages (a typo in an XPath expression silently select nothing with know why to debug why, for instance). CSS is hard to get right on web pages because there is no check if the HTML being styled fits the formatting model that the CSS operates on. C++ lets you override methods in subclasses with no checking for the matching semantics. PERL, well, don't get me started on PERL.

My frustration is that, after 40 years of computer language design, this still isn't obvious. Any language design should have a non-onerious method for the programmer to state his or her intentions and those intentions can be verified before you actually try executing the bits. Our focus should be on finding light-weight methods for expression of complex intentions not in making the latest light-weight language that has the problems of it's predecessors.
