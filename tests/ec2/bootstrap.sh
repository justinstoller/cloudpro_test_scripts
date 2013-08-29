#!/bin/sh
if [ "$#" -ne 3 ]; then
  echo "usage: `basename $0` ami image_size ec2_keyname"
  exit 1
fi

BASE=`dirname $0`
PRIVKEY="${HOME}/.ssh/id_rsa"
PUBKEY="${HOME}/.ssh/id_rsa.pub"

set -x

puppet node_aws bootstrap \
  --region us-west-2 \
  --image "$1" \
  --type "$2" \
  --keyfile "$PRIVKEY" \
  --keyname "$3" \
  --login root
