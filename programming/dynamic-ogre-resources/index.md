---
layout: post
status: publish
published: publish
title: Dynamic Ogre Resources
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 759
wordpress_url: http://misterblue.com/?page_id=759
date: 2009-03-29 08:41:14
categories:
- Programming
- LookingGlass

comments:
- id: 2701
  author: James Wynn
  author_email: james@jameswynn.com
  author_url: http://jameswynn.com
  date: 2009-03-30 07:23:28
  date_gmt: 2015-04-25 04:22:37
  content: Awesome work man! I have been trying to figure out the material reload thing for quite some time. Good luck on that patch, it will be a nice addition to Ogre.
- id: 2702
  author: Misterblue &raquo; Blog Archive &raquo; Dynamic Loading of Ogre Resources
  author_email: 
  author_url: http://misterblue.com/wwpp/archives/20090330-dynamic-loading-of-ogre-resources
  date: 2009-03-30 10:43:44
  date_gmt: 2015-04-25 04:22:37
  content: '[...] figured some of it out and wrote up Dynamic Loading of Ogre Resources. Hopefully this will save some other people many frustrating [...]'
- id: 2753
  author: Misterblue &raquo; Blog Archive &raquo; More Ogre Dynamic Loading
  author_email: 
  author_url: http://misterblue.com/wwpp/archives/20090620-more-ogre-dynamic-loading
  date: 2009-06-20 01:45:52
  date_gmt: 2015-04-25 04:22:37
  content: '[...] Ogre Dynamic Loading  I updated my page on dynamically loading meshes, materials and textures in Ogre with information for textures. Turns out that the requests for the textures works out but [...]'
- id: 4511
  author: peter
  author_email: yizhang88.net@gmail.com
  author_url: 
  date: 2010-12-22 12:31:15
  date_gmt: 2015-04-25 04:22:37
  content: "Hi MisterBlue!\r\n    I read your article \"Dynamic Loading of Ogre Resources\",since I have same situation that request ogre resources from servers.It's quit useful for me,alse I have some problem with your pseudo code, \r\n             MeshManager::prepare(meshName, groupName)...\r\n             MeshManager::load(meshName, groupName)...\r\n    please give me more tips and some demo code.\r\n\r\n    Thanks"
- id: 8067
  author: mehrshad
  author_email: mehrshad.NkNz@yahoo.com
  author_url: 
  date: 2011-07-12 09:26:25
  date_gmt: 2015-04-25 04:22:37
  content: i want to load a big city , can i use this way ? :-?
- id: 8079
  author: Misterblue
  author_email: misterblue@misterblue.com
  author_url: 
  date: 2011-07-12 11:07:31
  date_gmt: 2015-04-25 04:22:37
  content: Not sure what you are asking, Mehrshad. The description is about adding objects to the Ogre scene graph after Ogre has started running. If you do a little scheduling (only adding a limited number of things between each rendering frame) you should be able to load large numbers of items.
- id: 73019
  author: Yossi
  author_email: yossi.tokash@walla.com
  author_url: 
  date: 2014-07-15 11:32:21
  date_gmt: 2015-04-25 04:22:37
  content: >-
    Wow !!!

    A complete breakdown of the resource loading system.



    Kudos :)
---
<h1>Dynamic Loading of Ogre Resources</h1>
<blockquote>This article was written in March 2009 and relates to OGRE 1.6.1 [Shoggoth]. Maybe some of this is changed or improved in later versions. <strong>Updated 20090620</strong> with discussion and code on reloading of textures.</blockquote>
I am working on a project which uses Ogre as the 3D renderer of objects and textures fetched from a server. Ogre, though, is built around a game design workflow and the ability to dynamically load and insert objects into an Ogre rendered scene is not obvious.

This article describes my solution. I will put some code which is a chopped up version of my running code. Any code on this page is licensed under the BSD license. If you have any questions, you can contact me at misterblue at misterblue dot com.
<h3>Default Ogre Resource Workflow</h3>
Ogre is designed around preloaded resources. The usual application is a game that has been authored and is loaded onto the computer. All of the Ogre resources (meshes, textures, materials, ...) are on the disk and are read and indexed at application load time. The <code>resources.cfg</code> file lists the directories to find resources and <code>Ogre::ResourceGroupManager::InitializeAllResourceGroups()</code> causes all of the resources to be read in and initialized. There after, when a mesh is needed, for instance, Ogre::MeshManager is called to load the mesh and, viola, the mesh is available to be rendered. (Materials are a little different which is discussed below).
<h3>Dynamic Resource Loading</h3>
My application has nothing preloaded. <code>resources.cfg</code> points only to the barest of directories which contain only default textures and materials. The application connects to a server and starts receiving meshes and object locations for display. As objects are received, I need to hook the mesh into the scene graph and load the materials and textures needed to display that mesh. So, for my application, I have to handle complete dynamic loading of Ogre resources.

