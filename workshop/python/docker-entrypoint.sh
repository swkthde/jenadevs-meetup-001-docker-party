#!/bin/bash

# If any script fails then exit 1.
set -e

# Always own possibly mounted docker volumes (files on host).
chown -R root:root ${MY_VOL}

# Add templating steps if invoked with default command.
# TODO

# Execute defined arguments.
# This includes not default related args (e.g. `bash`).
exec "${@}"