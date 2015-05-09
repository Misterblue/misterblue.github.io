---
layout: post
status: publish
published: publish
title: 'VarRegion: adding TerrainData and HeightmapTerrainData classes'
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 875
wordpress_url: http://misterblue.com/?p=875
date: 2013-11-29 07:18:24
categories:
- Misterblue
- OpenSimulator
- Blog


---
One major problem is passing the terrain data from the region to theÂ protocol stack. The existing implementation passed an array of floatsÂ that were presumed to be a 256x256 array of region terrain heights.Â TheÂ <tt>TerrainChannel</tt>class is an attempt to hide the terrain implementationÂ fromÂ <tt>TerrainModule</tt>.Â <tt>TerrainChannel</tt>Â can't be passed into the protocol
stack (LLClientView) becauseÂ <tt>TerrainChannel</tt>Â is defined as part of <tt>OpenSim.Region.Framework</tt>Â which is not visible to the protocol code.

My solution is to create theÂ <tt>TerrainData</tt>Â class inÂ <tt>OpenSim.Framework.</tt>Â <tt>TerrainData</tt> just wraps the data structure for the terrain and additionally hasÂ the attributes giving X and Y size.

I didn't want to change the signature of IClientAPI since so many external modulesÂ rely on it.Â It should be Â changed to pass <tt>TerrainData</tt> rather than a <tt>float[]</tt>.Â I decided to not change IClientAPI but rather have <tt>LLClientView</tt> ignoreÂ the passed array and instead reach back into the associated scene and fetch theÂ <tt>TerrainData</tt> instance.

At the moment, all of these changes are in the <tt>varregion</tt> branch of the OpenSimulator repository.
