#!/bin/sh

geth --datadir ./devdata  --dev --nodiscover    \
  --mine --minerthreads 1 --maxpeers 0 --verbosity 3 \
  --unlock "0,1,2,3,4,5,6,7,8,9" --password ./passwordfile \
  --rpcapi eth,web3,net,admin --rpc 


