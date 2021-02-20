#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar, using default config location ~/.config/polybar/config
polybar time &
polybar right &
polybar left &

echo "Polybar launched..."
