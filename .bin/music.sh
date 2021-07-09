#! /bin/bash

# Plays link with mpv

clear

neofetch

# Get video title
title=`youtube-dl --no-warnings --skip-download -e $1`

echo -e "\033[1;33mCurrently Playing: \c\033[0m"
echo -e "\033[0;35m$title\033[0m"

# Play without video
mpv --shuffle --no-video --msg-level=ffmpeg=no,ffmpeg/demuxer=no,lavf=no "$1"
