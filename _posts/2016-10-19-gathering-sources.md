---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Gathering Prim Sources
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-10-19 21:33:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
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
Today's work has been gathering sources for prim construction. The base library
is [PrimMesher]. Then there is [MeshmerizerR] which is part of [libopenmetaverse].
(By the way, the "R" in "MeshmerizerR" is my initial.)
"MeshmerizerR" is different from [Meshmerizer] that is in [OpenSimulator] in that
it builds "faceted meshes" -- meshes that are renderable with all the prim
faces separated so textures, etc can be applied.

I should explain that, in the beginning, [SecondLife](r) defined all objects in
their virtual world with [procedural shapes]. These are the 'prim's of which I speak.
A 'prim' is a geometric shape (circle, square, ...) projected along a
path and then twisted, cut, and otherwise modified by parameters.
The parameters for the construction of the displayable mesh is a 'prim description'.
The SecondLife(r) viewer would receive prim descriptions from the server
and construct meshes for display. This design made sense when bandwidth
was very limited (back in the modem days).

[PrimMesher] was independently developed code that implements the conversion
of prim description to mesh.

[libopenmetaverse] is an independently developed SecondLife(r) protocol client.
It has many functions for scripting a SecondLife(r) or OpenSimulator virtual world
but it also includes functions for calling PrimMesher and created meshes.

The [GitHub] copies of [PrimMesher] and [MeshmerizerR] haven't changed in a long time
(and, in one case, the developer has sadly passed away)
but they have been forked and copied into other viewer projects. 
This means that, if improvements were made, they are in other source repositories.
Thus the job of finding the improvements and collecting them.

SecondLife(r) has added other formats and now there are [sculpties] as well as meshes.
The mesh reading code has been added to [OpenSimulator] so that code needs to
be incorporated into my code.
Luckily, all of this code uses the [BSD License] so the merged code will be distributable.

I might end up creating a pull request or patch to update [libopenmetaverse].

I also spent some time today installing and playing with [High Fidelity]'s virtual
world Sandbox and Interface. I will want to look into their asset storage system
but the user interface and experience is still pretty rough. Not sure where they
are going with their system but they have developed a lot of very cool avatar
and infrastructure technology.

[PrimMesher]: https://github.com/lkalif/PrimMesher
[libopenmetaverse]: https://github.com/openmetaversefoundation/libopenmetaverse
[MeshmerizerR]: https://github.com/openmetaversefoundation/libopenmetaverse/blob/master/OpenMetaverse.Rendering.Meshmerizer/MeshmerizerR.cs
[Meshmerizer]: http://opensimulator.org/viewgit/?a=viewblob&p=opensim&h=0d22e9680b470cbf4d7d4136b0c1a5a0965513f2&hb=586e4cf163cd68b47fce0b25ee34a0155d41bf4c&f=OpenSim/Region/PhysicsModules/Meshing/Meshmerizer/Meshmerizer.cs
[OpenSimulator]: http://opensimulator.org/
[SecondLife]: http://secondlife.com/
[procedural shapes]: http://wiki.secondlife.com/wiki/Primitive
[sculpties]: http://wiki.secondlife.com/wiki/Sculpted_prim
[GitHub]: https://github.com/
[BSD License]: https://opensource.org/licenses/BSD-3-Clause
[High Fidelity]: https://highfidelity.com/
