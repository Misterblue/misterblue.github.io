---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
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

While I was porting my
[old ROS2 Python test application](https://github.com/Misterblue/ros2-looker)
to the newest ROS2 Foxy
on my Raspberry Pi's, I discovered that I needed to use OpenCV
to capture images because
`picamera` does not work in 64 bit](https://github.com/waveform80/picamera/issues/540)
.

What's not documented very well (and I spent several days figuring out)
is that, after one has ported to OpenCV,
converting an OpenCV image into a ROS2 message is not obvious.
After a bunch of Google'ing, one discovers that the ROS2 folks
have packaged all the magic into a module called [CvBridge].

OpenCV keeps images in `cv:im` structures
and converting that into a byte array that fits into the ROS2 message
is tricky. Actually, what's expected in a ROS2 image message is not
documented very well so what works is hard to figure out in the first
place.

The ROS2 developers have created some tools for the OpenCV users
and one is a tool that converts OpenCV images into ROS2 image messages.
So, the code ends up looking like:


```python
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge
...
self.bridge = CvBridge()
self.camera = cv2.VideoCapture(0)
self.frame_num = 0
self.publisher = self.create_publisher(Image, "topic", 10)
...
ret, frame = self.camera.read()
if ret == True:
    msg = self.bridge.cv2_to_imgmsg(frame, 'bgr8')
    msg.header.frame_id = str(self.frame_num)   # 'msg' is a ROS2 sensor_msgs/Image.msg
    self.frame_num += 1
    self.publisher.publish(msg)

```

That is, don't try to create the image message yourself.
Instead, rely on the [CvBridge] package to create the whole message
and then fill it in with other information.


[ROS2]: https://docs.ros.org/en/galactic/
[TurtleBot3]: https://emanual.robotis.com/docs/en/platform/turtlebot3/overview/
[Petoi Bittle]: https://www.indiegogo.com/projects/bittle-a-palm-sized-robot-dog-for-stem-and-fun/
[CvBridge]: http://docs.ros.org/en/lunar/api/cv_bridge/html/python/index.html
