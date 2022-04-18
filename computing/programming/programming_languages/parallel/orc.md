+++
title = "ORC"
+++

## Distinctive features of the language
### Purpose of design
Inspired by functional programming languages.

Distributed computing: There'll be many services on the internet, need a language to orchestrate them. So, good internet mashup language.

Good for concisely reasoning about distrubted systems.

### Sites
Everything is a site: a possibly remote function without side-effect which may not respond. Even +, -, if(..) etc.. are sites. These may return sites too. Actual site call is not executed until all arguments are available.

### Functions
The language allows/ needs functions, but they're not site calls. It is simply a parametrized expression.

### Parallelism
Highly parrellelizable.

Even a+b: a and b are evaluated independently.

### Speed

## Writing, Building and executing code
Run in browser, or using an eclipse plugin.

### Debugging


## Help
The website.

## Pre-compilation processing

## Variable and data types
### Data types
signal is a unary data-type. boolean, numeric etc.. are other data types.

[] is an empty list.

a = Ref() yields a pointer: then do a.read(), a.write().

### Declaration syntax
val valName = expression.

This boils down to pruning operator. Eg: \\(a|valName\\) is actually \\(a|b<b<expression\\).

It is scoped to the expression in the next line.

Pattern matching: \\(a:b=[1, 2, 3]; (\_, a) = (2, 3)\\).

## Data manipulation
### Operators
/= is 'not equal to' boolean operator.

### Accessing object methods
channel.get() actually is shorthand for calling a function which retrieves the get() function and then invokes it.

## Code structure
### Sentence syntax
There is actually just one sentence/ expression. Rest is syntactic sugar. Line breaks don't matter.

#### Commenting
\{- asdf -\}

### Combinators
Use to stitch together expressions.

Parallel combinator: \\(a|b\\).

Sequential/ push combinator: \\(>\\). Eg: \\(prompt()>b>c(b)\\). Syntactic sugar: \\(prompt()>b>c\\) is same as \\(prompt()>>c\\).

Pruning/ pull operator: \\(a<b\\). Both sides begin to be evaluated simultaneously; if LHS needs a value, then it blocks.

### Syntax of functions
Can be nested.

def fnName(arglist) = expression.

Function definition which uses pattern matching, usual syntactic sugar to specify termination condition:

fn([]) = asdfasdf

fn((a:asdf)) = asdfasdf

### Decision, timing sites
if(). stop() never returns any value. RTimer().

Iteration accomplished through recursion.

### Function invocation
fn(arguments) or fn.

fn(expression): syntactic sugar for \\(f(x)<x<expression\\).

## Error handling

## Other library functions
### User interaction I/O sites
prompt(), print().


