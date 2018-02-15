---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Projects and Versions
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2018-02-14 20:13:20
# categories: VR, Robotics, OpenSimulator, Basil, Programming, LookingGlass,
#      Fun and Weird, Travel, Thoughts, Life, Meta, Family, Photography
categories:
- OpenSimulator
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
Haven't posted in a while.
Well, really, no one reads my little blog so no one has missed my missives.

To catch up:

After doing some work on [region simplification] (for displaying [OpenSimulator]
regions in a browser),
I've been trying to create an [OAR] to other format converter.
[OAR] files are the region archive format of [OpenSimulator].
The OAR file reading code is in C# (the native language of [OpenSimulator] ).
I started thinking that the best output format would be 
[GLTF] since it was new and upcoming.
There are [conversion toolsets] in the [Cesium] project and
it looked like the browser world was moving there.

Well, I ended up writing my own GLTF format exporter and had it more-or-less
working with [ThreeJS].

Then, the [GLTF] standards group decided that the world needed a version 2 of
the [GLTF] format. Over many months (and I mean MANY), the standard and then all
of the tools in the pipeline converted from [GLTFv1] to [GLTFv2].
Then there was the wait for the [GLTF extensions] to convert to version 2.
As of this writing, I'm not sure all the tools have caught up.

It then occured to me that I could use an existing format conversion library
to convert the OAR scene to many different formats.
So I found [Assimp] that reads and writes many different 3D formats.
One problem with that choice is that [Assimp] is a C++ library and, as
mentioned above, I was working in C#.

An interface library was required so I found [Assimp-net].
Well, actually one of the [forks of Assimp-net] which had been updated
recently. But it had been updated to the most recent Microsoft C# framework
which, it turned out, was not yet supported by everything.

Sigh. It is frustrating spending time playing with tool versioning when I
just wanted to do some 3D object conversion.
It feels like I started the day trying to build a house.
But, to build that house, I needed a hammer.
So I needed to research what hammer options were available.
To get the hammer option I needed, I had to then study forging and how to forge
the type of hammer I needed.
Finally, after weeks of researching hammers and forging and where to dig
up the iron oar, I look up and there is still the empty lot where my
house should be.

I'm shelving that project to let the tools mature a bit. In the mean time,
it's off to building robots!

[region simplification]: https://blog.misterblue.com/2017/2017-05-29-simplifying-regions
[OAR]: http://opensimulator.org/wiki/Load_Oar_0.9.0%2B
[OpenSimulator]: https://opensimulator.org/
[GLTF]: https://www.khronos.org/gltf/
[GLTFv1]: https://github.com/KhronosGroup/glTF/tree/master/specification/1.0
[GLTFv2]: https://github.com/KhronosGroup/glTF/tree/master/specification/2.0
[GLTF extensions]: https://github.com/KhronosGroup/glTF/tree/master/extensions
[conversion toolsets]: https://github.com/AnalyticalGraphicsInc/gltf-pipeline
[Cesium]: https://cesiumjs.org/
[ThreeJS]: https://threejs.org/
[Assimp]: http://www.assimp.org/
[Assimp-net]: https://github.com/assimp/assimp-net
[forks of Assimp-net]: https://github.com/mellinoe/assimp-net
