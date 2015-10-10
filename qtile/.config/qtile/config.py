from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

shift = "shift"
ctrl = "control"
alt = "mod1"
win = "mod4"
mod = "mod4"

keys = [

	# Qtile System Controls
	Key([ctrl, alt], "Delete", 
		lazy.shutdown()),
	Key([ctrl, alt], "r",
		lazy.restart()),

	# Set window style
	Key([alt], "s",
		lazy.group.setlayout('stack')),
	Key([alt], "d",
		lazy.group.setlayout('max')),
	Key([alt], "f",
		lazy.window.toggle_fullscreen()),

	# Close window
	Key([alt], "x",
		lazy.window.kill()),

	# Switch between windows on the same stack
	Key([alt], "h",
		lazy.layout.previous()),
	Key([alt], "l",
		lazy.layout.next()),
	Key([alt], "k",
		lazy.layout.down()),
	Key([alt], "j",
		lazy.layout.up()),

	# Switch between windows on the same screen
	Key([alt], "Left",
		lazy.layout.previous()),
	Key([alt], "Right",
		lazy.layout.next()),
	Key([alt], "Up",
		lazy.layout.down()),
	Key([alt], "Down",
		lazy.layout.up()),

	# Move windows on the stack
	Key([alt, shift], "h",
		lazy.layout.client_to_previous()),
	Key([alt, shift], "l",
		lazy.layout.client_to_next()),
	Key([alt, shift], "k",
		lazy.layout.shuffle_down()),
	Key([alt, shift], "j",
		lazy.layout.shuffle_up()),

	# Move windows on the screen
	Key([alt, shift], "Left",
		lazy.layout.client_to_previous()),
	Key([alt, shift], "Right",
		lazy.layout.client_to_next()),
	Key([alt, shift], "Up",
		lazy.layout.shuffle_down()),
	Key([alt, shift], "Down",
		lazy.layout.shuffle_up()),

	# Split and flip windows on the screen
	Key([alt], "space",
		lazy.layout.toggle_split()),
	Key([alt, shift], "space",
		lazy.layout.rotate()),

	# Dmenu quick commands
	Key([alt, shift], "Return",
		lazy.spawncmd()),
	Key([alt], "g",
		lazy.switchgroup()),

	# Spawn app shortucts
	Key([alt], "Return",
		lazy.spawn("gnome-terminal")),
	Key([alt], "BackSpace",
		lazy.spawn("urxvt")),
	Key([alt, shift], "d",
		lazy.spawn("dwb")),
	Key([alt, shift], "f",
		lazy.spawn("firefox")),
	Key([alt, shift], "g",
		lazy.spawn("google-chrome-stable")),
	Key([alt, shift], "p",
		lazy.spawn("gnome-control-center")),
	Key([alt, shift], "s",
		lazy.spawn("spotify")),
	Key([alt, shift], "n",
		lazy.spawn("nautilus")),
	
	# Enable audio buttons
    Key([], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB-")),

    # Also allow changing volume the old fashioned way.
    Key([mod], "equal", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([mod], "minus", lazy.spawn("amixer -c 0 -q set Master 2dB-")),

]

groups = [Group(i) for i in "1234567890"]

for i in groups:

    keys.append(
        Key([alt], i.name, lazy.group[i.name].toscreen())
    )

    keys.append(
        Key([alt, "shift"], i.name, lazy.window.togroup(i.name))
    )

layouts = [
    layout.Stack(num_stacks=2),
    layout.Max()
]

widget_defaults = dict(
    font='Arial',
    fontsize=16,
    padding=3,
)

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(active="#9393CC",
                                this_screen_border="#CC9393",
                                this_current_screen_border="#8DCBE2"),
                widget.Sep(padding=10),
                widget.Prompt(),
                widget.WindowName(),
                widget.Sep(padding=10),
                widget.CPUGraph(graph_color="#9393CC",
                                fill_color=["#9393CC", "#001111"]),
                widget.Sep(padding=10),
                widget.TextBox(text="Volume: ", foreground="#9393CC"),
                widget.Volume(foreground="#9393CC"),
                widget.Sep(padding=10),
                widget.TextBox(text="Battery: ", foreground="#8DCBE2"),
                widget.Battery(format="{percent:2.0%}  {char}", discharge_char="~", foreground="#8DCBE2"),
                widget.TextBox(text="Est Time Rem: ", foreground="#8DCBE2"),
                widget.Battery(format="{hour:d}:{min:02d}", foreground="#8DCBE2"),
                widget.Sep(padding=10),
                widget.Systray(),
                widget.Sep(padding=10),
                widget.Clock(format='%Y-%m-%d %a %I:%M %p', foreground="#9393CC"),
            ],
            30,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([alt], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([alt], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([alt], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating()
auto_fullscreen = True
wmname = "qtile"
