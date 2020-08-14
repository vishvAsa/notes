+++
title = "Python"
+++

## Features
### Syntax conciseness
Clean and concise syntax: compare to perl; so more readable. As a general rule, python tries to use the same operators and function names for similar operations over different types of operands: Eg: +, len, dir.

### Speed
An interpreted language. Speed is many times slower than C or Java. For vector operations, speed comparable with Matlab; but for looping, may be faster.

## Writing, Building and executing code
Make .py files; begin with \verb'#!/usr/bin/python'.

### Important env variables
PYTHONHOME: location of the std libraries.

PYTHONPATH: default search path for modules/ package libraries, may refer to zipfiles containing pure Python modules (in either source or compiled form).

PYTHONSTARTUP.

### Linting
Python is an interpreted language - so many silly errors which would have been caught by a compiler are noticed only at run-time, if at all that code is run. So, Linting (and testings) is especially important.

#### Pylint commands
In code, one can say:
\# pylint: disable-msg=W0613

### Point of entry
Can use interpreter. Or first line in file.py.

"python -c command [arg] ...", "python -m module [arg] ...", which executes the source file for module

#### Arguments
sys.argv, a list of strings has the script name and additional arguments from shell; an empty string if no argument is given.

### Installing External libraries
Place a link in the site-packages directory.

Or run python setup.py build, python setup.py install.

Or do: sudo pip install pkgName or easy\_install pkgName.

## Help
help(object/ module)

## Variables and data types
#### Matlab format
import scipy.io. \\
X = scipy.io.loadmat('mydata.mat'), scipy.io.savemat().

## Interfacing with other languages, the OS
### Numeric programming
numpy.

### RPy or RPy2 for R
No easy plotting in sage.\\
 from rpy import *. r.library ("..",  \verb'lib_loc =os.path.join(lib_path, "R"))'.

### With Matlab
In sage use 'matlab.eval()'.

## Other libraries
Regular expression: re.search(r'asdf', text) returns the first match object . m.group() returns the matching text.

re.findall returns a list of match objects. If regular expression contains pattern groups, tuple-list is returned.

