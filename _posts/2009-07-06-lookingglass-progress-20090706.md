---
layout: post
status: publish
published: publish
title: LookingGlass progress 20090706
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 823
wordpress_url: http://misterblue.com/?p=823
date: 2009-07-06 10:34:03
categories:
- Misterblue
- LookingGlass

comments:
- id: 2762
  author: Toni Alatalo
  author_email: toni@playsign.net
  author_url: http://www.playsign.net/
  date: 2009-07-14 04:30:40
  date_gmt: 2015-04-25 04:22:37
  content: >-
    hi,



    i just thought it might be interesting for you to know that http://www.realxtend.org/ published a first developer preview of a new Ogre based viewer, Naali - http://wiki.realxtend.org/index.php/Getting_Started_with_Naali



    it's in c++ but there are some material definitions and other things that might be interesting for you to see.



    you ui solution sounds interesting, we'll be working on getting a final ui toolkit integration in august .. so far that has been quite experimental.
- id: 2763
  author: Misterblue
  author_email: misterblue-blog@misterblue.com
  author_url: http://misterblue.com
  date: 2009-07-14 10:31:17
  date_gmt: 2015-04-25 04:22:37
  content: I have been following their work. It will be a professional quality viewer. I haven't dug into it yet but, you're right, they probably solved some of the problems I'm running into.
---
I've completed sculpties and added many texture processing improvements. Normal LLLP textures are JPEG2000 but I had to figure out how to store sculptie textures as PNGs so I could read them into the .NET/Mono graphics functions. Once I was more familiar with textures, I put in checks for transparency and put in the code to pass that info down into the renderer. There are some problems around PrimMesher but I don't know if it's a bug or me using it wrong. You'll see the problems with box prims having the wrong textures on the bottom (most notable if someone rotated the box to use the hollow for a hole) and that textures are placed on scuplties upside down.
<p>
But it's getting more stable and can pretty much do a sim. Walking around is not very easy but that will take prioritization of the work queues.
</p>
