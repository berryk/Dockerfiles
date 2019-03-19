FROM debian:jessie

RUN apt-get update

RUN apt-get install -yq curl sudo openssh-server git

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN useradd -u 1000 --create-home berryk
RUN usermod -aG sudo berryk

WORKDIR /home/berryk
#RUN rm -rf /opt/yarn && rm -f /usr/local/bin/yarn && rm -f /usr/local/bin/yarnpkg
RUN npm install -g yarn
USER berryk
RUN git clone --depth 1 https://github.com/theia-ide/theia && \
    cd theia && \
    yarn
EXPOSE 3000
WORKDIR /home/berryk/theia/examples/browser
ENV SHELL /bin/bash
CMD yarn run start --hostname 0.0.0.0
