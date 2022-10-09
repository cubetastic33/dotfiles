#!/usr/bin/fish

if playerctl metadata title &> /dev/null
    playerctl metadata --format "Now playing: {{ title }}"
end
