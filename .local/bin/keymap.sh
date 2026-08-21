#!/home/user/.local/bin/sh

case "$BUTTON" in
    1) xdotool key GroupNext ;;
esac

mask=$(xset -q | awk '/LED mask/ {print $10}')

case "$mask" in
    "00000000") echo "us" ;;
    "00001000") echo "ua" ;;
    "00002000") echo "ru" ;;
    *)          echo "us" ;;
esac
