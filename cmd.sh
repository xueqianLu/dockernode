#!/bin/bash
source env.sh
nodedir=$BASEDIR/fullsync
imagetag=hpb-project/ghpb:latest
PARAM=$@ 
docker run -it --privileged=true  --net=host --cpuset-cpus=$CPUS --rm -v $nodedir:/root/node/ --name ghpbinit $imagetag $PARAM

