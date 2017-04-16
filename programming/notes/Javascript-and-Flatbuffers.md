---
layout: page
title: Lessons on JavaScript and Flatbuffers
comments: true
---
# Lessons Learned Coding Flatbuffers in Javascript

This page is the output of wrestling with [Flatbuffers] in Javascript.
The information was correct when written (April 2017).

## TL;DR

* These lessons are for [Flatbuffers] in JavaScript. Your speed will vary with other target languages.
* One must create one `flatbuffer.Buffer()` for each output record being created and that buffer must be used when building all the structs and tables that go into that output record;
* On input, once the root structure has been read, all the included structures and tables can be referenced with the access members and there is a special (and not well documented) syntax for specifying tables from unions.

## Buffers and Building

In building the browser based version of [Basil], the team decided the
communication protocol serializer would be [Flatbuffers] for its presumed speed
and newness. That meant coding [Flatbuffers] in JavaScript.

[Flatbuffers] is one of those protocol systems (like [Protobufs])
where a schema is written and then compiled into binding code for
a particular language. Happily, [Flatbuffers] has a compiler for
JavaScript.

Thinking object-orientedly, I defined a communication record that
contained many `struct`'s and `table`'s (the two forms of structured
data in [Flatbuffers] schemas), compiled same, and started coding
the JavaScript.
I wanted to design the communication stack with
a command layer that sits on top of a flow layer. 
Still thinking in an object-oriented fashion, I wrote code
where I built the different tables (for commands and message flow)
in different layers of the code and then combined them into the final
message to send.

Nothing worked.

So, I spent much time staring at the limited JavaScript documentation
(while [Flatbuffers] has a JavaScript compiler, that language is obviously not
the primary target) and then staring at the generated code.

Inspecting the library and the generated code
(I love open source),
I realized something that is not very well explained in the documentation.
That realization was that the record that will eventually be sent is being built
while the structs and  tables are being constructed.
The fact that all the tables have an object-oriented type of design
mislead me into thinking that the building of each table is independent.
So, my first solution created a new `flatbuffers.Buffer()` for each table
and then expected to use the output of the 'end' operation to give an object
that would be added to the enclosing table.

As a concrete example, take this schema:

```
namespace frog;

table coord {
    x: int;
    y: int;
}
table item {
    position: coord;
    name: string;
}
table animation {
    animationFile: string;
    applyTo: string;
}
table messageSequence {
    seq: int;
    timeSent: long;
}
union msgMsg {
    item,
    animation
}
table message {
    sequence: messageSequence;
    msg: msgMsg;
}
```

This is a simple definition of a message that includes some flow information
(the message sequence number and time sent) and either an item or an animation
specification.

My initial implementation was made up of a bunch of classes which were like:

```javascript
var builder = new flatbuffers.Builder();
frog.coord.startcoord(builder);
frog.coord.addX(builder, 23);
frog.coord.addY(builder, 44);
var builtCoord = frog.coord.endcoord(builder);
```

Figuring the 'end' function was completing the object and giving me a handle to
same. Eventually, I would create the output message with:

```javascript
var builder = new flatbuffers.Builder();
frog.message.startmessage(builder);
frog.message.addSeq(builder, builtSeq);
frog.message.addMsg(builder, builtItem);
var builtMsg = frog.message.endmessage(builder);
```

This didn't work and the reason is that what is really happening with the
'add' operations is placing offsets and data into the output message in the `builder`.
That is,
for performance reasons and to eliminate copies and transforms, the message
is constructed as the tables are built.
The thing I didn't get from the examples on the web site was that there needs
to be only one `flatbuffers.Builder` for each message sent and it must be used
to build all the structs and tables that will be in that message.
This fact is hidden in comments about building tables non-recursively
and building up vectors before building the base table.

So, the solution is to create one `flatbuffers.Builder` per message and pass that
around to all the routines that create the message contents. For instance:

