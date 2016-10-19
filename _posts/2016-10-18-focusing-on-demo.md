---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Focusing on Demo
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-10-18 18:17:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# static-comments:
# - id: 100   # unused number
#   author: AUTHOR-HANDLE
#   author_email: AUTHOR-EMAIL
#   author_url:
#   date: 2004-10-09 09:22:40  # SET DATE
#   content: COMENT TEXT
# - id: 101
#   author: Misterblue
#   author_email: misterblue-mt@misterblue.com
#   author_url: http://www.misterblue.com
#   date: 2004-10-10 07:23:13
#   content: >-
#     COMMENT TEXT
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
I've been suffering from analysis paralysis.
What I envision for [Basil] and ultimately the [Herbal3D] system is a huge project
with many components.
These days, with the Internet and all the collaborations and projects happening,
there are innumerable technologies to choose from.
What languages to use?
What IDE to use?
What messaging library?
And on and on and on and on and on.
Argh! There are so many to choose from!!

Previous blog posts ([Pesto to Python], [Cassandra and Docker], [Looking for a message bus],
[Thirft vs ProtoBuff])
have all been about analysing various software libraries and packages.
The end effect is that nothing has gotten done.

Nothing.

Well, some little experiments and some documentation but really no useful code or results.

The next step is to do something.
The best thing to do is the prim baking code and the comparison of display frame rates
between a browser based viewer and an [Unreal Engine] viewer.
This experiment will create some of the required basic functionality and verify
some of my conjectures about the basic Basil architecture.
It will also be visual and will hopefully spark interest and thus build a community
of developers.

So, rather than worry about transport and APIs, over the next few days I'll work on
conversion of the [OpenSimulator] prims and objects into "baked" mesh format and
in various mesh file formats. Since an [OAR file format] contains all the asset descriptions
as well as the region placement, and, since it is just a compressed TAR file, I will
burst an OAR file and write routines to do the conversions and create new files.
For display, I can just move that file structure under an HTTP server.

[Basil]: http://blog.misterblue.com/basil/
[Herbal3D]: http://blog.misterblue.com/virtualworlds/herbal3d/
[Pesto to Python]: http://blog.misterblue.com/2016/2016-08-15-pesto-to-python
[Cassandra and Docker]: http://blog.misterblue.com/2016/2016-08-14-cassandra-and-docker
[Looking for a message bus]: http://blog.misterblue.com/2015/2015-07-10-Looking-for-a-message-bus
[Thirft vs ProtoBuff]: http://blog.misterblue.com/2015/2015-05-23-thrift-vs-protobuff-vs
[Unreal Engine]: https://www.unrealengine.com/
[OpenSimulator]: http://opensimulator.org/
[OAR file format]: http://opensimulator.org/wiki/OAR_Format_1.0

