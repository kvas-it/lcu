#!/bin/bash
# Populate system tray with useful applets.

function run_once {
    if ps xa | grep $1 | grep -v grep -q; then
        echo $1 is already started
    else
        $* >/dev/null 2>&1 &
	echo started $*
    fi
}

# Wifi
run_once nm-applet

# Battery
run_once cbatticon

# Sound control and indicator
run_once pasystray
