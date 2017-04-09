---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Coding Flatbuffers
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-04-08 21:50:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
- Programming
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
Not much new running code to report today.

There are those days when you just code infrastructure and new running features
don't come about. They will soon.

The previous version of the browser version of [Basil] had all its pieces integrated
into one module. To effect the distributed Basil architecture, I need to create the
messaging system that goes between the modules. That means improving the
[Basil protocol] and coding all the [Flatbuffers] message construction and decoding code.

[Basil]: https://github.com/Misterblue/basil
[Basil protocol]: https://github.com/Misterblue/Basil-protocol
[FlatBuffers]: https://google.github.io/flatbuffers/
[FlatBuffers Github repository]: https://github.com/google/flatbuffers
