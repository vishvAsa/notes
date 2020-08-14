+++
title = "Design"
+++

## Build Targets
A programmer may want to do certain specific actions with his code.

For example, downloading dependencies for being able to compile, compiling code, running test cases, running the code, packaging the code, deploying a package on a web-server. These actions are called build targets.

### Continuous mode
With some dependencies, one can execute a specific action while constantly scanning for source code changes..

### Target Dependencies
There may be various dependencies amongst these build targets. For example, to compile one may need to download some libraries from the internet.

### Library dependencies
Some build tools offer automated library dependency management, where if a repository and the dependencies are specified, the dependencies are automatically downloaded from the internet.

## Quality metrics
A good build system provides a concise way of declaratively expressing actions to be performed for various build targets: So, various commands for actions like downloading should be available.

Some build systems are also integrated with IDE's'.
