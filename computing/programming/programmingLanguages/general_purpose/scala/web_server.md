+++
title = "Web server"
+++


## Play
<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="play.toml"> </div>  

## Akka Http
HTTP front for the akka actor system - no built-in templating language.
offers several different API levels for “doing the same thing”.

<div class="spreadsheet" fullHeightWithRowsPerScreen=8 src="akka_http.toml"> </div>  

### Client
```
val request = HttpRequest(uri = Uri(uri))
val req = HttpRequest(uri = "/ignored", headers = List(`Raw-Request-URI`("/a/b%2Bc")))

val formData = FormData(("user_id", user_id), ("user_secret", user_secret))
val r = HttpRequest(POST, url, headers, formData.toEntity)

```