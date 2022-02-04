---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Notes on v-web Metaverse
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2022-02-04 09:12:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- Vircadia
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
There has been some discussion on adding metaverse selection to [Vircadia-Web] (here after "v-web") and this note talks about how the existing code could be modified.

Currently (as of Feb 4, 2022), v-web has a default metaverse URL that is used to fetch the metaverse information and is used as the metaverse to log the user into.
This default metaverse is specified in `@Base/config.ts` and is connected when the main view is mounted (in `App.vue`).

The real work connecting to a metaverse is in `@Modules/Utility.metaverseConnectionSetup()` which calls `MetaverseMgr.metaverseFactory()` to create a new metaverse connection class instance. This operation also has the side effect of making the network connection to the metaverse, setting the "active" metaverse, and updating the metaverse information in the Vue variable $store. So the overall effect of calling `metaverseConnectionSetup()` is to change the active metaverse and update all the display variables. The only work needed here is that the previous metaverse class instance is not saved or freed.

Looking at the user interface, there is a "Click to log in to metaverse" text at the top of the page. Clicking this opens the "Metaverse Login" dialog (`@Components/dialogs/Login.vue`). This dialog has fields for username and password. If this dialog has a "metaverse" field added that had the default metaverse URL preloaded then the user could enter a new metaverse URL if logging into a different metaverse. The action would be, when the user pressed "Login", the code would check if the metaverse URL had changed and, if so, call `metaverseConnectionSetup()` with the new URL before logging in the user. This would change the active metaverse and set up  the application to use the new metaverse (Explore and other operations use the active metaverse).

As a side note, `@Base/config.ts` has code to save some variables in the browser's local storage. If the user is specifying a different default metaverse, there should be some place that does a `Config.setItem(DEFAULT_METAVERSE_URL, newURL)`.

[Vircadia-Web]: https://github.com/vircadia/vircadia-web
