#Run radio script
alias radio='$HOME/.bin/radio.sh'

# neofetch alias
alias neofetch="clear && neofetch"

# Git dotfiles command
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Alias for playing music with mpv
alias music='$HOME/.bin/music.sh '

# Alias for downloading video and playing with mpv
alias downplay='$HOME/.bin/downplay.sh '

# Alias for tlmgr perl script location
alias tlmgr='$TEXMFDIST/scripts/texlive/tlmgr.pl --usermode'

# Alias for opening mpv and chatterino for twitch channel
alias twitch='$HOME/.bin/twitch.sh '

# Alias for taking a sceenshot with gscreenshot
alias screenshot='gscreenshot -sf $HOME/Bilete/$(date +"%Y-%m-%d_%T.png") '

# Aliases for exit
alias :q='exit'
alias q='exit'

alias c='clear'

alias hdmi='xrandr --auto --output eDP1 --left-of HDMI1'

alias sxmo='ssh user@172.16.42.1'
