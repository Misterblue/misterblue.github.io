---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Pesto to Python
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-08-15 08:10:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
After sending more time than I wanted on a [NodeJS] version of [Pesto],
I came to the conclusion that NodeJS was not the language of choice for that service.
This was given away when I found the multi-threaded [Thrift] server classes
for [Python].

Sound-of-forehead-slap.

Of course! JavaScript is not a multi-treaded language.
Pesto, though, is supposed to be the responsive messaging center of the whole
viewer framework. This kinda requires multi-threading.

I originally chose JavaScript/NodeJS because I wanted to build a fancy, interactive,
and responsive web interface to Pesto. Guess I will have to do that with some Python
libraries. The Python 2 vs Python 3 fork is concerning when thinking of the long
term but I'll have to see how that plays out.

[NodeJS]: https://nodejs.org/
[Pesto]: https://github.com/Misterblue/Pesto
[Thrift]: https://thrift.apache.org/
[Python]: https://www.python.org/

