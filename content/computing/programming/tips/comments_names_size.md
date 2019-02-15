---
title: Comments, names, size
unicode_script: devanagari
emphasis_as_inline_comments: true
---

## Readability techniques: Overview
To borrow from, but not fully copy, "literate programming" - a code segment (say a file) should read like a clear book chapter or short wiki article. Readability (ease of understanding) can be accomplished by a combination of good variable naming, function and file size and comments - in that order of preference.

Comments are the last resort (as they get out of sync), but should be quite copious when necessary (to communicate design choices, problems, describing obscure language features etc.. for example). To the greatest extant possible, comments should be interleaved with the code itself (and not in some external file) - to keep them in greater sync. One should be able to generate API documentation thence.

## Comment triggers
- If information apparent from code, don't comment
- In case of complex modules, document points of entry, the data flow etc..
- State Variables: how used, altered?
- When a particular design choice is implemented, comments may be included to justify the choice.
- Record observations, limitations influencing implementation
- Functions
  - Describe behavior if there is any ambiguity
  - Input detail
  - Output detail

Include TODO-s
## Coding conventions
Following common coding conventions ensures that:
- the code gels well with programming style of libraries as well as a broad set of contributors.
- Function and variable names will be easy to search.
- Sometimes they help avoid logic pitfalls.

## Modularity

### Pluses

- Code reuse
- Limited capacity to keep track of things

### Minuses
Hard to figure out where to start. This needs to be explicitly pointed out in some doc, or determined using breakpoints/ logs.

### Modules

- Functions
  - Functions lacking in side effects
  - Write short functions.
- Service layers in communication protocols
- Web programming
  - Separate structural, stylistic and logic elements.
    - Into html, css, scripts.
- Classes, structures
- Anonymous functions within functions

### Auxiliary techniques
- Avoid rely on globals in functions, classes.
- Access modifiers to limit variable visibility in classes.

## Conciseness

Remember cause

- Less clutter
- Important logic should stand out

Specially boilerplate code

- exception handling
- Assertions
- Null checks
  - Use monads
