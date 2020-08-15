+++
title = "Perl"
+++

## Distinctive features
This is an interpreted language. It is loosely typed.

It is very good at text processing.

### Richness of syntax
It is very rich, so that there are multiple ways to accomplish the same thing; to the point where code written by one programmer may be unintelligible to another.

## Running, building
### Running
See perlrun on the internet. Commands to be interpreted are either entered in a special shell, or is passed in a file to the interpreter, or is passed in the command line.

### Getting help
Use perldoc, perlsyn. Inbuilt function reference: perlfunc.

## Modules
Install: `cpan Chocolate::Belgian`

### Define
Begin:
```
package Some::Module;  # assumes Some/Module.pm
 BEGIN {
require Exporter;
our $VERSION     = 1.00;
# Inherit from Exporter - necessary.
our @ISA         = qw(Exporter);
our @EXPORT      = qw(func1 func2);
# Optional export
our @EXPORT_OK   = qw($Var1 %Hashit func3);    }
```

End:

```
 END { ... }  #cleanup
1;
```

## Ref
<div class="spreadsheet" src="../perl.toml"> </div>  

