#!/usr/bin/env bash

docker login

# Build the 2016 snapshot
cp topology/2016/bitcoin-topology-snapshot.cc src/applications/helper/bitcoin-topology-snapshot.cc
cp topology/2016/bitcoin-topology-snapshot.h src/applications/helper/bitcoin-topology-snapshot.h
docker build -t lzhou1110/bitcoin-simulator:2016 .
#docker push lzhou1110/bitcoin-simulator:2016
rm src/applications/helper/bitcoin-topology-snapshot.cc
rm src/applications/helper/bitcoin-topology-snapshot.h

## Build the 2019 snapshot
#cp topology/2019/bitcoin-topology-snapshot.cc src/applications/helper/bitcoin-topology-snapshot.cc
#cp topology/2019/bitcoin-topology-snapshot.h src/applications/helper/bitcoin-topology-snapshot.h
#docker build -t lzhou1110/bitcoin-simulator:2019 .
#docker push lzhou1110/bitcoin-simulator:2019
#rm src/applications/helper/bitcoin-topology-snapshot.cc
#rm src/applications/helper/bitcoin-topology-snapshot.h
#
## Build the optimal snapshot
#cp topology/optimal/bitcoin-topology-snapshot.cc src/applications/helper/bitcoin-topology-snapshot.cc
#cp topology/optimal/bitcoin-topology-snapshot.h src/applications/helper/bitcoin-topology-snapshot.h
#docker build -t lzhou1110/bitcoin-simulator:optimal .
#docker push lzhou1110/bitcoin-simulator:optimal
#rm src/applications/helper/bitcoin-topology-snapshot.cc
#rm src/applications/helper/bitcoin-topology-snapshot.h
