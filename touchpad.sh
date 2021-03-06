#!/bin/bash

GETNUM_RE='s/.*(\([0-9]*\)).*/\1/'

TP_ID=$(xinput list --id-only "ETPS/2 Elantech Touchpad")

ON_ID=$(xinput list-props $TP_ID | grep 'Device Enabled (' | sed -e "$GETNUM_RE")
SPEED_ID=$(xinput list-props $TP_ID | grep 'Accel Speed (' | sed -e "$GETNUM_RE")
TAP_ID=$(xinput list-props $TP_ID | grep 'Tapping Enabled (' | sed -e "$GETNUM_RE")

# echo "Touchpad is $TP_ID"
# echo "Speed is $SPEED_ID"
# echo "Tapping is $TAP_ID"

if [ "$1" == "off" ]; then
    xinput set-prop $TP_ID $ON_ID 0
else
    # Enable the touchpad.
    xinput set-prop $TP_ID $ON_ID 1

    # Enable tap to click
    xinput set-prop $TP_ID $TAP_ID 1

    # Accel-speed (out of 0-1)
    xinput set-prop $TP_ID $SPEED_ID 0.5
fi
