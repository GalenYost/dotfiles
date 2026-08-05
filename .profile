#!/home/user/.local/bin/sh

export ENV="$HOME/.shrc"

export QT_QPA_PLATFORMTHEME=gtk

# export WLR_NO_HARDWARE_CURSORS=1
# export MOZ_ENABLE_WAYLAND=1
# export QT_QPA_PLATFORM="wayland;xcb"
# export XDG_SESSION_TYPE=wayland
# export XDG_CURRENT_DESKTOP=river

export GTK_THEME="Adwaita:dark"
export QT_QPA_PLATFORM=xcb
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=dwm

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ELECTRON_OZONE_PLATFORM_HINT=auto

export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export LIBVA_DRIVER_NAME=nvidia

export VISUAL=nvim
export EDITOR=nvim

export PATH="/var/lib/flatpak/exports/bin:$PATH"
export PATH="$HOME/opt/Discord:$PATH"
export PATH="$HOME/onlyoffice/onlyoffice/desktopeditors:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.zvm/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"

if [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
    # exec dbus-run-session niri --session
    # exec dbus-run-session sway --unsupported-gpu
    # exec dbus-run-session river
fi
