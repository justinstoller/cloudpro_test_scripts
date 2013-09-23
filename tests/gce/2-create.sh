#!/bin/bash
if [ $# -lt 1 ]; then
    cat <<EOF
In the second test we create a new instance for you; this is pretty simple,
but you do need to identify the project you will be working with on the
command line.  Everything else is provided for you.

The created node will be named with a generated temporary name including the
process ID and hostname; this ensures that it will be reasonably likely to be
unique in the event multiple people run tests at once.
EOF
    exit 1
fi

name="$(echo "test-host-$(hostname)-$$" | sed -e 's/\./-/g')"
echo "generated hostname is '${name}' with account gcetest"

exec puppet node_gce create --project "$1" "${name}" \
    n1-standard-1 --image debian-7-wheezy-v20130816  \
    --login gcetest
