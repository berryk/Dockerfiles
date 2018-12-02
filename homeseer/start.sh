#!/bin/sh

# bug fix for case sensitive filesystems
# without this myhs.homeseer.com wont load icons
#ln -s /HomeSeer/html/images/homeseer /HomeSeer/html/images/HomeSeer
#

if [ -e /DO_INSTALL ]
then
	echo "HomeSeer (re)install/update required at container first run. Installing at /HomeSeer..."

        wget -O /homeseer.tgz "http://homeseer.com/updates3/hs3_linux_$HOMESEER_VERSION.tar.gz"
	tar -xzo -C / -f /homeseer.tgz
        rm -f /homeseer.tgz
	rm -f /DO_INSTALL

 else
        echo "HomeSeer already installed, not (re)installing/updating..."

fi

/etc/init.d/dbus start
/etc/init.d/avahi-daemon start
cd /HomeSeer
mono HSConsole.exe --log
exit 0
