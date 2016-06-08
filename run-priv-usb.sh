#!/bin/bash
# run script for creating a a container with the signal-tools 
# if you want o acces an usb device i.e. an SDR odr an Logic Analyzer you have to set $DEVICE  to the device name
# you may want to adjust the memory

#	--device=/dev/hackrf-one-1-1 \

docker run -it \
    --net host \
    --cpuset-cpus 0 \
    --memory 4096mb \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --device /dev/snd \
	--name signal-test-hackrf \
	-v /dev/bus/usb/:/dev/bus/usb/ \
	--privileged \
	--security-opt "apparmor=docker-signal-tools-hackrf" \
	signal-tools
