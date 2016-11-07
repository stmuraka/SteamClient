FROM ubuntu:xenial
MAINTAINER Shaun Murakami <stmuraka@us.ibm.com>

RUN apt-get -y update \
 && apt-get -y install \
        python-apt \
        xterm \
        gnome-terminal \
        konsole \
        zenity \
        curl \
        lib32gcc1 \
# Cleanup package files
 && apt-get autoremove  \
 && apt-get autoclean

WORKDIR /root/

ENV STEAM_CLIENT_DOWNLOAD="https://steamcdn-a.akamaihd.net/client/installer/steam.deb"
ADD ${STEAM_CLIENT_DOWNLOAD} /root/

RUN dpkg -i $(basename ${STEAM_CLIENT_DOWNLOAD})

RUN useradd -m steam
USER steam

CMD steam
