#
# ~/.bash_profile
#

export DEVICE=LAPTOP

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx
fi

# Autoscale therminal font
export WINIT_X11_SCALE_FACTOR=1
export SDL_VIDEO_FULLSCREEN_HEAD=1
export XDG_CONFIG_HOME=1
