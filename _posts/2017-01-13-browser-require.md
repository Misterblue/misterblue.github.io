---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Browser require
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-01-13 12:03:20
# categories: OpenSimulator, Basil, Fun and Weird, Programming, LookingGlass, Travel
#      Thoughts, Life, Meta, Family, Photography
categories:
- Basil
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
I need to create a web page for Basil's WebGL version so I started looking at the
JavaScript world.
For a humorous and insightful take on what I'm getting into, read
[How It Feels to Learn JavaScript in 2016].

I want to include modularized files and, since I had experience
with [NodeJS] modules, I figured I would just need to add a few `require()`s
to my program.

That's not the case.

While [NodeJS] has a (relatively) simple `require()` for appliction module
inclusion, the reigning solution on the browser side is [RequireJS].
Coming from [NodeJS]'s implementation, [RequireJS] is a complex and confusing
wall of specifications. Using [RequireJS] means a different wrapper for
modules, a config specification for paths, shims, and whatever.

Sheesh. What's all this stuff I have to learn? Why all the complexity?
Why is there a whole new framework I have to learn in order to modularize
my web page?

[RequireJS] does have a way of handling [CommonJS] modules but it
[requires manual conversion] of all the modules. That's not going to fly.

Another solution is [Browserify] which reads all the JavaScript files, interprets the
`require()`s and creates a single bundle to include in the web page.
This does solve part of the async loading problem but introduces a step that
would be different between developement and production.

The main difference between [NodeJS]'s `require()` and [RequireJS] is that the
former uses JavaScript language features
to do its thing while packages like [RequireJS] introduce a new level of abstraction and
complexity. Do I really need to learn a new framework in order to get asynchronous
loading? It seems so unnecessary.

Other people have wanted a simple `require()` (my unhappiness is shared) and
they have created some alternatives.
Some discussion in [Relation Between CommonJS and RequireJS]
(http://stackoverflow.com/questions/16521471/relation-between-commonjs-amd-and-requirejs),
Some simple solutions are given in [Node Style Require for Browser JavaScript].

I am giving [NodularJS] and [Smoothie] a try.

Others:

* [uRequire] is a converter that converts [NodeJS] modules and [RequireJS] modules into a common format
* TKRequire
* [Require-stub]
* [LiteScript]

And don't get me started on the crush of JavaScript package managers (Npm, Bower, Grunt,
Gulp, Broccoli, Mimosa, webpack, [rollup] and it goes on and on). A nice [summary of choices].


[How It Feels to Learn JavaScript in 2016]: https://hackernoon.com/how-it-feels-to-learn-javascript-in-2016-d3a717dd577f?gi=b887e699e5e6
[CommonJS]: https://commonjs.org/
[NodeJS]: https://nodejs.org/
[RequireJS]: https://requirejs.org/
[requires manual conversion]: http://requirejs.org/docs/commonjs.html
[Smoothie]: https://pixelsvsbytes.com/2013/02/js-require-for-browsers-better-faster-stronger/
[NodularJS]: https://github.com/salathegroup/nodular.js
[Browserify]: http://browserify.org/

[uRequire]: http://urequire.org/
[Require-stub]: https://github.com/dfcreative/require-stub
[LiteScript]: https://github.com/luciotato/LiteScript

[rollup]: http://rollupjs.org/
[summary of choices]: http://stackoverflow.com/questions/35062852/npm-vs-bower-vs-browserify-vs-gulp-vs-grunt-vs-webpack
[Relation Between CommonJS and RequireJS]: http://stackoverflow.com/questions/16521471/relation-between-commonjs-amd-and-requirejs
[Node Style Require for Browser JavaScript]: http://stackoverflow.com/questions/6971583/node-style-require-for-in-browser-javascript
