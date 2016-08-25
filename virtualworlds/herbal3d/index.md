---
layout: page
title: "Herbal3D: Overview of End-to-End Virtual World Infrastructure"
---

WARNING TO ALL READING THIS: As of August 2016, this is a growing document
that is being added to over time. It won't be finished for a month or two
so hang tight.

# Herbal3D: Infrastructure for Virtual Worlds

This document describes an system architecture for storing
and displaying three dimensional objects.
The three dimensional objects is in a scene which can be
used for immersive virtual reality or
can be mapped onto the real world for augmented reality.

Some high level goals of the system are:
be open source,
be secure,
be scalable,
and to be generally extensible.

There are many proprietary systems built for virtual worlds
and for augmented reality.
The systems are proprietary and they have their silo of implementation.
This tends to create a closed ecosystem of libraries and expertise that
does not extend across the open space of the Internet.
This project is to be open source so it can be modified, tweaked,
and added to by the Internet community at large rather than just by the implementers of one company.

This project is intended to be secure.
Secure in the fact that it's designed with security from the beginning rather than
having security added later.
This means passing around authentication, continually checking for access level,
and otherwise enforcing access identity and useage controls at all levels.

The system is to use the latest Internet technologies for scalability.
This means things like containers, multiple processors, the APIs,
micro services than anything else which is hip and new but also usable to
create a system that can grow from one user two million.

The system also designed to be modular and extensible.
We expect to grow and it will gather functionality over time.

There are three target audiences for this: 1) individual hobbyists
(requires easy installation and configuration); 2) the small grid or
game that wants a smallish but extensible operation (requires robust
implementation); and 3) a production environment where millions of
users and bots are interacting.

# Background

This project has grown out of my general interest in virtual worlds.
After working with many existing systems which are client server based
(that is there is a world simulation and the server at a client that receives
some representation of that world to display it) I have noticed
requirements
for scalability, security, and content mixing.
This has led me to start thinking about what it would take to build a
3D viewer where one could see into the world as well as the
needed infrastructure behind that viewer to
store, convert, interact and simulate the virtual world.

Many of the virtual implementations are oriented toward specific use case.
Whether making a multi-user game, or making a very precise real-time
interaction between users, the use case pushes the implementation of existing systems.

Additionally, I've seen several virtual worlds where unbelievably talented creators
have created content in that world but that content was not shareable anywhere else.
Content within one world is locked into that world and the interaction of people
there is locked into that world.
This made me think about how to build a virtual worlds system where an avatar
from one implementation of virtual world could stand next to an avatar from a
different virtual world.
What would such an implementation look like?
How would you build the pieces so that that one viewer allowed the two
simulated avatars to interact from the different worlds?

These lines of thought have lead to the this initial architecture for what
I am calling Herbal3D.
The "herbal" name came from the fact that the first project was a viewer
called "Basil" and from there herb names were used for all the different parts.
From that grew "Herbal3D".

At a less idealistic level, one impetus for creating Herbal3D is the creation of a follow-on
to [OpenSimulator].

OpenSimulator was originally designed as a open source alternative to [SecondLife].
But that was 10 years ago.
In that time, software development workflow has changed,
the tools and workflow have changed,
and, in general, the whole model for implementing a scalabile and massively parallel
application has changed greatly.

OpenSimulator, since it is 10 years old, is also suffering from old age.
It's a centralized service that is broken into regions and thus has scaling problems.
There have been several efforts to make open simulator decentralized and to make it
more scalable in all of its dimensions (like physics and scripting) but, again, the
software is getting long-in-the-tooth and needs updating.

So one of the things Herbal3D is attempting to do is to be an open source alternative
to the many proprietary systems that are being developed for virtual reality
and virtual worlds.
The other solutions are not wrong. They are just not open.

As an open source solution, Herbal3D attempts to be the basis for building
scalable systems.
It is a basis for building virtual worlds infrastructure like OpenSimulator
but using newer technologies and newer design patterns

Refer to [Other Virtual Worlds] for a description of some of the alternatives.

# Grand Architecture

## Session Manager (Pesto)

## Viewer (Basil)

## Space Managers

## Virtual World Simulators

### Asset Repositories

# Security




[OpenSimulator]: http://opensimulator.org/
[SecondLife]: http://secondlife.com/
[YouTube]: http://youtube.com/
[Other Virtual Worlds]: {{ site.baseurl }}/virtualworlds/herbal3d/otherWorlds.html

<!-- vim: shiftwidth=2 tabstop=2 autoindent expandtab
-->
