FROM ubuntu:14.04
#MAINTAINER Sven Hartmann <sid@sh87.net>
MAINTAINER Davor Serfez <dserfez@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-mark hold initscripts udev plymouth mountall
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get dist-upgrade -y --force-yes \
    && apt-get install -y --force-yes --no-install-recommends supervisor \
        net-tools \
        lxde-core lxde-icon-theme x11vnc xvfb screen openbox \
        wget \
        firefox links2 curl postal iputils-tracepath \
	htop bmon vim \
	lxterminal \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/*
    
ADD startup.sh /
ADD supervisord.conf /
ADD pipework /usr/sbin/
EXPOSE 5900
WORKDIR /
ENTRYPOINT ["/startup.sh"]
