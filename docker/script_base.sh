#!/bin/bash
cd /usr/src/
git clone -b 18 https://gerrit.asterisk.org/asterisk asterisk-18
cd asterisk-18/
contrib/scripts/get_mp3_source.sh
contrib/scripts/install_prereq install 
./configure
make menuselect
make -j2 
make install
make samples
make config
ldconfig
adduser --system --group --home /var/lib/asterisk --no-create-home --gecos "Asterisk PBX" asterisk
sed -i 's/#AST_USER="asterisk"/AST_USER="asterisk"/' /etc/default/asterisk
sed -i 's/#AST_GROUP="asterisk"/AST_GROUP="asterisk"/' /etc/default/asterisk
usermod -a -G dialout,audio asterisk
chown -R asterisk: /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
chmod -R 750 /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
