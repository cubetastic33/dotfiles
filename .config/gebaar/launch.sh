#!/bin/bash

# Terminate already running gebaard instances
killall -q gebaard

# Wait until the processes have been shut down
while pgrep -u $UID -x gebaard >/dev/null; do sleep 1; done

# Launch gebaard
gebaard -b
