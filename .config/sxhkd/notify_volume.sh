#!/bin/sh
sink=`pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1`
volume=`pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $sink + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`
muted=`pactl list sinks | awk '/^\s*Mute: / {if($2=="yes"){print "!"}; exit}'`
#notify-send "Volume set to $volume" -t 1500
echo $volume$muted > xobvolpipe
