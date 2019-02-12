# Set video mode on a monitor using xrandr.
# Usage:
#
#   setmode.sh MONITOR MODENAME MODELINE...
#

MONITOR=$1
MODE=$2
shift 2
# At this point $* is the modeline.

echo "Monitor:   $MONITOR"
echo "Mode name: $MODE"
echo "Modeline:  $*"

# Delete old definition of the mode if it's present.
if xrandr | grep "$MODE" -q; then
    xrandr --delmode "$MONITOR" "$MODE"
    xrandr --rmmode "$MODE"
fi

# Define new mode and add it to the monitor.
xrandr --newmode "$MODE" $*
xrandr --addmode "$MONITOR" "$MODE"

# Activate the mode
xrandr --output "$MONITOR" --mode "$MODE"
# And arrange the monitor to the left of the builtin one.
xrandr --output "$MONITOR" --left-of eDP-1
