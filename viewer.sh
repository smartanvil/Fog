#!/bin/sh
# some magic to find out the real location of this script dealing with symlinks
DIR=`readlink "$0"` || DIR="$0";
DIR=`dirname "$DIR"`;
cd "$DIR"
DIR=`pwd`
cd - > /dev/null 


if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters."
    echo " viewer [json|html] contract-address "
    exit 1
fi

if [ "$1" = "json" ]; then
    "$DIR"/files/pharo "$DIR"/files/Pharo st "$DIR"/json-viewer.st $2
    exit 0
fi

if [ "$1" = "html" ]; then
    "$DIR"/files/pharo "$DIR"/files/Pharo st "$DIR"/html-viewer.st $2
    exit 0
fi




echo " Ilegal export option $1 "
exit 1
