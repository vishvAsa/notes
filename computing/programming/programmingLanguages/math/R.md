+++
title = "R"
+++

## Introduction and use
### When to use
Statistics is the emphasis, not matrix manipulation. It is an expression language.

### When not to use
Text processing and general purpose programming are painful.

### Writing, Building and executing code
#### Script execution
source("/path/file.R").

#### Reloading changed code
library("R.utils");

sourceDirectory("work", modifiedOnly=TRUE, \\pattern="[A-Z]*[.]R\$", recursive=FALSE);

#### Important environment variables
\verb R_LIBS : the place where R libraries are installed.

#### Working environment
getwd(), setwd(dir)

options(): Example options(digits=3)

#### Command history
history(), savehistory, loadhistory.

Can use Ctrl+R as  in BASH.

#### Good IDE's
##### Native GUI
Graphical data entry: data.entry(x), edit(x).

### Listing and memory
objects() lists objects.

rm(objA, objB) removes certain objects from memory. rm(list=ls()) removes all objects.


exists() checks for the existance of an object.

### Development environment
RStudio is good. Interactivity with RapidMiner is useful.

### Debugging
The following can be inserted in the midst of code:

browser(): breaks execution and allows debugging with arbitrary code: like keyboard in matlab. Use cont to continue the program. Q halts execution.

debug(): marks function for debugging.

trace() function modifies a function to allow debug code to be temporarily inserted.

setBreakpoint("fun.R\#20")

traceback() is useful when error is encountered.

### Help
help(command), ?command, \\
apropos("log"), help.search("log"), example(commandName).

### libraries
#### Seeking
help.search(fnName);

#### Using

#### Installing
Many packages are listed in cran internet repository.

chooseCRANmirror()

install.packages("igraph"). For usage, see the packages subsection.

## Data: types, values, variables
### Names and namespace
#### Valid names
a.b and a\_b are valid name; but by doing so, you are not creating a structure named a. A name can start with '.', but if so it cannot be followed by a digit.

#### Namespace
Uses: avoid name conflicts, structure code well.

To call a function b in a namespace a, use: a::b(). If b is hidden, then use a:::b().

#### Accessing list members directly
Use attach(Lst). detach() reverses this.

### Object
Everything is actually an object with attributes.

#### Accessing attributes
attrName(objName)

#### Setting attributes
attr(object, attribute) is used to get or set an attribute.

Or one can use structure(object, attr=value).

#### Important attributes
mode: details about the type of data contained.

length.

### Modes and type
Mode: details about the type of data contained. This is distinct from the type of the object itself (data.frame, or vector ..). So, type is akin to a generic/ template/ meta class in Java made concrete by specification of mode arguments corresponding to contents.

#### Basic modes
Boolean. Numeric. Integer.

### Scalar values and operations
#### Special values
TRUE, FALSE. Inf. NA: 'not available' or missing values. NaN is also a special case of NA.

These can be checked using is.na() and isNaN functions.

### Data conversion
as.array(), as.data.frame etc..

Use methods(as) for a list of such methods.

### Vectors
#### The basic math object
A scalar is actually a vector with one element in R. An array is also internally a vector. A string is a character array.

#### Homegeneity
Vectors are homogenous: their 'mode' attribute is character, numeric, logical.

#### Named entries
names(x) = stringList is a way of giving names to indices.

#### Indexing
A vector can be indexed with a vector of a] logical elements, b] positive integers, c] negative integers.

Eg: x[1:10] picks 1st 10 elements. x[-2]: all but x[2].

x['abc'] is valid if entries are named.

tail(x, k) picks the k last elements.

To append to a vector: append(v, val)

#### Creating vectors
c(1,2) : Using the concatenation function.

seq(); This can be abbreviated using the : operator.

rep(vector, timesToRepeat) is the replicator function.

vector() creates an empty vector.

#### Vector statistics functions
length, max, min, sum, mean, median, cummax, cummin, cumsum, cumprod, range, prod. cor: correlation.

which: gather 'TRUE' values from boolean vector.

#### Apply scalar functions
lapply returns a list. sapply, a simpler wrapper around lapply, returns a vector by default. vapply is an

