### PACKAGES
```
sudo xbps-install -S void-repo-nonfree void-repo-multilib void-repo-multilib-nonfree
```
```
sudo xbps-install -Su
```
#### MAIN
```
sudo xbps-install -S xorg-minimal xinit xrandr xclip i3 rofi i3status ghostty firefox dejavu-fonts-ttf nerd-fonts-ttf flameshot telegram-desktop polkit elogind dbus 7zip unzip curl yazi obs xz mupdf imv setxkbmap udiskie xdg-desktop-portal-gtk xdg-desktop-portal xdg-utils gnome-themes-extra picom libxcb xcb-util xcb-util-image xcb-util-keysyms xcb-util-renderutil xcb-util-wm libxkbcommon qt5 qt5-x11extras qt5-multimedia qt5-svg qt5-declarative qt5-webengine qt5-webchannel qt5-location qt5ct adwaita-qt acpid xprop NetworkManager binutils xinput nushell fastfetch onefetch alsa-pipewire libtool libvterm-devel cmake emacs emacs-gtk3 bspwm sxhkd plymouth alsa-lib-devel
```
might need:
```
sudo xbps-install -S sof-firmware alsa-ucm-conf alsa-utils
```
niri:
```
sudo xbps-install -S niri xwayland-satellite rofi xdg-desktop-portal-gtk xdg-desktop-portal-gnome
```
```
sudo xbps-install -S mesa-dri mesa-vulkan-intel vulkan-loader intel-video-accel mesa-dri-32bit vulkan-loader-32bit mesa-vulkan-intel-32bit mesa-vaapi mesa-vdpau
```
## nvidia
```
sudo xbps-install -S nvidia nvidia-libs nvidia-libs-32bit nvidia-vaapi-driver libva-utils
```

#### DEPS FOR DEV AND BUILD
```
sudo xbps-install -S git protobuf alsa-lib yt-dlp ffmpeg mpv gstreamer1 lua-language-server nodejs libsixel libcxx
```

### steam
```
sudo xbps-install -S glibc-32bit libdrm-32bit libglvnd-32bit steam mono libgcc-32bit libstdc++-32bit Vulkan-Tools
```

### dotfiles
```
git clone https://gitlab.com/GalenYost/void-config $HOME/.dotfiles
cd $HOME/.dotfiles
stow .
```

### SERVICES
```
sudo ln -s /etc/sv/polkitd /var/service
sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/acpid /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
```

### NEOVIM NIGHTLY
grab tar.gz from official repo
- https://github.com/neovim/neovim/releases
```
mkdir -p $HOME/nvim-nightly
tar -xzf nvim-linux-x86_64.tar.gz -C $HOME/nvim-nightly --strip-components=1
```

### WATERFOX
grab tar.bz2 from official website
- https://www.waterfox.net
```console
mkdir -p $HOME/waterfox
tar -xvjf waterfox-X.X.X.X.tar.bz2 -C $HOME/waterfox --strip-components=1
```

### OnlyOffice
grab tar.xz from official repo
- https://github.com/ONLYOFFICE/DesktopEditors/releases
```
mkdir -p $HOME/onlyoffice
tar -xJf onlyoffice-desktopeditors-x64.tar.xz -C $HOME/onlyoffice --strip-components=1
```

### TERMUSIC
grab tar.xz from official repo
- https://github.com/tramhao/termusic/releases
```
mkdir -p $HOME/termusic
tar -xJf termusic-vX.X.X-<sys>.tar.xz -C $HOME/termusic --strip-components=1
```

### DISCORD
grab tar.gz from official website
-
```
mkdir -p $HOME/discord
tar -xzf discord-ptb-<ver>.tar.gz -C $HOME/discord --strip-components=1
```

### Pipewire + Wireplumber
```
sudo xbps-install -S pipewire wireplumber pavucontrol
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
```

### alsa
```
sudo mkdir -p /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
```

### YAZI
```
sudo xbps-install -S jq poppler fd ripgrep fzf zoxide resvg ImageMagick
```

### intel laptop sound issue
need to force legacy driver usage:
```
echo "options snd-intel-dspcfg dsp_driver=1" | sudo tee /etc/modprobe.d/audio.conf
```

### zvm
```
curl https://raw.githubusercontent.com/tristanisham/zvm/master/install.sh | bash
```

### wayland
```
sudo xbps-install -S xwayland-satellite xdg-desktop-portal-gtk xdg-desktop-portal-gnome
sudo xbps-install -S pkg-config glib-devel
```

### plymouth
```
git clone https://github.com/mamohat/void-mac-style $HOME/void-mac-style
doas cp -r $HOME/void-mac-style/void-mac-style /usr/share/plymouth/themes/
doas plymouth-set-default-theme -R void-mac-style
doas nvim /etc/default/grub
doas update-grub
doas echo "plymouth --quit" >> /etc/rc.local
```

### doas
```
git clone https://codeberg.org/thejessesmith/doas $HOME/opt/doas
cd doas
sudo make install
sudo cp -r /etc/pam.d/sudo /etc/pam.d/doas
sudo mkdir /usr/local/etc && nvim /usr/local/etc/doas.conf
    > permit persist user as root
sudo chown root:root /usr/local/etc/doas.conf
sudo chmod +x /usr/local/etc/doas.conf
```

### chimerautils
```
doas xbps-install -S cmake acl acl-devel ninja meson ncurses ncurses-devel libxo libxo-devel libedit libedit-devel openssl-devel
```
```
git clone https://github.com/chimera-linux/chimerautils $HOME/opt/chimerautils
cd $HOME/opt/chimerautils && mkdir build && cd build
meson ..
ninja all
```

### st
```
doas xbps-install -S freetype-devel fontconfig-devel xorg xorg-server-devel xorg-server-wayland libX11-devel libXpm-devel xorg-server-xvfb xorg-minimal libXft libXft-devel
```
```
git clone https://git.suckless.org/st $HOME/st
cd st && cp -r $HOME/dotfiles/st/config.h st/
doas make clean install
```


### nvidia suspend issue
```
doas nvim /etc/modprobe.d/nvidia-power.conf
    > options nvidia NVreg_PreserveVideoMemoryAllocations=1

doas chmod +x /usr/libexec/elogind/system-sleep/nvidia.sh
doas chmod +x /etc/zzz.d/suspend/nvidia-suspend
doas chmod +x /etc/zzz.d/resume/nvidia-resume

doas nvim /etc/elogind/sleep.conf
    AllowSuspend=yes
    SuspendByUsing=/usr/bin/zzz
    HibernateByUsing=/usr/bin/ZZZ
```
