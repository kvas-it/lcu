# Enable 4k mode on LG display.

if T=$(readlink $0); then
    REAL0=$T
else
    REAL0=$0
fi

ROOT=$(realpath $(dirname $REAL0))
SETMODE=$ROOT/setmode.sh

# From https://forums.puri.sm/t/how-i-set-up-my-3840x2160-monitor-via-hdmi/2607
# xrandr --newmode 3840x2160-knoqi 262.750000 3840 3888 3920 4000 2160 2163 2167 2191 +HSync -VSync
# xrandr --addmode HDMI-1 3840x2160-knoqi
# xrandr --output HDMI-1 --mode 3840x2160-knoqi
# xrandr --output HDMI-1 --left-of eDP-1

# Found through trial and error (clock just below the 297MHz)
# xrandr --newmode "3840x2160_26.50"  296.75  3840 4072 4472 5104  2160 2163 2168 2195 -hsync +vsync
# xrandr --addmode HDMI-1 "3840x2160_26.50"
# xrandr --output HDMI-1 --mode "3840x2160_26.50"
# xrandr --output HDMI-1 --left-of eDP-1

# From EDID decode 30Hz.
# xrandr --newmode "3840x2160_30" 297.0 3840 4016 4104 4400 2160 2168 2178 2250 +hsync -vsync
# xrandr --addmode HDMI-1 "3840x2160_30"
# xrandr --output HDMI-1 --mode "3840x2160_30"
# xrandr --output HDMI-1 --left-of eDP-1

# Reduced blanking from cvt -r with frequency changed to be at HDMI 1.4 maximum.
# This gives 33.7Hz refresh rate and feels better than native mode.
$SETMODE HDMI-1 3840x2160R 300.00 3840 3888 3920 4000 2160 2163 2168 2222 +hsync -vsync
