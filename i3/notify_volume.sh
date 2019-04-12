#!/bin/bash
volume=`pactl list sinks | awk '/^\s*Volume: / {print $5; exit}'`
notify-send "Volume set to $volume" -t 1500