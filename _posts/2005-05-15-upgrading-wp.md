---
layout: post
status: publish
published: publish
title: Upgrading WP
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 588
wordpress_url: http://misterblue.com/wwpp/archives/20050515-upgrading-wp
date: 2005-05-15 04:24:37
categories:
- Blog


---
<p>
I finally took the plunge and upgraded
<a href="http://wordpress.org">WordPress</a> to 1.5.1.
That necessitated finding the little hacks I put in.
In particular (I'm writing this here so I can find it next time), in 
<code>wp-include/default-filters.php</code>, I remove the <code>wpautop</code>
from <code>the_content</code> and <code>the_excerpt</code>. 
This causes these pages to be displayed with the html in them.
Could be dangerous but the html is filtered when it's entered so the problem is
minimal.  Someday I'll submit a change that will allow specifying whether the
comment should be formatted.  This was one feature I really missed from MovableType --
the ability to mark individual entries with a format or not flag.
</p>
<p>
Anyway, I'm upgraded so now I get to figure out how to handle all these new features.
</p>
