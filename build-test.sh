#!/bin/bash

mkdir build/ -p
cd build/ 
wget -O- get.pharo.org/60+vmT | bash
./pharo-ui Pharo eval --save "  Metacello new baseline: 'Fog'; repository: 'github://sbragagnolo/Fog/src'; load. "
cd .. 
cd scripts
./dev.sh &
sleep 5
cd ..
cd build
./pharo Pharo.image test --junit-xml-output "Fog.*"
killall geth


