---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Simplifying Regions
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-05-29 14:56:20   # SET DATE
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
One of  the many problems with displaying [OpenSimulator] content in a web browser
is that the WebGL interface doesn't handle lots of draw operations well.

I have been using the [Army Research Lab]'s [Atropia] region OAR files for testing
as it includes meshes as well as many shopping scripted objects.

The Atropia regions consists of nine 256x256 meter regions arranged in a 3 by 3 pattern.
This table summerizes the basic content of the regions.
<table class="mb">
    <tr>
        <th></th>
        <th>test88</th>
        <th>00</th>
        <th>01</th>
        <th>02</th>
        <th>10</th>
        <th>11</th>
        <th>12</th>
        <th>20</th>
        <th>21</th>
        <th>22</th>
    </tr>
    <tr>
        <td>Simple prims</td>
        <td>19</td>
        <td>109</td>
        <td>3088</td>
        <td>10</td>
        <td>416</td>
        <td>9317</td>
        <td>13</td>
        <td>2</td>
        <td>4063</td>
        <td>0</td>
    </tr>
    <tr>
        <td>Sculpties</td>
        <td>0</td>
        <td>1</td>
        <td>0</td>
        <td>0</td>
        <td>187</td>
        <td>1986</td>
        <td>0</td>
        <td>0</td>
        <td>4175</td>
        <td>0</td>
    </tr>
    <tr>
        <td>Mesh assets</td>
        <td>0</td>
        <td>0</td>
        <td>2</td>
        <td>0</td>
        <td>47</td>
        <td>213</td>
        <td>0</td>
        <td>0</td>
        <td>0</td>
        <td>0</td>
    </tr>
</table>

Of the many approaches to making the scene easier to render, I started with merging
meshes that share textures.
I decided that I could partition the scene into two types of objects: static and
non-static. "Static" objects are those with no scripts and no physics. This should be
buildings and plants in the scene. "non-static" objects are those that either have
physics enables or have a script that is waiting for touch or collisions.

This initial thought is that all static objects can be merged and have their
meshes rearranged in any way while the non-static objects need to be kept as separatable objects.
The next table shows a simple partitioning of the regions into these static and
non-static objects.
In this table, "meshes" is the count of individual meshes after prims have been converted
into meshes for rendering (a single prim will convert into 6 or more face meshes).

<table class="mb">
    <tr>
        <th></th>
        <th>test88</th>
        <th>00</th>
        <th>01</th>
        <th>02</th>
        <th>10</th>
        <th>11</th>
        <th>12</th>
        <th>20</th>
        <th>21</th>
        <th>22</th>
    </tr>
    <tr>
        <td>Static meshes</td>
        <td>166</td>
        <td>928</td>
        <td>15995</td>
        <td>44</td>
        <td>2910</td>
        <td>55398</td>
        <td>95</td>
        <td>15</td>
        <td>17499</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Static materials/textures</td>
        <td>93/4</td>
        <td>520/30</td>
        <td>8141/81</td>
        <td>8/3</td>
        <td>1209/80</td>
        <td>27402/637</td>
        <td>44/11</td>
        <td>5/3</td>
        <td>16256/38</td>
        <td>1/1</td>
    </tr>
    <tr>
        <td>nonStatic meshes</td>
        <td>0</td>
        <td>0</td>
        <td>5799</td>
        <td>20</td>
        <td>0</td>
        <td>4993</td>
        <td>0</td>
        <td>0</td>
        <td>120</td>
        <td>0</td>
    </tr>
    <tr>
        <td>nonStatic materials/textures</td>
        <td>0/0</td>
        <td>0/0</td>
        <td>2671/37</td>
        <td>8/3</td>
        <td>0/0</td>
        <td>1618/94</td>
        <td>0/0</td>
        <td>0/0</td>
        <td>53/15</td>
        <td>0/0</td>
    </tr>
</table>

So, all the static meshes were combined into a set of rebuilt meshes each of which
shared similar surface materials (and thus could use the same WebGL draw command).
Each of the non-static objects has any common material meshes combined and the
resulting numbers were:

<table class="mb">
    <tr>
        <th></th>
        <th>test88</th>
        <th>00</th>
        <th>01</th>
        <th>02</th>
        <th>10</th>
        <th>11</th>
        <th>12</th>
        <th>20</th>
        <th>21</th>
        <th>22</th>
    </tr>
    <tr>
        <td>Rebuilt static meshes</td>
        <td>12</td>
        <td>128</td>
        <td>801</td>
        <td>7</td>
        <td>375</td>
        <td>4014</td>
        <td>32</td>
        <td>3</td>
        <td>211</td>
        <td>1</td>
    </tr>
    <tr>
        <td>Rebuilt nonStatic meshes</td>
        <td>0</td>
        <td>0</td>
        <td>654</td>
        <td>6</td>
        <td>0</td>
        <td>857</td>
        <td>0</td>
        <td>0</td>
        <td>33</td>
        <td>0</td>
    </tr>
    <tr>
        <td>Total WebGL draws</td>
        <td>12</td>
        <td>128</td>
        <td>1055</td>
        <td>13</td>
        <td>375</td>
        <td>4868</td>
        <td>32</td>
        <td>3</td>
        <td>244</td>
        <td>1</td>
    </tr>
    <tr>
        <td>draws before rebuild</td>
        <td>166</td>
        <td>928</td>
        <td>21794</td>
        <td>64</td>
        <td>2910</td>
        <td>60391</td>
        <td>95</td>
        <td>15</td>
        <td>17619</td>
        <td>1</td>
    </tr>
</table>

As you can see from the last rows, the rebuilding and merging of common surface materials
significantly reduced the number of potential WebGL draw commands.

Merging common materials gets the number of draws within usability, there are still some
problems:

- even at 1000 draws, atropia02 still crashes [ThreeJS] and [BabylonJS] with out of memory
errors;
- materials with transparency (most commonly the plant sculpties) cannot be merged as most
3D renderers will Z-order transparent meshes but do not depth order the individual triangles
within a mesh;

The above scene rebuild was mesh-centric. That is, the meshes were merged without thought
to what they belonged to (other than static and non-static). Since these scenes have many
duplicated meshes (the bushes scattered around the scenes), another approach would be to
use mesh instancing to reduce draws. This technique will be explored next.

[OpenSimulator]: http://opensimulator.org/
[Army Research Lab]: https://www.arl.army.mil/
[Atropia]: http://www.hypergridbusiness.com/2014/01/military-releases-atropia-simulation/
[ThreeJS]: https://threejs.org/
[BabylonJS]: http://www.babylonjs.com/
