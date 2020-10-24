+++
title = "BASH"
+++


## Characteristic features
All environmental variables are imported into the context.

### Command construction, execution
Very simple syntax for execution of commands: simply use a line which says: commandName. Construction of command-strings using variable names is also simple: someText \$varName otherText

### Logic limitations
Not suitable for logic more involved than an if else statement.


## Writing and executing code
Bash commands and programs can either be run by providing/ typing the program in STDIN, or it can be run from a file.

### Context
Every sequence of Bash commands is executed in a certain context. Different contexts do not share the variables (including environment variables like PWD and PATH) - so changing variables in one context does not affect another.

#### Current context
source fileName executes the file in the current context.

#### New context
One can run a file using: bash fileName.

##### Invocation as a command
One can execute the file merely by saying fileName at the command prompt, if it begins with: \#!/usr/bin/bash . This line is used by many interpreters to identify and use the interpreter appropriate to the file when one runs the file.

If \#!/usr/bin/bash -x is used, all executed lines are echoed.

### Environment variables
Some variables, called the environment variables, are set automatically when a shell context is created.

These variables are important because they are used while searching for various purposes affecting terminal display and command interpretation/ execution. Eg: \verb LD_LIBRARY_PATH , PATH (a : separated list of directories where an executable file is to be sought), PWD (present working directory).

#### Setting
export VAR=value sets an environment variable.

To set these at startup, edit .bashrc and \verb .bash_aliases  in the home directory. env lists the environment variables.

## Variables and data
Dynamic typing.

### Assignment
VARNAME=value.
Array: area2=( zero one two three four )
A particular element is set with area2[0]=val

Note that there should not be any space around =.

### Reference
\verb|$VAR_NAME ${VAR_NAME}| are references to the variable.

Array Element reference: `${area2[0]}`.

Reference the entire array: `${colors[@]}`.

## General
<div class="spreadsheet" src="../bash.toml" fullHeightWithRowsPerScreen=8> </div>  


