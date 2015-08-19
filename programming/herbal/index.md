---
layout: page
---
<div id="herbal-toc">
  <ol>
    <li><a href="#3d-virtual-world-and-augmented-reality-architecture">Introduction</a></li>
    <li><a href="#finding-content-servers">Finding Content Servers</a></li>
    <li><a href="#the-basil-viewer">The Basil Viewer</a></li>
    <li><a href="#coordinate-system">Coordinate System</a></li>
    <li><a href="#space-servers">Space Servers</a></li>
    <li><a href="#making-a-system">Making a System</a></li>
    <li><a href="#use-cases">Use Cases
      <ol>
        <li><a href="#use-case:-virtual-worlds">Virtual Worlds</a></li>
        <li><a href="#use-case:-augmented-reality">Augmented Reality</a></li>
      </ol>
    </li>
    <li>Other Stuff
      <ol>
        <li><a href="#some-licensing-philosophy">Some Licensing Philosophy</a></li>
        <li><a href="#herbal-names">Herbal Names</a></li>
        <li><a href="#legal-stuff">Legal Stuff</a></li>
      </ol>
    </li>
  </ol>
</div>

# 3D Virtual World and Augmented Reality Architecture

This article describes an overall system for creating a
virtual world and augmented reality display system.

For virtual worlds, the goal is to have a system where an
[OpenSimulator] avatar can stand next to and interact with a
[High Fidelity] avatar.
For augmented reality, one should be able to look out into the
real world and see information from different sources all merged
into one enhanced view.

I hope that, after reading this document, that you will have an understanding
on how existing world simulations ([OpenSimulator], [High Fidelity], [Sirikata],
to name a few) as well as existing augmented reality systems (ADD SOME HERE)
can be made part of this general architecture.

## Finding Content Servers

Image building a computer system for looking at a place.
This 'view' looking into a virtual world
or looking out into the real world
has a 'camera' at some location that is looking in some direction.
The problem is is figure out what that camera sees and how to access
representations for what should be in the view.

The view process is imagined to be:

* the observer is at a location and looking in a direction
  (a view camera has a location and a direction);
* the world is queried as to what can be seen from here in that direction;
* the response to this query is multiple handles to various information and
  3d object servers that will handle portions of the 3d space being viewed.
  This fills the view space with smaller 3d spaces and their associated
  servers who have the information to fill the spaces;
* the viewer then queries the servers for contents for the smaller view spaces;
* the viewer displays the received information and objects relative to
  the viewers camera location;
* as the viewers camera moves, the display of information and objects is
  adjusted and, potentially, additional world queries are made to find more
  information and object servers to fill the viewed space.

So, the idea is that a view consists of the combination of multiple spaces.
For instance, looking down a street one would see multiple businesses
and each of those businesses would have something they want to display
for their 3D space that you see.
Similarily, for a virtual world, one would look out into a vista that
consists of the local village as well as the mountains in the distance.

This introduces the idea of a service
that holds information about all the object servers for filling 
the world space.
All the object servers  register with this "location service"
and the location service is queried by viewers to get the handlers
for all the space being viewed.
Think of it as the view being split into 3D
areas each of which has a different server supplying the objects to
display in that area.

So, for a virtual world, a query for a view might return a server who
can present a detailed display of the local village and another server
who will present a distant view of the mountains surrounding the village.
The query a viewer makes includes the distance and pixel size needed by
the viewer so a server can see that this view is far away an only requires
a low resolution view of the object[^1]. That the query includes the viewer
requirements (resolution, interaction requirements, ...) means that different
services could respond for different spaces in the viewed scene.

The viewer is then responsible for adding together the information from
the multiple space servers into one view. Since this is 3D space, addition
is easy.

## The Basil Viewer

This leads us to the viewer -- the piece of code that combines the objects
presented by the multiple space servers into a coordinated view for a user.
For ease of reference, the initial viewer is named "Basil".

Basil has the job of communicating with multiple space servers and combining
their objects into a consistent view for the user.

Think of the [X11 server] architecture for 2D content.
The X11 server was a viewer service for 2D content.
Multiple 2D content providers (xterm consoles, xclocks, ...) connected to
one server that managed the display of multiple 2D object on one display.
The applications that presented 2D information were separate from the
display engine and the manager for the multiple 2D areas (the "windows manager")
was also separate from the 2D applications.

