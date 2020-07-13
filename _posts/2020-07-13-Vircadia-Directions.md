---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Vircadia Directions
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2020-07-13 14:37:22
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography, Vircadia
categories:
- Vircadia
- Basil
- Programming
- Thoughts
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# static-comments:
# - id: 100   # unused number
#   author: AUTHOR-HANDLE
#   author_email: AUTHOR-EMAIL
#   author_url:
#   date: 2004-10-09 09:22:40  # SET DATE
#   content: COMMENT TEXT
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
Over the last several months I have been working on 
the [Project Apollo] metaverse-server for the [Vircadia] project.
The Internet is [awash in virtual world projects] -- both small and large.
Because of this, I have been thinking lot about this project and why I would
spend any time on Yet Another Virtual World.
This captures some of where I think [Vircadia] could go to be a
growing and interesting addition to the sea of virtual world technologies.

First, what is [Vircadia]?
Vircadia is a volunteer, open-source, virtual world server and viewer project
based on the [High Fidelity] code base.
A small collection of interested people have pulled this code dump into
a project and a community that chats, plays trivia games, and watches movies
together while working to improve the code and content of the virtual world.
The goal is to make a free, open-source, distributed, and non-corporate owned
virtual world that could be useful for education, training, meeting, and socialization.
The community and their passion for this particular virtual world technology
keeps the project alive.

I have spent years working on the [OpenSimulator] virtual world technology.
and more recently on my
[Herbal3d] and [Basil] viewer projects.
These are all for virtual worlds and the communities they create.
I have watched [OpenSimulator] putter along with hobbyists running their
own virtual world grids and small communities enjoying the ability
to socialize and hyper-grid/teleport among the many worlds.
But, in general, [OpenSimulator] never grew beyond its [SecondLife]
dispora and the project has dwindled over time.
It's still alive and interesting, but it is not making a new and interesting
addition to the virtual world ecosystem.

I got involved with [Vircadia] because of the great people and
they needed some server-side software and that is one of my interest areas.

But, now that I've invested in this project, I don't want it to
slowly die as people move on and/or just get lost in the virtual world
sea of projects.

There is the "marketing" direction which consists of building
communities and finding creators and applyers (like teachers or trainers)
to increase the number of people using the project.
But I'm more of a tech person so I see some technologies to focus
on in [Vircadia] development that would attach it to other
technology focused communities and grow and enhance its application.
The goal of these directions is to attach [Vircadia] to other
like-minded technical, volunteer, and passionate communities.

So, the two directions I'd like to help [Vircadia] go in are:

- develop the technology for a decentralized virtual world community, and
- generalize the virtual world viewer for new and different rendering engines.

### Decentralized Virtual World Community

Let's talk _decentralization_. 

One of the main motivators of the [Vircadia] project and many other
hobbyist and open-source development projects is the idea of creating
a non-centralized service/application/resource.
And by "centralization" most think of the large, ad-based concentrators
like Google or Facebook.

So, by "decentralization", most projects want there to be no single
owner of all the data, no single one place everything is stored, and
no one place that is necessary for the project to exist.

I feel like there are two approaches to this "decentralization":
1) decentralized storage and linking and 2) decentralized infrastructure.

"Decentralized infrastructure" is where multiple people host a common
infrastructure and the service/application is spread across these hosts.
So, like Tor or BitCoin, the service is not in a single location but
it spread out across multiple hosts so, one host going down or being
compromised, does not stop the service/application and no one entity
holds or owns the service/application.

"Decentralized storage and linking" is where multiple people host their
own stuff (no single owner or storer) and there are conventions for
naming, addressing, and fetching content and services.
In this case, data is spread out across the Internet and
availability and access is arranged and controlled by the source
of the data or service.

"Decentralized storage and linking" is more about linking together
smaller island while "decentralized infrastructure" is more about creating
one large island.
Both of these have their excellent uses but, for creating a set of virtual
world communities, I'm leaning more toward the original inter-net, web
focus of tying communities together.

Hope you're still with me here.

"Decentralized storage and linking" is the original design of the
World Wide Web where everyone hosted their own site and there were
hyper-links to get from one hosted resource to another.
[W3C] is the World Wide Web standards body that carries on
this architectural direction and has recently published several
"social community" standards which enable applications for
decentralized social communities.

These are the standards [ActivityStreams] and [ActivityPub] which
support social sharing services like [Mastodon], [PeerTube], and
many others.

