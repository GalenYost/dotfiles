#!/home/user/.local/bin/sh

case "$BUTTON" in
    1) pactl set-source-mute @DEFAULT_SOURCE@ toggle ;;
    4) pactl set-source-volume @DEFAULT_SOURCE@ +5% ;;
    5) pactl set-source-volume @DEFAULT_SOURCE@ -5% ;;
esac

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q "yes"; then
    echo "MIC: MUTED"
else
    VOL=$(pactl get-source-volume @DEFAULT_SOURCE@ | awk -F'/' '/[0-9]+%/ { print $2 }' | tr -d ' ' | head -n1)
    echo "MIC: $VOL"
fi
