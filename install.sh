#!/usr/bin/env bash
set -euo pipefail

RONFILES="${RONFILES:-$HOME/.dotfiles}"

echo "==> Linking dotfiles..."

ln -sf "$RONFILES/.zshrc"   "$HOME/.zshrc"
ln -sf "$RONFILES/.fehbg"   "$HOME/.fehbg"

# Clone RonaldLat/dotfiles for themes, yazi, and extra configs
if [ ! -d "$HOME/dotfiles" ]; then
  echo "==> Cloning dotfiles repo..."
  git clone https://github.com/RonaldLat/dotfiles.git "$HOME/dotfiles"
fi

# .tmux.conf — from dotfiles repo
if [ -f "$HOME/dotfiles/.tmux.conf" ]; then
  ln -sf "$HOME/dotfiles/.tmux.conf" "$HOME/.tmux.conf"
fi

# Nvim config — from ronfiles dot-config
mkdir -p "$HOME/.config"
if [ -d "$RONFILES/dot-config/nvim" ]; then
  ln -sfT "$RONFILES/dot-config/nvim" "$HOME/.config/nvim"
  echo "  linked .config/nvim"
fi

# Yazi config — from dotfiles/yazi.bak
if [ -d "$HOME/dotfiles/yazi.bak" ]; then
  ln -sfT "$HOME/dotfiles/yazi.bak" "$HOME/.config/yazi"
  echo "  linked .config/yazi"
fi

echo "==> Installing tmux plugin manager..."
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
"$HOME/.tmux/plugins/tpm/bin/install_plugins" 2>/dev/null || true

echo "==> Setting zsh as default shell..."
if command -v zsh &>/dev/null && [ "$SHELL" != "/usr/bin/zsh" ] && [ "$SHELL" != "/bin/zsh" ]; then
  sudo chsh -s "$(command -v zsh)" "$(whoami)" 2>/dev/null || true
fi

echo "==> Done"
