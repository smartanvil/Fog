#!/bin/sh
geth --datadir ./devdata   --nodiscover --mine --minerthreads 1 --maxpeers 0 --verbosity 3 --unlock "1" --password ./passwordfile  --rpcapi eth,web3,net,admin --rpc --testnet
