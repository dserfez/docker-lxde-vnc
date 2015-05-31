#!/bin/bash
/usr/sbin/pipework --wait -i eth0
mkdir /var/run/sshd
if [ ! -f /root/.vnc/passwd ]
then
mkdir /root/.vnc
x11vnc -storepasswd $passwd /root/.vnc/passwd
fi
/usr/bin/supervisord -c /supervisord.conf

while [ 1 ]; do
    /bin/bash
done
