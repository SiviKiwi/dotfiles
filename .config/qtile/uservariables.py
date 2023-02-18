import os

class uservariables:
    DEVICE = os.environ['DEVICE']
    TERM='alacritty'
    BROWSER='firefox'
    EDITOR='nvim'

    # Bar settings
    FONT='JetBrains Mono'
    FONTSIZE = 12
    BARSIZE = 36



    # Colors
    COLORS={
        'GRAY':'282a35',
        'WHITE':'e6e6e6',
        'PINK':'f2357b',
        'TEAL':'58f8ff',
    }

    ALIASES={
        'radio':f'{TERM} -e $HOME/.bin/radio.sh',
        'screenshot':'maim -s $HOME/Bilete/Skjermdump/$(date +"%Y-%m-%d_%T.png")',
        'profile':'firefox --new-window -P default',
        'q':'shutdown now',
        'r':'reboot',
    }

if  uservariables.DEVICE == "DESKTOP":
    uservariables.FONTSIZE = 12
    uservariables.BARSIZE = 15

elif uservariables.DEVICE == "LAPTOP":
    uservariables.FONTSIZE = 12
    uservariables.BARSIZE = 36
