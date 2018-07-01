---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Convoar and Converting OARs
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2018-07-01 17:10:00
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- OpenSimulator
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
I've been spending a long time working on an [OAR file converter].
For those of you not in the [OpenSimulator] community, an OAR file is a region
archive format -- saving the contents of a region for loading in another region.
So it contains all the meshes, textures, scripts, and assets that completely
define a region's contents.

[Convoar] reads an OAR file and outputs a GLTF scene and image files containing
most of the region information.
Most specifically, textured mesh representation of all the objects described in the OAR file.

Convoar is evolving.
The current version reads an OAR file and outputs either an unoptimized GLTF scene
file or a "material reorganized" GLTF scene.
The output GLTF is not packed or binary so the output GLTF is a JSON .gltf file,
one or more .buf files (containing the vertex information),
and an images directory with the texture files for the mesh materials.
By default, the output textures are either JPG or PNG format depending if
there is any transparency in the texture.

The unoptimized GLTF conversion is a simple conversion of the OAR primitives
which creates many, many meshes and is very inefficient for rendering but is
good for editing (importing into Blender, for instance).

The "material reorganized" scene has object corresponding to each unique material
(texture/color/features) and the meshes have been assigned to each of these material objects.
This renders the scene uneditable but this should greatly reduce the number of draw
calls needed to render the scene in OpenGL/WebGL.

Future versions of convoar with either contain or have tools to perform other
optimizations to the scene and the object therein.

Roadmap-wise, [Convoar] is a first step in developing code that makes
[OpenSimulator] content displayable in a web browser.

[OpenSimulator]: http://opensimulator.org/
[OAR file converter]: https://github.com/Misterblue/convoar
[Convoar]: https://github.com/Misterblue/convoar
[OAR file]: http://opensimulator.org/wiki/OAR_Format_1.0
[GLTF]: https://www.khronos.org/gltf/
