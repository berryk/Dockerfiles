    proxy_http_version 1.1;
    proxy_buffering off;
    proxy_set_header X-Forwarded-For  $remote_addr;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection $connection_upgrade;
    proxy_read_timeout 24h;
    proxy_send_timeout 24h;
