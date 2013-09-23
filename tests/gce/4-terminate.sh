#!/bin/bash
if [ $# -lt 2 ]; then
    cat <<EOF
In the fourth test we delete the instance we generated.

You need to identify the project you will be working with, and
the name of the node as generated in the second test.

$(basename "$0") <project> <instance>
EOF
    exit 1
fi

exec puppet node_gce delete --project "$1" "$2"
