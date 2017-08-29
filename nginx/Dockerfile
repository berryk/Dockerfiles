# To run:
# docker run -d --restart unless-stopped -p8000:80 -p3389:3389 -p3389:3389/udp --name remotespark-running berryk/remotespark:latest

FROM nginx:latest
MAINTAINER Keith Berry "keithwberry@gmail.com"

WORKDIR /usr/src

COPY generate_ca_certs.sh .
COPY setupfolders.sh . 
COPY create_user.sh . 
COPY conf/* /etc/nginx/conf.d/.