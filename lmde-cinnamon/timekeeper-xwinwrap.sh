#!/bin/bash

xwinwrap -argb -g 495x495+3300+30 -fdt -ni -s -b -nf -- \
env QT_QPA_PLATFORM=xcb /home/hans/qt-test/plasmawindowed-build/plasmawindowed /home/hans/timekeeper-evolution/package &

sleep 2

WIN=$(xdotool search --name "Time Keeper Evolution" | head -n 1)

if [ -n "$WIN" ]; then
    xdotool windowmove "$WIN" 2800 30
    xdotool windowsize "$WIN" 495 495

    xprop -id "$WIN" -f _MOTIF_WM_HINTS 32c \
        -set _MOTIF_WM_HINTS '2, 0, 0, 0, 0'
fi
