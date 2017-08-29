#!/bin/bash

username=$1

openssl genrsa -des3 -out /etc/ssl/ca/certs/users/$username.key 1024

openssl req -new -key /etc/ssl/ca/certs/users/$username.key \
    -out /etc/ssl/ca/certs/users/$username.csr

openssl x509 -req -days 1095 \
    -in /etc/ssl/ca/certs/users/$username.csr \
    -CA /etc/ssl/ca/certs/ca.crt \
    -CAkey /etc/ssl/ca/private/ca.key \
    -CAserial /etc/ssl/ca/serial \
    -CAcreateserial \
    -out /etc/ssl/ca/certs/users/$username.crt

openssl pkcs12 -export -clcerts \
    -in /etc/ssl/ca/certs/users/$username.crt \
    -inkey /etc/ssl/ca/certs/users/$username.key \
    -out /etc/ssl/ca/certs/users/$username.p12