from libqtile import bar, widget
from datetime import date

from uservariables import uservariables

foreground = uservariables.PINK
border = uservariables.TEAL

main_bar = bar.Bar(
        [
            widget.GroupBox(
                highlight_method='text',
                disable_drag=True,
                use_mouse_wheel=False,
                this_current_screen_border=border,
                this_screen_border=border,
                foreground=foreground,
                active=foreground,
                inactive=foreground,
                ),

            widget.Prompt(
                foreground=foreground,
                ),
            #widget.WindowName(),
            widget.Spacer(
                lenght=bar.STRETCH
                ),
            widget.PulseVolume(
                foreground=foreground,
                ),
            widget.Clock(
                format=f'| %a %d-%m-%Y | Week {date.today().isocalendar()[1]} | %H:%M',
                foreground=foreground,
                ),
            ], 24, opacity=1)
