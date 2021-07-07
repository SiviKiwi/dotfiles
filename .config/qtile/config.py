import os

from libqtile import layout, hook
from libqtile.config import Group, Match

from keys import keys
from groups import groups
from screens import screens

layouts = [
        layout.MonadTall(),
]

widget_defaults = dict(
        font='Jetbrains mono',
        fontsize=12,
        padding=3,
)
extension_defaults = widget_defaults.copy()

@hook.subscribe.startup
def autostart():
    os.system('nitrogen --restore')


dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

wmname = 'qtile'
