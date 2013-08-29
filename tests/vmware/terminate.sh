#!/bin/sh
 
if [ "$#" -ne 1 ]; then
  echo "usage: `basename $0` vmware_path"
  exit 1
fi
 
puppet node_vmware terminate \
  "$1"
