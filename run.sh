#!/bin/bash
# run script
# you may want to adjust the memory


docker run -it \
       --net bridge \
       --cpuset-cpus 0 \
       --memory 4096mb \
       --name signal-tools-container \
       -p 2222:22 \
       signal-tools-image
