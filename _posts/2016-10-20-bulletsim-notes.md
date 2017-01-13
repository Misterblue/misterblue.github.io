---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: BulletSim Notes
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-10-20 11:22:20   # SET DATE
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
A while back I sent an email describing some of the features of BulletSim --
the physics engine I did for [OpenSimulator]. This is useful information so
it should be on the web somewhere:

The C# part of BulletSim can be in addin-modules -- it doesn't need to be'in core'
but needs to be built with core so it can be an addin module.

There is a separate OpenSimulator source tree... opensim-libs at
"git://opensimulator.org/git/opensim-libs" that has a bunch of the non-core parts of
OpenSimulator (http server, old and ancient other tries at he physics engine, ...).
The C++ portion of BulletSim is in 'opensim-libs/trunk/unmanaged/BulletSim' and
there are the instructions for fetching the Bullet sources, patching same,
and then building with the interface to the C# code).
The C++ wrapper mostly deals with passing the structures back and forth between
the C# and C++ code (pinned memory for the position updates and collisions,
copying meshes in arrays of floats, ...)

The BulletSim design is around making a simulation step be only one transition
between C# and C++.
So, under normal running conditions, there is only one transition per simulation
step and the data (position updates and collisions) are passed in pinned memory
so there is no copy.
98% of the C# code deals with doing and adapting Bullet to what OpenSimulator
required (link sets (ugh!), ...). The C# -> C++ interface for BulletSim is rather
large... physics engines seem to have lots of calls for all their features
Bullet, for instance, has what seems like zillions of methods of changing
constraint parameters I made those appear in the interface to C#.
If I had it to do over again, I'd probably go more with a functional design
where there is a "call a named function with parameter blob" design so the C#/C++
interface was smaller and new function could be added without changing the
binding of the DLL then use some fancy reflection to build the binding on both sides

The .NET C#/C++ binding is pretty good except that ints and booleans change
size between 32 and 64bits... if you look at the BulletSim interface you'll
see I use floats and arrays of floats everywhere because they are always 32 bit.

I recently played with building "BulletThrift"... a version of BulletSim that
uses Thrift to call a remote process physics engine (experiment in distributed physics).
It didn't get finished mainly because the existing interface to the C++ module
is so large.
BulletSim actually has a HAL to access the physics engine and there are two
physics engines: the C++ Bullet and a C# port of Bullet.
The latter was last used by Nebadon to run OpenSimulator on a Raspberry PI.
But this also means it is easy to add a link to a remote Bullet.
That's where I was going to add BulletThrift that would call across the network
to a remote Bullet server.
My main reason for doing this was to be able to run Bullet in a pure C++ environment
where debugging wouldn't be complicated by the managed/unmanaged environment.

If you distributed the physics engine, operationally, I'd expect you'd see some of
the things that happen when running BulletSim on its own thread like jitter caused
when there is a 'beat' between the physics simulation time and the simulator heartbeat.
BulletSim running on its own thread means that the physics engine is called on
its own thread and  the passing back of collisions and position updates happens
when the simulator heartbeat thread calls into the physics engine.

[OpenSimulator]: http://opensimulator.org/

