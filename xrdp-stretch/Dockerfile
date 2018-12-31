#
# A common Xrdp image that the window-manager images build on
#
# docker build -t xrdp .

FROM debian:stretch
#FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

ENV TERM=xterm
RUN printf "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list

RUN apt-get install -yq curl dpkg xfce4 apt-utils sudo vim chromium openssh-server git

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
RUN adduser --disabled-password --gecos "" berryk 
RUN adduser berryk sudo
RUN adduser berryk users
RUN echo "berryk:docker" | chpasswd
# RUN setcap-r `which i3status`
#RUN alias chromium="chromium --no-sandbox"

RUN sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1

ADD run.sh /usr/local/bin/run

ADD xsessionrc /home/berryk/.xsessionrc
ADD profile /home/berryk/.profile
ADD xsession /home/berryk/.xsession
ADD bashrc /home/berryk/.bashrc

ADD https://github.com/berryk/dotfiles/archive/master.tar.gz /home/berryk/. 
RUN gunzip -c /home/berryk/master.tar.gz | tar xvf - 

ADD chromium /home/berryk/bin/chromium
ADD xrdp.ini /etc/xrdp
ADD startwm.sh /etc/xrdp
ADD sesman.ini /etc/xrdp
ADD Xwrapper.config /etc/X11
ADD start.sh /

CMD /start.sh

# for RDP
