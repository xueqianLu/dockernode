#!/bin/bash
source env.sh
nodedir=$BASEDIR/fullsync

docker run -it --privileged=true  --net=host --rm --cpuset-cpus=$CPUS -v $nodedir:/root/node/ --name ghpbinit $imagetag --datadir /root/node/data init /root/node/gensis.json
