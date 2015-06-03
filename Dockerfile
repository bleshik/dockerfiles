FROM ubuntu:14.10
MAINTAINER Alexey Balchunas <bleshik@gmail.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install openjdk-8-jre wget curl
RUN wget http://www.scala-lang.org/files/archive/scala-2.11.5.deb && dpkg -i scala-2.11.5.deb
RUN wget https://dl.bintray.com/sbt/debian/sbt-0.13.7.deb && dpkg -i sbt-0.13.7.deb
RUN (echo '#!/bin/sh'; echo 'exec java ${JAVA_OPTS} ${SBT_OPTS} -jar /usr/share/sbt-launcher-packaging/bin/sbt-launch.jar "$@"') > /usr/bin/sbt
RUN sbt help
