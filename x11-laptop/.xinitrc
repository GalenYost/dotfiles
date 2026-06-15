#!/bin/sh

export PATH="$HOME/nvim-nightly/bin:$PATH"
export PATH="$HOME/waterfox:$PATH"
export PATH="$HOME/discord:$PATH"
export PATH="$HOME/onlyoffice/onlyoffice/desktopeditors:$PATH"
export PATH="$HOME/termusic:$PATH"
export PATH="$HOME/.zvm/bin:$PATH"

export PATH="$HOME/opt/maven/bin:$PATH"
export PATH="$HOME/opt/jdtls/bin:$PATH"
export PATH="$HOME/opt/chimerautils/bin:$PATH"
export PATH="$HOME/opt/element:$PATH"
export PATH="$HOME/opt/teams-for-linux:$PATH"

export PATH="$HOME/.local/bin:$PATH"

export ZVM_INSTALL="$HOME/.zvm/self"

export QT_QPA_PLATFORM="xcb"
export QT_QPA_PLATFORMTHEME="gtk"
export XDG_SESSION_TYPE="x11"
export GTK_THEME="Adwaita-dark"

xset -dpms
xset s off
xinput set-prop "CRQ1080:00 0488:1014 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "CRQ1080:00 0488:1014 Touchpad" "libinput Natural Scrolling Enabled" 1
setxkbmap -layout us,ua,ru -option "grp:alt_shift_toggle,caps:none"

pipewire &
pipewire-pulse &
wireplumber &
udiskie -aNT &
picom --backend glx -D 0 --vsync &

cd ~
exec dbus-run-session dwm
