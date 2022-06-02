#!/bin/bash

exec picom &
exec nitrogen --restore &
#exec alacritty -t radio -e /home/sivert/.bin/radio.sh &
exec thunderbird &

# Enable mouse hide on inactivity
unclutter -idle 2 -root &

#exec qbittorrent &
exec thunderbird &
#exec discord &

exec emacs --daemon &
