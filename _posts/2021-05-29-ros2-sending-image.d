---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: draft
title: ROS2 Sending Image
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2021-05-29 21:51:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- ROS2
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
I don't know why this is not documented better but...

While I was porting my old ROS2 Python test application to the newest ROS2 Foxy
on my Raspberry Pi's, I discovered that I needed to use OpenCV
to capture images (
[`picamera` does not work in 64 bit](https://github.com/waveform80/picamera/issues/540)
)
and that
creating an ROS2 image message in Python is not simple.

What's not documented very well (and I spent several days figuring out)
is that, after one has ported to OpenCV (since `picamera` doesn't work)
converting an OpenCV image into a ROS2 message is not obvious
and all the magic has been packaged into [CvBridge].

Obvious, right?

Despite the sarcasm, OpenCV keeps images in `cv:im` structures
and converting that into a byte array that fits into the ROS2 message
is tricky. Actually, what's expected in a ROS2 image message is not
documented very well so what works is hard to figure out in the first
place.

The ROS2 developers have created some tools for the OpenCV users
and one is a tool that converts OpenCV images into ROS2 image messages.
So, the code ends up looking like:


```python
from cv_bridge import CvBridge
...
self.bridge = CvBridge()
...
ret, frame = self.camera.read()
if ret == True:
    msg = self.bridge.cv2_to_imgmsg(frame, 'bgr8')

```

That is, don't try to create the image message yourself.
Instead, rely on the [CvBridge] package to create the whole message
and then fill it in with other information.


[ROS2]: https://docs.ros.org/en/galactic/
[TurtleBot3]: https://emanual.robotis.com/docs/en/platform/turtlebot3/overview/
[Petoi Bittle]: https://www.indiegogo.com/projects/bittle-a-palm-sized-robot-dog-for-stem-and-fun/
[CvBridge]: http://docs.ros.org/en/lunar/api/cv_bridge/html/python/index.html
