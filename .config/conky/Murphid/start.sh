#!/bin/bash

killall conky
sleep 2s
		
conky -c $HOME/.config/conky/Murphid/Murphid.conf &> /dev/null &
