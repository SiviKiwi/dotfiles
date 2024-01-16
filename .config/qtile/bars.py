import subprocess
from libqtile import bar, widget
from libqtile.log_utils import logger
from datetime import date
from custom_widget import *

from uservariables import uservariables

colors = uservariables.COLORS

foreground = colors['PINK']
border = colors['TEAL']

font = uservariables.FONT
term = uservariables.TERM

def poop():
    subprocess.Popen("xvkbd -xsendevent -text \\[U0001F4A9]".split())

def bashtop():
    subprocess.Popen(f'{term} -e /bin/bashtop'.split())

widgets = []
widgets.append(widget.GroupBox(
                highlight_method='line',
                disable_drag=True,
                use_mouse_wheel=False,
                this_current_screen_border=border,
                this_screen_border=foreground,
                foreground=foreground,
                active=foreground,
                inactive=colors['GRAY'],
                font=font,
                ))
widgets.append(widget.Prompt(
                foreground=foreground,
                font=font,
                ))
widgets.append(widget.Spacer(
                lenght=bar.STRETCH
                ))
widgets.append(MPVNowPlaying(
                socket_path='/tmp/mpv-socket',
                update_interval=5,
                foreground=foreground,
                font=font,
                ))
widgets.append(widget.PulseVolume(
                foreground=foreground,
                font=font,
                ))
widgets.append(widget.TextBox(
                text='|',
                foreground=foreground,
                font=font,
                ))
widgets.append(widget.CPUGraph(
                graph_color=foreground+'.3',
                fill_color=foreground,
                line_width=1,
                border_width=0,
                mouse_callbacks={'Button1':bashtop},
                ))
widgets.append(widget.CPU(
                format='{load_percent}%',
                foreground=foreground,
                font=font,
                mouse_callbacks={'Button1':bashtop},
                ))
if uservariables.DEVICE == "DESKTOP":
    widgets.append(widget.Clock(
                format='| %a %d-%m-%y | week %W | %H:%M ',
                foreground=foreground,
                font=font,
                ))
elif uservariables.DEVICE == "LAPTOP":
    widgets.append(widget.Clock(
                format='| %a %d-%m-%y | week %W | %H:%M |',
                foreground=foreground,
                font=font,
                ))
    widgets.append(widget.Battery(
                format='{char} {percent:2.0%}',
                foreground=foreground,
                font=font,
                ))
main_bar = bar.Bar(widgets, uservariables.BARSIZE, opacity=1)
