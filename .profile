#!/home/user/.local/bin/sh

export ENV="$HOME/.shrc"

export ZVM_INSTALL="$HOME/.zvm/self"
export GTK_THEME="Adwaita-dark"
export MOZ_ENABLE_WAYLAND=1

export QT_QPA_PLATFORM="wayland;xcb"
export QT_QPA_PLATFORMTHEME="gtk"
export XDG_SESSION_TYPE="wayland"
export XDG_CURRENT_DESKTOP="sway"

export VISUAL=nvim
export EDITOR=nvim

export PATH="$HOME/waterfox:$PATH"
export PATH="$HOME/onlyoffice/onlyoffice/desktopeditors:$PATH"
export PATH="$HOME/termusic:$PATH"
export PATH="$HOME/games:$PATH"

export PATH="$HOME/opt/chimerautils/bin:$PATH"
export PATH="$HOME/opt/teams-for-linux:$PATH"
export PATH="$HOME/opt/boomer:$PATH"
export PATH="$HOME/opt/Discord:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.zvm/bin:$PATH"
export PATH="$ZVM_INSTALL:$PATH"

if [ "$(tty)" = "/dev/tty1" ]; then
    # exec startx
    plymouth --quit
    exec dbus-run-session sway
fi
