---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: draft
title: Loadable Abilities for Basil
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2022-02-08 17:08:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- Basil
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
Had this idea the other day.

The Basil protocol is built around `entities` and `abilities`.
The SpaceServer creates entities in the Basil viewer and adds abilities
to that entity.
The abilities add attributes to the entity and the values of the
attributes effect the entity's actions in the rendered world.
So, there would be abilities like "camera follow" which would be
added to a camera entity to cause the camera to follow something
(usually an avatar). Or maybe "instance" which adds "pos" and "rot"
properties to an entity and makes it appear somewhere in the view.

One problem with that design would be that  the abilities need
to be embedded into Basil. That is, abilities would have to be part
of Basil's protocol definition (this are the abiltities that are defined)
and thus would be rather static.

Also, abilities could get very complex. Like adding an animation
to a boned entity. Or just adding the bones. There might be scripted
behaviors for entities that is required to be implemented in the viewer for
latency issues.

So, the idea I had was: what if I could upload abilities? I could
define an API to the Basil entity internals and then individual
ability behaviors could be coded separately and dynamically added
to Basil.

Since the first Basil is for the browser, the abilities could be
Javascript code. But then I thought, what about [WebAssembly]?
That has the advantages of making other languages available as
well as not being tied to the browser since there are engines
for different languages and OS's.

An interesting idea. It would mean cleaning up the intefaces inside
Basil (which is a good thing in any case). Standardizing an internal
API. And then figuring out [WebAssembly].

Hummm. I wonder...

[Basil]: 
[WebAssembly]: https://webassembly.org/
