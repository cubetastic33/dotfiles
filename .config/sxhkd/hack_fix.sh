#!/bin/sh

eval "$(xdotool getmouselocation --shell)"
xdotool mousemove 0 5
if [ "$1" = "send" ]; then
	bspc node -d "$2"
elif [ "$1" = "follow" ]; then
	bspc node -d "$2" -f
else
	bspc desktop -f "$2"
fi
xdotool mousemove --screen $SCREEN $X $Y
