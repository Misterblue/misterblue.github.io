---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Possible Projects
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2023-05-30 18:29:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- OpenSimulator
- Basil
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
I'm at a decision point -- there are so many possible software projects and I can't decide
which one to choose. Here is a possible list:

- **Basil viewer**: this is advancing the features of the viewer.
    It includes implementing avatars, adding scene rendering features (water, ...),
    and updating the UI to be the WASM modules that run in the client to provide
    world and UI operation.
  - Avatar movement
  - Avatar implementation
  - Shaders for water, lighting, scene
  - Child/adjacent regions
  - WASM UI implementation
  - Reactor into peoperty updates and optional sync back to server

- **Loden**: work on creating the assets for the browser viewer.
    These things are also useful in other projects (like Convoar and Unity viewer).
    There are some refactoring (textures) but mostly is creating the 3d tiles version
    of the region. Also use the real asset database.
  - Integration with grid asset server (solve the access key (capabilities?))
  - Move texture resizing out of the GLTF generator
  - S3 asset storage
  - Create individual GLTF assets on demand
  - Create region 3dTiles down to the individual assets
  - Create avatar to GLTF
    - Close to VRM format and can be used with https://github.com/vrm-c/UniVRM and Unity 

- **OpenSimulator 3d voice service**: OpenSimulator needs a spacial voice replacement.
    On candidate is the voice mixer from HiFi/Overte. The work is figuring out
    how the scalable service is invoked and then adding a Vivox API to the mixer
    (that already has a WebRTC-data and Overte interface). Probably should have a
    plain WebRTC interface also. That could make it generally useful for other VWs.
  - Research the Overte voice service
  - Research the Vivox protocol (viewer to server)
  - Research the avatar position protocol (simuilator to audio server)
  - Understand OS capabilities: how generated and passed around

- **GLTF Avatar for OpenSimulator**: Related to the Loden work, making a GLTF
    version of the OS avatar would be useful in many places. The avatars could
    be used in other VWs as well as the CrystalFrost viewer (see (UniVRM)[https://github.com/vrm-c/UniVRM] ).
  - Research VRM format
  - Research OS avatar format
    - Seems to be Bento bones but a lot of work on mesh modes with sliders
    - (Viewer-Character)[https://github.com/vrm-c/UniVRM]

- **Convoar**: Based on the changes to Loden, add GLTF extensions that contain
    all of the OpenSimulator asset information (creator, transferable, ...).
  - Add GLTF extensions that includes the raw OS prim information
  - Add GLTF extension to hold ownership, etc
  - Add Identity to creator
    - This might include DIDs or some other identity info

There could be more.
