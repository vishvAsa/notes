+++
title = "Couchdb"

+++

## Overview
- Master-Master Replication - so better than master-slave. Eventual consistency. partition tolerance.
- lately allows ad hoc querying with sql-like syntax (changed in 2016?). Can also do map-reduce with views. 
- great versioning system.
- heavy-write friendly thanks to its append-only nature (writes operations return in no time while guaranteeing that no data will ever be lost).
- CouchDb relies on b-tree for all, even indexes. This means that even with 20 billions, the querying time will always remain below 10ms. This is a game changer which makes CouchDb a low-latency and read-friendly database.

### Distributions
- oft very inter-compatible:
- apache couchdb. 
  - free couchbase community (apache couchdb + memcache). commercial couchbase. 
- Couchbase Lite (android api).
- js pouchdb.
- Cloudant BigCouch (scales horizontally -  While it appears to the end-user as one CouchDB instance, it is in fact one or more nodes in an elastic cluster,)

## Contents
- Documents. Each document is identified uniquely by its ID.
- Views. Each view has a unique name, and a persistent index as well as map and reduce functions.
- Filter functions. These are used to replicate subsets of documents.
- Replications. Each replication specifies a remote database to sync documents to or from, and other parameters.

## Querying
Queries can then look up a range of rows from a view, and either use the rows' keys and values directly or get the documents they came from.

Cloudant's mango language is a mongo DB API layer for couchdb. Automatically tries to use the best available index (_all_docs index by default)

## Permissions
- 2 classes of users: admins, users.
- if admins present, only they can create design docs, indices etc.. .
- if users present, only they can read write etc.. else everyone can.
- read only restriction only possible with a validation function

## Indexing
- A View is a persistent index of documents in a database, ordered by some key, mapped to some value (+ a link to original doc), which you then query to find.
- The main component of a view (other than its name) is its map function. See below.
- The resulting index is persistent, and updated incrementally as documents change.

### Mango
```
{
  "index": {
    "fields": [
      "_id",
      "someField.someSubField"
    ]
  },
  "type": "json"
}
```

- type (optional): Can be json or text. Defaults to json. 
- name (optional): Name of the index.
- ddoc (optional): Name of the design document in which the index is created. By default, each index is created in its own design document. 
- Note: someArrayField.someSubField does not work - https://couchdb.slack.com/archives/C49LEE7NW/p1504061667000145 .

### JS Index
#### Setup
Even though a view is persistent, its map and reduce functions aren't: they're just function pointers (or blocks, or inner classes) and have to be registered at runtime, before the view is queried. 

It's good practice to set up views when your app starts up, right after opening the database

#### Map function
This function is written in the same language as your app. It takes a document's JSON as input, and emits (outputs) any number of key/value pairs to be indexed. A view may also have a reduce function. If present, it can be used during queries to combine multiple rows into one.

Both the key and value passed to emit can be any JSON-compatible objects - ie numbers too.

For example of routine and resultant values, see js couchdb.

#### Failure handling
CouchDB recovers gracefully from a few isolated map function failures, but when a map function fails regularly (due to a missing required field or other JavaScript exception), CouchDB shuts off its indexing to prevent any further resource usage. For this reason, it’s important to check for the existence of any fields before you use them.

## Ref
<div class="spreadsheet" fullHeight src="../couchdb.toml"> </div>  

 