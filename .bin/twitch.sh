#! /bin/bash

link="$1"

twitchName=${link##*/}

mpv $link & chatterino -c $twitchName
