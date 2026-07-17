#!/home/user/.local/bin/sh

# pipewire &
# wireplumber &
# pipewire-pulse &
# udiskie -aNT &
# picom --backend glx -D 0 --vsync &
# slstatus &

cd ~
# exec dbus-run-session dwm
exec dbus-run-session i3
