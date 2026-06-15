#!/bin/sh

export PATH="$HOME/nvim-nightly/bin:$PATH"
export PATH="$HOME/waterfox:$PATH"
export PATH="$HOME/onlyoffice/onlyoffice/desktopeditors:$PATH"
export PATH="$HOME/termusic:$PATH"
export PATH="$HOME/.zvm/bin:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"

export QT_QPA_PLATFORM="xcb"
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_SESSION_TYPE="x11"
export GTK_THEME="Adwaita-dark"
export XDG_CURRENT_DESKTOP="gtk"
export GTK_USE_PORTAL="1"

xrandr --output HDMI-0 --mode 1920x1080 --rate 144
xset -dpms
xset s off
setxkbmap -layout us,ua,ru -option "grp:alt_shift_toggle,caps:none"

pipewire &
pipewire-pulse &
udiskie -aNT &
nvidia-settings --load-config-only &
picom --vsync --backend glx -D 0 &

exec dbus-run-session i3
