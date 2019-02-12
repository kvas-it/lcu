# Enable 1440p mode on LG display.

# From EDID decode.
xrandr --newmode "2560x1440_60" 241.5 2560 2608 2640 2720 1440 1443 1448 1481 +hsync -vsync
xrandr --addmode HDMI-1 "2560x1440_60" 
xrandr --output HDMI-1 --mode "2560x1440_60"
xrandr --output HDMI-1 --above eDP-1
