On February 12, 2022, Frans Charming published to [opensim-dev/opensim-users]
(http://opensimulator.org/pipermail/opensim-users/2022-February/015641.html)
mailing lists responses from the OSCC21 conference on new features/improvements
that people would like to see in OpenSimulator.

Here is my rework of that list along with a few of the mailing list responses.

1. PBR Textures are only partially supported. It would be nice to see
   more of a full implementation to help bring the virtual world up to the
   standards of the gaming industry that people see when they play games.

2. It would be great if Open Simulator could import other formats like
   FBX and/or glTF with mesh, textures, and animations able to be uploaded.
   That would make content a lot easier to bring in than the archaic BVH and
   DAE formats. Most modern virtual worlds work with these formats and some
   even have ability to pull from places like 3dwarehouse and import avatars
   from readyplayer.me.
    Onefang (onefang@gmail.com)
        About a decade ago I added an experimental feature to Imprudence viewer.
        You put a specially formatted hover text on something, it would download
        and disploy a mesh from that URL, for about 20 different mesh formats.
        Also, that specially formatted hover textn got hidden.  If I recall, some
        of my test meshes where from 3dwarehouse or something like it.
        No need for OpenSim support, but it was a hack.

3. The OpenSimulator-Wiki needs a massive update. Most pages are either
   confusing, outdated or incomplete. E.g. the page 'Upgrading': It says "We
   don't recommend that you simply copy over your existing config files". Some
   lines below it says "Copy... The opensim.ini file". And it says "SEE
   Discussion at Talk:Upgrading". When you take a look at this, it says "last
   modified on 24 July 2009". And why are instructions at all in a discussion
   page? The Wiki software itself is outdated, it is from 2013. The privacy
   policy page is empty. It requires also RL name and address of at least one
   person who is responsible for the website and its content. Without that it
   is neither legal nor trustworthy. The same applies to the Mantis. Ever
   tried to delete your account or the contact an admin via email? Not
   working. Do you think, anyone will ever take OpenSimulator seriously?

4. On perfoming a HG teleport it should be possible to access the
   welcome page of the target grid.

5. One button publishing of Blender scenes to opensim. There was once a
   project to allow people to build a scene in Blender and publish it to
   opensim / realextend. There are now many many more Blender users and there
   is now a huge interest in the metaverse. This is an opensource project. It
   could be resurrected and bring a LOT of Blender builders into opensim.
   Here's the code: https://github.com/b2rex/b2rex. Here's a youtube
   description: https://www.youtube.com/watch?v=8biEltPsWT8
    Dahlia Trimble
        Regarding item #5, importing Blender scenes: I believe this exists to some
        extent already via the Blender Collada export module. It will format a
        multiple object Blender scene into a single .dae file and when imported via
        the viewer, will rez into multiple in-world objects. There's also an
        "export for OpenSim" (or some such) option in the export module, but I
        don't remember exactly what it do

6. A massively improved system avatar, which makes mesh avatars obsolete
   😛 (at least partially). Those system avatars are easier to customize, so
   new/older/handicapped users have it easier.

7. Copy Complete Prim and Mirror Complete prim buttons or options for
   symmetrical builds

8. Having the system trees and plants (those in Build window) updated to
   properly made mesh objects, but also in the ways they automatically snap to
   ground level. And when it is grass, it still has to be placed as mats
   keeping the terrain topology. So we have a bunch of standard plants in our
   libraries. At least you should publish information on how we can change the
   library content by ourself.
    Onefang
        The existing system trees are butt ugly only coz in viewers their LOD is
        by default set to very very low, and animated trees are turned off.  No
        need for "properly made mesh", just update viewer code so the trees look
        better.  Mesh system trees would just waste resources.

9. Chat decoupled from core
    Onefang: I plan to add XMPP based chat

10. Secure HG protocol decoupled from core
    Onefang: something like that planned

11. Code modernization/modularization
    Onefang: working on that

12. Community support

13. Interoperability with other platforms
    Onefang: working on that

14. TTS and STT

15. Instead of new features I would like to see getting the many bugs
   fixed and the installation simplified, because so many people just want a
   local grid for content creation or tinkering. if we could make it easier
   for them, they would also become members of the HG community one by one.
    Onefang:
        I have a theory that the quality of an open source project is inversely
        proportional to the number of forks.  OpenSim and SL / OS viewers have a
        lot of forks.  I have one to.  lol

16. The platform is an amazing and suitable tool for learning and social
   networking by design. The viewer is extremely powerful and has very
   advanced features, and as such, can generally be considered rather insanely
   difficult to get into for a new user. Viewer devs and grid runners could
   form teams, or otherwise work together, to ensure new users have acces to
   that information globally, from the beginning. Things like object creatino,
   inventory usage and avatar customization should be more accessible to all
   users.

17. easy access viewerr for new users

18. New renderer that can support VR - and then a Steam VR, Quest 2 or
   VRML client.
    Onefang:
        There's at least three VR viewers already, might be four.  I worked on
        one long ago, and it wasn't the first.

19. A kind of .htaccess, so I can route teleport attempts to deleted or
   renamed regions to another region. It should in addition send a message to
   the avatar, and tell him to create a new landmark.

20. A way for scripters to know under what opensim environment /
   scripting engine the region is running under . THere is a OSL function to
   have that reported but its rights of use is too restrictive . It should be
   allowed to know that information from any scripts since X and Y engines are
   not fully compatible .

21. Programmable TEXT-TO-SPEECH in the Viewer with associated VISEMES
   for AV mouth , face and eyebrows.........

22. meta

23. Since most grids are just small standalone ones with hypergrid
   enabled, there is no need for huge MySQL databases. Running, setting up and
   maintaining a MySQL instance is far over the top for such tiny grids.
   SQLight is sufficient. The only problem which remains, is that the asset
   database blows up quickly, because content deleted from all regions and
   inventories remains forever in the database. If you are into content
   creation and upload mesh and textures very often, the database blows up to
   several GB, where maybe less than one is required. Therefor a kind of
   garbage collector would be fine. (one can export and reimport regions and
   profiles into empty databases, but that breaks up too much and is too
   complex for most grid owners). So I want to see - a garbage collector for
   the asset database - SQLight support for groups
    Onefang:
        You can use FSASSETS for file based assets, and avoid filling up any
        database.  However converting from database to FSASSETS leaves all the
        converted assets in the database as well as creating the new files.  Also
        it didn't convert them all at once, only any time it stumble across an
        asset would it convert.

Proper garbage collection and deletion would be great.


24. Support for Shared Environments that Firestorm has build in.
    Onefang:
        Which of the half dozen ways of sharing environments do you mean?  They
        keep inventing new ones.  LightShare was added to OpenSim over a decade
        ago.  Most viewers support it.

        I've added this entire list to my personal Mantis.

--------------
Luisollo Contepomi (luisillocontepomi@gmail.com)
1.-Opensim Viewer
2.-Voice system
3.-Modules, search, bank, admin by web, integrated in code
-----------------
Dr Ramesh Ramloll (r.ramloll@gmail.com)
*1 maybe we could reiterate the need for a better physics engine.

*2 Ideally, it would be great if the YEngine had the same customization
    functionalities as the XEngine.
    I think we need to resolve a sticking problem: the need to remain back
    compatible with SL at the expense of fixing or advancing various
    functionalities of the YEngine.

*3 I would like to see bi directional hooks/flow of control between the
    operating system and in-world objects. This could allow us to control
    external real world devices from in world events for e.g. for midi control
    of external musical instruments, midi music to control in world animations,
    might make it easier to explore external VR hardware devices and so on. The
    'sex devices' currently implemented in SL seem a little primitive... but
    does illustrate the virtual 2 real use case.
    I truly believe over the next few years we will see a rebalancing of social
    and productivity functions in virtual worlds. Most of the value of virtual
    worlds is centered on social, it's a blessing but also a curse. Injecting
    productivity functions in virtual worlds is not easy, but whoever is able
    to crack it will add tremendous value to virtual worlds in general.
    Ideally, I want to log into a virtual world to achieve a higher level of
    productivity. E.g. would be nice if I could walk into a virtual control
    room in-world to change settings of the real world devices in my house ...
    why in 3D ... there are some advantages for finding things in spatial
    environments, rather than having to dig through hidden menus (debatable I
    know...)

*4 We also have to make it easier for end users to create in-world
    content,  make it as easy as it is for them to post a comment on social
    media.

*5 On the community front, it's hard for us to operate in a social media
    environment with algos rewarding 'attention grabbing' content vs
    'information with the primary goal of educating' content ...but having said
    that there is a lot we can do to promote and support community members.
    Internally, we can of course be more flexible and adopt more modern tools
    for communication, Discord seems satisfactory to many.


