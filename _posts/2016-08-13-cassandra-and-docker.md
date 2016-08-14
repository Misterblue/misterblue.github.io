---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: draft
title: Cassandra and Docker
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-08-13 17:30:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
In my continuing effort to learn all the new technologies, I wanted to use one of
the NoSQL databases. Since I want to store geographical data as well as meta
data for virtual world objects, I steered away from document oriented ones
like [ElasticSearch]. That leaves ones like [MondoDB] or [CouchDB] or pure
[Hadoop].

The fickle finder of databases then lead to [Cassandra]. It was used in the
[Sirikata] virtual world project and is scalable and clusterable and
continues to be used in a lot of places. 
It is also available on [AWS] and other infrastructures so it's a good
candidate.

The two target usages for Basil development are standalone, single computer
installations and in larger, production installations. So, how to easily run
Cassandra on a single desktop.

Another concern of mine is how to stay up-to-date with the latest versions
and sources of any package. I want an answer for 'what will building and maintaining
look like a year from now'.

I pulled the [Cassandra sources] and looked into building it. There were Java
dependencies and some other packages needed. 

[ElasticSearch]: 
[MondoDB]:
[CouchDB]: 
[Hadoop]:
[Sirikata]: 
[Cassandra]: 
[Cassandra sources]: 
[Docker]: 
[AWS]: 
