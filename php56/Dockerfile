FROM php:5.6-fpm

MAINTAINER Pedro Pereira <pedromdspereira.93@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD ./installer.sh /installer.sh

RUN chmod +x /*.sh

RUN bash /installer.sh

EXPOSE 80 443
