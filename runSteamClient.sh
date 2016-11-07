#!/bin/bash
docker run -it --rm \
    --privileged \
    --net=host \
    --name=SteamClient \
    --device /dev/snd \
    --device /dev/input/mice \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /home/shaun/.Xauthority:/home/steam/.Xauthority \
    steam-client
