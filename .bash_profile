#
# ~/.bash_profile

export DEVICE=DESKTOP

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx


# Autoscale therminal font
export WINIT_X11_SCALE_FACTOR=1
export SDL_VIDEO_FULLSCREEN_HEAD=1
export XDG_CONFIG_HOME=1
