---
layout: post
status: publish
published: publish
title: Chrome Hangouts extension complaining "Unable to connect to Google"
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 862
wordpress_url: http://misterblue.com/?p=862
date: 2013-09-02 09:59:45
categories:
- Web Tech


---
I use Chrome as my browser and I added the <a href="https://chrome.google.com/webstore/detail/hangouts/nckgahadagoaajjgafhacjanaoiihapd">Hangouts extension</a> so I can stay connected to friends. But, when I click the green button on the toolbar, I get the Hangout's popup dialog but I keeps repeating "Unable to connect to Google. Check your internet. Retrying in xxx seconds". Over and over.

Well, today I fixed this for the second time and I thought to write the solution down.

I run with JavaScript disabled (Settings-&gt;Advanced Settings-&gt;Content Settings-&gt;Do Not Allow Any Site to run Javascript). Call me paranoid but there you are. This setting allows me to turn on the sites I want to be running whatever on my computer (Chrome supports an allow/block list) and keeps stray folks from doing any nasties.

It turns out that the Hangouts extension works by creating a hidden resource html page that includes some JavaScript!. (You probably saw that coming).

The solution to my "Unable to connect to Google" problem was to add the Hangouts extension to the JavaScript allow list. Â Navigate to Settings-&gt;Advanced-&gt;Privacy-&gt;Content Settings-&gt;JavaScript-&gt;Manage Exceptions. There, add an 'allow' for "chrome-extension://nckgahadagoaajjgafhacjanaoiihapd/". That mess of letters is the ID of the extension which can be found on the Extensions page (navigate to "Settings-&gt;Extensions" or browse to "chrome://extensions".

Happy hanging out.
