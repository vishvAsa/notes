+++
title = "+Web server"
+++

## HTTP server and dynamic content
A http server serves files; of which html files are normally viewed using web-browsers. These files may be static, or they may be generated dynamically, at the time of the request. For dynamic generation of such files, the http server should coordinate with some external program. At the minimum, it passes the request made by the client to this program and retrieves its output.

These programs may be precompiled - they may be written in C; or they may be written in a scripting language, and the http server may use an appropriate interpreter when the request is made.

### CGI
- common gateway interface.
- A standard way of invoking scripts to serve http requests.
- HTTP requests: headers are sent as environment variables. body is sent as STDIN.
- HTTP response: read from STDOUT

### Cons
- With many servers, new process (not just new thread) is started for each request - most of the computing time goes there.
- presentation not separated from data.

## Scripting mixed with html
The dynamic programs often dynamically generate html pages, so the dynamic portions of such pages can potentially be written in another language, while the static portions are written in html. Depending on the language used for the dynamic portion, this mixed-language is called by different names, like perlscript or JSP (or java server pages) or ASP.

The http server may utilize these scripts/ server pages by first converting it into a program of the corresponding language and then using the appropriate interpreter. Eg: JSP's are often first converted to Java servelets.
