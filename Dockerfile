# CF Mini Base
# version 0.4
FROM ubuntu:trusty
MAINTAINER Tommy Hughes <tchughesiv@gmail.com>

WORKDIR /root
ENV HOME /root
ENV INSTALLER_BRANCH v237

RUN apt-get update && apt-get -yq install supervisor libcgroup1 curl sudo dnsmasq net-tools inetutils-ping aufs-tools libdevmapper-dev libapparmor-dev rsyslog debootstrap cron && sed -i 's/^mesg n/tty -s \&\& mesg n/g' /root/.profile && curl -s -k -B https://raw.githubusercontent.com/tchughesiv/cf_nise_installer/${INSTALLER_BRANCH}/scripts/install_ruby.sh > /root/install_ruby.sh && chmod u+x /root/*.sh && /root/install_ruby.sh && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/log/supervisor