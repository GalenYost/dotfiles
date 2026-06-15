alias bat="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -e 'percentage' 'state'"
alias yt-dlp="yt-dlp --cookies-from-browser firefox --remote-components ejs:github -t mp3"

alias ls="ls -l --color=auto"
alias grep="grep --color=auto"

alias suspend="systemctl suspend"

export PATH="$HOME/.cargo/bin:$PATH"
export ZVM_INSTALL="$HOME/.zvm/self"
export PS1='\W \$ '

[[ $PS1 &&
  ! ${BASH_COMPLETION_VERSINFO:-} &&
  -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

set -o vi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
