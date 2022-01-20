#!/bin/bash

for i in $(seq 10); do
    if xsetwacom list devices | grep -q Wacom; then
        break
    fi
    sleep 1
done

list=$(xsetwacom list devices)
stylus=$(echo "${list}" | awk '/stylus/{print $9}')

if [ -z "${stylus}" ]; then
    exit 0
fi

# configure the buttons on ${stylus} with your xsetwacom commands...
#xsetwacom set "${stylus}" Button 2 11

deceleration=$(xinput list-props "${stylus}" | grep "Constant Deceleration" | awk -F'[()]' '{print $2}')
velocity=$(xinput list-props "${stylus}" | grep "Velocity Scaling" | awk -F'[()]' '{print $2}')

xsetwacom set "${stylus}" Area 0 0 20000 12500
xsetwacom set "${stylus}" Mode Relative
xsetwacom set "${stylus}" CursorProximity 20
xsetwacom set "${stylus}" Rotate half
xinput set-prop "${stylus}" "${deceleration}" 2.5
xinput set-prop "${stylus}" "${velocity}" 10
