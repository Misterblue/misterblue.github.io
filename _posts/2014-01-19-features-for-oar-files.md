---
layout: post
status: publish
published: publish
title: Features for OAR files
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 887
wordpress_url: http://misterblue.com/?p=887
date: 2014-01-19 10:55:46
categories:
- Misterblue
- OpenSimulator


---
I wanted to make the creation of varregions easier so I added someÂ parameters to the 'load oar' simulator command. But, while I was inÂ the area, I got a little carried away.

For varregions, 'load oar' now has a '--displacement "&lt;x,y,z&gt;"' parameter. This displaces all of the objects and the terrain from the oar fileÂ when loading them into the new region. For instance, say you have fourÂ OAR files from four adjacent 256x256 regions (oar00.oar, oar01.oar, oar10.oar,Â and oar11.oar). You create a new 512x512 varregion named 'bigregion'.
The following commands place the four regions of objects, terrains and parcelsÂ into the new larger region:
<pre style="padding-left: 30px;">change region bigregion
load oar oar00.oar
load oar --displacement "&lt;0,256,0&gt;" --merge --forceterrain --forceparcel oar01.oar
load oar --displacement "&lt;256,0,0&gt;" --merge --forceterrain --forceparcel oar10.oar
load oar --displacement "&lt;256,256,0&gt;" --merge --forceterrain --forceparcel oar11.oar</pre>
Note the new "--forceterrain" and "--forceparcel" parameters. "--merge", used byÂ itself, is for merging together the objects from multiple OARs. Merging alsoÂ suppresses the loading of terrain and parcel data which is just what you wantÂ when merging objects. But, if loading multiple OARs to create a new, larger region,Â the terrain and parcel information must be loaded. Thus the new parameters.

While I was in the neighborhood, I also added '--rotation degrees' andÂ '--rotationcenter "&lt;x,y,z&gt;"'. These apply a rotation to all the objects in theÂ OAR file before they are displaced and placed in the new region. The rotationÂ center is relative to the original OAR and defaults to "&lt;128,128,0&gt;". At the moment,Â the rotation is applied only to objects and not the terrain or parcels.

Say you have a 512x512 region named 'bigregion2' and an oar file with buildingsÂ named 'buildings.oar' which is from a 256x256 region. The following placesÂ the buildings big region rotated 30 degrees without modifying the terrain:
<pre style="padding-left: 30px;">change region bigregion2
load oar --merge --displacement "&lt;128,128,0&gt;" --rotation 30 buildings.oar</pre>
The caveat to all this is that it is only in the 'varregion' source branch.Â More testing will make it get into the master branch quicker so test and fileÂ those manti.

And have fun with those OAR files.
