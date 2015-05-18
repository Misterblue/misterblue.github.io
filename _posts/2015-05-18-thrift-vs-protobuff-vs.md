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
date: 2015-05-17 11:22:20
categories:
- Basil
---
Application interface vs protocol

So, what are my requirements?
* API model (applications interface to an API rather than a protocol)
* Binary data (meshes and textures will be involved)
* High performance (going to move a lot of very small datas)
* Adaptable to many languages (at least JavaScript and C# at the beginning)
* Have a definition language (can define and possibly verify API and protocols)
* Allow versioning (the protocol definition on the first day will need changes)
* Multiple and extensible transports (will need networked, inter-process, and inner-process)

This eliminates the pure REST interfaces.
I don't want applications building JSON strings and interpreting the HTTP
error responses. Wrappers and libraries are possible and that's what I'll talk
about next.

As described in Igor Anishchenko's presentation [PB vs Thrift vs Avro][4],
ProtoBuffers and Thrift are pretty neck-and-neck as far as features and speed
but Thrift has a slightly wider distribution of supported languages.
They both support binary data, have protocol definition languages, and
support protocol versioning.

Avro is a newer protocol but, rather than pre-compiling the code stubs, it
evaluates the schemas and messages at runtime.
The feature of schema evolution is considered the winning feature in a
post by Jon Zuanich entitled [Three Reasons Why Apache Avro Data Serialization is a Good Choice for OpenRTB][6].
The three reasons are schema evolution, untagged (smaller) data, and dynamic typing.

Other random things that might affect selection:
* ProtoBuffers is used by Sirikata

[A case against using Protobuf for transport in REST Services][7] makes the arguement
that the lack of inheritance and polymorphism in Protobuf is a show stopper for
game protocols.
The article concludes that JSON with the [Jackson][8] library is the proper choice.





ICE



[1]: http://thrift.apache.org/
[2]: http://en.wikipedia.org/wiki/Apache_Thrift
[3]: http://en.wikipedia.org/wiki/Comparison_of_data_serialization_formats
[4]: http://www.slideshare.net/IgorAnishchenko/pb-vs-thrift-vs-avro
[5]: http://en.wikipedia.org/wiki/Internet_Communications_Engine
[6]: http://blog.cloudera.com/blog/2011/05/three-reasons-why-apache-avro-data-serialization-is-a-good-choice-for-openrtb/
[7]: http://techtraits.com/noproto/
[8]: http://jackson.codehaus.org/

