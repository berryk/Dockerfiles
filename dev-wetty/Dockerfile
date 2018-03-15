# To run:
# docker run -it --name dev-base --hostname dev-base dev-base /bin/bash  

FROM node:stretch
MAINTAINER Keith Berry "keithwberry@gmail.com"

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y neovim
RUN apt-get install -y tmux

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev
ENV PATH /home/dev/bin:$PATH

WORKDIR /home/dev
ENV HOME /home/dev

RUN chown -R dev: /home/dev
USER dev

RUN git clone https://github.com/berryk/wetty.git
WORKDIR /home/dev/wetty
RUN npm install