apply returns an array or a vector but acts on arrays.

### Factor
Factors are ways of storing a label-vector. They can be created using factor(labelColumn).

An important attribute is levels, which contains the set of labels used.

### Strings
These are character vectors. Enclosed in "" for brevity.

#### String manipulation
concatenation: paste(vector). substr gets a substring.

strsplit(v, sep) returns a list, having split each element in v.

### Dates
#### String connection
\verb'd<-as.Date("1995/12/01",format="%Y/%m/%d")' converts string to date.

format(dt) converts date to string.

#### Arithmetic operations
Then, one can add days with d+20.

### Arrays/ matrices
#### As special vectors
Arrays are just vectors which support multiple subscript indexing. So all operations and restrictions that apply to vectors apply to arrays.

Arrays are stored column by column.

The dimensionality is stored as a vector in the dim attribute.

#### Indexing
A[a, ...]. Any subscript can be replaced with the sort of vector used to index vectors. If a subscript is omitted all values in that dimension are chosen.

Eg: A[,c(3:5)]: picks 3 cols.

#### Data creation
array(vector, dimensions). Or just set the dim attribute after creating a vector.

Or concatenate various vectors or arrays: c(v1, v2)

##### Matrices
x = matrix(vector, nrow = 3).
matrix(0,nrow=n,ncol=n)

Row or column binding functions: rbind(vec1, vec2); cbind.

#### Dimension-wise oeprations
apply applies functions to margins of an array; apply(x,1,max): gives row max.

sweep(m, 2, colSums(m), FUN="/")

#### Matrix functions
t(A): transpose.\\
\%*\%, \%\^\%: matrix mult and exp.

diag(A) extracts diagonal, creates a diagonal matrix depending on the argument.

sum, rowSums, colSums, rowMeans, colMeans. cor: correlation.

##### Linear algebra
eigen, svd, qr. solve(A, b). lsfit(A, b).

### Lists
Lists are heterogenous. They are a combination of a Hashmap and a list. They are very convenient to use as structures.

#### List creation
$L <-list(1, a, b)$ or $L <-list(a1= 1, a2 = a, xyz = b)$ for named lists.

#### Accessing list items
L[[4]], L[["fieldName"]], L\$fieldName. While indexing, list names can be abbreviated: Eg: 'cov' instead of 'covar', as long as the interpreter is still able to uniquely identify the intended member.

TO see if a member exists, use: fieldName \%in\% colnames(Lst).

#### Concatenation
c(L1, L2) returns a single list with members from both.

### Data frame
Data frames are the R concept for data tables or matrices which can consist of columns of mixed types which can also have a name.

#### Creation
They are often read in from files - using read.csv for example.

By concatenating vectors: df = data.frame(n, s, b).

#### Conversion
Or from a matrix: data.frame(A). It can be reconverted to a matrix using data.matrix.

#### Indexing
Indexing is done as in the case of two dimensional arrays. If column headers exist, they can be used for indexing.

```
drops <- c("x","z")
DF[,!(names(DF) %in% drops)]
DF$colName
```


#### Searching
\verb which(sbux.df$Date == "3/1/1994")

#### Concatenation
As in the case of matrices

### Model Formulae
\~ operator is used to separate left and right sides of formulae.

Syntax: response \~ predictor variables (separated by +).

### Functions
Functions are actually objects.

#### Definition
```
my.mean <- function(x1 = defaultValue, y1) codeBlock
```

The value returned is the value evaluated by the last expression in the function definition. Multiple return values are usually handled using lists.

#### Variables used
Usually variables have a local scope: they cannot be accessed outside a function.

They can use variables from the parent scope, say g. The value of g is bound from the parent scope. If a normal assignment is made to g: $g <- 0$, g is then taken to refer a local variable. If g is not bound to a value, but is required in the function definition, there is an error; as it is not bound either in the definition or by an argument. However, if $g <<- 0$ is used, then the parent-scope variable is updated, and g acts as the 'state' of the function.

#### Operator defintions
The function name can be replaced by \%*\% for example.

