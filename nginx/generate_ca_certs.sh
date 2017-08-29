#!/bin/bash

openssl genrsa -des3 -out /etc/ssl/ca/private/ca.key 4096

openssl req -new -x509 -days 1095 \
    -key /etc/ssl/ca/private/ca.key \
    -out /etc/ssl/ca/certs/ca.crt

openssl ca -name CA_default -gencrl \
    -keyfile /etc/ssl/ca/private/ca.key \
    -cert /etc/ssl/ca/certs/ca.crt \
    -out /etc/ssl/ca/private/ca.crl \
    -crldays 1095