FROM ubuntu:14.04
MAINTAINER Aaron Huslage <aaron.huslage@docker.com>

RUN apt-get update && apt-get install -y apache2 supervisor
ADD bin/consul-v0.1.0 /usr/local/bin/consul
ADD config/consul.d-web.json /etc/consul.d/web.json
ADD config/supervisor.d-supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD html/index.html /var/www/inmdex.html

EXPOSE 80
CMD ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisor.conf"]
