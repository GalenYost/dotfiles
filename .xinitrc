#!/home/user/.local/bin/sh

export ZVM_INSTALL="$HOME/.zvm/self"
export QT_QPA_PLATFORM="xcb"
export QT_QPA_PLATFORMTHEME="gtk"
export XDG_SESSION_TYPE="x11"
export GTK_THEME="Adwaita-dark"

export VISUAL=nvim
export EDITOR=nvim

export PATH="$HOME/waterfox:$PATH"
export PATH="$HOME/discord:$PATH"
export PATH="$HOME/onlyoffice/onlyoffice/desktopeditors:$PATH"
export PATH="$HOME/termusic:$PATH"
export PATH="$HOME/games:$PATH"

export PATH="$HOME/opt/chimerautils/bin:$PATH"
export PATH="$HOME/opt/teams-for-linux:$PATH"
export PATH="$HOME/opt/boomer:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.zvm/bin:$PATH"
export PATH="$ZVM_INSTALL:$PATH"

xset -dpms
xset s off
xinput set-prop "CRQ1080:00 0488:1014 Touchpad" "libinput Tapping Enabled" 1
xinput set-prop "CRQ1080:00 0488:1014 Touchpad" "libinput Natural Scrolling Enabled" 1

pipewire &
pipewire-pulse &
udiskie -aNT &
picom --backend glx -D 0 --vsync &
slstatus &

cd ~
exec dbus-run-session dwm
# exec dbus-run-session i3
