location /login {
  proxy_pass http://ubuntu:3000/login;
}

location /validate {
  proxy_pass http://ubuntu:3000/validate;
}

location = /auth {
  internal;
  proxy_pass http://ubuntu:3000/auth;
  proxy_pass_request_body off;
  proxy_set_header Content-Length "";
  proxy_set_header X-Original-URI $request_uri;
}