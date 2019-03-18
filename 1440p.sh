# Enable 1440p mode on LG display.

if T=$(readlink $0); then
    REAL0=$T
else
    REAL0=$0
fi

ROOT=$(realpath $(dirname $REAL0))
SETMODE=$ROOT/setmode.sh

# From EDID decode.
# 2560x1440 59.95 Hz (CVT 3.69M9-R) hsync: 88.79 kHz; pclk: 241.50 MHz
$SETMODE HDMI-1 2560x1440 241.5 2560 2608 2640 2720 1440 1443 1448 1481 +hsync -vsync
