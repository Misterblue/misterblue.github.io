---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: OpenSimulator in Docker Containers
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2019-11-06 12:13:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- OpenSimulator
- Programming
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
Working on cloud services lead me to create Dockerfiles for deploying
[OpenSimulator] as [Docker] containers.
The [Github] repository [https://github.com/Misterblue/opensim-docker]
contains instructions and files for building and deploying [OpenSimulator]
using `docker-compose`.

The hardest part of treaking [OpenSimulator] configuration because there are
so many files that need changing and I wanted to have both packaged configurations
and the ability to completely replace the simulator's configuration without changing
the Docker image.

So, as is explained in the [repository], the setup is to pretty much null out all
the default configuration files (those in `config-include`) and replace them with
copies in `bin/config`. This allows pre-packaged configurations to be included
in the images (set with environment variable `CONFIG_NAME`) or to completely replace
the configuration by mounting over the `bin/config` directory.

Happy Docker'ing.

[OpenSimulator]: https://opensimulator.org/
[Docker]: https://www.docker.com/
[repository]: https://github.com/Misterblue/opensim-docker
[https://github.com/Misterblue/opensim-docker]: https://github.com/Misterblue/opensim-docker
