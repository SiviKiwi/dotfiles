#!/bin/bash

exec picom &
exec nitrogen --restore &
exec alacritty -t radio -e /home/sivert/.bin/radio.sh &

exec qbittorrent &
exec thunderbird &
exec discord &

exec emacs --daemon &
