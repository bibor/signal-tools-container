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

This container is based on the phusion Ubuntu 16.04 base image.

## Getting started

### Building the Container
To create the Docker container execute the `./generate.sh` script. it will build a Container named "signal-tools-container".
In the build process all files from the `configs/home` directory will be stored in  `/home/signals` in the container. This will be handy, if you want to use your own config files.
Its importend that you store your ssh public key in `configs/ssh/authorized_keys` to access the running container.

### Running the Container
To execute the Container run

    ./run.sh
    
You will get a bash shell in the container
The normal `run.sh` runs an unprivileged container. If you want to access an USB device like an SDR or locic analyzer you have to run

    ./run-priv-usb.sh
    
This will run a **privileged** container with acces to **ALL** your usb devices. So be carefull, because the root user in the container is virtually root outside the container! To mitigate this problems you can apply an apparmor profile to the container (see the `run-priv-usb.sh` script).

It would be a wa better idea to pass the device with the `--device=<dev>` option but i didn't get it work yet.


### Accessing the Container
The container can be accessed over ssh with the pubkey in `configs/ssh/authorized_keys`. For GUI Applications like `gnuradio-companion` its possible to use x2go. You can find more infos at http://wiki.x2go.org/doku.php/doc:newtox2go .


### Misc
#### Existing Containers
If you want to run a existing container execute

	docker start signal-tools-container
    

#### User
The signals user password is "signals" and the user has sudo capabilities.

## Credits
Thanks to Marcus D. Leech who wrote the gnuradio install script, which this container is based on.
