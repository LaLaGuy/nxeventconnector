#! /bin/sh
/usr/bin/nxeventconnector $@
unset nxeventconnector_alive
nxeventconnector_alive=`ps -a | grep -F "nxeventconnector" | grep -v "grep -F "`
while [ -n "$nxeventconnector_alive" ]
do
sleep 5s
nxeventconnector_alive=`ps -a | grep -F "nxeventconnector" | grep -v "grep -F "`
echo "$nxeventconnector_alive" >> /root/log.log
done
unset nxeventconnector_alive
