#
# A common Xrdp image that the window-manager images build on
#
# docker build -t xrdp .

FROM debian:stretch
#FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV TERM=xterm
RUN printf "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list

RUN apt-get update
RUN apt-get upgrade -yq

RUN apt-get install -yq curl dpkg wget xfce4 apt-utils sudo vim openssh-server git 
RUN apt-get install -yq gnupg

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get update \
    && apt-get install -y google-chrome-stable --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /src/*.deb

RUN apt-get update
RUN apt-get -t stretch-backports install -yq "xrdp"
RUN apt-get -t stretch-backports install -yq "xorgxrdp"

#RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
#RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#RUN apt-get install -yq apt-transport-https
#RUN apt-get update 
#RUN apt-get install -yq code

#hard code the root pwd
#RUN echo "root:docker" | chpasswd
#ADD xsession /root/.xsession

# add our user
#RUN adduser --disabled-password --gecos "" berryk 
#RUN adduser berryk sudo
#RUN adduser berryk users
#RUN echo "berryk:docker" | chpasswd

RUN groupadd --system chrome

RUN useradd --system --create-home --gid chrome --groups audio,video,sudo,users berryk
RUN mkdir --parents /home/berryk/reports
RUN chown --recursive berryk:chrome /home/berryk  
RUN echo "berryk:docker" | chpasswd

RUN sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1

ADD run.sh /usr/local/bin/run

ADD xsessionrc /home/berryk/.xsessionrc
ADD profile /home/berryk/.profile
ADD xsession /home/berryk/.xsession
ADD bashrc /home/berryk/.bashrc

ADD https://github.com/berryk/dotfiles/archive/master.tar.gz /home/berryk/. 
RUN gunzip -c /home/berryk/master.tar.gz | tar xvf - 

#ADD chromium /home/berryk/bin/chromium
ADD xrdp.ini /etc/xrdp
ADD startwm.sh /etc/xrdp
ADD sesman.ini /etc/xrdp
ADD Xwrapper.config /etc/X11
ADD start.sh /

CMD /start.sh

# for RDP
