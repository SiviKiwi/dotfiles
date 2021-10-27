from libqtile.config import Group, Match
from libqtile import layout

groups = [Group(i) for i in "12345678"]

groups.append(Group('9', label='radio', layout='floating', matches=[Match(title='radio')]))
