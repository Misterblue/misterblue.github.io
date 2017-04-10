---
layout: post
# 'status' is the main flag of where the post will appear.
# status is 'draft' or 'publish'
status: publish
title: Flatbuffers tables in tables
author:
  display_name: Misterblue
  login: Misterblue
  email: misterblue-blog@misterblue.com
  url: http://misterblue.com
author_login: Misterblue
author_email: misterblue-blog@misterblue.com
author_url: http://misterblue.com
date: 2017-04-09 22:12:20
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
Forgot to push publish.

Besides having some family over to the house for dinner,
today's coding was even more [Flatbuffers] coding.

I'm in the trough of disillusionment with [FlatBuffers].

For [FlatBuffers], one writes a schema description of records. The tool then generates
serialization and deserialization code for the target language. The coolness comes from
the the streamlined deserialization which minimizes data reformatting and copying.

But the programming interface to these serialization routines is a tad clunky.
Firstly, you never know what type of serialization interface it is going to generate.
Sometimes it will generate a single create call to build a structure and sometimes
it generates a 'start' and 'end' function with 'add' functions for the fields.
It took me a while to realize the interface difference comes between 'struct' and
'table' definitions. Another factoid that is not explained in the documentation.

Another thing I'm learning is that the serialization interface gets complex if one
defines a protocol with 'table's inside 'table's.
Using the schema, it is easy to define a record that includes several tables.
The problem comes in the complexity of the record generation code -- table
generation code embedded in table generation code embedded in table generation
code. The make-a-record subroutine becomes long and complex.
Additionally, if a field is ever added to a table, code in several different
places will need modification.

It would be nice if the code generator created some higher level code.

[Basil]: https://github.com/Misterblue/basil
[Basil protocol]: https://github.com/Misterblue/Basil-protocol
[FlatBuffers]: https://google.github.io/flatbuffers/
[FlatBuffers Github repository]: https://github.com/google/flatbuffers
