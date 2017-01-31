#!/bin/sh

geth --datadir ./devdata           \
  --password ./passwordfile \
  account new
