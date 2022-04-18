+++
title = "Google Spreadsheet"
+++

## Google docs
### Cell referencing
Columns are numbered with letters and rows with numbers. A cell can be specified using a latter and a number.

When cell references are copied (perhaps as part of formulae), the references may be automatically changed in a certain way - this is called relative reference: Eg: The reference A20 used in cell A2, when copied to B2 will automatically be changed to B20.

When such change does not happen, we have absolute reference to a cell. Eg A\$20, and \$A20 (the former indicating that the row is fixed and the latter fixing the column), \$A\$20.

### Range specification
A:A, A2:A30.

### Filtering


#### Condition specification
">0", value.

### Counting
COUNTIF(rangeToCheck, condition, rangeToCount). rangeToCount is optional.

COUNTBLANK. COUNT.

### Summation
SUMIF, SUM. These have syntax similar to countif and count.


### Averaging
AVG(RANGE)

### Looking up values
vlookup()

## Ref
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="../google_spreadsheet.toml"> </div>  