```javascript
var builder = new flatbuffers.Builder();

// Create the first table (which get added to the buffer in the Builder)
frog.coord.startcoord(builder);
frog.coord.addX(builder, 23);
frog.coord.addY(builder, 44);
var builtCoord = frog.coord.endcoord(builder);

// Create another table using the same Builder)
frog.item.startitem(builder)
frog.item.addposition(builder.builtCoord);
frog.item.addname(builder.createString('froggishItem'));
var builtItem = frog.item.enditem(builder);

frog.messageSequence.startmessageSequence(builder)
frog.messageSequence.addseq(builder, globalMessageSequenceNumber++);
frog.messageSequence.addtimeSent(builder, Date.now());
var builtSeq = frog.messageSequence.endmessageSequence(builder);

// Finally, create the enclosing table and add the offsets from the 'end' methods
frog.message.startmessage(builder);
frog.message.addSequence(builder, builtSeq);
frog.message.addMsg(builder, builtItem);
frog.message.addMsgType(builder, frog.msgMsg.item);
var builtMsg = frog.message.endmessage(builder);

// Finish the message buffer with all the tables in the Builder.
builder.finish(builtMsg);

// Write out the completed message as a byte array
write(builder.asInt8Array());
```

I came to visualize this as the creation of the `flatbuffers.Builder()` is
allocating the buffer that the output message will be constructed into.
All the 'start', 'end', and 'add' operations are storing the information
about that table into  the `Builder`'s buffer. The final `finish` call
does any fixup and the record is ready for sending.

The additional complication for my code was the communication layer
organization. I ended up with a control layer that builds  the command
table (like the 'item' table in the above example) and it was the builder
that was passed to the flow layer. The flow layer then added the flow control tables
before passing the whole builder to the transport layer.

## Getting Tables from Unions

Another head scratcher was, on reception, how to get the table
out of the union. This is what I found:

Using the `msg` variable of type `msgMsg` in the above schema,
a union definition creates an enumeration and two variables
in the generated Javascript code:

* `addMsg` for putting the msgMsg table into the message;
* `addMsgType` for putting a code of what type of table was used for `msgMsg`;
* `msgMsg` enumeration with codes for each of the table types that can be in a `msg`.

If the target language is C++, the extra variable for the type is named `msg_type` but,
for Javascript, the name is `msgType`. The code must set the type when filling
the union variable.

On the receiving side, the union can be extracted thusly:

```javascript
var buff = bufferOfRawMessageAsByteArray;
// ByteBuffer is the input equivilent to Builder
var fbBuff = new flatbuffers.ByteBuffer(buff);
// Get the buffer as a 'message'
var receivedFb = frog.message.getRootAsmessage(fbBuff);

// Note that the variable fetching methods are functions
var seqTable = receivedFb.sequence();
// If the table was not added by the sender, 'undefined' is returned
if (seqTable != undefined) {
    console.out('Sequence number = ' + seqTable.seq());
}

if (receivedFb.msgType() != undefined) {
    switch(receivedFb.msgType()) {
        case frog.msgMsg.NONE:
            // There was no table added by the sender
            break;
        case frog.msgMsg.item:
            var itemTable = receivedFb.msg(new frog.item());
            break;
        case frog.msgMsg.animation:
            var animationTable = receivedFb.msg(new frog.animation());
            break;
    }
}
```

The trick for Javascript is to add a 'new' of an empty table type in the fetcher
for the union field. What the fetcher for a union does is initialize the empty
table passed pointing into the union field. As shown, the extra type variable tells
the receiver what type is in the union.

There you go, a very long winded explanation of Javascript and [Flatbuffers].
As mentioned above, any discussion is associated with the
[blog post] about this publication.


[Flatbuffers]: https://google.github.io/flatbuffers/
[Basil]: https://github.com/Misterblue/basil
[Protobufs]: https://developers.google.com/protocol-buffers/

<!-- vim: shiftwidth=2 tabstop=2 autoindent expandtab
-->
