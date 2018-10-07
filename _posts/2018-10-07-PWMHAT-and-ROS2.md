---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: PWMHAT and ROS2
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2018-10-07 15:22:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- ROS2
- Robotics
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

To learn robotics and eventually program robot brains I've started building some [ROS2] modules. I have several Raspberry Pi 3B's so I bought some stepping motors and an [Adafruit 16-channel PWM HAT] and set about building some ROS2 packages.

Well, I soon discovered that, while ROS2 is a modernization of the original ROS (which grew organically over the last decade plus), it is not all done. There are many, many features, modules, and conventions that are not complete. So, I scaled my project back a little and started building some basic modules so I could learn the state of things.

First thing I published is a fork of Christian's [raspicam2_node] which compiles and runs under the latest ROS2 build (bouncy). This lead me to needing a version of ROS2 on [Raspbian]. ROS2 is targeted at the latest versions of operating systems and tools. So ROS2 wants that latest version of Linux and also wants 64-bit hardware. But everything hasn't caught up -- the latest version of Raspbian is 32-bit and the previous LTS version of Ubuntu.

To build ROS2 on Raspbian, I created a script in [ROS2OnPiTools] that fetches and builds ROS2 on Raspbian. It takes several hours but it results in a directory that can be copied onto multiple Raspberry Pi's.

Future blog posts will describe the details of this project but the first step is a ROS2 node to drive the [Adafruit 16-channel PWM HAT]. So the project [ros2_adafruit_pwmhat_node] is a simple, Python only node that subscribes to several topics and sets the PWM values on the HAT.

Now that I have stepping motors moving, I will work on capturing images and animating my little camera project. Future blog posts will describe this as it comes together.

[ROS2]: http://www.ros2.org
[Adafruit 16-channel PWM HAT]: https://www.adafruit.com/product/2327
[raspicam2_node]: https://github.com/Misterblue/raspicam2_node
[Raspbian]: https://www.raspberrypi.org/downloads/raspbian/
[ROS2OnPiTools]: https://github.com/Misterblue/ROS2OnPiTools
[ros2_adafruit_pwmhat_node]: https://github.com/Misterblue/ros2_adafruit_pwmhat_node
