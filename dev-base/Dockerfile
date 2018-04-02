# To run:
# docker run -it --name dev-base -v /var/run/docker.sock:/var/run/docker.sock --hostname dev-base dev-base /bin/bash  

FROM debian:latest
MAINTAINER Keith Berry "keithwberry@gmail.com"

RUN groupadd --gid 1000 berryk \
  && useradd --uid 1000 --gid berryk --shell /bin/bash --create-home berryk
RUN echo "berryk:berryk" | chpasswd
RUN chown -R berryk: /home/berryk
ENV PATH /home/berryk:$PATH

RUN apt-get update -y
RUN apt-get install -y apt-utils
RUN apt-get install -y curl
RUN apt-get install -y git
RUN apt-get install -y neovim
RUN apt-get install -y locales
RUN apt-get install -y tmux
RUN apt-get install -y ssh
RUN apt-get install -y sudo
RUN apt-get install -y xterm
RUN apt-get install -y fonts-powerline

RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8 

RUN curl -sSL https://get.docker.com/ | sh

# Setup home environment
RUN adduser berryk sudo && adduser berryk docker

USER berryk
WORKDIR /home/berryk
ENV HOME /home/berryk

RUN git clone https://github.com/berryk/dotfiles.git
RUN /home/berryk/dotfiles/install.sh
#RUN git clone https://github.com/berryk/wetty.git
#WORKDIR /home/dev/wetty
#RUN npm install

CMD /bin/bash
