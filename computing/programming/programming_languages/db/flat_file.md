+++
title = "Flat file"
+++

The entire database may be stored within a single file. Such databases may be useful when a database server is not required and when access is local. Eg: sqlite, berkeley db (not a relational db), recutils.


## sqlite
- sqlite3 databases cannot be opened with sqlite.
- sqlite offers a limited set of field types.
- sqlite does not allow joins during updates - making the process of copying columns a bigger chore.

### GUI
sqlitebrowser offers a good GUI for sqlite - but the import from csv feature is very slow as of 2012.

### Shell
#### Importing
```
.mode csv
.import fileName.csv tableName
```

