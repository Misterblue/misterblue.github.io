---
layout: post
status: publish
published: publish
title: LookingGlass progress
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 797
wordpress_url: http://misterblue.com/?p=797
date: 2009-05-09 12:08:05
categories:
- Misterblue
- LookingGlass
- Blog


---
<p>I am working on an OpenSim/SecondLife compatable viewer. I almost have it to a state that I am going to let the BSD Licensed code loose. I want to get it to the point of being buildable and runnable and not totally sucky before I put the code out. That's not to say it will be anywhere usable or feature complete at that point.
</p>
<p>The biggest problem at the moment is performance. I have clearly made some of the noob mistakes when creating a visual application. It disparately needs a manager and scheduler for all of the work queues. The current implementation gets totally overwhelmed when entering a large sim (especially an OpenSim sim since the whole sim contents is thrown at the viewer).
</p>
<p>
Here are some progress pictures. These are of the <a href="http://slurl.com/secondlife/Portland%20Connection/164/202/31">Portland Connection</a> sim in SecondLife(r).
<table>
<tr>
<td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090506_001.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090506_001.jpg" class="oldImageThumb"/></a></div></td>
<td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090506_002.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090506_002.jpg" class="oldImageThumb"/></a></div></td>
<td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090506_003.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090506_003.jpg" class="oldImageThumb"/></a></div></td>
</tr>
</table>
<table>
<tr><th>LookingGlass</th><th>SecondLife(r) Viewer</th></tr>
<tr>
  <td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090509_001.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090509_001.jpg" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/SecondLife-20090509_001.jpg"><img src="/images/oldimages/thumb/SecondLife-20090509_001.jpg" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090509_003.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090509_003.jpg" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/SecondLife-20090509_003.jpg"><img src="/images/oldimages/thumb/SecondLife-20090509_003.jpg" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090509_002.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090509_002.jpg" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/SecondLife-20090509_002.jpg"><img src="/images/oldimages/thumb/SecondLife-20090509_002.jpg" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090509_004.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090509_004.jpg" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/SecondLife-20090509_004.jpg"><img src="/images/oldimages/thumb/SecondLife-20090509_004.jpg" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/LookingGlass-20090509_005.jpg"><img src="/images/oldimages/thumb/LookingGlass-20090509_005.jpg" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/SecondLife-20090509_005.jpg"><img src="/images/oldimages/thumb/SecondLife-20090509_005.jpg" class="oldImageThumb"/></a></div></td>
</tr></table></p>
