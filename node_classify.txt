#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "usage: `basename $0` certname group"
  exit 1
fi

/opt/puppet/bin/puppet node classify \
  --node-group="$2" \
  --enc-server=localhost \
  --enc-port=443 \
  --enc-ssl \
  --enc-auth-user="admin@puppetlabs.com" \
  --enc-auth-passwd="puppetlabs" \
  $1