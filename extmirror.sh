#!/bin/bash
#
# Make external display a mirror of the builtin one.

if T=$(readlink $0); then
    REAL0=$T
else
    REAL0=$0
fi

ROOT=$(realpath $(dirname $REAL0))

xrandr --output HDMI-1 --auto
xrandr --output HDMI-1 --mode 1920x1080
xrandr --output HDMI-1 --same-as eDP-1

$ROOT/kbdmap.sh
$ROOT/touchpad.sh
