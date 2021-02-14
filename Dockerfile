FROM steamcmd/steamcmd:ubuntu-18

RUN apt-get update && \
  apt-get -y install perl-modules curl lsof libc6-i386 lib32gcc1 bzip2 && \
  useradd -ms /bin/bash steam

RUN steamcmd +login anonymous +force_install_dir /valheim +app_update 896660 +quit

WORKDIR /valheim

ENV VH_SERVER_NAME="MyServerName"
ENV VH_SERVER_PORT="2456"
ENV VH_WORLD_NAME="Dedicated"
ENV VH_SERVER_PASSWORD="CHANGEME"

COPY files/start_server.sh start_server.sh

ENTRYPOINT [ "./start_server.sh" ]