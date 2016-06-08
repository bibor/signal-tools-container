#!/bin/bash
# run script for creating a a container with the signal-tools 
# you may want to adjust the memory


docker run -it \
    --net host \
    --cpuset-cpus 0 \
    --memory 4096mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --device /dev/snd \
	--name signals \
	signal-tools 
