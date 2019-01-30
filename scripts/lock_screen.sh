#!/bin/bash

# Make a print screen
scrot /tmp/screen.png

# Blur it
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png

# Stop Spotify
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop

# Turn off the screen when locked. Use the blurred print screen as the background of lock.
i3lock -d -i /tmp/screen.png

# Remove the unnecessary pic.
rm /tmp/screen.png
