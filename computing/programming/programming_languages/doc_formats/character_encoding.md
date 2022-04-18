+++
title = "Character encoding"
+++

Displaying, accepting and writing to files characters readable by humans are common tasks in many programs, irrespective of language.

So, common standards have evolved to represent these characters with natural numbers or characters visible on most English keyboards or arbitrary bytes.

## ASCII
This represents the Latin alphabet plus some common characters. Range: 0:255.

Special characters include control characters.

### Control characters
Carriage return (move cursor to beginning of current line), line-feed (start a new line), tab (a long horizontal space). Their popular latin/ symbolic representations are: '\\r\\n\\t'. Carriage return without line-feed is often used to overwrite text.

## Unicode
This is capable of accomodating symbols in many of the world's scripts. It uses multiple bytes. Since the number of bytes actually needed may vary, variants such as UTF-8 are used.

UTF-8 is backward compatible with much of ASCII. If extra bytes are needed, it is indicated by a special bit.

