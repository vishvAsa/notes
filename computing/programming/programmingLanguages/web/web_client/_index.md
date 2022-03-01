+++
title = "+Web client"
+++

## Curl
```
curl -X GET http://127.0.0.1:5984/_all_dbs
HOST="http://anna:secret@127.0.0.1:5984"
curl -X PUT $HOST/somedatabase
curl -X PUT $HOST/somedatabase/_design/log -d '{"validate_doc_update":"function(newDoc, oldDoc, userCtx) { log(userCtx); }"}'
```

## Chrome extension
<div class="spreadsheet" src="chrome_extension.toml" fullHeightWithRowsPerScreen=8> </div>  
