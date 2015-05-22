---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
# if status is 'publish', post will apprear in blog roll.
status: draft
title: Thrift vs Protocol Buffers vs so many more
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2015-05-23 11:22:20
categories:
- Basil
---
A base design decision is the inter-module protocol.
The design of the 3D server is for multiple content sources to talk to
the one renderer so the wire protocol definition is foundational.
To complicate any selecion, wire protocols have been exercised and libraried
many times and it would be foolish to start from scratch.
But there are [so many to choose from][3].

So, what are my requirements?
* High performance (going to move a lot of very small datas)
* Both RPC and streaming messages (non-blocking messages)
* Binary data (meshes and textures will be involved)
* Have a definition language (can define and possibly verify API and protocols)
* Adaptable to many languages (at least JavaScript and C# at the beginning)
* Have stub/interface API generation (for defined mapping from application to protocol)
* Allow versioning (the protocol definition on the first day will need changes)
* Multiple and extensible transports (will need networked, inter-process, and inner-process)

There seem to be two classes of interface definitions on the Internets
at the moment: the pure [REST] interfaces (defined with something like [RAML] or [Swagger])
and the more API oriented ones (like [Thrift] or [Protocol Buffers]).

There is always roll-your-own which has some advantages in that
one can customize the protocol specifically for the application and
use case:
* balance the use of TCP and UDP depending on latency and interaction;
* specialize the formatting and compression of the line protocol for the application's data; and
* specialize the message type queuing and throttling depending on the user experience.
This is the approach taken by [High Fidelity] and many gaming systems.
This is a trade-off of development work vs on-going support of an
external package.

I don't want applications building JSON strings and interpreting the HTTP
error responses. Wrappers and libraries are necessary.

As described in Igor Anishchenko's presentation [PB vs Thrift vs Avro][4],
ProtoBuffers and Thrift are pretty neck-and-neck as far as features and speed
but Thrift has a slightly wider distribution of supported languages.
They both support binary data, have protocol definition languages, and
support protocol versioning.

Avro is a newer protocol but, rather than pre-compiling the code stubs, it
evaluates the schemas and messages at runtime.
The feature of schema evolution is considered the winning feature in a
post by Jon Zuanich entitled
[Three Reasons Why Apache Avro Data Serialization is a Good Choice for OpenRTB][6].
The three reasons are schema evolution, untagged (smaller) data, and dynamic typing.

[A case against using Protobuf for transport in REST Services][7] makes the argument
that the lack of inheritance and polymorphism in Protobuf is a show stopper for
game protocols.
The article concludes that JSON with the [Jackson] library is the proper choice.

So, what to decide. 

It feels to me like the REST protocols are best for "arms length" relationships
between the server and the client while the more API/streaming systems
(like [Thrift] or [Protocol Buffers]) are for more intimately related
clients and servers.
This leads me to think the decision also depends on the publicness
of the interface. 

Therefore, I am going to start by using both. Between the modules that
hook together and communicate to share state and information (between
the 3D renderer itself and the object modules, for instance) I will
start with [Thrift]. For the asset service, I will use [RAML].

I will learn and report how well that works.

[REST]: http://en.wikipedia.org/wiki/Representational_state_transfer
[RAML]: http://raml.org/
[Swagger]: http://swagger.io/
[Thrift]: http://thrift.apache.org/
[Protocol Buffers]: https://developers.google.com/protocol-buffers/
[High Fidelity]: https://highfidelity.com/
[3]: http://en.wikipedia.org/wiki/Comparison_of_data_serialization_formats
[4]: http://www.slideshare.net/IgorAnishchenko/pb-vs-thrift-vs-avro
[5]: http://en.wikipedia.org/wiki/Internet_Communications_Engine
[6]: http://blog.cloudera.com/blog/2011/05/three-reasons-why-apache-avro-data-serialization-is-a-good-choice-for-openrtb/
[7]: http://techtraits.com/noproto/
[Jackson]: http://jackson.codehaus.org/
