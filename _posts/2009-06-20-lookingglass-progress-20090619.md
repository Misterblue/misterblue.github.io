---
layout: post
status: publish
published: publish
title: LookingGlass progress 20090619
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 818
wordpress_url: http://misterblue.com/?p=818
date: 2009-06-20 09:37:49
categories:
- Misterblue
- LookingGlass
- Blog


---
I reduced the detail of Meshermizer from High to Low. The effect is not visible (at least so far) but the number of vertices generated per mesh is much less. After setting 'MultipleSims' to one, I was able to login and render the whole of OSGrid/Wright Plaza. Woot!!

Performance is no where near good enough yet. The callback for materials is taking forever since there are > 30k materials in Wright Plaza. Ogre also freezes up now and then. I added/completed statistics gathering and RESTing to try and find it. At the moment, it looks like Ogre hangs up doing the JPEG2000 decompression for the mipmaps. Might have to convert the textures on reception.
