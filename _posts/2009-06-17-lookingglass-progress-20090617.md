---
layout: post
status: publish
published: publish
title: LookingGlass Progress 20090617
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 816
wordpress_url: http://misterblue.com/?p=816
date: 2009-06-17 10:49:04
categories:
- Misterblue
- LookingGlass


---
I spent a few days trying to get Ogre scaling of prim working. Decided to bag it for the moment. I thought that letting Ogre scale the prims would make most of the prims just unit boxes and these I could share vertices of thus reducing the memory problem. Well, it seems that entity scaling affects the coordinates of the entity also so linked sets (prims relative to their parent) would be messed up. Even after fixing that I discovered that the scaling messed up the texture mapping (which I am using Ogre for also) so I would have to scale the texture depending on the scaling of the face the texture was on. Ick.

Anyway, backed out the scaling code, found some bugs (one in the work queue that would ironically make more work) and the arrow keys now move t he agent avatar although the camera doesn't move yet. 
