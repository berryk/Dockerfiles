#
# A common Xrdp image that the window-manager images build on
#
# docker build -t xrdp .

FROM debian:jessie

RUN apt-get update

RUN apt-get install -yq curl dpkg xterm xrdp apt-utils sudo i3 vim chromium i3status dmenu openssh-server git

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get install -yq apt-transport-https
RUN apt-get update 
RUN apt-get install -yq code

#hard code the root pwd
#RUN echo "root:docker" | chpasswd
#ADD xsession /root/.xsession

# add our user
RUN adduser --disabled-password --gecos "" dockerx 
RUN adduser dockerx sudo
RUN adduser dockerx users
RUN echo "dockerx:docker" | chpasswd
# RUN setcap-r `which i3status`
#RUN alias chromium="chromium --no-sandbox"

RUN sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1

ADD run.sh /usr/local/bin/run

ADD xsessionrc /home/dockerx/.xsessionrc
ADD profile /home/dockerx/.profile
ADD xsession /home/dockerx/.xsession
ADD bashrc /home/dockerx/.bashrc

ADD chromium /home/dockerx/bin/chromium
ADD xrdp.ini /etc/xrdp/
ADD i3config /home/dockerx/.i3/config
ADD start.sh /

CMD /start.sh

# for RDP
EXPOSE 3389
