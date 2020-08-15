+++
title = "Java"
+++

## Intro
- Platform independence: so no direct access to memory.
- Object orientated approach.
- Memory management: Garbage collection.
- Compiled into bytecode which can be run everywhere using native interpreters. Due to many optimizations - such as 'just in time' compilation, speed comparable with C for many applications.

## Classes
### Important Superclasses, interfaces
#### Serializable
Implementing Serializable ensures that an object instance can be stored in a file and retrieved later.

#### Clonable
Implementing the Cloneable interface ensures that the traits of a given object can be copied using the copy() definition. ArrayList internally uses an array, but if copy were implemented such that only the reference to the internally used arraylist were copied, then both copies would be affected by any change in the arraylist. Hence, it is important to override copy() as appropriate.

## IO
Contained in the package java.io.

### Stream
IO is handled using streams; which usually need to be opened and closed explicitly for efficiency.

#### OutputStream
Output streams can output bytes or readable text. Commonly used is PrintStream and PrintWriter (For writing characters rather than bytes); which include : println and print.

#### Output to files
Initializing PrintStream or PrintWriter to write to a file can be painful because one needs to first initialize a FileOutputStream(fileName).

#### Standard output
System.in and System.out are always open.

### File listing
java.io.File has useful functions: exists(fileName), list() to list contents in case it is a directory.

### Read configuration files
Reading parameters from properties files, which store (key, value) pairs in lines with the format key= value is a very common task. So, there are specialized functions to deal with them: props = new java.util.Properties();  props.load(fileStream);.


## CGI programming
### Writing servlets
One must use the servlet API (preferably provided by the webserver being used) and create classes which extend HttpServlet, in which doGet and/or doPost methods are overriden.

#### Reading input
To decode HTML escaped characters, one can use the apache.commons.text package.

getParam, getParamMap.


#### Output
outStream object will have methods like setContentType, setEncoding, println.

### Mapping to URL
One then maps a url to a servlet in the WEB-INF.xml file, using the \verb'<servlet>' and other tags.

