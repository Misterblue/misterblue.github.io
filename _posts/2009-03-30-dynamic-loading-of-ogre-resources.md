---
layout: post
status: publish
published: publish
title: Dynamic Loading of Ogre Resources
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 790
wordpress_url: http://misterblue.com/?p=790
date: 2009-03-30 10:43:39
categories:
- Misterblue
- Programming
- LookingGlass


---
In trying to get LookingGlass working with Ogre, I had to figure out how to dynamically load resources (meshes, materials and textures). Ogre's default methodology is to have everything preloaded. Loading meshes and materials on demand is not obvious. Especially materials.
<p>I've figured some of it out and wrote up <a href="http://misterblue.com/programming/dynamic-ogre-resources">Dynamic Loading of Ogre Resources</a>. Hopefully this will save some other people many frustrating hours.</p>
