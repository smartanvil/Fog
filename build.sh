#!/bin/bash

mkdir build/ -p
cd build/ 
wget -O- get.pharo.org/60+vmT | bash
./pharo-ui Pharo eval --save "  Metacello new baseline: 'Fog'; repository: 'github://sbragagnolo/Fog/src'; load. "
cd .. 


