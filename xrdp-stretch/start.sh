#!/bin/bash

export PATH=$HOME/bin:$PATH

/home/berryk/dotfiles-master/install.sh
/etc/init.d/xrdp start

tail -f /var/log/xrdp-sesman.log
