+++
title = "Lua"
+++

## Paradigms and extensibility
Multi-paradigm language. Functions can be treated as values, higher-order functions exist.

Highly extensible.

### Building
Compiled to bytecode, executed.

### Metatable
This can be used to effect inheritence.
```
 fibs = { 1, 1 }
setmetatable(fibs, {
  __index = function(name, n)
  -- Call this function if fibs[n] does not exist.
    name[n] = name[n - 1] + name[n - 2]
    return name[n]
  end
})
```


## Ref
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="../lua.toml"> </div>  

