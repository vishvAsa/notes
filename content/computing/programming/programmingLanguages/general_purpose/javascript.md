+++
title = "Javascript"
+++

## Intro
- Loosely typed.
- prototype-based object oriented.
- Functional (has first class functions, closures)

## Design flaws
- overloading of + to mean both addition and concatenation with type coercion
- the error-prone with statement should be avoided. 
- The reserved word policies are much too strict.
- It takes varName = value; to mean a declaration of a global variable if varName had not been declared previously. DOM, which is heavily used by the language, is also flawed.

### Mitigation
1] Ensure syntactic correctness using jslint, 2] Ensure semantic correctness using proofs and testing as usual.

## Strict mode
- ECMAScript 5's strict mode is a way to opt in to a restricted variant of JavaScript. Strict mode isn't just a subset: it intentionally has different semantics from normal code. Browsers not supporting strict mode will run strict mode code with different behavior from browsers that do.
- Strict mode applies to entire scripts or to individual functions. It doesn't apply to block statements enclosed in {} braces; attempting to apply it to such contexts does nothing.
-  'use strict';

## Module
- Limits scope.
  - In that code, there may be declarations (variable declarations, function declarations, etc.). Local by default, but may be exported.
- Each module is a piece of code that is executed once it is loaded. 
- A module can import things from other modules. Cyclic dependencies ok.

## Global scope
- A global object is an object that always exists in the global scope.
- there is always a global object defined, for example in Browser it is the window object where in Node.js it is the global object.

## Identifier
- An identifier must start with $, _, or any character in the Unicode categories “Uppercase letter (Lu)”, “Lowercase letter (Ll)”, “Titlecase letter (Lt)”, “Modifier letter (Lm)”, “Other letter (Lo)”, or “Letter number (Nl)”.
- The rest of the string can contain the same characters, plus any U+200C zero width non-joiner characters, U+200D zero width joiner characters, and characters in the Unicode categories “Non-spacing mark (Mn)”, “Spacing combining mark (Mc)”, “Decimal digit number (Nd)”, or “Connector punctuation (Pc)”.

## Context pointer : this
- In the global execution context (outside of any function), this refers to the global object, whether in strict mode or not.
- Inside a function, the value of this depends on how the function is called.  In sloppy mode, this will default to the global object. In strict mode, however, the value of this remains at whatever it was set to when entering the execution context.
- When a function is called as a method of an object, its this is set to the object the method is called on. When a function is used as an event handler, its this is set to the element the event fired from (some browsers do not follow this convention for listeners added dynamically with methods other than addEventListener).

## Package management
### NPM
- Initialize: npm init . creates packages.json for dependency management

#### Installation
Global installation:  
```
 sudo npm install -g react-reflux
npm install git+https://github.com/jashkenas/coffee-script.git 
```

Dev installation:  
`npm i style-loader --save-dev`

### Webpack
- Works on top of npm
- It's a dependency manager, bundler, size-optimizer. works on .js, .css., .scss, pictures ...
- Combines js modules into a single bundle.js which you include in html (avoiding multiple includes) - can also debug this with appropriate flags. 
- Also transforms npm modules as need for browser use.

## Ref
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="../javascript.toml"> </div>  

