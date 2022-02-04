---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: OpenSim Docker V2 to V3
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2022-02-04 11:22:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography,
#      Vircadia, Robotics, ROS2, VR
categories:
- OpenSimulator
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---

Since I've started playing with [Herbal3d] again (more on that later), I need to have an easy way of running my modified [OpenSimulator] instances.
Thus, I've gone back and updated my old [opensim-docker] project.

I first updated from V1 to V2 by updating OpenSimulator configuration files to the latest versions and then reworking the code so it is easier to understand.

That last problem was that it was a muddle of which image was being created and which runtime configuration was to be used. So now there are clearly two images (found in the directories `image-opensim` and `image-herbal3d`) and there are multiple configurations for those images in the image directories.

I also debugged the SQL version so it properly creates a standalone region and connects to the separately spun up database container.

After working on V2, I have come to feel that the idea of putting the configuration and the secrets for the configuration into the [Docker] image is wrong.

Thus version 3 is born.

The plan is to fix `docker-config` to mount the `config` directory in the user's space. The process then becomes to clone the repository, build your image, edit the configuration information in the `config` directory, and finally start the container.

[Docker]: https://www.docker.com/
[Herbal3d]: https://herbal3d.org
[OpenSimulator]: http://opensimulator.org/
[opensim-docker]: https://github.com/misterblue/opensim-docker/

