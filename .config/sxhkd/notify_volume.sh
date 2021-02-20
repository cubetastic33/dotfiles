#!/bin/sh
volume=`pactl list sinks | awk '/^\s*Volume: / {gsub("%","");print $5; exit}'`
muted=`pactl list sinks | awk '/^\s*Mute: / {if($2=="yes"){print "!"}; exit}'`
#notify-send "Volume set to $volume" -t 1500
echo $volume$muted > xobvolpipe
