---
layout: post
status: publish
published: publish
title: Restarting blog
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2015-05-09 11:30:18
categories:
- Misterblue

---
After a long hiatus, I've decided to start the blog again.
I have lots of design stuff I want to do around virtual worlds
and I need a place to put it.

I ported the old blog from WordPress to [Jekyll](http://jekyllrb.com/)
and had to learn [Markdown](http://en.wikipedia.org/wiki/Markdown) along the way.
Someday I'll go off on my rant on why I hate Markdown and its cousin
[YAML](http://www.yaml.org/) but that is for another blog entry.
They are what they are and lots of people are using them so, with grumbling,
I must adapt.

The port from WordPress to Jekyll wasn't all smooth. Jekyll supplies a conversion
program that converts the WordPress database into Jekyll post entries but
I found that I couldn't get the right combination of Ruby libraries working to
make that happen. The result was my own conversion routine written for C#.
It's only in C# because, at the moment, I have a full development environment
for it running and, secondly, I could include the DLLs so there are no
dependencies to random old versions of external libraries.
If you are in a similar spot, checkout
[jekyll-importws-cs](https://github.com/Misterblue/jekyll-importwp-cs).

The base theme for the Jekyll version of the blog is
[jekyll-clean](https://github.com/scotte/jekyll-clean) by Scott Emmons.
A good starting point that I have since taken many liberties with.
I like his philosophy of not including every cool library and feature
in the world. This makes for easy modification and support.



