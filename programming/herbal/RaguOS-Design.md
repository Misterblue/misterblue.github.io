---
layout: page
style: herbal3d
title: "RaguOS: Design Discussion"
---
<div id="herbal-toc">
  <ol>
    <li><a href="#raguos-module-based-spaceserver-frontend-for-opensimulator">Introduction</a></li>
      <ol>
        <li><a href="#choice-of-region-modules">Choice of Region Modules</a></li>
      </ol>
    <li><a href="#Loden">Loden</a></li>
      <ol>
        <li><a href="#editing-mode">Editing Mode</a></li>
      </ol>
    <li><a href="#RaguOS">RaguOS</a></li>
      <ol>
        <li><a href="#editing-mode">Editing Mode</a></li>
      </ol>
  </ol>
</div>

# RaguOS: Module Based SpaceServer Frontend for OpenSimulator

"Ragu" is the code name for a SpaceServer that makes an [OpenSimulator] grid/region available
to a [Basil Viewer].
This document describes the implementation of [RaguOS] which is a set of [OpenSimulator] region
modules that convert and presents region contents so it fits into the [Herbal System].

Because of the limitations of the OpenSimulator region content format, the region must
be converted before use. This conversion provides:

* Formats that can be used by simplified viewers (convert to GLTF, JPEG, ...);
* Reduces triangle and draw count (for better performance in browser and mobile [Basil Viewer]s);
* Converts content into "drawable" form for sending to a viewer
  (as opposed to sending the original, editable content);
* Provides level-of-detail ("lod") versions of region content (for more efficient display)

This conversion is done by the [Loden] region module.

Once the region contents have been converted, [RaguOS] acts as a SpaceServer to a [Basil Viewer]
to display and interact with the region's contents.

## Choice of Region Modules

These routines ([RaguOS], [Loden], etc.) were created as [OpenSimulator] region modules
because:

* ease of implmentation;
* [Loden] is essentially a "copy-bot" and thus creating it as a separate program seemed questionable;
* modules are the extensibility system for [OpenSimulator];
* [RaguOS] requires object update events to implement editing, avatar movement, object movement,
  and all other region update operations

Two options for making them separate programs would be to either:

* make them a proxy that talks LLLP[^1] and acts on all the content changes and events as presented by the legacy viewer protocol, or
* create a region module (probably based on [Dispatcher]) that presents a new protocol

The major advantage of separate programs is not requiring the rebuilding of the regions
simulator with the [Loden] and [RaguOS] modules. This is a great advantage for acceptance of
the [Basil Viewer] by the [OpenSimulator] community. 

# Loden

Description of Loden operation

Region content is separated into four different "layers" that are displayed on top of each other:

* Static
* Dynamic
* Actors
* Editing

## Editing Mode

# RaguOS

## Editing Mode

Description of RaguOS operation


[^1] LLLP: "Linden Lab Legacy Protocol". The combination of TCP and UDP communications used by
all [OpenSimulator] grids and Third Party Viewers.

[OpenSimulator]: http://opensimulator.org/
[RaguOS]: https://github.com/Herbal3d/RaguOS
[Loden]: https://github.com/Herbal3d/Loden
[Dispatcher]: https://github.com/cmickeyb/dispatcher
[WGS 1984]: http://earth-info.nga.mil/GandG/publications/tr8350.2/tr8350_2.html
[Herbal System]: http://herbal3d.org/
[Basil Viewer]: http://basilviewer.org/
[Pesto]: http://misterblue.github.io/pesto/
[BSD License]: http://opensource.org/licenses/BSD-3-Clause
[MIT License]: http://opensource.org/licenses/MIT
[Apache License]: http://opensource.org/licenses/Apache-2.0
[Creative Commons Attribution-NonCommercial 4.0 International]: http://creativecommons.org/licenses/by-nc/4.0/

