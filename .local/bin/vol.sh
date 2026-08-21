#!/home/user/.local/bin/sh

case "$BUTTON" in
    1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
    4) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    5) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q "yes"; then
    echo "VOL: MUTED"
else
    VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk -F'/' '/[0-9]+%/ { print $2 }' | tr -d ' ' | head -n1)
    echo "VOL: $VOL"
fi