The model presented by [ActivityPub] is of actors that have
"streams" of "activities". Thus, a person can have a newsfeed,
a community could have a stream of newsletters, an event could have
a stream of events, and a myriad other combinations. The standard
allows for publishing and subscribing to streams.

This creates a collection of hosts that are created for an interest
area, a community, or just for fun and the hosts exist for as long
as the hoster wishes. There is no central control or ownership.
Just interested and passionate individuals.

This architecture is useful for [Vircadia] for two reasons:

1. It matches how I see developer based virtual worlds growing -- as small hosted "grids", and
2. Linking the "girds" together with an existing socialization standard pulls the community
   into a larger socialization world of like-minded developers and users.

So, how do I see this playing out?

I see the continued development of a metaverse-server to act as the center of a "grid"
of virtual world spaces ("domain-servers"). This metaverse-server would provide
the services to tie this collection of virtual world spaces together --
account creation, storage, and permissions, domain-server registry and discoverability,
and any cross-domain communication).
This provides the basis for anyone to create their own, independent virtual world.

Then, adding to this, extending the metaverse-server with an [ActivityPub]
interface. For multiple grids, this allows the grids to share some
account identity/profile information, have interest groups that span grids,
have conversations that span grids, and other sharing.

For wider usage, one could use existing [ActivityPub] based tools to share
and communicate with users in the virtual worlds.
For instance, use [Mastodon] to chat with or check the presence of people
in the virtual world.
Or use one of the many gateway applications (like ActivityPub to Discord)
to connect between social groups and virtual world groups.

One way of looking at it, this makes [Vircaida] the virtual world extension
of [ActivityPub] or maybe the virtual world version of [Mastodon].

Check out [The-Federation] and [Fediverse.Party] for some of the other
federation-based, decentralized communities.

### Generalize the Viewer

This was all about the socialization side of [Vircadia], but what about
the viewer.
There are many people very passionate about the technologies and devices
for viewing virtual worlds.

The existing viewer is a custom C++ engine. It combines world logic
(avatars, location, scripts), with simulator interface (TCP and UDP
communication), with the rendering engine (and the interfaces to all the
different VR devices).

A [presentation] by Sam Gateau (the High Fidelity core engine team lead)
suggests the rendering part of the viewer is separated from all the world
logic by a scene representation that is acted on by "transactions" that
come from the world logic.
This gives a good beginning to separate the virtual world logic from the renderer.

So, what I'm suggesting is that the interface between the "scene" and
the world logic (the "transactions") be formalized and refactored to
make code pieces separable.
Then, the project could go in different directions.
The rendering engine could be replaced (some people have suggested that
the [Unreal Engine] is a candidate).

Or, building on my [Herbal3d architecture] ideas, build a system
where multiple world logic interfaces can talk to the same renderer
and thus allowing viewing multiple virtual world systems with
the same viewer rather than requiring a different viewer for
each virtual world.

## Conclusion

I believe that by adding an interface to existing and growing
distributed social network systems and by separating the renderer pieces,
the [Vircadia] project can attract many new developers, users, and
advancers and live on as a vibrant community.

Well, that's way too much typing. Back to coding.

[Project Apollo]: https://github.com/kasenvr/project-apollo
[Vircadia]: https://vircadia.com
[awash in virtual world projects]: https://ryanschultz.com/list-of-social-vr-virtual-worlds/
[High Fidelity]: https://en.wikipedia.org/wiki/High_Fidelity_(company)
[SecondLife]: https://secondlife.com/
[ActivityPub]: https://www.w3.org/TR/activitypub/
[ActivityStreams]: https://www.w3.org/TR/activitystreams-core/
[OpenSimulator]: http://opensimulator.org/wiki/Main_Page
[Herbal3d]: https://herbal3d.github.io/
[Basil]: https://github.com/Herbal3d/basil
[W3C]: https://www.w3.org/
[ActivityStreams]: https://www.w3.org/TR/activitystreams-core/
[ActivityPub]: https://www.w3.org/TR/activitypub/
[Mastodon]: https://joinmastodon.org/
[PeerTube]: https://joinpeertube.org/instances
[The-Federation]: https://the-federation.info/
[Fediverse.Party]: https://fediverse.party/
[presentation]: https://cdn.discordapp.com/attachments/564926326025224214/729066537368944751/High_Fidelity_Interface_Core_Engine.pdf
[Unreal Engine]: https://www.unrealengine.com/
[Herbal3d architecture]: https://herbal3d.github.io/architecture/

