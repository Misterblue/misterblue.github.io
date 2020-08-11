---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: ActivityPub and Matrix for Vircadia
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2020-08-11 11:27:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Vircadia
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
As I discussed in my ideas on [Vircadia Directions], it would be cool to
implement virtual world federation using existing social networks. I discussed
[ActivityPub] but the other one mentioned is [Matrix].

Both [ActivityPub] and [Matrix] are open-source, non-centralized federation systems
with active and busy communities. But they each seem to be built for different
appliction designs and have different architectures and uses.

Let me discuss each.

### Matrix

[Matrix] is a decentrialized infrastructure where anyone can run a "home-server" that
links into the larger synchronization space.
The collection of "home-server"s implement
"rooms" which contain JSON objects that are signed and securely synchronized across
the home servers. [Matrix] design leans toward security and authorization so there is
a strong emphasis on identity and encryption.

The base communication system is JSON sent between clients and servers
using HTTP REST operations, the model presented is of "rooms" that are
magically distributed across all of the connected home-servers.
Of course, there are optimizations so rooms are only synchronized across
home-servers with clients that are listening to those rooms.
Encryption and identity management prevent snooping and corruption.

[Matrix] application model leans toward the concept of chat rooms
with decentralized infrastructure 
thus applications that mimic [Discord] or [IRC] are easy to implement.
But the infrastructure has been generalized into
a de-centralized, JSON object synchronization system which enables applications
like IoT sensor devices reporting status and many more applications.

One downside is that, even though room contents are synchronized between
homeservers that have room clients, the room contents themselves "live"
on that room's homeserver. If that one homeserver is down, then the room
is unavailable. This means [Matrix] is a distributed communication system
rather than a distributed data system.

**Pros**:

- Secure encrypted communication.
- "Rooms" could fit with chatting in domains.

**Cons**:

- Not completely distributed
- Adding a metaverse-server to the federation would involve connecting it to a [Matrix] home-server;
- One needs a "matrix account". When a user creates a metaverse-server account, the
  metaverse-server would have to create an account on a home-server

### ActivityPub

[ActivityPub] is a [W3C] standard (the group that does the web application level
standards like HTML, CSS, SVG, URL, RDF, ...) that defines client-to-server
and server-to-server interactions which implement a decentralized "social network".
Through multiple JSON-formatted HTTP requests, content in "streams" is added to,
read, edited and deleted while activity notifications and content is distributed.

The definitions of [ActivityPub] is very much around "micro-blogging" (think Twitter).
[ActivityPub] defines "actors" who each have an "inbox" and "outbox".
An actor POSTs a message to their outbox and the message is sent to the
inboxes of addressed recepients.
Actors can also have "collections".
A defined collection is "followers" thus a message can easily be addressed to
one's "followers" (like Twitter).
This would be like a Tweet that shows up in the "streams" of the receivers
(if a user views their inbox like user's view their Twitter stream).

This is how [Mastodon] implements a distributed micro-blogging service
where many servers make up a system where one could "follow" people and
bots from other servers and view one's own stream of subscribed posts.

Using other [W3C] standards, identities are distributed, referenced "names"
can be dereferenced [WebFinger] into URLs to inboxes and profiles, messages
can be authorized [HTTP Authentication] and verified [HTTP Signatures].

Several services have adapted the microblogging model to other publishing
services like [PeerTube] and [PixelFed].

[ActivityPub] has the same architectural feature as [Matrix] in that an
actor/collection/inbox/outbox all "live" on one server and when that
server is down, that actor cannot be accessed.

[ActivityPub] keeps content encrypted in transport using TLS connections
but end-to-end message encryption would have to be added. This is a feature
that is built into [Matrix].

**Pros**:

- Identites can easily be created and shared across federated servers
- Actors and collections could fit with chatting in domains and groups.
- REST/JSON APIs allowing scripts easy access to users, actors, ...

**Cons**:

- Not completely distributed
- Would have a lot of URL traffic between metaverse-servers

[Matrix]: https://matrix.org/
[Matrix FAQ]: https://matrix.org/faq/
[ActivityPub Implementations]: http://blog.misterblue.com/2020/2020-07-15-ActivityPub-Implementations
[Vircadia Directions]: http://blog.misterblue.com/2020/2020-07-13-Vircadia-Directions 
[Discord]: https://discord.com/
[IRC]: https://en.wikipedia.org/wiki/Internet_Relay_Chat
[ActivityPub]: https://www.w3.org/TR/activitypub/
[ActivityStreams]: https://www.w3.org/TR/activitystreams-core/
[Mastodon]: https://joinmastodon.org/
[W3C]: https://w3c.org/
[WebFinger]: https://tools.ietf.org/html/rfc7033 "WebFinger"
[Twitter]: https://twitter.com/
[PeerTube]: https://joinpeertube.org/ "Video sharing"
[PixelFed]: https://pixelfed.org/ "Photo sharing"
[HTTP Signatures]: https://tools.ietf.org/id/draft-cavage-http-signatures-01.html
[HTTP Authentication]: https://tools.ietf.org/html/rfc7235
