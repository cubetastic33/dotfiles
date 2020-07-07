import subprocess
import os

from mpd import MPDClient
import mutagen

MUSIC_DIR = "/home/aravk/Music/Exemplary"
ALBUM_ART_LOCATION = "/tmp/mpd_album_art"

client = MPDClient()

client.connect("localhost", 6600)

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
