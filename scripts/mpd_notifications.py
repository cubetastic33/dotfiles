#!/usr/bin/python

import subprocess
import os
import mutagen

from tendo import singleton
from mpd import MPDClient
import psutil

me = singleton.SingleInstance()

MUSIC_DIR = "/home/aravk/Music/Exemplary"
ALBUM_ART_LOCATION = "/tmp/mpd_album_art"

client = MPDClient()

while True:
    try:
        client.connect("localhost", 6600)
        while True:
            current_song = client.currentsong()
            client.idle()
            # Enable to let ncmpcpp handle notifications when it is running:
            # Check if ncmpcpp is running because if it is then a different program
            # will be called to show the notification
            # if "ncmpcpp" in (p.name() for p in psutil.process_iter()):
                # continue

            if client.currentsong()["file"] != current_song["file"]:
                current_song = client.currentsong()
                title = ""
                body = ""
                if current_song["title"]:
                    title = current_song["title"]
                else:
                    title = "MPD - changed song"
                if current_song["artist"] and current_song["album"]:
                    body = current_song["artist"] + " - " + current_song["album"]
                elif current_song["artist"] or current_song["album"]:
                    body = current_song["artist"] or current_song["album"]
                try:
                    # Get album art if available
                    song_file = mutagen.File(os.path.join(MUSIC_DIR, current_song["file"]))
                    with open(ALBUM_ART_LOCATION, "wb") as f:
                        if "APIC:" in song_file.tags:
                            f.write(song_file.tags["APIC:"].data)
                        else:
                            f.write(song_file.pictures[0].data)
                    subprocess.run(
                        ["notify-send", title, body, "-i", ALBUM_ART_LOCATION]
                    )
                except:
                    subprocess.run(["notify-send", title, body])
    except:
        client = MPDClient()
