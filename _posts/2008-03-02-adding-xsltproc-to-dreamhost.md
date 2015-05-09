---
layout: post
status: publish
published: publish
title: Adding xsltproc to Dreamhost
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 704
wordpress_url: http://misterblue.com/wwpp/archives/20080302-adding-xsltproc-to-dreamhost
date: 2008-03-02 05:52:02
categories:
- Misterblue
- Web Tech
- Blog

comments:
- id: 2645
  author: Arthur Zhu
  author_email: arthurzhuwei@gmail.com
  author_url: http://www.saison.com.cn
  date: 2008-03-26 01:07:26
  date_gmt: 2015-04-25 04:22:36
  content: >-
    hi,

    I want to download libxml from its ftp. But I don't know the user and password. Could you tell me? I can't use anonymous.

    Thanks.



    Kind Regards,



    Arthur Zhu
---
I have moved some web hosting to <a href="http://dreamhost.com/">Dreamhost</a> (very pleased, by the way) but one irritation is the lack of all of the <code>libxml2</code> tools. In particular, the fact that <code>xsltproc</code> is not installed.

Derived from these excellent instructions on <a href="http://www.sagehill.net/docbookxsl/InstallingAProcessor.html">Installing an XSLT processor</a>, here are the instructions for creating a version of xsltproc for use on DreamHost.
<!--more-->
Get the latest sources from ftp://xmlsoft.org/libxslt/. The trick is that Dreamhost has libxml2 available in /usr/lib and they have an old version -- not just any xsltproc source will work. On November 18, 2007, /usr/lib/libxml2 in Dreamhost was version 2.6.16. Looking at the ftp dir listing at <a href="ftp://xmlsoft.org/libxslt/">xmlsoft.org</a> I discover that 2.6.16 sources were distributed on 11/10/2004. Looking down the list, I find libxslt version 1.1.12 was distributed on 10/29/2004. This is the one I want.

The following block shows the command line steps to build xsltproc.
<pre>
me@hera ~> ftp xmlsoft.org
Connected to xmlsoft.org.
220 (vsFTPd 2.0.1)
Name (xmlsoft.org:me): anonymous
331 Please specify the password.
Password:
230 Login successful.
Remote system type is UNIX.
Using binary mode to transfer files.
ftp> binary
200 Switching to Binary mode.
ftp> cd libxslt
250 Directory successfully changed.
ftp> get libxslt-1.1.12.tar.gz
local: libxslt-1.1.12.tar.gz remote: libxslt-1.1.12.tar.gz
200 PORT command successful. Consider using PASV.
150 Opening BINARY mode data connection for libxslt-1.1.12.tar.gz (2617274 bytes
).
226 File send OK.
2617274 bytes received in 14.93 secs (171.2 kB/s)
ftp> quit
221 Goodbye.
me@hera ~> tar -xzf libxslt-1.1.12.tar.gz
me@hera ~> cd libxslt-1.1.12
me@hera ~/libxslt-1.1.12> ./configure
... much outout ...
me@hera ~/libxslt-1.1.12> ./make
... much output ...
me@hera ~/libxslt-1.1.12> cp xsltproc/xsltproc ~/bin
me@hera ~/libxslt-1.1.12> cd
me@hera ~> xsltproc -version
Using libxml 20616, libxslt 10112 and libexslt 810
xsltproc was compiled against libxml 20616, libxslt 10112 and libexslt 810
libxslt 10112 was compiled against libxml 20616
libexslt 810 was compiled against libxml 20616
me@hera ~>
</pre>
This works but be careful about trying to move the <code>bin/xsltproc</code> around -- it is a script and it refers back to the build directory for the libraries. If you want to move the libraries, you will edit <code>bin/xsltproc</code> to point at your new location. If you don't do anything tricky, you won't notice this problem.

Happy transforming.
