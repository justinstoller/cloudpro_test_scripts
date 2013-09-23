#!/bin/bash

if [ $# -lt 2 ]; then
    cat <<EOF
In this first test you will register your node_gce installation as a
"native applcation" with your GCE account and project -- which, in turn,
grants us the rights to manage GCE through the API on your behalf.

You will need access to the Google cloud console, and read/write access
to a project within, in order to proceed with this test.

To register your new native application, go to the cloud console here:

    https://cloud.google.com/console

Navigate as follows:

1. Enter the project where testing is to take place.
2. Select the `APIs & auth` section in the left navigation panel.
3. Select the `Registered apps` section that expands from that.
4. Hit the `REGISTER APP` button at the top of the screen.

Now, enter a name for your application -- the test itself is of no
importance in this process -- and select "Native" as the platform.

Hit Register, and then invoke this script again with two arguments,
the "CLIENT ID" and "CLIENT SECRET" values that you are presented with.

Once you do that we will generate a URL to visit to actually authorize
your account, and grant access to the API.  Follow the on-screen
instructions to complete the process.
EOF
    exit 1
fi

set -x
exec puppet node_gce register "$@"
