+++
title = "+Proxy"
+++

## Haproxy
### Frontend
```
frontend http-in
         bind *:7465 ssl crt /etc/haproxy/MY_DOMAIN.pem
         default_backend couchdbs
         reqadd X-Forwarded-Proto:\ https
         acl secure dst_port eq 7465
         rsprep ^Set-Cookie:\ (.*) Set-Cookie:\ \1;\ Secure if secure
         rspadd Strict-Transport-Security:\ max-age=31536000 if secure
         redirect scheme https code 301 if !{ ssl_fc }
```

cert is formed by combining fullchain.pem and private.pem

### Backend
```
"
backend couchdbs
        option httpchk GET /_up
        http-check disable-on-404
        server couchdb1 127.0.0.1:5984 check inter 5s"
```