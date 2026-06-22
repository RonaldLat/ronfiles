# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"

alias pn="pnpm"
alias lg="lazygit"
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcr="docker compose restart"
alias dcl="docker compose logs"
alias vv="nvim"
# Load and initialise completion system
autoload -Uz compinit
compinit

alias cat="bat"
alias ranger=". ranger"
#alias ranger="ranger"
alias pacs="sudo pacman -S "
alias pn="pnpm"
#alias docker="sudo docker"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# oh-my-posh prompt (replaces zap-prompt)
if command -v oh-my-posh &>/dev/null && [ -f "$HOME/dotfiles/ohmyposh_themes/amro.omp.json" ]; then
  eval "$(oh-my-posh init zsh --config ~/dotfiles/ohmyposh_themes/amro.omp.json)"
fi

# bun completions
[ -s "/home/ronald/.bun/_bun" ] && source "/home/ronald/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#proxies
#export http_proxy="http://192.168.12.194:44355"
#export https_proxy="http://192.168.12.194:44355"
