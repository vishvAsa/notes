+++
title = "Matlab/ Octave"
+++

## Introduction
### Distinctive features of the language
Excellent plotting facilities; many libraries; interactive sessions good for exploring features of data; easy I/O: don't need to spend as much time in getting I/O right as in actual computation; excellent debugging facilities.

Octave is an open source clone of matlab.

#### Purpose of design
Matrix computations. This is meant to be a rapid prototyping language : It is not meant for fast implementations.

#### Versions
Certain OOP methods, properties don't work with 2007 version.

### Speed
Matrix/ vector multiplications are implemented by calling efficient linear algebra implementations like LAPACK etc.. So, operations which can be specified using matrices/ vectors should never be specified using loops.

Also, certain functions like repmat, ones, sub2ind etc.. could be faster. Use packages like lightspeed which implement faster versions of these oft used functions.

#### Speeding up loops
When unavoidable, loops are known to be slow, even when efficient linear algebra routines are used internally. This is because of costs associated with interpreting each line of code in the loop at runtime.

##### Preallocate memory
You can speed up loops by preallocating the memory used therein - that way matlab will not have to repeatedly allocate a new block of memory.

##### Use C
Implementing the logic in C not only removes the overhead due to MATLAB interpretation; it also generally forces the programmer to be conscious of and avoid memory allocation overheads.

However, there is an additional cost involved in packaging arguments for use by the C function: So it is best not to call the same C function in a loop - rather it is better to code even the loop in C.

##### Make function logic inline
This can avoid repeated memory allocation and overhead due to the function calling infrastructure and increase speed. BUT for unknown reasons, the reverse can be true sometimes!

