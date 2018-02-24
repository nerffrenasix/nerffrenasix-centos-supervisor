FROM nerffrenasix/centos-httpd
MAINTAINER nerffren
RUN yum -y update
RUN yum -y install git
RUN yum -y install apache
RUN yum -y install sshd
RUN yum -y install python-setuptools -y
RUN easy_install supervisor
RUN git clone https://github.com/zokeber/supervisor-systemd.git ~/supervisor-systemd
RUN cp -vr ~/supervisor-systemd/etc/systemd/system/supervisord.service /etc/systemd/system/
RUN mkdir -p /var/log/supervisor
RUN alias supervisorctl="supervisorctl -c /etc/supervisor/supervisord.conf"
RUN systemctl enable supervisord.service


CMD ["systemctl","enable","httpd"]
