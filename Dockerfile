FROM ubuntu:12.04
MAINTAINER Aaron Huslage <aaron.huslage@docker.com>

ENV VERSION 0.0.1

RUN apt-get update && apt-get install -y apache2
ADD index.html /var/www/index.html
RUN exit 1

CMD /usr/sbin/apache2ctl -D FOREGROUND
