---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: FlatBuffer Documentation
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-04-07 20:32:20
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
Today's work (besides wrestling with email setup) has been defining the [Basil]
protocols using [FlatBuffers]. Mainly because someone in the project I'm working on
has discovered them as a (in theory) faster way of serializing and de-serializing
protocol messages.

[FlatBuffers] were created by some engineers at [Google] as a faster alternative to
[Protocol Buffers]. [FlatBuffers] have a much simpler schema and the serialization
format lays down the data in a data natural way so, at the receiving end, the program
does not need to copy the data but have just be passed a pointer to the data in the
message buffer. All this while still having optional fields and downward compatibility.

The largest problem I've found so far is a lack of documentation. For instance, there
is a 'union' of tables definition in the schema. This defines a field that can be
one of a selection of 'tables' (the schema defines 'table's and 'struct's with the latter
being quicker and more compact but not extensible). The receiver of a message that
includes a 'union' must know what was put in the field so it can parse the correct table
contents. Well, there is an enumeration automatically generated and a special function
that is generated so the receiver can know that. But where is the documentation?
No where that I found.

In the next day or two I'll post some code examples so people Google'ing will find
some working definitions and code.

[Basil]: https://github.com/Misterblue/basil
[Google]: http://google.com/
[FlatBuffers]: https://google.github.io/flatbuffers/
[FlatBuffers Github repository]: https://github.com/google/flatbuffers
[Protocol Buffers]: https://developers.google.com/protocol-buffers/
