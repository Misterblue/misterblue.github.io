---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Veritesting
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-06-16 17:34:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
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
The latest *Communications of the ACM* (6/2016 Vol 59. No 6) has the interesting article
[Enhancing Symbolic Execution with Veritesting].
This describes a program testing method called "symbolic testing".
This is where, rather than stepping through the program for specific test values,
one pushes all values through every path of the program.
Got that?

It is a way of testing programs by pushing "symbols" through all the paths of the program
and the symbols represent all possible values that values could have at that point in
the program.

Mind blown. :astonished: :boom:

Because I have been programming computers for decades,
I have a lot of programming habits left over from a more constrained era.
I still worry about the amount of memory or the number of
iterations. While it *is* a consideration and performance is always necessary, the limits
and bounds have changed a lot.

What [Moore's Law] has made posssible is astonishing.
From deploying deep learning everywhere to, well, simulating every path in a program.

It is a lesson I need to internalize and I should not be limited by what I feel is computable.

[Enhancing Symbolic Execution with Veritesting]: http://dl.acm.org/citation.cfm?doid=2927924
[Moore's Law]: https://en.wikipedia.org/wiki/Moore%27s_law
