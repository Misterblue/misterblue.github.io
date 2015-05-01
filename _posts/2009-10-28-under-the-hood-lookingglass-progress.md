---
layout: post
status: publish
published: publish
title: Under the hood LookingGlass progress
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 837
wordpress_url: http://misterblue.com/?p=837
date: 2009-10-28 06:56:27
categories:
- Misterblue
- LookingGlass


---
I broke a lot of stuff getting to a better place. The loading and reloading experience was poor (slow and jerky) so I moved a bunch of the update code from C# to C++. That has necessitated (after a while finding that this was the problem) building and including [http://boost.org Boost] for data structure access locking. I also wanted to have the Radegast window navigatable via the keyboard. This meant reorganizing the input code to extract common routines. Adding avatars meant rethinking and redoing the organization of Entities to allow for extensions for attachements, etc. Avatars are not first class items but merely a specialization of an entity which the viewer has to figure out how to display. The short of all this is I ripped a lot of things apart and they are not all together yet. Hopefully only another week. Fingers crossed.
