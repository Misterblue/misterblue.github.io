---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Cassandra and Docker
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-08-14 22:03:20
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

The fickle finger of databases then lead to [Cassandra]. It was used in the
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

I pulled the [Cassandra sources] and looked into building it. 
It requires a specific version of Java and several other packages.
This looked like it was going to be a nightmare to build on general use
Linux system and the dependencies would make upgrading difficult.
And, like I said above, I wanted the latest and greatest and not
the older versions that will be in the Ubuntu package repositories.

But wait.  Looking around I found a [Docker] version of Cassandra.
Docker containers would provide some of the isolation of the different versions
four all the libraries are going to Cassandra and he would get me again
tangled up in other interesting internet technologies.

Docker also provides a solution for creating simple standalone systems as
well as complex, production, scalable systems.
A simple Docker setup would allow someone to just run a local Cassandra
or they could deploy all of the services into the cloud and have a production environment.

So, off down the rabbit hole of learning Docker and learning all of its
setup and configuration options.

[ElasticSearch]: https://www.elastic.co/products/elasticsearch
[MondoDB]: https://www.mongodb.com/
[CouchDB]: http://couchdb.apache.org/
[Hadoop]: http://hadoop.apache.org/
[Sirikata]: http://www.sirikata.com/blog/
[Cassandra]: http://cassandra.apache.org/
[Cassandra sources]: https://git1-us-west.apache.org/repos/asf?p=cassandra.git;a=summary
[Docker]: https://www.docker.com/
[AWS]: https://aws.amazon.com/