Looking over the forums, the power user solution to this problem is to edit the Ogre sources and replace the existing resource manager. This creates a custom version of Ogre that perfectly fits the required solution.

I wished to use an unmodified Ogre binary so I set out to find a solution that does not require rebuilding Ogre. My design is: when Ogre notices it does not have a necessary resource, it displays a default resource while requesting the real resource. When the real resource is available, Ogre is made to reload the resource and thus start displaying the real shape/texture/... I also chose to cache everything on disk. It is a "simple matter of programming" to add some database storage system if needed.
<h3>Meshes</h3>
Meshes are pretty easy. I defined my own resource group and added an archive class to catch the file reads. Since, in my application, meshes (displayed objects) are pushed into the scene, I can declare the mesh and thus cause <code>Ogre::MeshManager</code> to do all the right things with fetching the resource from the archives. My archive handler at the bottom catches the mesh request the reads the mesh resource. Here is the code that starts it all:
<pre>void RendererOgre::AddEntity(Ogre::SceneManager* sceneMgr, Ogre::SceneNode* sceneNode,
                                  char* entName, char* meshName) {
    Ogre::ResourceGroupManager::getSingleton().declareResource(meshName,
                                  "Mesh", MyResourceGroupName
                                   );
    Ogre::MovableObject* ent = sceneMgr-&gt;createEntity(entName, meshName);
    sceneNode-&gt;attachObject(ent);
    return;
}</pre>
I declare the mesh to <code>Ogre::ResourceGroupMananger</code> and declare it to be in my resource group. This is a nicety that really doesn't effect anything. Then, an <code>Ogre::Entity</code> is created on an existing scene node and the mesh (in name only) is attached to it. Here we only specify the name of the mesh and the declare to the manager will mean the mesh is known and needs to be loaded.

Let's take a moment to understand (at least as far as I do) how Ogre resources work. At the top level is <code>Ogre::ResourceGroupManager</code>. This manager is the controller of all the resource managers. <code>Ogre::ResourceGroupManager</code> keeps a list of all declared resources and, when initialized, it calls the appropriate managers to create and prepare the resources. After that, the group manager is only good for making general calls down into the various managers.

Most of the work is done by the type specific resource managers (<code>Ogre::MeshManager, Ogre::MaterialManager, ...</code>). In our above code, we put the name of a mesh on the entity node. Later, the rendering thread will call the mesh manager to find and load a mesh by that name. The mesh manager will create a mesh object and then call the archive handlers to read it in. Remember the lines you put in <code>resource.cfg</code>? Saying something like "Filesystem=../media/meshes" has the effect of creating an instance of <code>Ogre::FilesystemArchive</code> initialized to recursively search the directory "../media/meshes". The resource managers eventually call the archive instances to find the datastream to read the resource contents from. This can be short circuited by specifying a manual loader for a resource but that's for another article.

I inserted myself into this process by creating an archive class that is a wrapper around a filesystem archive. The wrapper checks to see if the file in the filesystem exists. If it does not, it generates the request to dynamically load the resource and then it returns a default datastream. So, for meshes, my archive returns a default mesh (a sphere) while requesting that the real mesh be loaded into the filesystem. [[TODO: insert a discussion of how resource names correspond to filenames and what that implies here.]]

