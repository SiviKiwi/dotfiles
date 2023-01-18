import subprocess
import socket
import json
import re

from libqtile import bar, widget
from libqtile.log_utils import logger
from datetime import date
from libqtile.widget import base

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


class MPVNowPlaying(base.InLoopPollText):
    def __init__(self, socket_path, **config):
        super().__init__(**config)
        self.add_defaults(MPVNowPlaying.defaults)
        self.socket_path = socket_path

        self.__prev_song = ""

    def poll(self):
        currently_playing_song = ""

        s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)

        try:
            s.connect(self.socket_path)

            s.send('{ "command": ["get_property", "media-title"] }\n'.encode('utf-8'))

            response = s.recv(1024)

            # Parse the response to extract the currently playing song
            try:
                response_json = json.loads(response)
            except json.decoder.JSONDecodeError:
                response_json = ""

            if "data" in response_json:
                song = re.sub(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}", "", response_json["data"]) + '|'
                if song != self.__prev_song:
                    currently_playing_song = song
                    self.__prev_song = song
            s.close()
        except (ConnectionRefusedError, FileNotFoundError):
            pass
        return currently_playing_song


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
            MPVNowPlaying(
                socket_path='/tmp/mpv-socket',
                update_interval=5,
                foreground=foreground,
                font=font,
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
                format=f'| %a %d-%m-%Y | Week %W | %H:%M |',
                foreground=foreground,
                font=font,
                ),
            widget.Battery(
                format='{char} {percent:2.0%}',
                foreground=foreground,
                font=font,
                ),
            ], 34, opacity=1)
