# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

alias pn="pnpm"
# Load and initialise completion system
autoload -Uz compinit
compinit

#alias nvim="exec ~/Dev/ronfiles/nvim.appimage && zsh"
#alias nvim="exec /home/Dev/ronfiles/nvim.appimage"
#ln -sf nvim.appimage ~/
#alias nvim="exec ~/nvim.appimage"
alias cat="bat"
alias ranger=". ranger"
#alias ranger="ranger"
alias pacs="sudo pacman -S "
alias pn="pnpm"
#alias docker="sudo docker"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/ronald/.bun/_bun" ] && source "/home/ronald/.bun/_bun"

#PS1='%~: '
#exec ~/.fehbg


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#proxies
#export http_proxy="http://192.168.12.194:44355"
#export https_proxy="http://192.168.12.194:44355"
