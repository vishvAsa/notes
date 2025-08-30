+++
title = "Intellij Idea"
+++

## Setup
- JDK and JRE changes can lead to frequent crashes. Totally removing jdk and jre (and relying on the intellij jdk and jre versions) solved this problem.

## Version control: Git
- Settings -> version control -> git -> use native client
- If you are repeatedly asked for github login tokens, ensure that gnome-keyring-daemon is running.

## Build tools
### sbt
#### import module

Just use Intellij, and *add module with existing sources* by pointing to the build.sbt file (Don't point to the iml file: See [this thread](https://stackoverflow.com/questions/46258668/intellij-reimport-sbt-dependencies) )

### maven
#### import module

setup dependencies:

If it complains about missing maven dependencies:
* just open the *Maven projects* widget, refresh and do a full build.
* Also try Maven -> reimport and *synchronoze* actions in the context menu.

## Find history
To clear search history, you could use the below ways (no UI to clear the whole history currently):

Search ProjectId used in .idea/workspace.xml to find your current project ID.  
Open the IDE config folder/workspace/<project_id>.xml. (use locate or a symlink in workspace folder)  
Close the IDE, remove all whole <component name="FindInProjectRecents">...</component> section in it.

## Misc tricks
<div class="spreadsheet" src="../intellij-idea.toml" fullHeightWithRowsPerScreen=8> </div>  
