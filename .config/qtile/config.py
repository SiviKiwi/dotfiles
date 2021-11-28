import os
import subprocess

from libqtile import layout, hook
from libqtile.config import Group, Match
from libqtile.log_utils import logger
from libqtile.lazy import lazy

from keys import keys
from groups import groups
from screens import screens



layouts = [
        layout.MonadTall(border_width=1, single_border_width=0),
        #layout.Columns(border_focus_stack='#d75f5f'),
        layout.Floating(),

]

widget_defaults = dict(
        font='Jetbrains mono',
        fontsize=12,
        padding=3,
)
extension_defaults = widget_defaults.copy()

@hook.subscribe.startup_once
def autostart():
    subprocess.call('/home/sivert/.config/qtile/startup.sh')


dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    # *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(title='Picture in picture'), # Freetube
    Match(wm_class='battle.net.exe'), # Battle.net
    Match(wm_class='display'), # Imagemagic display
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = 'LG3D'
