#Run radio script
alias radio='$HOME/.bin/radio.sh'

#Add autocompletion for radio
complete -W "--lain --darksynth --thanatos --lofi --va11hall-a --50s -la -d -t -lo -v -5" radio

# neofetch alias
alias neofetch="clear && neofetch"

# Git dotfiles command
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Alias for playing music with mpv
alias music='$HOME/.bin/music.sh '

# Alias for downloading video and playing with mpv
alias downplay='$HOME/.bin/downplay.sh '
