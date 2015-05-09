---
layout: post
status: publish
published: publish
title: Doing VarRegion for OpenSimulator
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 867
wordpress_url: http://misterblue.com/?p=867
date: 2013-11-29 06:37:28
categories:
- Misterblue
- Programming
- OpenSimulator
- Blog


---
I've taken on the task of porting <a title="Aurora" href="http://aurora-sim.org" target="_blank">Aurora</a>'s variable region feature into <a href="http://opensimulator.org/">OpenSimulator</a>.

This port will use Aurora's protocol extensions so the existing Firestorm and Singularity Aurora support will now work for OpenSimulator. The larger regions size will be restricted to multiples of 256 meters and adjacent regions (the ability to have other regions spacially next to larger regions) will not be implemented and will not work. Additionally, the larger regions must be square. This latter restriction is because the viewers currently (20131101) only use the X size dimension for both X and Y size. These restrictions are enforced by code in <tt>RegionInfo.cs</tt> which truncates and rounds values and output warning log messages.

The size is be specified in the <tt>Region.ini</tt> file:
<pre>[MyRegionName]
RegionUUID = 95ec77ec-58c5-4ce2-9ff3-b6d1900d78a2
Location = 1000,1000
SizeX = 1024
SizeY = 1024
InternalAddress = 0.0.0.0
InternalPort = 9200
AllowAlternatePorts = False
ExternalHostName = SYSTEMIP</pre>
If size is not specified, it will, of course, default to the legacy size of 256.

Since this will be a major change to OpenSimulator that touches a lot of different parts, subsequent posts, will discuss the changes I'm making.
