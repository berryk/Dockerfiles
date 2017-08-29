#!/bin/bash

mkdir -p /etc/ssl/ca/certs/users && \
mkdir /etc/ssl/ca/crl && \
mkdir /etc/ssl/ca/private

touch /etc/ssl/ca/index.txt && echo ’01’ > /etc/ssl/ca/crlnumber

