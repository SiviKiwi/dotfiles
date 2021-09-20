from libqtile import bar, widget
from datetime import date

main_bar = bar.Bar(
        [
            widget.GroupBox(),
            widget.Prompt(),
            #widget.WindowName(),
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
            widget.Clock(format='%d-%m-%Y %a %H:%M'),
            widget.TextBox(f'Week {date.today().isocalendar()[1]}')
        ], 24)
