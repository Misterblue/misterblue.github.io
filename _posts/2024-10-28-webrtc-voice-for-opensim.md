---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: WebRtc Voice for OpenSim
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2024-10-28 14:03:20   # SET DATE
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
I haven't been updating this blog lately so I thought I'd add something today.

I've been working on adding webrtc voice to [OpenSimulator] using
the [Janus] webrtc server.

To use the [Janus] server, I've created a [Docker] container
for running the server configured up for [OpenSimulator].
Check out [os-webrtc-janus-docker] for details.
That allows the running of the voice service separate from a region or a
grid server and, hopefully, eventually allows scaling.
I'm using the [audio bridge] plugin in [Janus] to create "rooms"
for group and region sessions.
That allows the mixing of audio for an area.
Initially, there won't be spacial voice mixing but I expect future work
to add that to a fork of the [audio bridge] plugin for [Janus].

I've submitted a presentation for this project to [OSCC24] that happens
in early December so I have a deadline. Insert "freak out" emoji.

[OpenSimulator]: http://opensimulator.org
[Janus]: https://janus.conf.meetecho.com
[Docker]: https://www.docker.com   
[os-webrtc-janus-docker]: https://github.com/Misterblue/os-webrtc-janus-docker
[audio bridge]: https://janus.conf.meetecho.com/docs/audiobridge.html
[OSCC24]: https://conference.opensimulator.org/