#### Invocation
Invocation can be done as in C, using a sequence of values. Together with positionally specified values, one can pass named arguments in any order. Eg: f(3, a=1, b = 2) or f(a=1).

## Operator
### Assignment
$<-, ->$, assign(). $<<-$ is used to make global assignments: assignment to a variable outside the local scope.

### Scalar operators
#### Arithmetic operators
As in C.

#### Operators on booleans
\verb'|, &, ||, &&',  where the latter result in 'short-circuit' evaluation, where the second argument is evaluated only if necessary.

#### Operators which produce booleans
\verb'>, <, =='.

### General Vector operators
#### Mapping over elements
lapply can be used to apply scalar functions to vector elements, while apply() can be used to apply vector functions on array rows.

#### Arithmetic and boolean ops
All scalar arithmetic operators are extended to be meaningful when provided vector arguments: even when they are not of the same size.

#### Lengthening of arguments
All shorter arguments are extended by repetition to have the size of the longest vector: Thus 1+c(2 3) is define.

##### Examples
c(1,2,3,4)/c(4,3,2,1). c(1,2,3,4) + c(4,3) yields 5 5 5 8.

#### ifelse op
ifelse operation uses a logical vector as a condition.

#### Set membership
```
drops <- c("x","z")
DF[,!(names(DF) %in% drops)]
```


#### Missing value identification
is.na(x) returns true for both NA and NAN values. Note that this is different from the syntactically undecidable expression x == NA.



## Code structure
Every line of code is an expression or a sentence.

### Code blocks
\{\} encloses code block.

### Sentence syntax
Sentences end with newline or ;.

\# comments.

### Decision structures
if(..) codeBlock; optionally followed by else codeBlock. for(var in vector) codeBlock. while(cond) codeBlock.

### Packages
To be able to use a package, one says: library(packageName). Standard packages are automatically available. Note that this is distinct from the idea of a namespace.

### Organization with lists
Can group functions in lists which are declared in separate files. These files are then (re)loaded using commands like source or sourceDirectory.

## IO
### File I/O
To load data from a table, use read.table(), read.csv (fileName, header=FALSE, stringsAsFactors = FALSE), write.csv(x, file).

Write in matlab format: library(R.matlab), writeMat(filename, A=mat).

### User interaction I/O
#### output
a+b prints a value, which is then lost.

print. printf is available in the base package.

sink('fileName') diverts output to a file. sink() restores it to STDIO.

#### Input
x= scan(): keyboard input, no commas.

### Plotting and tables
\verb' plot(y ~ x) ' produces a scatter plot.

Tables can be produced with \verb'xtabs(y ~ x)'.

## Data preparation and exploration
scale(x, center = TRUE, scale = TRUE) normalizes columns using the mean and standard deviation.

Getting covariance matrix: cor(x, y = NULL, use = "pairwise.complete.obs")

## Modeling
Several useful functions are provided to evaluate fitted models in the package stats, which is loaded by default.



### Classification
Decision tree learning: rpart

#### Logistic regression
```
glm(model, data=tblName, family = binomial())
ret <- glm.fit(x=X, y=z, family=binomial())

```
Options for family include: binomial(link=logit)

The return value is a list which includes coefficients and fitted.values.


#### Logistic regression with l1/l2 regularization
Use the glmnet package (requires gfortran).

Example:
```
returnList <- cv.glmnet(X, y, family = "binomial");
```

returnList contains the following vectors: lambda (corresponding to the lagrangian multiplier for the l1-norm), cvm - the corresponding mean cross-validated errors, glmnet.fit: the fit weights.

#### Decision tree: rpart and tree
```
ret <- rpart(model, tblRet)
print(ret)
```


## Other library functions
### Random sampling
Sampling from distributions: runif. sample(x, size, [replace=TRUE])

## Write C extensions
### Write C code
Useful libraries: \#include <R.h> \#include <Rmath.h>

Signature: void getSamples(int *input, int *output)

### Calling C code
Compile C code: R CMD SHLIB foo.c

Loading: dyn.load("foo.so")

Calling: .C("foo", n=as.integer(5), x=as.double(rnorm(5)))

This returns a list of return.

