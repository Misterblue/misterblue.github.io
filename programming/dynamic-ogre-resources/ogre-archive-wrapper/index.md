---
layout: page
status: publish
published: publish
title: Ogre Archive Wrapper
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com

wordpress_id: 781
wordpress_url: http://misterblue.com/?page_id=781
date: 2009-03-30 10:17:11
categories:
- LookingGlass
- Programming

---
<h1>Archive Wrapper</h1>
<blockquote>
This article was written in March 2009 and relates to OGRE 1.6.1 [Shoggoth]. Maybe some of this is changed or improved in later versions. 
</blockquote>
<p>
As described in the article on <a href="/programming/dynamic-ogre-resources">dynamically loading Ogre resources</a>, I achieved much of the dynamic loading by adding an archive manager for my resource group. The routine acts as a wrapper for <code>Ogre::FileSystemArchive</code> which does the actual file searching.
</p>
<pre>
#pragma once
#include "MyCommon.h"
#include "OgreArchive.h"
#include "OgreArchiveFactory.h"

class MyArchive : public Ogre::Archive {
protected:
    Ogre::String m_name;
    Ogre::String m_type;
    Ogre::Archive* m_FSArchive;
    Ogre::String m_defaultMeshFilename;
    Ogre::String m_defaultTextureFilename;
    int ExtractResourceTypeFromName(Ogre::String) const;
public:
    MyArchive( const Ogre::String& name, const Ogre::String& archType );
    ~MyArchive(void);

    // Ogre::Archive
    const Ogre::String& getName(void) const { return m_name; }
    bool isCaseSensitive(void) const;
    void load();
    void unload();
    Ogre::DataStreamPtr open(const Ogre::String& filename) const;
    Ogre::StringVectorPtr list(bool recursive = true, bool dirs = false);
    Ogre::FileInfoListPtr listFileInfo(bool recursive = true, bool dirs = false);
    Ogre::StringVectorPtr find(const Ogre::String& pattern, bool recursive = true, bool dirs = false);
    bool exists(const Ogre::String& filename);
    time_t getModifiedTime(const Ogre::String& filename);
    Ogre::FileInfoListPtr findFileInfo(const Ogre::String& pattern,
        bool recursive = true, bool dirs = false);
    const Ogre::String& getType(void) const { return m_type; }
    // END OF Ogre::Archive
};

// our ArchiveFactory
class _OgrePrivate MyArchiveFactory : public Ogre::ArchiveFactory {
public:
    virtual ~MyArchiveFactory() {}
    const Ogre::String& getType(void) const;
    Ogre::Archive* createInstance( const Ogre::String&);
    void destroyInstance( Ogre::Archive* arch) { delete arch; }
};
</pre>
<p>
The code is a simple subclass of <code>Ogre::Archive</code>. Internally it creates an instance of <code>Ogre::FileSystemArchive</code> and most of the requests are just passed through.
</p>
<p>
Notice that the name of the archive is actually the name of the directory the archive is supposed to search. This is a feature of the archives -- they are created and named and there is not another parameter to specify the target directory. The name is the directory. So here, when we create the filesystem archive, we pass our own name to it.
</p>
<pre>
#include "StdAfx.h"
#include "MyArchive.h"
#include "OgreFileSystem.h"

MyArchive::MyArchive( const Ogre::String& name, const Ogre::String& archType )
            : Ogre::Archive(name, archType) {
    m_FSArchive = NULL;
    return;
}

MyArchive::~MyArchive(void) {
    unload();
}

// Get the name of this archive
// const String& MyArchive::getName(void) const { return mName; }

/// Returns whether this archive is case sensitive in the way it matches files
bool MyArchive::isCaseSensitive(void) const {
    return m_FSArchive->isCaseSensitive();
}

// Loads the archive.
void MyArchive::load() {
    // this is really a wrapper for a filesystem archive
    LookingGlassOgr::Log("MyArchive::load(): mName=%s", mName.c_str());
    m_defaultMeshFilename = GetParameter("Renderer.Ogre.DefaultMeshFilename");
    m_defaultTextureFilename = GetParameter("Renderer.Ogre.DefaultTextureFilename");
    m_FSArchive = OGRE_NEW Ogre::FileSystemArchive(mName, "XXOLFilesystem");
    m_FSArchive->load();
}

