#! /bin/sh
/usr/bin/nxeventconnector $@
trap "kill `ps -e  | grep nxeventconnector | awk '{print $1}'`; exit" SIGTERM
unset nxeventconnector_alive
nxeventconnector_alive=`ps -e | grep -F "nxeventconnector"`
while [ -n "$nxeventconnector_alive" ]
do
sleep 5s
nxeventconnector_alive=`ps -e | grep -F "nxeventconnector"`
echo "$nxeventconnector_alive" >> /root/log.log
done
unset nxeventconnector_alive