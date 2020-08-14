+++
title = "SBT"
+++

Scala build tool is written in scala. Configuration files tend to be very concise. See a ready empty sbt project for a quick start.

Important commands include: update (To satisfy dependencies), actions, compile, package. Some commands may be prefixed by \~ (Which constantly scans for source code changes and recompiles automatically when necessary.)

### Dependencies - automation
One can automate the problem of downloading certain versions of external libraries on which the project depends, and adding the jars to the CLASSPATH if necessary.

#### Repository specification
By default, Maven2 and Scala Tools Releases repositories are used. The former includes many sourceforge libraries. One can add other repositories: resolvers += name at location.

#### Library specification
In build.sbt in the project folder, add the following line:
```
libraryDependencies += groupID % artifactID % revision
```
If you are using a dependency that was built with sbt, double the first \% to be \%\%.

The revision argument could be: 1.3.2 or "[1.3,)" etc..

One can explicitly specify the url above by adding 'from "url1"' to the line above. The url is used only if it is necessary.

One can also add 'sbtAction' to indicate that the library dependency need only be included if a certain sbtAction is to be performed. \chk

### Tasks: definition
lazy val collectJars = task \{ collectJarsTask; None \} dependsOn(compile)

Here, collectJarsTask is a scala method.

#### File IO tasks
Use FileUtilities.

