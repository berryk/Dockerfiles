#!/bin/bash

export PATH=$HOME/bin:$PATH

/etc/init.d/xrdp start

tail -f /var/log/xrdp-sesman.log
