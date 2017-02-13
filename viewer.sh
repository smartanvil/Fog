#!/bin/sh


if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters."
    echo " viewer [json|html] contract-address "
    exit 1
fi

if [ "$1" = "json" ]; then
    ./build/pharo ./build/Pharo st ../json-viewer.st $2
    exit 0
fi

if [ "$1" = "html" ]; then
    ./build/pharo ./build/Pharo st ../html-viewer.st $2
    exit 0
fi




echo " Ilegal export option $1 "
exit 1
