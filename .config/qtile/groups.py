from libqtile.config import Group, Match
from libqtile import layout

groups = [Group(i) for i in "1234567"]

groups.append(Group('8', label='8', matches=[Match(wm_class='qbittorrent')]))
groups.append(Group('9', label='radio', layout='floating', matches=[Match(title='radio')]))
