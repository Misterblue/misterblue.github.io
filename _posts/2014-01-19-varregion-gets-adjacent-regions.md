---
layout: post
status: publish
published: publish
title: varregion gets adjacent regions, maptiles and better viewer support
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 889
wordpress_url: http://misterblue.com/?p=889
date: 2014-01-19 10:57:31
categories:
- Misterblue
- OpenSimulator
- Blog


---
The 'varregion' source branch in the OpenSimulator source repository has beenÂ updated this last week to fix a lot of the existing varregion problems.Â Some things that now work:

Teleporting to and from large regions using Singularity does not crash anyÂ more. There are still some problems with using the map to select teleportÂ locations greater than 256 but that is being worked on.

Adjacent large regions now works. For instance, you can create adjacentÂ 512x512 regions to reduce the number of border crossings. Remember that theÂ region coordinates are specified in 256m region count so a group of fourÂ 512x512 regions would be specified at 8000/8000, 8000/8002, 8002/8000, andÂ 8002/8002, for instance.

Another feature of adjacent large regions is, if you set your draw distance,Â you can see into the other regions.

Large regions show up in the map correctly. In fact, a lot of work was doneÂ on the Warp3D maptile rendered to make it faster, more functional (it nowÂ does meshes and prim textures[1]) and to not crash.

These changes are in the 'varregion' source branch which is in-sync withÂ the master branch. More testing will make it get into the master branchÂ quicker so test and file those manti.

<span style="line-height: 1.5em;">[1] Check out the new parameters under the "[Map]" section in Opensim.ini.example.</span>

&nbsp;
