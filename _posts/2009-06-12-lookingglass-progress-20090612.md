---
layout: post
status: publish
published: publish
title: LookingGlass progress 20090612
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 809
wordpress_url: http://misterblue.com/?p=809
date: 2009-06-12 05:29:16
categories:
- Travel


---
To get proper sun and moon lighting, I spent a day adding <a href="http://www.ogre3d.org/wiki/index.php/Caelum">Caelum</a>. This is an Ogre plugin for sun and moon and precipitation and everything atmospheric. I didn't quite get it working and as I was looking for solutions I found that the person who created <a href="http://www.ogre3d.org/wiki/index.php/Hydrax">Hydrax</a> (water and oceans) is now building a sky system. I think I might wait to see how that comes out. This means that, for the moment, Caelum build information is in the source tree but the ifdef in LookingGlassOgre is commented out to disable any use of that library.
