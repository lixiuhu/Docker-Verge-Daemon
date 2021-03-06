# Dockerfile for Verge
# http://vergecurrency.com/
# https://bitcointalk.org/index.php?topic=1365894
# https://github.com/vergecurrency/verge

FROM ubuntu:latest

MAINTAINER Simon Medved <simon@medved.in>

RUN apt-get update 
RUN apt-get install -y software-properties-common 
RUN apt-get install -y python-software-properties 
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update 
RUN apt-get install -y libdb4.8-dev 
RUN apt-get install -y libdb4.8++-dev 
RUN apt-get install -y \
    build-essential \
    git \
    libboost-all-dev \
    libdb-dev \
    libtool \
    autotools-dev \
    automake \
    pkg-config \
    libssl-dev \
    libevent-dev \
    bsdmainutils \
    git \
    libboost-all-dev \
    libminiupnpc-dev \
    libqt5gui5 \
    libqt5core5a \
    libqt5dbus5 \
    qttools5-dev \
    qttools5-dev-tools \
    libprotobuf-dev \
    protobuf-compiler \
    libqrencode-dev \
    libssl-dev

RUN git clone https://github.com/vergecurrency/verge /coin/git

WORKDIR /coin/git/src

RUN ./autogen.sh && ./configure && make

RUN mv VERGEd /coin/VERGEd && rm -rf /coin/git

WORKDIR /coin
VOLUME ["/coin/home"]

ENV HOME /coin/home

ENTRYPOINT ["/coin/VERGEdaemon"]
#CMD ["/coin/dogedaemon"]

# P2P, RPC
EXPOSE 21102 20102
