---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: WebRtc Update Grid
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2025-01-09 11:55:20   # SET DATE
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
Some progress on WebRtc for [OpenSimulator].

[os-webrtc-janus] has been updated with the grid connector.
This means that a region can be pointed to a grid service that implements
the WebRTC voice function. Thus, a grid can provide voice for all
the regions in  the grid.

For the grid, the voice service is a Robust module so a grid can 
add it to all the other Robust modules or, to distribute the load,
a Robust service that provides only the voice service is possible.
See the description and instructions at [os-webrtc-janus].

At the region level, a region can provide a spatial voice service
for just the region and send the non-spatial (group and person-to-person chat)
to the grid voice service.

I have also updated the README for [os-webrtc-janus-docker] which is a Docker
image for running the [Janus] WebRTC voice server.
The instructions include Linux and Windows operation.

I also have region in [OSGrid] that has WebRTC based voice. Visit [Blueland]
and see if anyone is there talking.
[Blueland] is running as a [Docker] container built with [opensim-docker]
and the [Janus] server is a Docker container built by [os-webrtc-janus-docker].

There is still a lot of things to complete:

- spatial code modifications to Janus
- voice controls (mute, volume, ...)

[OpenSimulator]: http://opensimulator.org
[OSGrid]: https://osgrid.org
[Janus]: https://janus.conf.meetecho.com
[Docker]: https://www.docker.com   
[os-webrtc-janus]: https://github.com/Misterblue/os-webrtc-janus
[issues]: https://github.com/Misterblue/os-webrtc-janus/issues
[project]: https://github.com/users/Misterblue/projects/7
[os-webrtc-janus-docker]: https://github.com/Misterblue/os-webrtc-janus-docker
[opensim-docker]: https://github.com/Misterblue/opensim-docker
[audio bridge]: https://janus.conf.meetecho.com/docs/audiobridge.html
[OSCC24]: https://conference.opensimulator.org/
[WebRTC Voice for OpenSim]: https://docs.google.com/presentation/d/1WUULV5dwnAWooWtqinJGd-1h6-OT7Hvd_mlOdWc9DVU/edit?usp=sharing
[Blueland]: hop://hg.osgrid.org:80/Blueland/253/92/35

