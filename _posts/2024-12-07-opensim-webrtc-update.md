---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: OpenSim WebRtc Update
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2024-12-07 10:44:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- OpenSimulator
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# static-comments:
# - id: 100   # unused number
#   author: AUTHOR-HANDLE
#   author_email: AUTHOR-EMAIL
#   author_url:
#   date: 2021-10-09 09:22:40  # SET DATE
#   content: COMENT TEXT
# - id: 101
#   author: Misterblue
#   author_email: misterblue-mt@misterblue.com
#   author_url: http://www.misterblue.com
#   date: 2021-10-10 07:23:13
#   content: >-
#     COMMENT TEXT
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
I have WebRtc kinda working for [OpenSimulator] and I gave a presentation
on it at OpenSimulator Community Conference [OSCC24]:  [WebRTC Voice for OpenSim].

I also have region in [OSGrid] that has WebRTC based voice. Visit [Blueland]
and see if anyone is there talking.
[Blueland] is running as a [Docker] container built with [opensim-docker]
and the [Janus] server is a Docker container built by [os-webrtc-janus-docker].

The code is in [os-webrtc-janus] as an [OpenSimulator] addin-module. That is,
you clone the repository into the `addin-module` directory of the [OpenSimulator]
sources, do a `runprebuild`, and then build the simulator.

There is still a lot of things to complete:

- spatial code modifications to Janus
- voice controls (mute, volume, ...)
- connection to the grid server
- hardening

If you want to help with the coding, join me at [os-webrtc-janus] and checkout
the [issues] and the [project].
Please test the feature and make some [issues] and this will eventually get
integrated into all [OpenSimulator] regions and grids.

[OpenSimulator]: http://opensimulator.org
[Janus]: https://janus.conf.meetecho.com
[Docker]: https://www.docker.com   
[os-webrtc-janus]: https://github.com/Misterblue/os-webrtc-janus
[issues]: https://github.com/Misterblue/os-webrtc-janus/issues
[project]: https://github.com/users/Misterblue/projects/7
[os-webrtc-janus-docker]: https://github.com/Misterblue/os-webrtc-janus-docker
[audio bridge]: https://janus.conf.meetecho.com/docs/audiobridge.html
[OSCC24]: https://conference.opensimulator.org/
[WebRTC Voice for OpenSim]: https://docs.google.com/presentation/d/1WUULV5dwnAWooWtqinJGd-1h6-OT7Hvd_mlOdWc9DVU/edit?usp=sharing
[Blueland]: hop://hg.osgrid.org:80/Blueland/253/92/35

