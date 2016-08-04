---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Thrift and Python
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-08-04 15:08:20   # SET DATE
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
[Previous posts] have talked about choosing an interconnection system for
the multiple parts of a [Basil viewer] session.
I've started with [Thrift] and I am learning of the bumps in the road.

First of all, Thrift is not well documented. Since it is a low level transport
that was built for larger projects, it makes some sense that the writers of Thrift
really care more about the larger project, but, for us people trying to use Thrift
in a new project, a bunch more documentation would be a help.
Others have started to fill the gap (like Diwaker's [Thrift: The Missing Guide])
but there is still a big barrier to getting started.

I started of trying to use Thrift in JavaScript (the [Pesto server]) and
Python (the test routine for same).
Both of these languages are not, shall I say, first class languages in the implementation.
It seems most of the work on Thrift is for Java and the examples
for the other languages show
one simple example and leave the reader wondering about installation, configuration,
and the exact syntax for including the generated code.

[Thrift] is perfectly happy with hyphens in names, Python is not. Make sure all your
service names use [camel case] or similar rather than hyphens or underscores.

As of today (August 3, 2016) the latest Thrift sources require [TwistedTrial] to be
installed to build the Python libraries. The documentation does not mention this and it
is frustrating in that no error is generated -- Python is just not built even with
the `--with-python` configuration parameter. Since TwistedTrial
is only needed to run the test suite, I edited `configure.ac` to
remove that requirement. And viola, Python libraries built and installed.

The change is:

```diff
builder@sys:~/thrift-git$ git diff configure.ac
diff --git a/configure.ac b/configure.ac
index c72dd43..bcdaec3 100755
--- a/configure.ac
+++ b/configure.ac
@@ -281,8 +281,9 @@ AM_PATH_PYTHON(2.6,, :)
 AX_THRIFT_LIB(python, [Python], yes)
 if test "$with_python" = "yes";  then
   AC_PATH_PROG([PIP], [pip])
-  AC_PATH_PROG([TRIAL], [trial])
-  if test -n "$TRIAL" && test "x$PYTHON" != "x" && test "x$PYTHON" != "x:" ; then
+  if test "x$PYTHON" != "x" && test "x$PYTHON" != "x:" ; then
     have_python="yes"
   fi
 fi
builder@sys:~/thrift-git$

```

More notes are most likely on the way as I write Python code to use Thrift.

[Previous posts]: http://blog.misterblue.com/2015/2015-05-23-thrift-vs-protobuff-vs
[Thrift]: https://thrift.apache.org/
[Python]: https://www.python.org/
[camel case]: https://en.wikipedia.org/wiki/CamelCase
[Pesto server]: https://github.com/Misterblue/Pesto
[Basil viewer]: http://blog.misterblue.com/basil/
[Thrift: The Missing Guide]: https://diwakergupta.github.io/thrift-missing-guide/
[TwistedTrial]: http://twistedmatrix.com/trac/wiki/TwistedTrial 
