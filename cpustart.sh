#!/bin/bash
source env.sh
nodedir=$BASEDIR/fullsync
rpcport=8545
peerport=30303
iperfport=30403
wsport=22000
nodename=$CONTAINER_NAME

docker stop $nodename
docker rm $nodename

docker run -itd --cpuset-cpus=$CPUS --ulimit nofile=20480:40960 --privileged=true --restart=always -v $nodedir:/root/node/ -p $rpcport:8545 -p $peerport:30303 -p $iperfport:30403 -p $wsport:22000 --network=host --name $nodename $imagename --datadir /root/node/data --networkid 100 --verbosity 3 --rpcvhosts '*' --rpc --rpcaddr 0.0.0.0 --rpcapi eth,hpb,web3,admin,txpool,debug,personal,net,miner,prometheus --ws --wsaddr 0.0.0.0 --wsapi eth,web3,hpb --wsorigins '*' --wsport 22000  --syncmode full  --critical.flag 0 --nodetype synnode console
