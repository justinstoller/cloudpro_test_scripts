#!/bin/bash
if [ $# -lt 1 ]; then
    cat <<EOF
In the third test we list instances.  Again, you need to identify the project
you will be working with on the command line.  Everything else is provided for you.
EOF
    exit 1
fi

exec puppet node_gce list --project "$1"
