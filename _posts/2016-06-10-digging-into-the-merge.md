---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Digging into the Merge
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-06-10 12:46:00
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
About 6 months ago, a big source merge was done in [OpenSimulator].
The merge added many fixes and improvements to OpenSimulator (more stable TPs,
vehicle region border crossing, better permissions, etc).
The merged sources were from an old fork of OpenSimulator. The sources had
been forked and improved for several years before the sources came back to be
merged.
This sort of thing would happen if any of the public grids donated their
sources back to the base OpenSimulator projects (hint, hint -- you other grids
should really be donating back!).

Anyway, over the years between the fork and the source coming back, there were
independent changes in OpenSimulator and the other grid. Doing a 'git merge'
on two related, but independently modified sources is an iffy thing.
You never know what changes will end up in the final sources.

On 20151116, commit [f93ce485b1df8c1c8a7ff1a44b280ce30b8707b9] merged the
branch 'avinationmerge' into 'master' and the version 0.9.0 journey began.

There are now two versions/branches of OpenSimulator:
branch 'master' which is the unreleased version 0.9.0
and the
branch '0.8.2-post-fixes' which is the last released, 'working' version of OpenSimulator.

The '0.8.2-post-fixes' branch is rooted in master on November 11, 2015
(commit [f980355da4e233f714534afc6b958ceda1d07115]) with patches applied thereafter
for various bug fixes.

The problem is that Git will merge but that doesn't mean what you wanted to do
actually happened. My goal is to do a big diff between 0.9.0 and 0.8.2-post-fixes
and go through the changes by hand. It will take a while but, I will be posting
progress reports. The plan is to spend an hour a day going through the diffs.

[OpenSimulator]: http://opensimulator.org/
[f93ce485b1df8c1c8a7ff1a44b280ce30b8707b9]: http://opensimulator.org/viewgit/?a=commit&p=opensim&h=f93ce485b1df8c1c8a7ff1a44b280ce30b8707b9
[f980355da4e233f714534afc6b958ceda1d07115]: http://opensimulator.org/viewgit/?a=commit&p=opensim&h=f980355da4e233f714534afc6b958ceda1d07115