// Unloads the archive.
void MyArchive::unload() {
    Ogre::ArchiveManager::getSingleton().unload(m_FSArchive);
}

// Open a stream on a given file.
Ogre::DataStreamPtr MyArchive::open(const Ogre::String& filename) const {
    if (m_FSArchive->exists(filename)) {
        return m_FSArchive->open(filename);
    }
    // if the file doesn't exist, just return a default type
    try {
        Ogre::MemoryDataStream* renamed = 0;
        switch (ExtractResourceTypeFromName(filename)) {
            case ResourceTypeMaterial:
                // we don't do materials, these are handled at a higher level if they don't exist.
                // Return an empty stream
                return Ogre::DataStreamPtr();
            case ResourceTypeMesh:
                return m_FSArchive->open(m_defaultMeshFilename);
            case ResourceTypeTexture:
                return m_FSArchive->open(m_defaultTextureFilename);
        }
    }
    catch (char* e) {
        Log("MyArchive::open(): default shape not found: %s", e);
    }
}

// List all file names in the archive.
Ogre::StringVectorPtr MyArchive::list(bool recursive, bool dirs) {
    // return m_FSArchive->list(recursive, dirs);
    return Ogre::StringVectorPtr(new Ogre::StringVector());
}

// List all files in the archive with accompanying information.
Ogre::FileInfoListPtr MyArchive::listFileInfo(bool recursive, bool dirs) {
    // return m_FSArchive->listFileInfo(recursive, dirs);
    return Ogre::FileInfoListPtr(new Ogre::FileInfoList());
}

Ogre::// Find all file or directory names matching a given pattern
StringVectorPtr MyArchive::find(const Ogre::String& pattern, bool recursive, bool dirs) {
    // return m_FSArchive->find(pattern, recursive, dirs);
    return Ogre::StringVectorPtr(new Ogre::StringVector());
}

// Find out if the named file exists (note: fully qualified filename required) */
bool MyArchive::exists(const Ogre::String& filename) {
    if (m_FSArchive->exists(filename)) {
        return true;
    }
    // it isn't in the cache so we have to request it. Figure out what to request
    int rType = ExtractResourceTypeFromName(filename);
    if (rType != ResourceTypeUnknown) {

        RequestResource(filename.c_str(), rType);
        return true;
    }
    return false;
}

// Retrieve the modification time of a given file */
time_t MyArchive::getModifiedTime(const Ogre::String& filename) {
    return m_FSArchive->getModifiedTime(filename);
}

// Find all files or directories matching a given pattern in this
Ogre::FileInfoListPtr MyArchive::findFileInfo(const Ogre::String& pattern,
              bool recursive, bool dirs) {
    return m_FSArchive->findFileInfo(pattern, recursive, dirs);
}

const Ogre::String& MyArchiveFactory::getType(void) const {
    static Ogre::String name = MyArchiveTypeName;
    return name;
}

Ogre::Archive* MyArchiveFactory::createInstance( const Ogre::String& name ) {
    return OGRE_NEW MyArchive(name, MyArchiveTypeName);
}

//From the filename, figure out what type of resource it is. We use the file extension
// but we also always return 'texture' for unknown types because they will be .png, .jpg, etc
int MyArchive::ExtractResourceTypeFromName(Ogre::String resourceName) const {
    int ret = ResourceTypeUnknown;
    if (resourceName.size() > 5
            && resourceName.substr(resourceName.size()-5, 5) == ".mesh") {
        ret = ResourceTypeMesh;
    }
    else {
        if (resourceName.size() > 9
                && resourceName.substr(resourceName.size()-9, 9) == ".material") {
            ret = ResourceTypeMaterial;
        }
        else {
            ret = ResourceTypeTexture;
        }
    }
    return ret;
}
</pre>

