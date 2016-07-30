#
# Dockerfile to build SpongeVanilla on Ubuntu 16.04
#

FROM ubuntu:16.04
MAINTAINER Tighe Kuykendall, http://github.com/TigheK
RUN useradd -s /bin/bash -d /srv/minecraft -m minecraft
ADD ./eula.txt /srv/minecraft/

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
  apt-get install -y oracle-java8-installer && \
  apt-get clean

ADD https://repo.spongepowered.org/maven/org/spongepowered/spongevanilla/1.8.9-4.2.0-BETA-343/spongevanilla-1.8.9-4.2.0-BETA-343.jar /srv/minecraft/

RUN ln -s /srv/minecraft/spongevanilla-1.8.9-4.2.0-BETA-343.jar /srv/minecraft/spongevanilla.jar


RUN mkdir /srv/minecraft/custom
RUN touch /srv/minecraft/custom/banned-ips.json
RUN ln -s /srv/minecraft/custom/banned-ips.json /srv/minecraft/banned-ips.json
RUN touch /srv/minecraft/custom/banned-players.json
RUN ln -s /srv/minecraft/custom/banned-players.json /srv/minecraft/banned-players.json
RUN touch /srv/minecraft/custom/ops.json
RUN ln -s /srv/minecraft/custom/ops.json /srv/minecraft/ops.json
RUN touch /srv/minecraft/custom/server.properties
RUN ln -s /srv/minecraft/custom/server.properties /srv/minecraft/server.properties
RUN touch /srv/minecraft/custom/usercache.json
RUN ln -s /srv/minecraft/custom/usercache.json /srv/minecraft/usercache.json
RUN touch /srv/minecraft/custom/whitelist.json
RUN ln -s /srv/minecraft/custom/whitelist.json /srv/minecraft/whitelist.json
RUN mkdir /srv/minecraft/custom/world
RUN ln -s /srv/minecraft/custom/world /srv/minecraft/world

RUN chown -R minecraft:minecraft /srv/minecraft

WORKDIR /srv/minecraft
VOLUME ["/srv/minecraft"]

EXPOSE 25565
EXPOSE 25565/udp

USER minecraft

CMD [""]

ENTRYPOINT java -Xmx1024M -Xms1024M -jar /srv/minecraft/spongevanilla.jar 


