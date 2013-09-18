#!/bin/sh
if [ "$#" -ne 3 ]; then
  echo "usage: `basename $0` ami image_size ec2_keyname"
  exit 1
fi
set -x

puppet node_aws create \
  --image "$1" \
  --type "$2" \
  --keyname "$3" \
  --region us-west-2
