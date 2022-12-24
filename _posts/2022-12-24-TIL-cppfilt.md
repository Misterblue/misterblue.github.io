---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: TIL (Today I Learned) About c++filt
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2022-12-24 07:35:21
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- Programming
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
I've been working on this project[1] where I'm compiling different C++ libraries
and statically linking them together.
I had problems with undefined symbols.
And the undefined symbols were mangled C++ symbols.
If you didn't know, C++ creates "mangled" symbols for all your human readable
symbols to solve the global namespace problems that C++ inherited from C.
The article [How To Mangle And Demangle A C++ Method Name] explains it well.

The problem I had was that one library had the symbol 
`_ZNK16btCollisionShape17getBoundingSphereER9btVector3Rd`
and another library referenced
`_ZNK16btCollisionShape17getBoundingSphereER9btVector3Rf`
.
What was different?

Well, the above referenced article references the "well known" tool of `c++filt`.
Of course!!

```
user@ubuntu:~> c++filt _ZNK16btCollisionShape17getBoundingSphereER9btVector3Rd
btCollisionShape::getBoundingSphere(btVector3&, double&) const
user@ubuntu:~> c++filt _ZNK16btCollisionShape17getBoundingSphereER9btVector3Rf
btCollisionShape::getBoundingSphere(btVector3&, float&) const
user@ubuntu:~>
```

Looks like I am building one library with double precision turned on
and the other was referencing it with double precision turned off.
Now I know what to fix.

There are just so many tools in Linux.

[1]: BulletSim in [OpenSimulator](http://opensimulator.org)
[How To Mangle And Demangle A C++ Method Name]: https://blog.oakbits.com/how-to-mangle-and-demangle-a-c-method-name.html
