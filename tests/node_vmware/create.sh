#!/bin/sh
if [ "$#" -ne 1 ]; then
  echo "usage: `basename $0` name"
  exit 1
fi
set -x

# Delivery/Quality Assurance/Templates/vCloud/centos-6-i386
# Delivery/Quality Assurance/Templates/vCloud/centos-6-x86_64
#  --template=/Datacenters/saleseng/vm/ubuntu1204 \
#  --template='/Datacenters/pdx_office/Delivery/Quality\ Assurance/Templates/vCloud/centos-6-i386' \

puppet node_vmware create \
  --vmname="$1" \
  --template=/Datacenters/saleseng/vm/ubuntu1204 \
  --wait-for-boot
