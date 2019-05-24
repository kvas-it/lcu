#!/bin/bash
#
# Turn off external screen.

if T=$(readlink $0); then
    REAL0=$T
else
    REAL0=$0
fi

ROOT=$(realpath $(dirname $REAL0))

xrandr --output HDMI-1 --off --output eDP-1 --primary

$ROOT/kbdmap.sh
$ROOT/touchpad.sh
