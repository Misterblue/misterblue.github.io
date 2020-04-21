---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Basil Again
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2020-04-21 09:48:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
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
I just can't leave the Basil [OpenSimulator] viewer alone.
I need to tweek and change and make improvements.

Well, I've updated [BasilJS] which is the browser/JavaScript based version of the
viewer. The protocol was simplified into a more streaming form to better fit with
the bi-directional WebSocket connection. Also, the protocol change from an Entity/Instance
explicit form to a more Entity/Attibute construction. This required refactoring
and debugging [BasilJS] all over again.

You can see the load-a-single-GLTF-file test mode of [BasilJS] on [Misterblue OAR Collection]
where pressing "View" invokes [BasilJS] to load the converted OAR scene.

Then [BasilTest] was refactored to use the new protocol and to reorganized how SpaceServers
are implemented so the [OpenSimulator] region modules can be simplified by using the
common code. This made for major changes to the common C# code libaries
([HerbalCommonEntitiesCS], [HerbalTransportCS], and [OSAuthModule]).

The last refactor part is to redo the [OpenSimulator] region modules
([Loden] and [RaguOS]). Then I need to find a way of building an online
demo so people can try it out.

That last idea (of "trying it out") lead me to think of building a straight
[OpenSimulator] viewer. This has been made especially critical as
[SecondLife] development has veared away from compatible protocol and viewer changes.
So, I've taken my old [LookingGlass] viewer and did a rehack to allow plugging in
either the [Godot] or [Stride] (previously Xenko) rendering engines.
Thus BasilG or BasilS will eventually exist building on all the logic
I had in [LookingGlass] for using [libOpenMetaverse] to talk LLLP
(Linden Lab Legacy Protocol). We'll see how much progress I make.

The other task is getting all the web pages together.

[OpenSimulator]: http://opensimulator.org/
[Misterblue OAR Collection]: https://misterblue.com/oars/
[BasilJS]: https://github.com/Herbal3d/basil
[HerbalCommonEntitiesCS]: https://github.com/Herbal3d/HerbalCommonEntitiesCS
[HerbalTransportCS]: https://github.com/Herbal3d/HerbalTransportCS
[OSAuthModule]: https://github.com/Herbal3d/OSAuthModule
[Loden]: https://github.com/Herbal3d/Loden
[RaguOS]: https://github.com/Herbal3d/RaguOS
[SecondLife]: https://secondlife.com/
[LookingGlass]: http://lookingglassviewer.org/
[Godot]: https://godotengine.org/
[Stride]: https://xenko.com/
