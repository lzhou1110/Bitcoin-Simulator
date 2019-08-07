FROM ubuntu:16.04

RUN apt-get update

# Minimum Requirements
RUN apt-get install -y gcc g++ python

# MPI based distribution
RUN apt-get install -y openmpi-bin openmpi-common openmpi-doc libopenmpi-dev

# Installation packages required
RUN apt-get install -y wget git bzip2

# Install NS-3 source
WORKDIR /root/workspace
RUN wget http://www.nsnam.org/release/ns-allinone-3.25.tar.bz2
RUN tar -xf ns-allinone-3.25.tar.bz2

# clone rapidjson
WORKDIR /root
RUN git clone https://github.com/Tencent/rapidjson.git

# Copy source code
WORKDIR /root/Bitcoin-Simulator
COPY . .

# Prepare
WORKDIR /root
RUN cd Bitcoin-Simulator && sh copy-to-ns3.sh

RUN rm workspace/ns-allinone-3.25/ns-3.25/src/applications/wscript
RUN rm workspace/ns-allinone-3.25/ns-3.25/src/internet/wscript

COPY ./modifications/applications/wscript workspace/ns-allinone-3.25/ns-3.25/src/applications/wscript
COPY ./modifications/internet/wscript workspace/ns-allinone-3.25/ns-3.25/src/internet/wscript

RUN cd workspace/ns-allinone-3.25/ns-3.25 && CXXFLAGS="-std=c++11" ./waf configure --build-profile=optimized --out=build/optimized --with-pybindgen=/home/bill/Desktop/workspace/ns-allinone-3.24/pybindgen-0.17.0.post41+ngd10fa60 --enable-mpi --enable-static

RUN cd workspace/ns-allinone-3.25/ns-3.25 && ./waf

WORKDIR workspace/ns-allinone-3.25/ns-3.25