Basil aspires to that design but for 3D spaces.
So, consider multiple sources of 3D objects filling the 3D space viewed
while the manager of this coordinated view is separate from both the viewer
and the multiple sources.
This would solve many problems of existing viewers where the content connection
and the UI were intimately linked.
For Basil, the UI would be separate code that connects to the view service and
manages the multiple space servers.
The UI is just another service and thus can be replaced if needed.

Basil connects to the multiple space services and gets objects to display
in the viewed 3D space.
The interface between the space servers and Basil needs to be a standard
interface that allows the space servers to properly display its content.
The current state-of-the-art is represented in the multiple game
engines in the world.  
So, in the most abstract sense, Basil is *just* a common interface to most of
the features available in current game engines
(meshes, shaders, animations, boned-objects, textures, materials, etc).
That plus some coordination
functions so multiple object suppliers can present a unified view for the user.

One feature of Basils additive nature is that multiple space servers can
fill the same space.
For instance, if a space was filled with both static and dynamic objects
(tables and walls along with a realtime avatar), there could be multiple
space servers with one presenting the static objects and a different
one displaying the realtime avatar.
In this case, the two space servers could be using completely different
protocols, caching schemes, and update strategies for the display of their objects.

Basil considers the world made up of 'layers' that fill 'spaces' within
a 'view' and there may be multiple layers within a space.
Basil's job is adding together all the layers and managing the updates
and optimizations necessary for efficient display of all the 3D data.

An important point about 'viewers' -- viewers just create a view into a 3D world
and what defines the Basil viewer is the protocol connecting it to
the space servers.
Just like the X11 Server, there will be multiple implementations of the
Basil viewer for different applications.
What is rendered depends on the display and user requirements.
There can be viewers that display a stereoscopic view (for devices
like [Oculus]). There can be viewers that display on traditional 2D
computer screens.
There can also be viewers that describe what is seen for the sight impaired.

The 'viewer' concept is the idea of a programming
module that is able to get information about multiple spaces and then
render those spaces for a user.
Rendering a view for a machine is not precluded either.

## Coordinate System

One problem with merging multiple real world and virtual world
spaces is the coordinate system.
The Herbal System attempts to solve this by using a 
known coordinate system that all applications can fit into.
That coordinate system is [WGS 1984] which is the world coordinate
system used by the GPS system.
This supplies an <X,Y,Z> coordinate system for the planet earth.
This puts all virtual world and augmented reality application into
the real world.
All measurements are in meters.

While real-world coordinates work for augmented reality, for
virtual worlds there just needs to be a mapping from the
virtual world coordinates to the real world.
There is no reason that an [OpenSimulator] virtual world can't
exist on a coffee table in some person's house.

It is expected that coordinates will be <x,y,z> with each coordinate
as a [double] (64 bit floating point number).
This gives about 15 significant digits of coordinate information
which should be sufficient for both large scale locations and
micro-scale worlds.
It is expected that there are transformations available to convert
planetary coordinates to localized spherical tangential plane coordinates
and back.

There will certainly be optimizations in the protocols to
transfer smaller or relative coordinate information.

## Space Servers

Basil finds and communicates with "space servers"[^2].
Space servers have the job of presenting to Basil the view of
the space they are managing.
So, remember that Basil sees multiple space servers with some
managing specific 3D spaces in the view and some overlapping and
presenting different layers in a 3D space in the view.
As mentioned earlier, the space server has some information from
Basil as to the requirements of the display.
For instance, the space being served could be in the distance and
thus a low resolution version of the world.
Or the display could require edit level access to the objects.

Space servers are the interface between the view and the simulated world.
The world could be stores along the road or complex physical
simulations of objects in a virtual world.
So the space servers have to solve the problems of synchronization and
latency between the simulated world and the view being presented.
This is the main job of the space servers that connect to Basil.

The space server is where most of the adaption and conversion happens
between some virtual world server.
The space server is the adaptor between, for instance, a [OpenSimulator]
based region and Basil.
This has to include format conversion and event passing.
Coordination with user interface elements would enable
editing and movement of in-world objects but that is a feature
of the space server interface to Basil and not a feature of Basil --
Basil only enables the features of selection and pointing to be used
by user interface and space servers.

