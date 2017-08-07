---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Bullet Version Upgrade and Build Tasks
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-08-07 15:51:20
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
Since the [Bullet physics engine] is distributed with [OpenSimulator] as a
binary, I have to keep my library compatibility kind of old fashioned,
That means I can't use the latest-and-greatest Visual Studio nor the
latest-and-greatest version of Linux.
I'm building the Linux versions on Ubuntu 14.04 as that has been good with
various shared library compatibilities.
For Windows, I'm using Visual Studio 2012.

I have to build for both 32 bit and 64 bit Linux systems. Does anyone still
use 32 bit?

The upgrade of the [Bullet physics engine] to v2.86 doesn't seem to have any
problems and I will start the [OpenSimulator] development branch
("BulletSim2017") later today. There shouldn't be any functional difference.

After thinking about the work to be done and talking to people,
the major task list is getting longer:

* Upgrade the underlying [Bullet physics engine] to version 2.86;
* Fix the [missing][mantis7132] [collision][mantis8010] [problem][mantis8011] ;
* CPU performance improvements (people mention high CPU usage with physical objects);
* generate convex shapes if PhysicsShapeType is set to CONVEX;
* Raycasting is not done in the physics engine.

Once I'm happy with the upgrade, I'll create some test cases for collisions
and CPU usages to track progress.

[BulletSim]: http://opensimulator.org/wiki/BulletSim
[OpenSimulator]: http://opensimulator.org/
[Bullet physics engine]: http://bulletphysics.org/
[mantis7132]: http://opensimulator.org/mantis/view.php?id=7132
[mantis8010]: http://opensimulator.org/mantis/view.php?id=8010
[mantis8011]: http://opensimulator.org/mantis/view.php?id=8011

