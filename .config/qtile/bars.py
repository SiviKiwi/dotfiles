import subprocess

from libqtile import bar, widget
from datetime import date

def poop():
    subprocess.Popen("xvkbd -xsendevent -text \\[U0001F4A9]".split())

main_bar = bar.Bar(
        [
            widget.GroupBox(),
            widget.Prompt(),
            #widget.WindowName(),
            widget.Spacer(
                lenght=bar.STRETCH
                ),
            widget.TextBox(text='SHIT', mouse_callbacks={'Button1':poop }),
            widget.Spacer(
                lenght=bar.STRETCH
                ),
            widget.PulseVolume(),
            widget.CheckUpdates(
                display_format='Updates: {updates}',
                distro='Arch',
                colour_have_updates='990000',
                color_no_updates='007300',
                update_interval=1800,
                execute='alacritty -e sudo pacman -Syu'
                ),
            widget.Systray(),
            widget.Clock(format=f'| %a %d-%m-%Y | Week {date.today().isocalendar()[1]} | %H:%M |'),
            widget.Battery(format='{char} {percent:2.0%}')
        ], 24)
