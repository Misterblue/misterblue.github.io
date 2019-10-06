---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Where have I been
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2019-10-06 11:45:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Meta
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
Haven't said much the past year.
I have been moving to other projects that don't have as much blogging interaction.

A year ago, I did a bunch of playing with robotics and [ROS2]. This culminated in
a small, multi-node setup with a camera that tracks faces.
What I learned was captured in a [presentation] that I gave at our
local [ROS Meetup].

After that, I played with the [Basil] virtual world viewer by creating several
[OpenSimulator] modules that convert and present a region to [Basil].
This included [Loden] which converts [OpenSimulator] primitive objects
into meshes and eventually a [GLTF] format file.

This virtual world conversion idea came from the [Sirikata project] that was
done at Stanford over a decade ago. Any continued work would build on the 
many papers available on things like [automatic LOD generation of scenes].
Things to do.

Then [RaguOS] adds to [OpenSimulator] a WebSocket interface talking the Basil
protocol and making available all the assets created by [Loden].
From this, [Basil] can display the region contents.
Extended RaguOS's operation with some authorization stuff ([OpenSimulator] module [OSAuth])
but haven't gotten all the way to adding the [JWT tokens]
that will eventually underly all the authentication/authorization.

This led me to wanting to put up a sample region that people could try out.
Deployment got me working on [Docker] and the creation of images for
consistant operation of [OpenSimulator]. The output of this has been
a repackaging of [OpenSimulator] into a set of scripts to
[build and deploy OpenSimulator as Docker containers].

With all that done, I've become overwhelmed with the amount of work that still
needs to be done. Also, the on-line virtual world environment has changed.
Augmented reality is the Cool Thing at the moment.
The latest incarnation of virtual world companies have grown, stumbled, and
needed to regroup.
The Big Guys (Facebook, Amazon, Microsoft, ...) have started to deploy their hardware and 
infrastructures.
So, my little hobby project seems a dead end.
Like it will never have all the capabilities that the virtual world community needs
and my dreams of bigger impact seem out of reach.

This means I will probably moth-ball the whole [Herbal3d] project, bring documentation
up to date, complete the architecture ideas, and then move on.

What will 'moving on' look like?
I'm thinking robotics.
I expect to get back to [ROS2], [Docker] deployment of node logic, and
playing with things using [transformer neural networks]
to build
[model predictive controllers].
Will be fun.

[ROS2]: https://index.ros.org/doc/ros2/
[presentation]: https://drive.google.com/open?id=1gY9ByfrH92V28EUl5SoEEkMiymYqme7H
[ROS Meetup]: https://www.meetup.com/Robot-Operating-System-ROS-Development/
[Basil]: https://github.com/Herbal3d/basil
[OpenSimulator]: https://opensimulator.org/
[Loden]: https://github.com/Herbal3d/Loden
[GLTF]: https://www.khronos.org/gltf/
[RaguOS]: https://github.com/Herbal3d/RaguOS
[Herbal3d]: https://herbal3d.org/
[OSAuth]: https://github.com/Herbal3d/OSAuthModule
[JWT tokens]: https://jwt.io/
[Docker]: https://www.docker.com/
[Sirikata project]: http://sing.stanford.edu/pubs/sirikata-atc12.pdf
[automatic LOD generation of scenes]: https://hal.inria.fr/hal-01113078/file/manuscript.pdf
[build and deploy OpenSimulator as Docker containers]: https://github.com/Misterblue/opensim-docker
[model predictive controllers]: https://en.wikipedia.org/wiki/Model_predictive_control
[transformer neural networks]: https://medium.com/inside-machine-learning/what-is-a-transformer-d07dd1fbec04
