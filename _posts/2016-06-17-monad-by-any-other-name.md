---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Monad by any other name
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-06-17 06:32:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Programming
# 'comments: true' is needed for Disqus. 'static-comments' is legacy, imbedded comments.
comments: true
# http://www.emoji-cheat-sheet.com/
#  Faces: :smiley: :blush: :sleeping: :confounded: :innocent: :sunglasses: :sleepy:
---
My previous job had me programming in [Scala] which was my most recent introduction
to the world of functional programming after years of declarative programming.
While trying to bend my head around the functional way of
describing programming, I found that, to me, the way the languages and concepts
are described to be completely un-useful.

Take [monad]s.

As a programmer, I need a feeling about what my program is going to do.
How it works under the covers.
Not that I need to know what specific binary bits are generated or how
exactly it will be executed, but some concept of now my code is mapped
to the underlying execution of it.
When writing in declarative languages, the mapping from language to 
execution is straight forward: first this step, then that.
We all know there will be optimizers that will take out unneeded operations
and ordering might be rearranged but basically the program I write defines
the steps for execution.

For functional languages, that mapping is not as straight forward.
Not that it is bad or weird. It is just different.
Once you get that mapping into your head, then you 'get it'.
Somehow the light dawns and you have the 'feel' for the language.

But functional language constructs are not explained that way.
If one asks "[What is a monad]?", the explanations are about the abstract
features of the language construct -- its definition.
But this doesn't really get the uninitiated closer to a feeling for what it does.

Getting a handle on the mapping is made all the harder by the layers of
the new languages. Scala (the one I'm familiar with) has all forms of 'syntactic
sugar' which maps what one writes into lower level operations which are
then mapped into lazily evaluated execution closures, which are then mapped
onto execution threads that vary at runtime based on the input data.

In the beginning, one starts learning Scala types and operations (`List.map()`, ...)
and one starts getting the feel for data with operations vs operations on data.

Then you hear about these functional programming things called monads and you
look them up. There, you find discussions about *bind* and *return operations*
(or is it *unit*?) and an introduction of new syntax and operators to do
what exactly? Something about creating a pipeline of functions. Really?
Wouldn't you just write them one after another? Why a new operator? :confused:

The explanations aren't helped by advancing into language sugar that you
aren't handy with yet. For Scala, it is the optional function dot and parentheses.
This stuff is not covered in the introduction to that language which has
already confused your reading of code with postfix type declarations.

After a lots of web searching, you start stumbling over articles like
[Monads - Another way to abstract computations in Scala]
and
[Scala FAQ: Yield]
which start to explain the mapping of some language idioms to the underlying
functions. After a while one realizes that writing:

    for {
      i <- 1 until n
      j <- 1 until (i-1)
      if i > j
    }
    yield (i, j)

is the same as writing:

    for ( i <- Range(1,n); j <- Range(1,i-1); if i<j) yield (i,j)

which is the same as writing:

    Range(1,n).flatMap(i => Range(1,i-1).flatMap(j => List((i,j)).filter(c => c._1 > c._2)))

That is, the Scala coding convention for building up monads is a bunch of rewriting
syntactic sugar around the application of map and filter operations.

For me, learning functional programming and languages like Scala are made difficult
by the need to learn several different features of the language at the same time.
There is the syntax of the language
(postfix type declarations,
optional syntax,
multiple ways of writing the same operation,
...),
all of the syntactical sugars
(with documentation that explains different features using different sugar conventions),
functional coding conventions
(monads, pipelines, ...),
lazy evaluation,
and on and on.

Well, maybe this is just me twisting in the wind over learning a new programming method.
It's good for me.

[Scala]: http://www.scala-lang.org/
[monad]: https://en.wikipedia.org/wiki/Monad_(functional_programming)
[What is a monad]: http://stackoverflow.com/questions/44965/what-is-a-monad#
[About Monads]: https://www.haskell.org/tutorial/monads.html
[Haskell]: https://www.haskell.org/
[Monads - Another way to abstract computations in Scala]: http://debasishg.blogspot.com/2008/03/monads-another-way-to-abstract.html
[Scala FAQ: Yield]: http://docs.scala-lang.org/tutorials/FAQ/yield.html
