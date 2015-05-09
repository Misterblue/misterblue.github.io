---
layout: post
status: publish
published: publish
title: LookingGlass progress 20090614
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 814
wordpress_url: http://misterblue.com/?p=814
date: 2009-06-14 07:58:31
categories:
- Misterblue
- LookingGlass
- Blog


---
This weekend's time spent programming (as opposed to pulling weeds and cleaning the garage) was changing the scaling of prims to use the Ogre scaling factors rather than having Meshmerizer scale the vertices information. This will allow me to share vertices information within cube prims. 

Ogre doesn't allow one to share vertices between prims (well, not really true and I will look into creating my own vertices class but that's a ways down the road) but it does have a feature to share the same vertices between all of the sub-meshes within a mesh. That means I can share the vertices between all the sides of the ubiquitous cube. This should divide the memory requirements by nearly 6. Fingers crossed.
