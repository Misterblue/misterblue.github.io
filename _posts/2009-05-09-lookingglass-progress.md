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


---
<p>I am working on an OpenSim/SecondLife compatable viewer. I almost have it to a state that I am going to let the BSD Licensed code loose. I want to get it to the point of being buildable and runnable and not totally sucky before I put the code out. That's not to say it will be anywhere usable or feature complete at that point.
</p>
<p>The biggest problem at the moment is performance. I have clearly made some of the noob mistakes when creating a visual application. It disparately needs a manager and scheduler for all of the work queues. The current implementation gets totally overwhelmed when entering a large sim (especially an OpenSim sim since the whole sim contents is thrown at the viewer).
</p>
<p>
Here are some progress pictures. These are of the <a href="http://slurl.com/secondlife/Portland%20Connection/164/202/31">Portland Connection</a> sim in SecondLife(r).
<table>
<tr>
<td><div class="g2image"><a href="/images/oldimages/6648"><img src="/images/oldimages/thumb/6648" class="oldImageThumb"/></a></div></td>
<td><div class="g2image"><a href="/images/oldimages/6652"><img src="/images/oldimages/thumb/6652" class="oldImageThumb"/></a></div></td>
<td><div class="g2image"><a href="/images/oldimages/6655"><img src="/images/oldimages/thumb/6655" class="oldImageThumb"/></a></div></td>
</tr>
</table>
<table>
<tr><th>LookingGlass</th><th>SecondLife(r) Viewer</th></tr>
<tr>
  <td><div class="g2image"><a href="/images/oldimages/6658"><img src="/images/oldimages/thumb/6658" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/6673"><img src="/images/oldimages/thumb/6673" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/6664"><img src="/images/oldimages/thumb/6664" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/6679"><img src="/images/oldimages/thumb/6679" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/6661"><img src="/images/oldimages/thumb/6661" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/6676"><img src="/images/oldimages/thumb/6676" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/6667"><img src="/images/oldimages/thumb/6667" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/6682"><img src="/images/oldimages/thumb/6682" class="oldImageThumb"/></a></div></td>
</tr><tr>
  <td><div class="g2image"><a href="/images/oldimages/6670"><img src="/images/oldimages/thumb/6670" class="oldImageThumb"/></a></div></td>
  <td><div class="g2image"><a href="/images/oldimages/6685"><img src="/images/oldimages/thumb/6685" class="oldImageThumb"/></a></div></td>
</tr></table></p>
