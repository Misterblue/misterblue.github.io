---
layout: post
status: publish
published: publish
title: More Ogre Dynamic Loading
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 821
wordpress_url: http://misterblue.com/?p=821
date: 2009-06-20 01:45:49
categories:
- Misterblue
- Programming


---
I updated my page on <a href="http://misterblue.com/programming/dynamic-ogre-resources">dynamically loading meshes, materials and textures</a> in Ogre with information for textures. Turns out that the requests for the textures works out but that, again, the containing mesh has to be reloaded to get the texture to pop up in the scene. The code for finding which meshes need reloading is included.