Here is some pseudo code that shows the calling sequence. This is a mixture of calling sequences (one routine calling the next is shown as indented code) and decision logic. Loading a mesh calls the manager who finds the mesh who is loaded and its loading causes calls to the archives to get the data from where ever it is stored.
<pre>MeshManager::prepare(meshName, groupName)
    MeshManager::createOrRetreive(meshName, groupName)
        mesh = ResourceManager::createOrRetreive(meshName, groupName)
        mesh.prepare()
            Resource::prepare()
                Mesh::prepareImpl()
                    ResourceGroupManager::getSingleton().openResource(meshName, groupName)
                        if (loadingListener)
                            loadingListener-&gt;resourceLoading(meshName, groupName, resourceBeingLoaded)
                        grp = getResourceGroup(groupName)
                        grp-&gt;resourceIndexCaseSensitive(resourceName)
                        if (found)
                            stream = foundArchive-&gt;open(resourceName)
                            if (loadingListener)
                                loadingListener-&gt;resourceStreamOpened(resourceName, groupName, resourecBeingLoaded, stream)
                            return stream
                         else
                             grp-&gt;resoureceIndexCaseInsensitive(resoureceName.toLower())
                              if (found)
                                  stream = foundArchive-&gt;open(resourceName)
                                  if (loadingListener)
                                      loadingListener-&gt;resourceStreamOpened(resourceName, groupName, resourceBeingLoaded, stream)
                                  return stream
                              else
                                  foreach (archive in grp-&gt;locationList)
                                      if (archive-&gt;exists(resourceName))
                                          stream = archive-&gt;open(resourceName)
                                          if (loadingListener)
                                              loadingListener-&gt;resourceStreamOpened(resourceName, groupName, resourecBeingLoaded, stream)
                                          return stream
                           if (shouldSearchAllGroups)
                               grp = findGroupContainingResoureceImpl(resourceName)
                                   doTheSameCodeAboveForEachGroup
                memoryCopy = new MemoryDataStream(stream)
MeshManager::load(meshName, groupName)
    MeshManager::createOrRetreive(meshName, groupName)
        mesh = ResourceManager::createOrRetreive(meshName, groupName)
        mesh.load()
            Resource::load()
                Mesh::loadImpl()
                    MeshSerializer.importMesh(memoryCopy)</pre>
What you should get from all that is the resource system searches across all the archives several different ways in an attempt to find the data for the mesh. Once a datastream is found, it is read into memory and later imported as the mesh data. So, if I just slip in a new archive, I can load anything I want into the mesh.

A copy of sample archive code is <a href="/programming/dynamic-ogre-resources/ogre-archive-wrapper">HERE</a>. Essentially, it creates an instance of <code>Ogre::FilesystemArchive</code> to do the actual filesystem operations and otherwise looks at the requested resource name and, if it's one of mine, it says "yes it exists". If some thing actually tries to load the resource, the routine starts the process of downloading the actual resource while, in the mean time, returning a stream of default contents. In my case, new meshes show up as a sphere made of a glittery substance until the real mesh is loaded and the displayed mesh is updated.

My updating works by storing the downloaded mesh into the filesystem in the correct cache location (where the filesystem archive will find it) and then, between frames, does a <code>mesh-&gt;reload()</code>. This eventually causes another entry into my archive routine for the mesh of that name and this time it is on the disk. The second time, the mesh is loaded from the disk and all is good.
<h3>Materials Are Resources But They Are Different</h3>
Once I got all that working, I figured it would be easy to do materials. Well, a few weeks later I have finally mastered that materials, while they are <code>Ogre::Resource</code>s, they do not follow the same resource management workflow as meshes. Let me talk about some of the differences.

Materials are scripts. They are read and parsed by one of the script parsers. The invocation of this parsing is not done in <code>Ogre::MaterialManager</code>. The parsing is called in <code>Ogre::ResourceGroupManager::InitializeGroupResources</code>. That is, by default materials are only read and parsed at startup time. So, if you want to create new materials, you either have to build them up with code or you have to call the parser yourself to read from a datastream.

"Well, I'll just use a manual loader then". Nope. Material specifically cannot be loaded manually. The code even has a special error message to tell you this.

Materials are also different in that they have their names embedded in them. For meshes, I could fool the upper systems by passing them any ol' datastream as a default shape. For materials, you'll discover that the parsing routines don't take a material name because they expect to read the name of the material out of the material file.

Thus, materials are always expected to be there. Material loading and unloading only changes the mapping of the material techniques onto the hardware. If a material is not defined when it is needed, the material does not go through the same search-through-all-the-archives code as described for meshes. Also, this means that just reloading a material does not update the display since the material is hidden down under the mesh and does not cause a scene recalculation.

These together mean the archive trick does not work for materials. So, what to do? You might have noticed in the above calling sequence example several checks for listeners. If the listener was specified, the routine calls out to allow modifications to the code flow. Well, some listeners were added to Ogre which allow material loading.

