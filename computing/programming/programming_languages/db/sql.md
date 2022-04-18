+++
title = "SQL"
+++
A standard language for dealing with RDBMS. So, data can be visualized as being stored in tables.

## Help and tutorials
w3schools has a good tutorial.

## Values
Strings are enclosed as here: 'asdf'.

## Query language

### Query table
The query table may be specified in several ways. In the most basic case, it is a single table.

- table1 (as t1), table2 represents a cross-product, aka cross join. This returns a table whose rows are members of tbl1 X tbl2. In specifying temporary table names, as in table1 as t1, some dialects allow omission of 'as'.
- tableList may be of the form: tbl1 join-command tbl2 [on condition]
- Or it can be: (selectStatement)


### Post selection processing
- 'group by fieldName' groups the data together before displaying.

- Multiple select statements may be combined using keywords like: UNION ALL, INTERSECT.

### Temporary tables
Temporary or inline tables are automatically created whenever a query table involves a join of any sort, or when it is defined by some select statement.

However, one may want to explicitly name and store the results of a query. Syntax is same as in create statement, with additional keyword: create temporary/ inline table.

#### Storage
These tables are stored in the RAM of the database client or on the database server.

The tables are dropped automatically at the end of the session.

## Stored procedures
A piece of sql code which can be easily called.
