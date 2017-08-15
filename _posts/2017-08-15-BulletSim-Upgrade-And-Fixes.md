---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: BulletSim Upgrade and Fixes
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-08-15 09:59:20
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
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
An update to BulletSim has been checked into the [OpenSimulator]
[source repository] that upgrades BulletSim with version 2.86 of
the [Bullet physics engine] as well as fixing some known problems.

[Mantis 8010] ("BulletSim does not always call collision events on collisions")
was caused by BulletSim not doing collision detection on all of the physics engine
sub-steps. This meant that fast moving objects (like bullets) could bounce off
of a target without reporting any collisions. For those into details,
any [OpenSimulator] physics engine is called every tenth of a second to simulate
the next tenth of a second of time. BulletSim internally steps 10 times within
that tenth of a second to do a higher resolution physics simulation --
a tenth of a second is a long simulation step but that's the way [OpenSimulator] does it.

[Mantis 8011] ("BulletSim fails to send land_collision messages on some terrain")
was caused by BulletSim computing terrain height differently than the mesh in the
physics engine. So, an object on steep terrain could compute as underground to some code
while appearing above ground in other code. BulletSim prevents physical objects from
going underground by pushing them up when the do. This check would sometimes cause
a falling object to float over terrain rather than colliding with the terrain.

The problem in [Mantis 7132] ("Collisions stop for no apparent reason on BulletSim")
hasn't been explicitly fixed. Still looking for that problem.

I found an additional problem that collision_end events don't happen
if the colliding object does an llDie() on its collision. For instance, a target object
wouldn't get a collision_end event for a bullet object that hits the target and
does an llDie() on its collision. It looks like the ODE and ubODE physics engines
don't exhibit this problem because of the order that collisions are reported to
the simulator. The fix is some code re-organization in SceneObjectPart.cs.

Still in the pipeline is the proper implementation of PhysicsShapeType
and then physics engine implementation of raycast.

[OpenSimulator]: http://opensimulator.org/
[source repository]: git://opensimulator.org/git/opensim
[Bullet physics engine]: http://bulletphysics.org/
[Mantis 7132]: http://opensimulator.org/mantis/view.php?id=7132
[Mantis 8010]: http://opensimulator.org/mantis/view.php?id=8010
[Mantis 8011]: http://opensimulator.org/mantis/view.php?id=8011
