FROM debian 
RUN apt-get -yqq update 

RUN apt-get install -y wget 
RUN wget -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz | tar xzC /usr/local/bin 
#RUN mkdir -p /etc/cloudflared/ 
#COPY cert.pem /etc/cloudflared/ 
#COPY config.yaml /etc/cloudflared/ 

CMD ["cloudflared"] 
