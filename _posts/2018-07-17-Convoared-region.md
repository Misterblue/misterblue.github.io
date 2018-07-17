---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Convoared Regions
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2018-07-17 11:30:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Programming
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
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
<a href="https://misterblue.com/oars/">
<img style="float:right;width:200px;padding:10px" src="images/20180717-convoared.jpg"/>
</a>
I've updated [Convoar] to version 1.1 and started converting a collection of
OARs.
These sample OARs are available on a [Converted OARs] page at
<a href="https://misterblue.com/oars/">
https://misterblue.com/oars/
</a>.
This gives pointers to various optimized [GLTF] scene conversions,
downloads of all the scene files (ZIP and TGZ),
as well as a download of the original OAR file.

There is also a VIEW button which opens another browser page with a simple
[ThreeJS] viewer on that version of the [GLTF] file.
Be sure to close that view page as having several views open at the
same time till greatly overtax any graphics card.

I've had a lot of luck running [Convoar] in a [Docker] image. This has solved most
of the problems with getting the correct .Net/Mono environment on Linux machines.
Even conversions that crash under Windows 10 (usually out-of-memory) work with
the [Docker] image.

On a Linux system with [Docker] installed, I do the following:

```bash
mkdir /tmp/frog
cd /tmp/frog
cp OARFILE.oar .
docker image pull herbal3d/convoar
docker run --user $(id -u):$(id -g) --volume $(pwd):/oar herbal3d/convoar OARFILE.oar
```

The `--volume` parameter maps the container `/oar` directory to the current directory
(which contains the OAR file named `OARFILE.oar` or whatever you wish).
The `--user` parameter sets user and group IDs of the [Docker] container to the current
user's so the container can write into the mapped directory.
Then the container is run which reads the OAR file and writes all the output files
to the mapped directory.
If there are any parameters for [Convoar], they go before the OAR file filename.
When it's done, you have the original OAR file and all the GLTF files in the
mapped directory.

Cool.

[ThreeJS]: https://threejs.org/
[Docker]: https://docker.org/
[Convoar]: https://github.com/Misterblue/convoar
[GLTF]: https://www.khronos.org/gltf/
[Converted OARs]: http://misterblue.com/oars/
