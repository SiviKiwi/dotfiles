import subprocess

from libqtile import bar, widget
from datetime import date

from uservariables import uservariables

colors = uservariables.COLORS

foreground = colors['PINK']
border = colors['TEAL']

font = uservariables.FONT
term = uservariables.TERM

def bashtop():
    subprocess.Popen(f'{term} -e /bin/bashtop'.split())

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
                font=font,
                ),

            widget.Prompt(
                foreground=foreground,
                font=font,
                ),
            #widget.WindowName(),
            widget.Spacer(
                lenght=bar.STRETCH
                ),
            widget.PulseVolume(
                foreground=foreground,
                font=font,
                ),
            widget.TextBox(
                text='|',
                foreground=foreground,
                font=font,
                ),
            widget.CPUGraph(
                graph_color=foreground+'.3',
                fill_color=foreground,
                line_width=1,
                border_width=0,
                mouse_callbacks={'Button1':bashtop},
                ),
            widget.CPU(
                format='{load_percent}%',
                foreground=foreground,
                font=font,
                mouse_callbacks={'Button1':bashtop},
                ),
            widget.Clock(
                format=f'| %a %d-%m-%Y | Week %W | %H:%M',
                foreground=foreground,
                font=font,
                ),
            ], 24, opacity=1)
