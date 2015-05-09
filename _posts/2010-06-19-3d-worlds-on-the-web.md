---
layout: post
status: publish
published: publish
title: 3D Worlds on the web
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 850
wordpress_url: http://misterblue.com/?p=850
date: 2010-06-19 05:27:51
categories:
- Misterblue
- Thoughts
- Programming
- LookingGlass
- Blog


---
I've been working on <a title="LookingGlass viewer" href="http://lookingglassviewer.org">LookingGlass </a>which is a stand-alone, you-have-to-download-it viewer for the <a title="OpenSimulator" href="http://opensimulator.org/">OpenSimulator </a>virtual worlds. I really wish one didn't have to download the viewer. Viewing should just happen as part of the web.

I've looked at this several times and it looks like the infrastructure is maturing. <a title="WebGL" href="https://www.khronos.org/webgl/wiki/Main_Page">WebGL </a>is appearing or will soon appear in most browsers. This provides the basis for getting accelerated, 3D graphics on the screen. Additionally, it is standard in the browsers (IE is a problem, Microsoft being who they are, but Google has a plugin to fix that).

Recently, Google has decided to move their <a title="O3D" href="http://code.google.com/p/o3d/">O3D project</a> to being a scene graph wrapper for WebGL. This makes JavaScript connect to the 3D world reasonably while keeping all the 3D technology in the standard browser.

The new O3D is early in its development but it is coming. 3D on the web is just around the corner.
