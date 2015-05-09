---
layout: post
status: publish
published: publish
title: Varregion and the grid
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 884
wordpress_url: http://misterblue.com/?p=884
date: 2013-12-28 08:54:22
categories:
- Misterblue
- OpenSimulator
- Blog


---
After a brief hiatus recovering from a crashed disk and installing and becoming accustomed with Windows 8.1 (question to MS: what the heck were you thinking???), I've spent more time on the OpenSimulator varregion code.

The code is still on the 'varregion' branch of the source repository and it has been kept pretty close to the 'master' branch. I've added the size information to a bunch of the teleport messages trying to get teleport to a large region working. Sadly, it crashes Singularity whenever you log into or teleport to a non-legacy sized region in grid mode. Works in standalone mode. I haven't tested it yet, but I'm hoping adjacent standalone large regions (like four 512x512) now border cross. It is an iffy thing, though, since there is 'find my neighbor' logic in Scene, GridService, EntityTransferModule, and a few other places. That logic does need some cleaning up.

I found that the Singularity crash when running in grid mode has to do with the fact that the grids out there are not running the 'varregion' code. In particular, OSGrid's grid service is not storing and returning the region size. This means that Singularity gets told the destination region is zero by zero which is assumes means that region is legacy sized (256x256). The simulator, though, thinks the region is larger and sends terrain patches to Singularity for the larger region. Singularity doesn't like that and it crashes complaining about bad terrain patches.

The fix is to get the grid services updated. To that end, I added a new commit to 'master' that adds the size accounting to RegionInfo, RegionData, and GridRegion classes. Since the database code already knows about storing the region sizes, this makes for a downward compatible update to the 'master' branch that does not change any APIs or change any functionality except for passing around and storing the region size along with its location.

Once that patch is distributed or cherry-picked (commitÂ 6869633d76b2a6664743a608e4284b8dd7df85a6), testing will continue.

&nbsp;
