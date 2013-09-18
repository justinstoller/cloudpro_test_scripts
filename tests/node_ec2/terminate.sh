#!/bin/sh
 
if [ "$#" -ne 1 ]; then
  echo "usage: `basename $0` EC2_hostname"
  exit 1
fi
 
puppet node_aws terminate \
  "$1"
