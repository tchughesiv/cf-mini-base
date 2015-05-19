# CF Mini Base
# version 0.1
FROM ubuntu:12.04.5
MAINTAINER Tommy Hughes <tchughesiv@gmail.com>

WORKDIR /root
ENV HOME /root
ENV INSTALLER_BRANCH v205

RUN apt-get update && apt-get -yq install curl sudo dnsmasq inetutils-ping rsyslog cron && sed -i 's/^mesg n/tty -s \&\& mesg n/g' /root/.profile && curl -s -k -B https://raw.githubusercontent.com/tchughesiv/cf_nise_installer/${INSTALLER_BRANCH}/scripts/install_ruby.sh > /root/install_ruby.sh && chmod u+x /root/*.sh && /root/install_ruby.sh
