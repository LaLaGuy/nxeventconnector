FROM quay.io/centos/centos:stream8
RUN yum update -y && yum install -y epel-release procps && yum install -y screen
RUN curl https://docs.nexthink.com/integrations/840925474/nxeventconnector-1.4.0-1.el7.noarch.rpm -o ~/nxeventconnector-1.4.0-1.el7.noarch.rpm
RUN screen -mdS "nxinstall" bash -c "yum install -y ~/nxeventconnector*";sleep 20s;screen -S "nxinstall" -X stuff "1";sleep 10s
COPY ./stay_alive.sh /root/
RUN chmod 700 /root/stay_alive.sh
ENTRYPOINT ["/root/stay_alive.sh"]