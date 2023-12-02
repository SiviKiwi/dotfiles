from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile.log_utils import logger

from groups import groups
from uservariables import uservariables

import re
import subprocess
import os

BROWSER = uservariables.BROWSER
TERM = uservariables.TERM
EDITOR = uservariables.EDITOR
ALIASES = uservariables.ALIASES

def unfloat(q):
    windows = q.current_group.windows.copy()
    for window in windows:
        window.floating = False


def move_all(q, i):
    windows = q.current_group.windows.copy()
    for window in windows:
        window.togroup(i.name, switch_group=False)
    q.groups[int(i.name) - 1].cmd_toscreen()

def open_browser(q):
    def open_link(user_input):
        regexp = re.compile(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-&?=%.]+')
        if regexp.search(user_input):
            q.spawn(f'{BROWSER} --new-window {user_input}')
        elif len(user_input) > 0:
            q.spawn(f'{BROWSER} --new-window duckduckgo.com/?q={"+".join(user_input.split(" "))}')
        else:
            q.spawn(f'{BROWSER} --new-window')


    widgets = q.current_screen.top.widgets
    prompt = next(w for w in widgets if w.name == 'prompt')
    prompt.start_input(BROWSER, open_link, allow_empty_input=True)

def open_mpv(q):
    q.spawn('/home/sivert/.bin/open_mpv.sh')


mod = 'mod4'
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.swap_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.swap_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "space", lazy.layout.flip()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "k", lazy.layout.grow(),
        desc="Grow window to the left"),
    Key([mod, "control"], "j", lazy.layout.shrink(),
        desc="Grow window to the right"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "u", lazy.function(unfloat), desc="Unfloat window"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),

    # Toggle between different screens
    Key([mod], "Tab", lazy.next_screen(), desc="Toggle between screens"),
    # Kill the focused window
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    # Qtile commands
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(aliases=ALIASES),
        desc="Spawn a command using a prompt widget"),

    # Program shortcuts
    Key([mod], "Return", lazy.spawn(TERM), desc="Launch terminal"),
    # Key([mod], "b", lazy.spawn(BROWSER), desc="Launch web browser"),
    Key([mod], "b", lazy.function(open_browser), desc="Launch web browser"),
    Key([mod], "s", lazy.spawn("steam"), desc="Launch Steam"),
    Key([mod], "e", lazy.spawn("emacsclient -c -a 'emacs'"), desc="Launch Doom Emacs"),
    Key([mod], "g" ,lazy.spawn("lutris lutris:rungame/battlenet"), desc="Launch BattelNet"),
    Key([mod], "m", lazy.function(open_mpv), desc="Open clipboard in mpv"),
]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + ctrl + shift + letter of group = switch to & move ALL windows to group
        Key([mod, "control", "shift"], i.name, lazy.function(move_all, i),
            desc="Switch to & move all windows to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False),
            desc="Switch to & move focused window to group {}".format(i.name)),
    ])
