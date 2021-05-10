---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Iamus Walkthrough
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2021-05-10 09:15:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- Vircadia
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
Since July of last year, I have been coding a metaverse-server for the [Vircadia] virtual worlds.
The [Iamus] metaverse-server acts as the coordination point for the independent
domain-servers which host the virtual world space.

When [High Fidelity] open-sourced the code for their virtual world, they
kept the central coordination services private so a new service for
accounts and discovery was needed.

I created [Iamus] with [NodeJS], [ExpressJS], and [MondgoDB].

For anyone picking up the project and making modifications,
there is written documentation on the server's
[design](https://github.com/vircadia/Iamus/blob/master/docs/Design.md),
[building](https://github.com/vircadia/Iamus/blob/master/docs/Building.md),
[running](https://github.com/vircadia/Iamus/blob/master/docs/AdministrationNotes.md),
running as a [Docker image](https://github.com/vircadia/Iamus/blob/master/docs/RunningDockerImage.md),
and various [notes](https://github.com/vircadia/Iamus/blob/master/docs/NotesOnDevelopment.md).

In addition to the written documentation, I created a video walking through the internals
of the code:

<iframe width="560" height="315"
    src="https://www.youtube.com/embed/2DBrDdQK1G0"
    title="Iamus Walkthrough"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen>
</iframe>

This should give anyone modifying [Iamus] an good start.

[High Fidelity]: https://en.wikipedia.org/wiki/High_Fidelity_(company) 
[Vircadia]: https://vircadia.com
[Iamus]: https://github.com/vircadia/Iamus
[Tivoli]: https://tivolicloud.com/
[MongoDB]: https://www.mongodb.com/
[NodeJS]: https://nodejs.org/
[ExpressJS]: https://expressjs.com/
