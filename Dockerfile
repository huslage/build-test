FROM ubuntu:14.04
MAINTAINER Aaron Huslage <aaron.huslage@docker.com>

RUN apt-get update && apt-get install -y apache2 supervisor unzip

ADD https://dl.bintray.com/mitchellh/consul/0.1.0_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/local/bin && unzip /tmp/consul.zip

ADD config/consul.d-web.json /etc/consul.d/web.json
ADD config/supervisor.d-supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD html/index.html /var/www/inmdex.html

EXPOSE 80 8400 8500 8600/udp
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisor.conf"]
