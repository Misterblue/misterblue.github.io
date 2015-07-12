---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
# if status is 'publish', post will apprear in blog roll.
status: publish
title: Looking for a message bus
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2015-07-10 21:06:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
- Programming
comments:
- id: 100   # unused number
  author: Misterblue
  author_email: misterblue-blog@misterblue.com
  author_url:
  date: 2015-07-12 09:22:40  # SET DATE
  content: >-
    Not a real comment. This is just a test of my Jekyll/Liquid hacking to make comments work.
# - id: 101
#   author: Misterblue
#   author_email: misterblue-mt@misterblue.com
#   author_url: http://www.misterblue.com
#   date: 2004-10-10 07:23:13
#   content: >-
#     COMMENT TEXT
---
I have a project that will be multiple, independent programs that
network and message to each other. The connections between the modules
will be tuned to the particular data types and requirements (size, latency, etc).
But, control of the whole allocation needs some sort of 'control plane'
for the setup, configuration, and control of all the programs.
A message bus seems the right thing to send notices and updates
around the whole distributed application.

I'm thinking some pub/sub system. Some criteria are:
* provides asynchronous notifications and status between network distributed programs
* low volume: after setup, messages will be rare
* light weight: both the clients and servers needs to be small and simple
* easy protocol: I'm not building a mission critical infrastructure here
* don't need message ordering
* reliability and non-duplication would be good
* clients available in many different languages (C++, Javascript, Java)
* doesn't require a 'cloud service': there are notification services that could be used but that should be an option and not a requirement

First candidate is [MQTT].
MQTT is simple-ish. Has lots of clients (like [Eclipse/Paho] and [Mosquitto])
and has several hardened brokers ([Mosquitto], [Moquette], [Mosca], [HiveMQ], and even
multi-protocol servers like [Apollo] or [AMQP]).
Conceptually a good simple and good model but there are gottchas in most of the
clients and the brokers tend to be heavier than I need.

Could use [node.js] and [socket.io] but that needs a server running somewhere.

[WAMP] (Web Application Messaging Protocol) is another possibility.
It is built around websockets but it basicily just needs a reliable connection (TCP).
WAMP provides both pub/sub and RPC communication patterns which might be useful.
It only moves JSON messages (text only) although it can use [MsgPack] for
compressed/compacted messages.
For a control plane message system, I don't think I need binary so that is
not a required feature.

Now, thinking about it, firewalls will always be a problem when running a centralized
message service. If the distributed application is started on a tablet, it will start
other components both locally (inside the firewall) and remotely (outside the firewall).
If the message server is started with the application inside the firewall, any component
outside the firewall would have problems connecting back to the 'control plane' server.

More discussion to come.

[MQTT]: http://mqtt.org
[Eclipse/Paho]: http://www.eclipse.org/paho/
[Mosquitto]: http://mosquitto.org/
[Moquette]: http://andsel.github.io/moquette/
[HiveMQ]: http://www.hivemq.com/
[AQMP]: https://www.amqp.org/
[Apollo]: http://activemq.apache.org/apollo/
[Mosca]: http://www.mosca.io/
[node.js]: https://nodejs.org/
[socket.io]: http://socket.io/
[WAMP]: http://wamp.ws/
[MsgPack]: http://msgpack.org/


