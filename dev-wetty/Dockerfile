# To run:
# docker run -it --name dev-base -v /var/run/docker.sock:/var/run/docker.sock --hostname dev-base dev-base /bin/bash  

FROM node:stretch
MAINTAINER Keith Berry "keithwberry@gmail.com"

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y neovim
RUN apt-get install -y tmux
RUN apt-get install -y ssh
RUN apt-get install -y sudo

RUN curl -sSL https://get.docker.com/ | sh

# Setup home environment
RUN useradd berryk && echo "berryk:berryk" | chpasswd && adduser berryk sudo
RUN mkdir /home/berryk && chown -R berryk: /home/berryk
ENV PATH /home/berryk:$PATH

WORKDIR /home/berryk
ENV HOME /home/berryk

RUN git clone https://github.com/berryk/dotfiles.git
RUN ./dotfiles/install.sh
#RUN git clone https://github.com/berryk/wetty.git
#WORKDIR /home/dev/wetty
#RUN npm install

