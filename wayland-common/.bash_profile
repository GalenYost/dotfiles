#!/bin/sh

export PATH="$HOME/nvim-nightly/bin:$PATH"
export PATH="$HOME/waterfox:$PATH"
export PATH="$HOME/onlyoffice/onlyoffice/desktopeditors:$PATH"
export PATH="$HOME/termusic:$PATH"
export PATH="$HOME/.zvm/bin:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"

exec dbus-run-session niri --session
