#!/bin/sh

COMMAND="/usr/sbin/asterisk -T -W -U ${ASTERISK_USER} -p -vvvdddf"
exec ${COMMAND}