Materials are used in meshes. When a mesh is read in, <code>Ogre::MeshSerializer</code> accepts an optional listener which is called when the mesh is being parsed and a material name is encountered. While initializing Ogre, I do:
<pre>Ogre::MeshManager::getSingleton().setListener(new MyMeshSerializerListener());</pre>
Inside <code>MyMeshSerializerListener</code> is a routine for processing the found material name:
<pre>// called when mesh is being parsed and it comes across a material name
// check that it is defined and, if not, create it and read it in
void MyMeshSerializerListener::processMaterialName(Ogre::Mesh* mesh, Ogre::String* name) {
	// get the resource to see if it exists
    Ogre::ResourceManager::ResourceCreateOrRetrieveResult result =
            Ogre::MaterialManager::getSingleton().createOrRetrieve(*name, OLResourceGroupName);
    if ((bool)result.second) {
        // the material was created by createOrRetreive() -- try to read it in
        // The created material is an empty, blank material so we must fill it
            Ogre::MaterialPtr theMaterial = result.first;
            // Do the magic to make this material happen
            FabricateMaterial(*name, theMaterial);
    }
}

// We have been passed a material that needs to be filled in. We try to read it in from
// the file. If the file is not there, we fill it with the default texture and request
// the loading of the real material. When that real material is loaded, someone will call
// RefreshMaterialUsers.
void MyMeshSerializerListener::FabricateMaterial(Ogre::String name, Ogre::MaterialPtr matPtr) {
    // Try to get the stream to load the material from.
    Ogre::DataStreamPtr stream = Ogre::ResourceGroupManager::getSingleton().openResource(name,
            MyResourceGroupName, true, matPtr.getPointer());
    if (stream.isNull()) {
        // if the underlying material doesn't exist, return the default material
        // and request the real material be constructed
        MakeMaterialDefault(matPtr);
        Ogre::Material* mat = matPtr.getPointer();
        RequestResource(name, MyResourceTypeMaterial);
    }
    else {
        // There is a material file under there somewhere, read the thing in
        try {
            Ogre::MaterialManager::getSingleton().parseScript(stream, Ogre::String(MyResourceGroupName));
            Ogre::MaterialPtr matPtr = Ogre::MaterialManager::getSingleton().getByName(name);
            if (!matPtr.isNull()) {
                // is this necessary to do here? Someday try it without
                matPtr-&gt;compile();
                matPtr-&gt;load();
            }
        }
        catch (Ogre::Exception&amp; e) {
	    Log("MyMeshSerializerListener::FabricateMaterial: error creating material %s: %s",
				name.c_str(), e.getDescription().c_str());
        }
        stream-&gt;close();
    }
    return;
}</pre>
So, the above code checks to see if the material exists. If it doesn't, I do the <code>Ogre::ResourceGroupManager::openResource</code> which does all the searching through the archives. If it's found there, I have to parse the material script and then see that the material is loaded. If the file does not exist, I request the async thread to create the file (request it from the server) and, in the mean time, I initialize the new material structure with a default material specification.

