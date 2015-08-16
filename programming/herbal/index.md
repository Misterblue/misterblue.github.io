---
layout: page
---
<div id="herbal-toc">
  <ol>
    <li><a href="#3d-virtual-world-and-augmented-reality-architecture">Introduction</a></li>
    <li><a href="#finding-content-servers">Finding Content Servers</a></li>
    <li><a href="#the-basil-viewer">The Basil Viewer</a></li>
    <li><a href="#coordinate-system">Coordinate System</a></li>
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
virtual world storage and display system.
The idea is that, for both virtual worlds and augmented reality,
the basic infrastructure is the same.

For virtual worlds, the goal is to have a system where an
[OpenSimulator] avatar can stand next to and interact with a
[High Fidelity] avatar.
For augmented reality, one should be able to look out into the
real world and see information from different sources all merged
into one enhanced view.

## Finding Content Servers

## The Basil Viewer

## Coordinate System

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

## Legal Stuff

This document is covered by [Creative Commons Attribution-NonCommercial 4.0 International].

Since every idea in  the world is covered by a patent somewhere, I make
no claims as to the ownership or availability of any design or concept
described above.

[Basil Viewer]: http://basilviewer.org/
[OpenSimulator]: http://opensimulator.org/
[High Fidelity]: http://highfidelity.io/
[Herbal System]: http://herbal3d.org/
[BSD License]: http://opensource.org/licenses/BSD-3-Clause
[MIT License]: http://opensource.org/licenses/MIT
[Apache License]: http://opensource.org/licenses/Apache-2.0
[Creative Commons Attribution-NonCommercial 4.0 International]: http://creativecommons.org/licenses/by-nc/4.0/

<!-- vim: ts=2 sw=2 et ai
-->
