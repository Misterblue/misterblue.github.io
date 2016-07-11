---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Peeking at Reactive Programming
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2016-07-11 13:46:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Programming
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
These days, I keep running across references to this
wonderful New Thing called 'reactive programming' so I spent a day researching this wonderful New Thing. 

I worked with the [Scala] language when I played with [Spark] so I've had my initiation
to the new functional programming world.

Now, I'm a gray beard and have been programming for several decades and I've seen
New Things come and go.
I've also noticed that New Things usually have been done before
in one form or another, so, the thing I need to discover is what form this most recent
New Thing is taking, how it is being applied, and what it is good for.
Like all New Things, I expect it is not the solution to All Problems like the hype
seems to make it out to be, but it is instead a solution for a particular problem
in some environment.
I need to discover when and how to apply this particular tool.

James Coglan's talk at JSConf EU 2014 entitled [Practical Functional programming: pick two],
nicely steps through the process of converting if/then logic implementing a multi-stage,
asynchronous task and converting it into event flows and functional/reactive form.

The original program is a state machine implemented with if/then statements.
My experience is that when approaching a problem as a state machine, one first sees
the few, straight-forward states and one says "this will be easy". But, when dealing
with multi-stage, asynchronous processes, once one considers error states, stage order problems,
and stage failures, the state space explodes and many of the states are the same.
The response is to drop implementing the state machine as a state machine and
resort to if/then statements to cover the state space. This approach has
a chance of working especially if
the original programmer adds some comments about what is expected from the statements
and thus giving the next code visitor (the poor person debugging a problem) a hint at the logic.

If you transform the program from if/then procedural programming into a functional
program, the state table doesn't go away. It's still there but is now embodied in the
end nodes of the functional projection of the stream interactions.
I mean, the relationship and movement between the states still has to be there
but it is in a different form.

I see the state machine form and the functional programming form as two expressions
of the same problem and solution. The question is which one affords the best
adaptation to the input, the best execution implementation and the best vehicle
for debugging.

For me, two of the advantages of functional programming are:

* better model of problems relating to flow of events
* better representation of the program for lazy evaluation and distribution.

The first point is about using a programming tool to easily express the
desired solution and to easily debug any problems. For the state machine approach
expressed above, say one forgot about an error condition. For a pure state machine
implementation, the solution is to add some more states and actions. For an if/then
implementation of the state space coverage, the solution is to add more if/than
statements which often leads to spaghetti code and unexpectedly breaking things
that used to work. The functional program version seems closer to the latter
situation -- a new error condition means adding `.filter` or `.map` to some
transform to patch up the condition. Are there tools for finding the new conditions?
Say there was a test suite that pushed values through the code. How would error
conditions be found? Are there `ASSERT`s for functional code?

For the second point, computer languages have added features allowing the computer
to do some jobs and thus relieving the programmer of some onerous task. Garbage
collectors meant that programmers didn't have to worry about memory allocation
and deallocation. Lazy evaluation and distribution of closures means a programmer
doesn't need to worry about optimization of a stream of data transforms (usually
done as some complex collapsing of multiple dissimilar transform operations) or
the scheduling and placement of data and parallelizable computations.

But the infrastructure has to be able to implement lazy evaluation and distribution.
Thomas Reynolds' [Functional Programming in Javascript Equals Garbage] describes two
problems with functional/reactive programming in JavaScript: 1) there are usually
easier ways to accomplish the same in the language without all the new functional
cruft, and 2) functionalizing is done in JavaScript with piles and piles of functions
that do not know, for instance, how to collapse tail recursion and all the other
lazy evaluation
features of language implementations designed for functional programming.

After writing the above, I will go back and read [The Reactive Manifesto] 
and [General Theory of Reactivity]
and think about how to apply this technology.
I am not one to discount a New Thing just because "programmers have been doing
this for years" or because this is just the Latest Thing.
Tools and conventions are being developed that could make it a better
solutions for some problems -- a better solution than the way I've always done it.

[Scala]: http://www.scala-lang.org/
[Spark]: http://spark.apache.org/
[Functional Programming in Javascript Equals Garbage]: http://awardwinningfjords.com/2014/04/21/functional-programming-in-javascript-equals-garbage
[The Reactive Manifesto]: http://www.reactivemanifesto.org/
[General Theory of Reactivity]: https://github.com/kriskowal/gtor
[Practical Functional programming: pick two]: https://www.youtube.com/watch?v=XcS-LdEBUkE
