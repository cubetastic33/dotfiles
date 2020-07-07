#!/usr/bin/python

import gi
import pulsectl

gi.require_version("Playerctl", "2.0")

from gi.repository import Playerctl

manager = Playerctl.PlayerManager()

for name in manager.props.player_names:
    # Make sure spotify is running
    if name.name == "spotify":
        player = Playerctl.Player.new_from_name(name)
        artist = player.get_artist()
        title = player.get_title()
        if len(title) == 0:
            # If no song is playing
            break
        # Truncate the title if it's too long
        if len(title) > 25:
            title = title[:25] + "…"
        icon = "" if player.get_property("playback-status") == Playerctl.PlaybackStatus(0) else ""
        print(f"{artist}: {title}  {icon}")
        # Mute ads
        with pulsectl.Pulse('event-printer') as pulse:
            for inp in pulse.sink_input_list():
                if inp.proplist['application.name'] == 'Spotify':
                    pulse.mute(inp, artist == "" and title in ["Advertisement", "Spotify"])
