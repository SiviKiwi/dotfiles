#! /bin/bash

help()
{
	echo "      Availiable channels: "
	echo "      -la | --lain"
	echo "      -d  | --darksynth"
	echo "      -t  | --thanatos"
	echo "      -lo | --lofi"

}

valid_input=false

case "$1" in
	--lain | -la)
		channel="https://lainon.life/radio/cyberia.ogg"
		name="Lain Cyberia"
		valid_input=true
		;;
	--darksynth | -d)
		channel="https://stream.nightride.fm/darksynth.m4a"
		name="Darksynth Radio"
		valid_input=true
		;;
	--thanatos | -t)
		channel="https://www.youtube.com/channel/UCmYTgpKxd-QOJCPDrmaXuqQ/live "
		name="Thanatos Retrowave"
		valid_input=true
		;;
	--lofi | -lo)
		channel="https://www.youtube.com/channel/UCSJ4gkVC6NrvII8umztf0Ow/live"
		name="Lofi Hip Hop Radio"
		valid_input=true
		;;
	--va11hall-a | -v)
		channel="https://www.youtube.com/playlist?list=PLQuOY1HVtJ__GGoVvMXuT9ezBouejgvTq"
		name="Va11 Hall-A Radio"
		valid_input=true
		;;
	--50s | -5)
		channel="http://0n-50s.radionetz.de/0n-50s.mp3"
		name="50s Radio"
		valid_input=true
		;;
	--help | -h)
		help
		;;
esac

if [ $# -eq 1 -a "$valid_input" = true ]
then

	clear
	neofetch
	echo -e "\033[1;33mCurrently Playing: \c\033[0m"
	echo -e "\033[0;35m$name\033[0m"
	mpv --no-video --msg-level=ffmpeg=no,ffmpeg/demuxer=no,lavf=no $channel 
	clear
	neofetch
else
	help
fi