Consider a virtual world like [OpenSimulator].
The space server for this virtual world would be responsible for
giving Basil information about which objects are in view
(meshes and boned avatar representations)
and where to fetch representations of those objects for viewing.
To make the objects available to Basil, format conversion might be
necessary as well as coordinate conversion to make the
[OpenSimulator] regions appear in a reasonable place in the
real-world coordinates of Basil.

## Making a System

The space server query service and the Basil viewer are just parts
of a system that can create a view of layers of a world. The following
diagram shows many of the parts.

There exists a session server ([Pesto]) that handles the user's ongoing
state and which viewer is interesting at the moment.
Although not an early part of the Herbal design, it is expected that,
in the future, users will always be online and their connection to the
shared world will be through multiple viewers.
Pesto has the job of connecting the user to viewers and the necessary
services in these different environments.

One early project is [Ragu] which is a space server for [OpenSimulator].

# Use Cases

## Use Case: Virtual Worlds

## Use Case: Augmented Reality

# Extra Stuff

## Some Licensing Philosophy

I believe that business and innovation is advanced by common infrastructures.
One example is the road system.
There could be independently owned roads with tolls so each owner can support
their piece of road.
Think of such a world.
Different pieces of road would conform to different design standards.
Toll collection system would be different with different payment and membership
requirements.
Traveling any distance would require constantly stopping and paying and
navigating different lane sizes and pavement qualities.
Some destinations just wouldn't have roads.

But if an entity creates a common infrastructure of uniform roads, travel
and shipment becomes easy. The roads still aren't free (taxes through
a government or some such) but now commerce and mobility explodes.

My assertion is that overall prosperity is greater when there are many
uses and businesses built upon the common infrastructure vs the world
where there are businesses making money off creating the infrastructure.
Some economists probably have opinions here.

For the [Herbal System], I see it as a common infrastructure that enables
shared and extensible viewing of images in the real and virtual worlds
and the overall ecosystem will be larger, more innovative, and more
prosperous if this common infrastructure is created and made available
without barriers.

This philosophy means the sources will be "open source" licensed with
some core  technologies licensed with GPLv3 so the feature is always
available and in the open.
Some of the modules could have instances
created for specific uses and, since the glue between components is
the protocols, these instances could be proprietary.
Addtionally, some reference designs of certain modules could
have a more flexible license ([BSD License], [Apache License], [MIT License], ...) 
but, in general, the core development should happen in a larger,
public community.

## Herbal Names

Just for fun, the various components have herbal names.
This started with the [Basil Viewer] and 
spilled over into [Pesto] and [Ragu].
Green, leafy herbs are good for you.

## Legal Stuff

This document is covered by [Creative Commons Attribution-NonCommercial 4.0 International].

Since every idea in  the world is covered by a patent somewhere, I make
no claims as to the ownership or availability of any design or concept
described above.

[^1]: see work in [Sirikata] for querying space servers by pixel size.
[^2]: a term coined from [Sirikata]

[WGS 1984]: http://earth-info.nga.mil/GandG/publications/tr8350.2/tr8350_2.html
[double]: https://en.wikipedia.org/wiki/Double-precision_floating-point_format
[X11 Server]: https://en.wikipedia.org/wiki/X_Window_System
[Basil Viewer]: http://basilviewer.org/
[View Service]: http://loc-loc.net/
[OpenSimulator]: http://opensimulator.org/
[High Fidelity]: http://highfidelity.io/
[Oculus]: http://www.oculus.com/
[Herbal System]: http://herbal3d.org/
[Pesto]: http://misterblue.github.io/pesto/
[Ragu]: http://misterblue.github.io/ragu/
[Sirikata]: http://sirikata.org/
[BSD License]: http://opensource.org/licenses/BSD-3-Clause
[MIT License]: http://opensource.org/licenses/MIT
[Apache License]: http://opensource.org/licenses/Apache-2.0
[Creative Commons Attribution-NonCommercial 4.0 International]: http://creativecommons.org/licenses/by-nc/4.0/

<!-- vim: ts=2 sw=2 et ai
-->
