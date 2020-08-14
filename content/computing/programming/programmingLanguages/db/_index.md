+++
title = "+DB"
+++

## Relational Database management system (RDBMS)
All records can be viewed as consisting of some fields or attributes.  Every attribute has a fixed domain. There are relations among these fields which impose constraints on what forms a valid record.

Tuples are a collection of values assigned to attributes. A bunch of tuples sharing the same attributes form a relation (or a table).

### Relational algebra
Relations can undergo the following operations: Union, intersection, difference, cross product, selection/ restriction, projection, inner join, relational division (?).

### Database normalization
What relations should exist and what attributes should various relations contain so that they do not redundantly store data?

To do this there are various normal forms (Boyce Codd). However, normalizing a database too much causes retrieval and update operations to slow down as they will involve joins.

## Sharding
Databases can be too large to store in a single machine. In that case, the tables may be split horizontally and stored in different machines.

The different shards can be named using the convention tblName\@ shardNum.

Some query engines like dremel can query multiple shards simultaneously.

## Pooling writes
Database writes, when pooled, reduce client to database server traffic. Intelligent pools collect writes and flush when a sufficient load is accumulated.
