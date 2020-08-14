+++
title = "Compilation"
+++

## Machine instructions and their files
Machine instructions are understood by the processor. Assembly level code provides a way to write machine instructions using words instead of hexadecimal instructions.

### Executable files
When an operating system is being used, machine instructions, which are stored in a file or on fixed locations in the hard-disk, should be associated with suitable meta-data/ headers. Such files are called executable files.

### Object files
Object files contain named segments of machine instructions - library functions. These files may be linked to executable files, from which, using a mechanism like the 'call stack', data is processed using the library functions.

## Translation from High level programming language
Writing machine instructions directly is excruciating - most of the work is mechanical - it is best done automatically by specialized programs which read files with precise yet high-level instructions and create machine instructions.

### Compiled vs interpreted languages
In the case of interpreted languages, this is done one line at a time. In case of compiled languages, this is done one program or code block at a time.

Some languages, like Java are compiled to a byte-code, which is then interpreted (translated to machine language) during execution.

Run-times of programs written in Interpreted languages can slow down due to the cost of translating each line of code at run-time. This problem is assuaged with the use of 'just in time' compilers - now, loops can potentially be translated entirely to machine language before they are entered.

#### Freedom from error
Compiled langauges tend to be more error free, because successful compilation guarantees: a] every variable used is known  to be clearly defined. b] Every function is passed the right sequence of arguments.

In case of a interpreted language, since they lack the compilation checks, errors are caught only at run-time, that too if execution of the erroneous part of the code is attempted. This can be assuaged by use of special linting tools.

### Steps in translation
During lexical analysis, lexical tokens are identified from the high level program; variable names are distinguished from constants and operators. During syntactic analysis, or parsing, the tokens are put together into a bunch of instructions. Finally, addresses are assigned to variable names, and translation happens.

During this, linking is done by a linker: references to functions described in other object files are resolved.

## Memory allocation
### Compile-time memory allocation
This is memory allocated to data at compile time.

Memory can be considered as having been allocated at the time of function call and deallocated when the funciton exits. So, this is often visualized/ reffered to/ implemented as 'stack space'.

Stack memory is often more limited compared to heap space (although both can be increased).

### Run-time memory allocation
This is done at run-time. One cannot be absolutely certain beforehand about the exact amount of memory a program will require. There are overheads in dynamic allocation: there can be problems such as fragmentation: data used by the same chunk of code may be located in different memory blocks (either in the main memory or in the cache on the hard disk). Allocation algorithms take atleast 50 instructions for making one allocation.

The space used for dynamic memory allocation is often called 'heap space'.

