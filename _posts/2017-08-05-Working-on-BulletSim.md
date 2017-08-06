---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Working on BulletSim
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-08-05 17:32:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- OpenSimulator
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
I've set aside time the next two weeks to work on [BulletSim].
As some of you might know, I am the original author of the BulletSim physics
engine in [OpenSimulator].
While other projects have taken up most of my attention, there are some tweeks
to BulletSim that are needed.

There are three things that I want to address the next weeks:

* Upgrade the underlying [Bullet physics engine] to version 2.86;
* Fix the [missing] [collision] [problem];
* Raycasting is not done in the physics engine.

The first job is getting re-setting up the build environment.
I have to use an old version of Visual Studio and an old version
of Linux so the compiled C++ code DLL's and SO's will work
on older versions of the operating systems.

When I start making source changes, I'll create an [OpenSimulator]
branch for testing.

Stay tuned.


[BulletSim]: http://opensimulator.org/wiki/BulletSim
[OpenSimulator]: http://opensimulator.org/
[Bullet physics engine]: http://bulletphysics.org/
[missing]: http://opensimulator.org/mantis/view.php?id=7132
[collision]: http://opensimulator.org/mantis/view.php?id=8010
[problem]: http://opensimulator.org/mantis/view.php?id=8011

