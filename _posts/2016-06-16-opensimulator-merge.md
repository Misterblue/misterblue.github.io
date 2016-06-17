---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: OpenSimulator merge 20160616
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-06-16 16:34:00
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- OpenSimulator
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
---
Notes on looking at the merge diffs:

OpenSim/Addons/Groups/GroupsModule.cs

    0.8.2 in OnMakeRoot, does SendAgentGroupDataUpdate. 0.9.0 removes this with comment
        that this is a wrong thread to do this and that viewer ignores this message.
        This update missing causes problems (Mantis 7920 and 7915)
        Restored the SendAgentGroupDataUpdate with a comment.
    The code for group updates was refactored differently in the two versions:
        0.8.2 added an OnAgentDataUpdateRequest for extensibility and used that
            in SendAgentGroupDataUpdate
        SendAgentGroupDataUpdate was changed to send to optionally update other clients
        0.8.2 put logic for sending update via Caps in GroupsModule.
            Merge properly put it in LLClientView
        0.9.0 cleaned up update with SendAgentGroupDataUpdate and SendDataUpdate
    8.2 commented out OnClientClosed event commenting that InstantMessageModule doesn't do this
        Merge added logic to OnClientClosed to find who to send the update to
            The original problem was that the event was fired when there were several
                possible destination
    OnAgentDataUpdateRequest: 0.9.0 calls SendAgentGroupUpdate while 0.8.2 calls
        both SendAgentGroupUpdate and SendScenePresenceUpdate. 0.9.0 has comment that
        region arrival will send the group title. Keep lookout for not getting group titles.
    0.9.0 sends group updates to all clients more often than 0.8.2.
        Could be extra traffic when changing groups but probably not a problem

[OpenSimulator]: http://opensimulator.org/
