#!/usr/bin/fish

if playerctl metadata album &> /dev/null; and test -n (string trim (playerctl metadata album))
    # If the album name is available and not empty
    if playerctl metadata artist &> /dev/null; and test -n (string trim (playerctl metadata artist))
        # If the artist name is also available and not empty
        playerctl metadata --format "from {{ album }} by {{ artist }}"
    else
        # If only the album name is available
        playerctl metadata --format "from {{ album }}"
    end
else if playerctl metadata artist &> /dev/null; and test -n (string trim (playerctl metadata artist))
    # If only the artist name is available
    playerctl metadata --format "by {{ artist }}"
end
