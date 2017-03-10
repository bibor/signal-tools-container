#!/bin/bash
# run script
# currently ALL usb devices are passtroughed, because of provlems with the --device option
# you may want to adjust the memory

#	--device=/dev/<device>

docker run -it \
       --net bridge \
       --cpuset-cpus 0 \
       --memory 4096mb \
       --name signals-usb-container \
       -v /dev/bus/usb/:/dev/bus/usb/ \
       --privileged \
       --security-opt "apparmor=docker-signal-tools-hackrf" \
	     signal-tools-image
