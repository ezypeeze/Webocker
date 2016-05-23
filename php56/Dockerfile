FROM ubuntu:14.04

MAINTAINER Pedro Pereira <pedromdspereira.93@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ADD installer.sh /installer.sh
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN chmod +x /*.sh

RUN ./installer.sh

EXPOSE 80
CMD ["/usr/bin/supervisord"]
