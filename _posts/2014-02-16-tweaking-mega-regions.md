---
layout: post
status: publish
published: publish
title: Tweaking mega-regions
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 891
wordpress_url: http://misterblue.com/?p=891
date: 2014-02-16 10:47:08
categories:
- Blogroll
- Misterblue
- OpenSimulator


---
Adding the varregion feature to OpenSimulator caused me to bump into the mega-region code. The most recent commits to OpenSimulator are a rewrite of some of that code to make it easier to understand and eliminate some complexities (like creation and testing of complex border classes).

There have been some Mantis entries saying how mega-regions were broken but now that should be better. This is, previous mega-region configurations should now properly test for border crossings within the mega-region.

One side effect of the changes is to allow combining varregions into mega-regions. Although not completely tested (I figure there are some problems with maps and TPing with maps), you can mega-region'ize adjacent, same-sized large regions. Not for the faint-of-heart, but a configuration possibility.

I have been working on several Mantis entries for varregion and mega-regions and getting those problems resolved. If you find something that doesn't work, Mantis away.

-- mb
