#!/bin/bash

exec nitrogen --restore &
exec alacritty -t radio -e /home/sivert/.bin/radio.sh &

exec thunderbird &
exec birdtray &
