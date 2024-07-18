---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Writing Down Projects
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2024-07-17 18:29:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- Programming
- VR
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
It's been a long year and I've done a bunch of misc project support but haven't
done any of the larger projects I listed last year.
No major deliverables.

So, what's up now? I'm still interested in the
[OpenSimulator](http://opensimulator.org)
virtual worlds but have been spending time supporting various spin-offs:

[NGC](https://github.com/OpenSim-NGC)

[CrystalFrost](https://github.com/JennaScvl/Crystal-Frost-Viewer)

So, what do I want to accomplish in the next few months? Some possibilities are:

- **AIS Inventory**: add newer SL inventory interfaces to OpenSimulator.
    This means coding the inventory capability. It would contain the base code
    with the HTTP interface separate so that the code could be used for
    both OpenSimulator core (as a region module) and in NGC as a service.

- **ASync Interface for libreMetaverse**: 
    Several viewer projects are using libreMetaverse as their connection to the
    simulator. The internal API needs an update from the callback form to
    the newer Task model. Along the way, I'd like to document the internal
    API and thus make it easier for new people to use.

- **OpenSimulator interface for GLTF content**:
    I had the odd idea of creating a "capability" (modular API unit of the client/simulator
    interface) that returned GLTF versions of assets.
    That is, rather than inventing a new way of fetching GLTF items like I did for
    the [Basil viewer](https://github.com/Herbal3d/basil)
    , a viewer could see that the feature is available (in the list of available
    capabilities received at login) and thus fetch the GLTF versions.
    This is would incorporate
    [convoar](https://github.com/Misterblue/convoar)
    code in a way usable by different systems.
    I think this also might include adding
    [WebTransport](https://www.w3.org/TR/webtransport/)
    communication connection to OpenSimulator for browser based viewers.

The last project is a slightly different approach to what I did for Basil.
I had created a new protocol and built region modules (Ragu, Loden, ...) to
implement the protocol. I still like the idea of creating a Wayland-like
protocol for separating the viewer from world logic but that's for another time.
