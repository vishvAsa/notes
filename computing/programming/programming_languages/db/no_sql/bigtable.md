+++
title = "Bigtable"
+++

A sparse 3D map: (rowkey, column-name, timestamp) to data. No other indexing, not a relational database. rowkey can be any byte sequence.

## Efficient operations
- Single row lookup. Scan row ranges/ prefixes.
- Scan column, timestamp ranges

## Advantages
- Scales easily, shards as necessary (during 'compaction' times). Shards are called tablets.
- Shards may be overloaded before the unpredictable compaction times, so intelligent key distribution may be desirable.

## Disadvantages
- Columns can be grouped into column family. Only column families are specified at the time of creation. Columns are created as needed.