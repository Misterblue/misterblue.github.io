---
layout: post
status: publish
published: publish
title: 'Varregion: crossing region boundries'
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 879
wordpress_url: http://misterblue.com/?p=879
date: 2013-11-29 08:00:55
categories:
- Misterblue
- OpenSimulator


---
Most of the 'move to new region' code is based on checking boundaries. There is much code related to computing if an object or avatar has crossed a region boundary and then computing the address of the next region from same. Introducing variable sized regions messes a lot of this computation up. That is, the code doing the arithmetic usually assumes it knows the address of the next region based on a known region size and them can compute the location of the next region based on that. With varregions those assumptions no longer hold. Varregion implementation means that the computation of region base locations and border locations moves to the GridService who is the entity who really knows the size of all the regions and what is adjacent to what.

The realization that location to region computation is really a GridService operation lead me to totally rip apart the grid boundary checking code and replace it with two functions: <tt>Scene.PositionIsInCurrentRegion(Vector3 pos)</tt> and then <tt>IGridService.GetRegionContainingWorldLocation(double X, double Y)</tt>. The former function tests to see if the object/avatar has moved out of the current region and the latter gets the region moved into.

A side note is the computation of positions. A region has a base X,Y that is measured in meters and in "region units" (the number of 256 regions to this point). For instance, the region location of (1000,1000) is in 'region units' which is the number of 256 meter regions to the location. The "world coordinate" of the region is (256000, 256000) -- the meters from zero. These meter measurements are usually passed around at 'int's or 'uint's. An object/avatar within a region has a relative position -- relative to the base of the region. This relative location is usually a 'float'. So an object would be at (23.234, 44.768) withing a region. An object's world location, though, must be a 'double' since a C# float has only 6 or 7 significant digits. An object's relative location (float) plus a region's base (uint) are combined into a world coordinate (double) that can be used to find the region that includes Â that point.
