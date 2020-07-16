---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: ActivityPub Implmentations
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2020-07-15 15:44:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Vircadia
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# static-comments:
# - id: 100   # unused number
#   author: AUTHOR-HANDLE
#   author_email: AUTHOR-EMAIL
#   author_url:
#   date: 2004-10-09 09:22:40  # SET DATE
#   content: COMENT TEXT
# - id: 101
#   author: Misterblue
#   author_email: misterblue-mt@misterblue.com
#   author_url: http://www.misterblue.com
#   date: 2004-10-10 07:23:13
#   content: >-
#     COMMENT TEXT
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
In my previous post ( [Vircadia Directions] ) on the directions I'd like
to take the [Vircadia] project, I talked about integrating
[ActivityPub] as the socialization backend to the metaverse-server.
That has lead me to several days of researching [ActivityPub], [ActivityStreams],
the various implmentations of same.

<img align="left" src="https://docs.google.com/drawings/d/e/2PACX-1vTs9X2lmKe_5p2CNVHk4cPBC-Ornj2YmWk8vsMwEhmjq-TByaZQmPsdXIzvIcn788-8Jo2WZu85nX3a/pub?w=300">

The idea is to use the [ActivityPub] system to create a "Fediverse" of virtual
worlds and thus leverage an existing infrastructure and community.

The original [Project Apollo] metaverse-server design has a server that presents
the MetaverseAPI (REST/JSON/...) and has a custom designed backend database to
store information about accounts, domains, account relationships (friends, ...),
and domain connection information (ICE servers, chat servers, ...).

The diagram to the left shows this structure (with the "domain-servers" simplified
into one box that includes the "assignment clients"). In this structure,
the only interface that is "standard" is the "MetaverseAPI".

In thinking about adding [ActivityPub], I first thought I'd add a [MongoDB]
database on the backend (since everything is JSON) and an [ActivityPub]
interface on the frontend. This would allow the existing domain-servers
to talk to the metaverse-server and any other metaverse-servers and
[ActivityPub] application to communicate with the users in that metaverse.

But this would mean writing a lot of code (the [ActivityPub] interface)
just to interface with the metaverse database. Looking around, there are
several system implmenting [ActivityPub] and some services that could
just be used.

But then, I realized that the metaverse-server just creates and manages
accounts and manages the domain-server interconnections.
What if I just considered the metaverse-server a MetaverseAPI to [ActivityPub]
protocol converter?

Since the [ActivityPub] protocol already has all the functions for creating
and managing account as well as functions to create and and manage collections
of objects (like domains), an [ActivityPub] server could act as the database
for the metaverse-server.

<img align="left" src="https://docs.google.com/drawings/d/e/2PACX-1vQDsQGBPOHiMlF-PTiyw_N5d2YLKyVBDG0_dTgy2s3pGXS8OxAd7F_0Uh8hWVZxVwG9HT9-avtviyD5/pub?w=445&amp;h=314">

[ActivityPub] servers already have authentication and access control
conventions.

I first thought that I could just use a [Mastodon] server as the
backend metaverse database but I believe that we will want to be
extending the functionality of the server. This work is extending
the [ActivityPub] social network model into virtual worlds so there will be special
features like chat groups that only work with the people close together.
Thus, location and distance need to be added to status and filtering.

At the moment, I am considering the [ActivityPub-Express]
project which is a pretty well written [NodeJS]/[ExpressJS]/[MongoDB] based
[ActivityPub] server.

[Vircadia Directions]: http://blog.misterblue.com/2020/2020-07-13-Vircadia-Directions 
[Project Apollo]: https://github.com/kasenvr/project-apollo
[Vircadia]: https://vircadia.com
[MongoDB]: https://www.mongodb.com/
[NodeJS]: https://nodejs.org/
[ExpressJS]: https://expressjs.com/
[ActivityPub-Express]: https://github.com/wmurphyrd/activitypub-express
[ActivityPub]: https://www.w3.org/TR/activitypub/
[ActivityStreams]: https://www.w3.org/TR/activitystreams-core/
[Mastodon]: https://joinmastodon.org/