Now, what happens when the material file is created? I can't use the re-reading from the file trick because materials don't unload like a mesh. My routine has to create the needed material (this works for me since I don't get a .material file from the server but a description of the surface parameters). I serialize it to disk for the next application run. My routine can compile and load the material but that doesn't update the scene. That is because the materials are integrated into the rendering engine when the mesh is loaded (creating all the different passes and such). Just changing the material does not change any of that. So, what I have to do is go find all the meshes that use a newly loaded material and reload the mesh. This reloads all the submesh info and thus all the materials.
<pre>// Routine to cause Ogre to redisplay the material. The problem is that changing a
// material and reloading it does not cause Ogre to reload the entities that use the
// material. Therefore, it looks like you change the material but the thing on the
// screen does not change.
// This routine walks the entity list and reloads all the entities that use the
// named material
// Note that this does not reload the material itself. This presumes you already did
// that and you now just need Ogre to get with the program.
// This must be called at between frames.
void MyMeshSerializerListener::RefreshMaterialUsers(const Ogre::String&amp; matName) {
    std::list m_meshesToChange;
    // only check the Meshs for use of this material
    Ogre::ResourceManager::ResourceMapIterator rmi = Ogre::MeshManager::getSingleton().getResourceIterator();
    while (rmi.hasMoreElements()) {
        Ogre::MeshPtr oneMesh = rmi.getNext();
        Ogre::Mesh::SubMeshIterator smi = oneMesh-&gt;getSubMeshIterator();
        while (smi.hasMoreElements()) {
            Ogre::SubMesh* oneSubMesh = smi.getNext();
            if (oneSubMesh-&gt;getMaterialName() == matName) {
                // this mesh uses the material
                // we sometimes get multiple materials for one mesh -- just reload once
                std::list::iterator ii = m_meshesToChange.begin();
                while (ii != m_meshesToChange.end()) {
                    if (ii-&gt;getPointer()-&gt;getName() == oneMesh-&gt;getName()) {
                        break;
                    }
                }
                if (ii == m_meshesToChange.end()) {
                    m_meshesToChange.push_front(oneMesh);
                }
                break;
            }
        }
    }
    if (!m_meshesToChange.empty()) {
        for (std::list::iterator ii = m_meshesToChange.begin();
                          ii != m_meshesToChange.end(); ii++) {
            ii-&gt;getPointer()-&gt;reload();
        }
        m_meshestoChange.clear();
    }
    return;
}</pre>
<h3>Textures</h3>
Now I have meshes with materials specified. The materials specify textures so what about them? Well, the texture resource manager is a well behaved manager like the mesh resource manager. When a texture is needed, <code>Ogre::TextureManager</code> is called and it does the searching through the archives for the file. So, for textures, the archive hack works. Yea!!

<strong>Update 20090620</strong>. The display update of the textures doesn't happen, though. Sigh. That necessitates a hack similar to the materials but searching deeper into the materials to find the meshes with materials that have the changed texture.
<pre>// find all the meshes that use the texture and add it to a list of meshes
// TODO: figure out of just reloading the resource group is faster
void MyMaterialTracker::GetMeshesToRefreshForTexture(std::list* meshes, const Ogre::String&amp; texName) {
  // only check the Meshs for use of this material
  Ogre::ResourceManager::ResourceMapIterator rmi = Ogre::MeshManager::getSingleton().getResourceIterator();
  while (rmi.hasMoreElements()) {
    Ogre::MeshPtr oneMesh = rmi.getNext();
    Ogre::Mesh::SubMeshIterator smi = oneMesh-&gt;getSubMeshIterator();
    while (smi.hasMoreElements()) {
      Ogre::SubMesh* oneSubMesh = smi.getNext();
      Ogre::String subMeshMaterialName = oneSubMesh-&gt;getMaterialName();
      Ogre::MaterialPtr subMeshMaterial = (Ogre::MaterialPtr)Ogre::MaterialManager::getSingleton().getByName(subMeshMaterialName);
      if (!subMeshMaterial.isNull()) {
        Ogre::Material::TechniqueIterator techIter = subMeshMaterial-&gt;getTechniqueIterator();
        while (techIter.hasMoreElements()) {
          Ogre::Technique* oneTech = techIter.getNext();
          Ogre::Technique::PassIterator passIter = oneTech-&gt;getPassIterator();
          while (passIter.hasMoreElements()) {
            Ogre::Pass* onePass = passIter.getNext();
            Ogre::Pass::TextureUnitStateIterator tusIter = onePass-&gt;getTextureUnitStateIterator();
            while (tusIter.hasMoreElements()) {
              Ogre::TextureUnitState* oneTus = tusIter.getNext();
              if (oneTus-&gt;getTextureName() == texName) {
                // this mesh uses the material
                // we sometimes get multiple materials for one mesh -- just reload once
                std::list::iterator ii = meshes-&gt;begin();
                while (ii != meshes-&gt;end()) {
                  if (ii-&gt;getPointer()-&gt;getName() == oneMesh-&gt;getName()) {
                    break;
                  }
                  ii++;
                }
                if (ii == meshes-&gt;end()) {
                  meshes-&gt;push_front(oneMesh);
                }
                break;
              }
            }
          }
        }
      }
    }
  }
}</pre>
You will notice that this routine and the routine for reloading materials pushes the meshes to update onto a list. This is part of some small optimizations to only reload meshes once (multiple materials can change on a mesh in one frame). I haven't finished timing this work so I'm not sure if just reloading the resource group would be quicker than this.

If you have special needs for building textures, there is an <code>Ogre::ScriptCompilerListener</code> which is called before the script creates any objects. This would be your chance to create your own texture objects as they are referenced in the material script.
<h3>The Other Resource Types</h3>
I don't yet have an answer for this. I haven't yet added animations and skeletons. Stay tuned.
<h3>Additional Notes and Comments</h3>
I don't know why materials are so different than the other resources. I would think that <code>Material.prepare()</code> could do the parsing of the script and thus move that code out of <code>Ogre::ResourceGroupManager</code>. That plus some tainting mechanism to notify the entity containing a material of changes could make material act nearly identical to meshes and textures. I don't know if a well behaved resource manager for materials would break things. Guess I will have to make up a patch.
