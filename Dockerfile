#signal testbench
#todo:
#	pulling the gr-install script from own signed repo
#	usefull bashrc
#	plugdev group?
#	sigrok


FROM ubuntu:16.04

MAINTAINER bibor@bastelsuse.org

RUN apt-get update && apt-get dist-upgrade -yf && apt-get clean && apt-get autoremove                
RUN apt-get install -y sudo git subversion axel wget zip unzip cmake build-essential #for building gnuradio
RUN export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -qq -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" \
	vim wireshark  wireshark python-scipy gqrx-sdr software-properties-common xterm #common tools

##### add "signals" user #####

RUN useradd -m signals && echo "signals:signals" | chpasswd && adduser signals sudo &&\
	usermod -a -G video signals

##### build GNURadio #####
RUN mkdir -p /src/gnuradio 
WORKDIR /src/gnuradio

RUN axel http://www.sbrac.org/files/build-gnuradio && chmod a+x ./build-gnuradio && printf "y\ny\ny\n    y\n" | ./build-gnuradio -ja
RUN echo "export PYTHONPATH=/usr/local/lib/python2.7/dist-packages" > ~/.bashrc


##### build gr-baz #####
WORKDIR /src/
RUN git clone https://github.com/balint256/gr-baz.git && mkdir -p ./gr-baz/build
WORKDIR /src/gr-baz/build
RUN cmake .. && make && sudo make install && sudo  ldconfig

#env and entry
USER signals 
WORKDIR /home/signals/
ENTRYPOINT      ["/bin/bash"]
