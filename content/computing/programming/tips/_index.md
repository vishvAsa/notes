---
title: +Tips
---

## Meta Coding
### Packaging
- Supply automatic packaging, build system.
- Publish periodic releases.

### Reviews
- Remember cause
  - Can't write truly complete test cases
  - education
- Web based code review tool
- Ideal prerequisite for check-in
  - Readability review
  - Code owner review
- Separate changelists for separate changes
- Self critique
  - Beware over-confidence bias
    - Take break, return fresh
- Record confidence
  - 'Confidence in correctness: High. Reason: Tested multiple times'

## Separate data from code
### Externalizing messages

Message strings should, in most cases, not be hard-coded inside the code. Instead, message strings should be externalized; perhaps be returned by a function when provided with an appropriate key.

This separates the program logic from the messages cleanly. One advantage of doing this is that these messages can be changed without touching the program logic.

This is also convenient when the program needs to be made available in several different languages.

## Automate tests

In case of code to be shipped: test every function; make test scripts. If on GitHub, use free testing and build tools like Travis.

## Optimizing code for speed

Use a profiler to detect parts of the code which are slow. Use libraries optimized for speed.

Avoid repeated memory allocation.

Avoid writing loops in interpreted languages without ’just in time compiling’ facilities - like Matlab: use a compiled language like C instead: otherwise interpretation costs for executing the code piles up.

## Code reuse
Don’t rewrite the same logic multiple times: put it away in functions.

## Experiment functions

Make a function out of each experiment.

Clearly make program variables for all parameters involved in the experiment. You should not have to comment or uncomment code to run different variations of the experiment; you should just set the experiment parameters as necessary.
