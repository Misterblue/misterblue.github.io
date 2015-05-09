---
layout: post
status: publish
published: publish
title: Integrating Avatars and Attachments and generalizing entities
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 830
wordpress_url: http://misterblue.com/?p=830
date: 2009-10-20 10:01:13
categories:
- Misterblue
- Programming
- LookingGlass
- Blog


---
I had been fretting about whether avatars and their attachements are first class objects or subclasses of entities. I am now thinking the latter. That is, World just deals with Regions that contain Entities and the Entities have sub-classes that are created by Comm and sensed by the Viewer.

The pattern I'm working with at the moment is (using an Avatar as an example) for there to be a World.IEntityAvatar which defines the operations beyond the base entity. For LLLP, there is a World.LL.LLEntityAvatar that implements the IEntityAvatar and IEntity for an LLLP avatar. Additionally, LLEntityAvatar does a
<blockquote>RegisterInterface&lt;IEntityAvatar&gt;(this);</blockquote>
to add the interface to the IEntity. Later, the Viewer will do a
<blockquote>TryGet&lt;IEntityAvatar&gt;(out anAV)</blockquote>
to see if the underlying entity is an avatar or not. If it is, it will call the avatar specific methods to view the avatar.

Over time, methods will be added to IEntityAvatar and LLEntityAvatar to try and hide the implementation details of an avatar and create an abstract interface for a boned mesh with animations. I figure that the specific positioning logic that is now in RendererOgreLL will move into LLEntityPhysical with a generalized interface for RendererOgreLL to call into the entity to compute the location and parent.

The goal would be to extend Viewer to handler IEntityPhysical (a regular object in the view), IEntityFoliage, IEntityAvatar and IEntityAttachment and all the protocol and item type specific logic will move into protocol specific implementation of classes with those interfaces.
