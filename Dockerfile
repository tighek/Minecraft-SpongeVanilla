#
# Dockerfile to build SpongeVanilla
#

FROM java:8
MAINTAINER Tighe Kuykendall, http://github.com/TigheK

RUN mkdir /srv/minecraft

ADD ./eula.txt /srv/
RUN cp /srv/eula.txt /srv/minecraft/

ADD ./start_sponge /srv/
RUN chmod 775 /srv/start_sponge

ADD https://repo.spongepowered.org/maven/org/spongepowered/spongevanilla/1.12.2-7.1.0-BETA-11/spongevanilla-1.12.2-7.1.0-BETA-11.jar /srv/spongevanilla.jar
RUN ln -s /srv/spongevanilla.jar /srv/minecraft/spongevanilla.jar

RUN touch /srv/spongevanilla_1.12.2-7.1.0-BETA-11

RUN chown -R minecraft:miencraft /srv

WORKDIR /srv/minecraft
VOLUME ["/srv/minecraft"]

EXPOSE 25565
EXPOSE 25565/udp

CMD [""]

ENTRYPOINT /srv/start_sponge 