### Using External libraries
#### Locating libraries
Go to \url{http://www.mathworks.com/matlabcentral/}, \\ search, look under appropriate tags.

#### Installing and using
unzip package, add it to path: maybe can use addpath(genpath(dir)) to add subdirectories.


### Building and executing code
Can write directly in matlab command window.

Or can write scripts (a sequence of commands in a file) or functions; Add directory to path; Use matlab to invoke.

#### Useful options
No GUI: matlab -nodesktop.

Command history: diary on. Others: addpath, savepath.

#### Good IDE's
Matlab.

### Debugging
Can view matrices in tables, as an image etc..

Introducing break points: Use GUI or 'keyboard' can be inserted in the midst of any function. Then use dbquit or dbcont or dbstep or dbstack.

#### Profiling code for bottlenecks
profile on
myfun;
profile report

### Help
help commandName.

For library documentation, see its docs.

## Constants and data types
### Data types of constants
Everything is an object. The most common object is an n-dimensional array.

boolean numbers are represented by 0 and 1.

str = 'stringValue': a character array.

### Important constants
Inf, NaN.

isNaN(a).

### Arrays
A = zeros(2,3,2,3) makes a 0 tensor of those dimensions.

#### Matrix
```
A = [2 1;
     1 8]
```
; separates columns.

Block matrices: B = [A  A+32; A+48  A+16].

#### Data generation functions
$-14:0.2:14$: Produces vector of equispaced numbers in the interval.

##### Basic constant arrays
zeros, ones, trues, falses.

eye, speye.

##### Random array generation
randn, random, unifrnd.

##### Sparse array generation
spconvert(mat) returns sparse matrix with indices/ values specified in mat's columns. sparse().

##### Generate random permutations
randperm(4) may return [2 3 1 4].

#### Array indexing
Array indexing is used to access a subarray in an array.

##### Indexing with scalars
Array index starts at (1,1, ..). Shortcut for last element along any dimension: end. Eg: A(end, 5).

##### Indexing with index-vectors
Entire row or col of an array can be selected using : symbol: A(:,3).

##### Indexing with one scalar
Aka linear indexing

A(5) or A(v) are also meaning-ful, especially straight-forward for vector A.

##### Indexing with logical vector
Eg: $A(A>12)$.

##### Indexing tricks
Indexing upper triangular portion of a matrix: create indices using triu(ones(m, n)).

### Cell array
A = cell(m, n); creates a cell array of pointers (cells), usually pointing to matrices.

#### Cell elements: indexing, altering
A\{i, j\}: returns the contents of the appropriate cell in the array, whereas A(i, j) returns a cell (pointer).

Delete element from cell array: $cell(i) = []$.


#### Cell values
\{23 34\} creates a 1*2 cell array.

### Data-type conversion
Use logical(), num2str(number, precision).

### Structures
#### struct
s = struct('field1', values1, 'field2', values2, ...). isstruct.

isfield(s, 'fieldx'). rmfield.

get and put are abbreviated by syntax like s.field1.

##### Dimensions/ size of struct
The size of the resulting structure is the same size as the value cell arrays or 1-by-1 if none of the values is a cell.

#### Use Java objects
```
mtype = java.util.Hashtable;
mtype.put ( 'numNodes', numNodes);
s = mtype.get('numNodes');
```

Note: Java heap space runs out of memory much more easily.

##### Checking emptyness
mtype.get('asdf') returns [].

### Function handles
Suppose fn f defined already. Then can use g = @f, can pass it to other fns just like variables.

#### Reparametrization
Can reparametrize functions while you are at it. Eg: If poly(x, b, c) is defined and b, c are specified, can use @(x)poly(x, b, c) to get a handle to a function with parameter x.

#### Anonymous functions
Can also create anonymous fn using an expression; Eg: $f = @(x)x^3+x$.

#### Clearing memory
clear varName;

### Objects
#### Object creation
c= ClassName(..)

#### Access/ manipulate objects
Use object.member.

##### Introspection methods
properties(obj) or fieldnames(obj) \\
lists public properties; methods(obj) lists public methods. class(obj).


## Memory, variable management
List variables in use: whos.

### Clearing, recompiling
clear classes; rehash pathreset;. Need to do this if you alter class signature.

## Data manipulation
### Operators
#### Unary
transpose\', minus -.

#### Boolean valued operators
```
 <  >  <=  >=  == ~=
```

#### Boolean operations on matrices
Boolean ops also work with matrices to make boolean matrices.

all(A) checks if $\forall i,j A_{i,j} \neq 0$.

#### Arithmatic operators
* + -

#### Multi-ary
Range specifiers: 1:5 1:2:5.

#### Component-wise operations
```
y = sin(x)./x;
```

#### Matrix operators
\verb A/B : roughly $AB^{-1}$.

\verb A\B : roughly $A^{-1}B$.

### Operation with constant arrays: shortcuts
In A + 1: 1 is evaluated as a matrix of 1's.

### Array processing functions
#### Array statistics
size, numel.

sum (along any dimension: 1 for sum along rows/ sum of columns, 2 for sum along columns/ row sum etc..).

max, min.

nz, norm, unique.

find: find non-0 elements of matrix.

##### Checking emptiness
use isEmpty().

#### Reshape array
Delete row: A(2, :) = [].

If you store a value in an element outside of the array, the size increases to accommodate the newcomer.

Alter array shape: reshape.

#### Alter matrix
normr/c, tril, triu.

### Vector processing functions
Vector statistics: histc().

dot(a, b) gets the dot product of a and b without having to worry about whether a and b are both column vectors in doing a'b.

#### String manipulation
c=['sdf' 'asdf'] or strcat() concatenates.

[firstToken reminder] = strtok(string, delimiters).

strrep : string replacement.

### Matrix functionals
#### svd and eig
svd, svds (get only a few $\sw_i$), eig, eigs.

eig and eigs can return vectors differing in signs. \why

##### Low rank approximations of symmetric A
If A is symmetric, eigs is faster than doing svds, as it probably constructs $B = \mat{0 & A\\ A^{T} & 0}$ to compute svd. Can pass options which specify the structure of A (eg: symmetry), so that ew decomposition can be computed faster. Actually, $\abs(\ew) = \sw$, but if ew's are close together, $\ew$ and $\sw$ returned by eigs and svds can be very different --- but the resulting low rank approximations are both equally good.

## Code structure
### Sentence syntax
Sentence ends with ';' or new line: if former, execution is silent. Can continue writing in next sentence with '...'.

#### Commenting
\% comment.

### Functions and commands
#### Commands
Commands usually don't take vlaues/ variables, assume everything is a string etc..

Functions can be nested.

#### Functions without side-effects
Matlab functions are almost functions in the mathmatical sense: accept values and variables as arguments, return value. If they modify an object passed in the argument, they *must* return the object.

#### Syntax of function defn
```
function outputValue = fnName(arg1, arg2)
%  fnName(x,y)  function documentation
end

```

arg1 could be a function handle: you can then use arg1(..) to invoke the corresponding function.

To return multiple values, use function [a, b] = fnName(..).

To invoke functions from outside the file, they should be public: they should have same name as the file. Else, ye have a private function. Can't declare a fn inside a script.

#### Anonymous / temporary functions
\begin{lstlisting}
f = inline('sqrt(x.^2+y.^2)','x','y');
f = @(x, y)sqrt(x.^2+y.^2);
\end{lstlisting}

Reparametrization is another way of defining temporary functions: this is described under the function handles section.

#### Nested functions
##### Definition
Functions can be nested - by defining them as usual within a function body. But they cannot be nested within control structures.

##### Variable scope
They can access and modify variables and utilize functions, if they are defined within functions defined at a higher level.

Variables defined within a nested function are not available outside.

##### Restrictions on modifying runtime workspace
While debugging, if you break execution in a function in which a nested function is defined, you cannot modify the workspace by defining new variables. But you can define 'global' variables to get around this.

#### Checking input and output structure
Behaviour of a function can be made to vary based on the number of output variables expected by the caller, and the number of input variables required.

##### Variable inputs
Use nargin to check number of arguments passed. Or, you can use structures to pass arguments.

##### Variable outputs
Use nargout to check the number of output arguments expected. Then, add variable number of outputs like this: varargout(1) = {op1}; varargout(2) = {op2}; .

#### Invocation
##### Invocation of functions
output = functionName(arg1, arg2);\\
`[m, n] = size(X)`. Strings must be enclosed with ''.

Usually, reference is passed. Only the field being modified by the function will be passed 'by value'. If modified structure is returned as output, only changed fields will be altered upon function-return.

\subparagraph*{Asking functions for fewer outputs}
A function can return variable number (upto n) of outputs. But, when you invoke the function asking for k outputs, you cannot predict whether you get the first k of the n outputs or some other set - that is up to the function definition. Eg: qr().

\subparagraph*{To ignore return value}
`[~, n] = size(X)`.


##### Invocation of commands
commandName arg1 arg2 . Arguments assumed to be strings: even if not enclosed by ''.

##### Invocation of methods
Call superclass method: methodName@super(obj);

##### Invocation over multiple elements
cellfun(fun, cell), arrfun(fun, array).

### Define classes, packages
Base classes: value, handle.

```
classdef ClassName < package.superClass1 & superClass2
 properties (Access = ..)
  ...
 end
 methods
  % Constructor
  function s = ClassName(..)
   s = s@package.superClass1(...)
   s = s@superClass2(...)
  end
  function delete(objRef)
  ...
  end
 end
 events
  EventName
 end
end
```

In all non-static methods, the first arg is the object itself. object.fn(a, b) $\equiv$ fn(object, a, b).

No overloading functions within the same class.

If function modifies the object, it must return the object, like any fn in the mathematical sense!

#### Modifiers
Property modifiers: setAccess, getAccess = protected/ private/ public, Constant (not available in 2007 version), Static. Method modifiers: Access, Abstract = true, Static.

Property access methods: called when ye get or set property, before setting/ getting:
```
function value = get.PropertyName(object)
...
end
```

#### Directory structure
Under a directory in the path, +packageName dir, @ClassName dir or ClassName.m file. If a @ClassName folder is used, then ClassName.m containing the class definition should be placed within that folder.

##### mex files
Packages can contain mex files: \\
invocation: packageName.functionName.

#### Ceveat about 2007 version
The modifier syntax (Static) can't be used in 2007 version: must use (Static = true): does not even give error message.

Bad error messages.

#### Check errors in definition
Try to construct an object or Use fieldnames on an object, or invoke a test method.

#### Specifying events
Make a subclass of handle. Broadcast event using notify(obj,'EventName').

Listen for events: addlistener(eventObj,'EventName',@myCallback).

### Branching structures
```
if n == 0
    T = t0;
elseif n == 1;
    T = t1;
else
    T = 3;
end

switch x
case {1,2}
disp('Probability = 20%');
case {3,4,5}
disp('Probability = 30%');
otherwise
disp('Probability = 50%');
end
```

### Loop structures
```
for k= (Any *row* vector like 2:n)
  T = [2*t1 0] - [0 0 t0];
  t0 = t1;
  t1 = T;
end

while booleanCondition
  statements;
end
```

#### break and continue
Can break out of a loop or skip an iteration.

#### Avoiding loops in place of matrix ops
For efficient implementation, whenever matlab does large matrix operations, matlab uses PROPAC and other specially designed libraries to do things efficiently. So, if matlab has a matrix operation, always use that rather than writing your own loop.

### Error handling
#### Throwing errors
```
ME = MException('component:mnemonic', ...
       'message');
throw(ME)
```


#### Throwing warnings
Use warning('msg') or warndlg(). These are displayed when you do warning('on').

#### Assertions about input
assert(condition, errorMessage) generates an exception with an error message if a condition is violated. This is useful.


## Visualization
### Creating a figure
figureHandle = figure() creates a figure.

Can later save this: saveas (figureHandle, name With Extension).

gcf returns handle to the current figure.

figureHandle = hgload(figure path) or open() loads a figure.

##### Set properties
colormap gray;


### Plotting data
The plotting functions accept suitable data, figure properties, return a figure handle.

subplot(m,n,p) breaks up the figure into m*n table, selects the pth cell for the current plot.

hist(vector, nbins) without output arguments. bar(vector).

plot (xAxis, yAxis, LineSpec, 'PropertyName', value, ...);

semilogy plots y axis in log scale.

#### Line specifications
It is composed of the following, in that order. Eg: '-+r'

Line styles: -, --, -., : .

Markers: + o * . x s d p h \^ v .

Colors: r g b c m y k g.


### Plot properties
xlabel, ylabel, title.

grid on/ off/ minor.

### Visualize matrix
### Visualize matrices
spy a sparse matrix, for use with full matrices (aka non-sparse) use $>0.0001$. imagesc(A), image(A).

## Prallel programming
### Multi-threaded programming
Automatically enabled after 2008. Can be enabled with maxNumCompThreads = 2. Makes large matrix operations faster.

### With matlab toolbox
Tightly integrated with many other mathworks toolboxes.

#### Processor pool
Worker processes can be enable on a cluster or on the local multicore machine : controlled by a distributed computing server.

Use: matlabpool open/ close/ size.

#### parfor loop
Operates like for loop, but there may be no variable dependency between loops - otherwise the program will fail to compile.

#### Other tools
Look in matlabcentral.

## System IO
Use: [returnValue, commandOutput] = system(commandName);

To get environment variables: env(variableName).

## Other library functions
Very rich in functions for matrix operations. Try to find pre-written functions before writing code from scratch.

### Useful external toolboxes/ packages
software from Kevin Murphy and collaborators. Minka's lightspeed.

### Solving Matrix problems
\verb A\b  solves system of equations Ax=b. lsqnonneg: Non negative least squares.

Fitting polynomials to x and y: polyfit.

### File I/O
#### Log files
Can use file = fopen(fileName, mode); Mode can be w for overwrite, a for append ...
fprintf(file, 'asdf');
fclose(file).

#### Loading formatted data
```
load someFile.mat;
save data.mat A1;
```
load can read ascii files with two space separated columns and make sense of it.


#### C like functions
fprintf, `fscanf(fid,"%d ...")`, fopen(fid, 'w'), fclose.

### User interaction I/O
To print stuff: disp(). pause().

format long : set extra accuracy.

### Solve general optimization problem
Described among optimization software.

### Algebra
```
symadd('x^2 + 2*x + 3','3*x+5')
```

### Measure time
tic toc.

## mex: Using C functions
Write c files for efficiency.

### Interface
```
#include "mex.h"
void mexFunction(int numOutputArrays, mxArray *pOutput[],
int numInputArrays, const mxArray *pInput[])
 ...
```

Compile them in matlab prompt: mex fileName.

#### Debugging
See tips online.

### mxarray datatype
This includes the array's type, matlab variable name, dimensions. Non-sparse arrays contain pr and pi to store the real and imaginary parts of the data: these are one dimensional arrays.

#### Creation
Use functions like: mxCreateNumericArray, mxCreateCellArray, mxCreateCharArray.

```
 mxArray *myarray = mxCreateNumericArray(..);
 mxCreateDoubleMatrix(1,3,mxREAL);
```

#### Array access
mxGetPr, mxGetPi, mxGetData, mxGetCell.

mxGetM, mxGetN: get matrix dimensions.

#### Array modification
mxSetPr, mxSetPi, mxSetData, mxSetField. Can use memcpy to copy arrays at one shot.

#### Memory management
mxMalloc, mxCalloc, mxFree, mexMakeMemoryPersistent, mexAtExit, mxDestroyArray, memcpy

### Executing matlab commands
Both mexCallMATLAB and mexEvalString execute MATLAB commands. Use mexCallMATLAB for returning results (left-hand side arguments) back to the MEX-file. The mexEvalString function cannot return values to the MEX-file.

### User IO
mexPrintf, mexWarnMsgTxt, mexErrMsgTxt.

### Input validation
mxIsChar, mxIsClass(prhs[0], "sparse"), mxIsComplex.

## Java
### Advantages
Using loop operations can be 2x faster in java. For matrix operations, the fortran routines used by matlab are faster; but using java libraries like colt is said to be not too much worse.

Also, Arrays and values are automatically converted between matlab and java formats.


### Classpath
javaclasspath shows static and dynamic portions of class path. The former is loaded from [matlabroot \verb '\toolbox\local\classpath.txt' ]
. The latter is set using javaclasspath or javaaddpath. The class path is refreshed using [clear java].

