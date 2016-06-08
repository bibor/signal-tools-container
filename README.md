# signal tools


## Summary 
"signal tools" aims to provide a Docker container with the most importand lab tools for working with signals of any kind, including recording and processing.

## Tools
* rf
	* gnuradio
		* gr-baz
	* rtl-sdr
	* gr-osmocom
	* hackrf
	* bladerf
	* UHD
	* gqrx
* Networking
	* Wireshark
* misc
	* vim
	* scipy
The container is based on Ubuntu 16.04

## Getting started

### Building the Container
To create the Docker container execute the `./generate.sh` script. it will build a Container named "signal tools".

### Running the Container
To execute the Container run
	./run.sh
You will get a bash shell in the container
The normal `run.sh` runs an unprivileged container, with acces to Xorg and sound but not to USB. If you want to access an UBS device like an SDR or Locic Analyzer you have to run
	./run-priv-usb.sh
This will run a **privileged** container with acces to **ALL** your usb devices. So be carefull, because the root user in the container is virtually root outside the container! To mitigate this Problems you can apply an apparmor profile to the container (see the `run-priv-usb.sh` script).

If you want to attach to the running container run
	docker attach signal

It would be a wa better idea to pass the device with the `--device=<dev>` option but i didn't get it work yet.

## Credits
Thanks to Marcus D. Leech who wrote the gnuradio install script, which this container is based on.
