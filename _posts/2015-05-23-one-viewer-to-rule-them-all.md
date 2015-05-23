---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
# if status is 'publish', post will apprear in blog roll.
status: publish
title: One Viewer to Rule Them All
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2015-05-23 11:22:20
categories:
- Basil
---
My (previous post)[1] referred to something called a 'viewer'.
Let me describe what I mean by that.

For a person to look into a virtual world, they need some device and some
software to render a view into that virtual world onto that device.
These days, the hot devices are head mounted, stereographic displays
(see [Oculus], [GearVR], and many more) but 2D monitor screens
and tablets and phones do the job.

There is software that creates the pixels for the device.
This software must convert whatever representation the virtual world
keeps its contents in into a coherent three dimensional view for
the device. There are several very hard problems here. 
For instance, if the device is a head mounted display that is supposed
to give an immersive 3D experience (the user is supposed to fell like they
are "in" the 3D world), the view has to move with low latency with the
head so as to not cause nausea.

These are problems of the view (latency, rendering, frame-rate, ...) which
don't have a direct relationship with the actual content of the world
(indirect in that types of content will cause different frame rates and such).
But this leads me to think of the 'viewer' as separate from the content
and even separate from the user interactions.

The [X Window System] was that for 2D windows -- it provided a display
server to which multiple window applications connected to.
One of the applications was a windows manager which created the window
decorations (title bar, scroll bars, ...) and handled the user interactions
(window movement, mouse control, ...).
In the [X Window System], both the content and management were outside the
viewer.
This makes them distributable (could run on different computers, ...)
and modular (multiple window managers, ...).
The [X Window System] viewer focuses on efficiently displaying the 2D
windows and lets everything else happen in the external applications.

What if a 3D version of this was built?
Not just a version of the 2D windows viewer that draws 3D but a viewer
built to fetch and display 3D objects and display them in a 3D space for
some display. The viewer would handle efficiently displaying the right
thing for the particular display and there is no reason why there couldn't
be completely different viewers for different displays.

Behind the viewer would be all the applications that present the
3D objects to the viewer as objects in a space to be displayed.
Another application would manage that space for the user -- whatever
that management should be. And there could easily be different
space and interaction managers.

In future posts I'll talk about this viewer model and how I
believe it is applicable for augmented reality and virtual worlds.

[1]: http://blog.misterblue.com/archive/2015/2015-05-14-a-3d-object-viewer
[Oculus]: https://www.oculus.com/
[GearVR]: http://www.samsung.com/global/microsite/gearvr/
[X Window System]: http://en.wikipedia.org/wiki/X_Window_System
