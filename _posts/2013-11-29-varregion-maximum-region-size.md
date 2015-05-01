---
layout: post
status: publish
published: publish
title: 'varregion: maximum region size'
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 881
wordpress_url: http://misterblue.com/?p=881
date: 2013-11-29 08:14:19
categories:
- Misterblue
- OpenSimulator


---
Seems that 8192 is a good maximum for region size. Both the viewer and the simulator agree.

To that end, I added <tt>Constants.MaximumRegionSize</tt> and have <tt>RegionInfo</tt> enforcing same.

Having a maximum region size is also good for searching for neighbor regions as this limits the search area. This constant is thus used in the 'find neighboring region' logic as well as the 'find region containing point' logic.

For the moment, this is in the <tt>varregion</tt> branch of the OpenSimulator source repository.
