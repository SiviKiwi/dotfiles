class uservariables:
    TERM='alacritty'
    BROWSER='firefox'
    EDITOR='nvim'

    FONT='JetBrains Mono'


    # Colors
    COLORS={
            'GRAY':'282a35',
            'WHITE':'e6e6e6',
            'PINK':'f2357b',
            'TEAL':'58f8ff',
            }

    ALIASES={
            'radio':f'{TERM} -e $HOME/.bin/radio.sh',
            'screenshot':'gscreenshot -sf $HOME/Bilete/Skjermdump/$(date +"%Y-%m-%d_%T.png")',
            'profile':'firefox --new-window -P default',
            }


