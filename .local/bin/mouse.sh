#!/home/user/.local/bin/sh

sleep 2

DEVICE=$(ratbagctl list | grep -i "Logitech" | head -n 1 | cut -d':' -f1)

if [ -z "$DEVICE" ]; then
    exit 1
fi

DPI="1200"
LED_MODE="breathing"
LED_COLOR="9a9996"
LED_BRIGHTNESS="128"

ratbagctl "$DEVICE" dpi set "$DPI"
for led in 0 1 2; do
    ratbagctl "$DEVICE" led $led set mode "$LED_MODE"
    ratbagctl "$DEVICE" led $led set color "$LED_COLOR"
    ratbagctl "$DEVICE" led $led set brightness "$LED_BRIGHTNESS"
done
