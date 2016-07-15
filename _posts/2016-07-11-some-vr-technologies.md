---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Some VR Technologies
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-07-11 17:14:20
# categories: VR, OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- VR
comments: true
---
I attended the
[Portland Virtual Reality Meetup]
nearly a month ago and, at the time, I made a list of VR technologies that I
needed to understand. This is that short list:

### WebVR

[WebVR] is a JavaScript/DOM API standard for interfacing and application
to VR input/output devices. 
The [WebVR API] specifies data structures and conventions for controlling
the headset. This includes focal length, resolution, and timing.
The interface is important because the realtime nature of displaying on the
quickly moving head display requires a lot of coordination between the display
and the renderer.

Hopefully this API will allow browser games and such to adapt to multiple different
headsets and controllers.

### aframe.io

[AFrame] is a JavaScript system that specifies HTML extensions to define 3D scenes which
are displayed with WebGL. So it is a simple authoring tool for creating 3d scenes.
It is fairly new and doesn't have a lot of controls for very complex scenes
(multi-threading, ...).

### OSVR

[OSVR] is an effort to build an open source VR system.
[OSVR on Github].
While there are several proprietary
systems, this tries to be the open, hackable version.
They have an SDK and a
[2160 X 1200 dual display headset] which is part of their Hacker Development Kit ([HDK]).
The software seems to be built for Windows and Mac.
OSVR is maintained by Sensics and Razer.

[Portland Virtual Reality Meetup]: http://www.meetup.com/Portland-Virtual-Reality-Meetup/events/231253911/
[AFrame]: http://aframe.io/
[WebVR]: http://webvr.info
[WebVR API]: https://developer.mozilla.org/en-US/docs/Web/API/WebVR_API
[OSVR]: http://www.osvr.org/
[OSVR on Github]: http://osvr.github.io/
[2160 X 1200 dual display headset]: http://www.osvr.org/forum/viewtopic.php?f=2&t=3930
[HDK]: http://www.osvr.org/hdk2.html

