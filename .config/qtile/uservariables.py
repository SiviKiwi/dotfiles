

class uservariables:
    TERM='alacritty'
    BROWSER='firefox'
    EDITOR='nvim'

    ALIASES={
            'radio':f'{TERM} -e $HOME/.bin/radio.sh',
            'screenshot':'gscreenshot -sf $HOME/Bilete/$(date +"%Y-%m-%d_%T.png")'
            }

    # Colors
    PINK='f2357b'
    TEAL='58f8ff'
