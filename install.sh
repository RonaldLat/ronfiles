#!/usr/bin/env bash
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/.dotfiles}"

echo "==> Linking dotfiles..."

# Compatibility symlink
ln -sfT "$DOTFILES" "$HOME/dotfiles"

ln -sf "$DOTFILES/.zshrc"   "$HOME/.zshrc"
ln -sf "$DOTFILES/.fehbg"   "$HOME/.fehbg"

# .tmux.conf — fetch from dotfiles repo if not present
if [ ! -f "$DOTFILES/.tmux.conf" ]; then
  curl -fsSL https://raw.githubusercontent.com/RonaldLat/dotfiles/master/.tmux.conf \
    -o "$HOME/.tmux.conf"
else
  ln -sf "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
fi

mkdir -p "$HOME/.config"
if [ -d "$DOTFILES/dot-config" ]; then
  for dir in nvim yazi; do
    src="$DOTFILES/dot-config/$dir"
    if [ -d "$src" ]; then
      ln -sfT "$src" "$HOME/.config/$dir"
      echo "  linked .config/$dir"
    fi
  done
else
  for dir in nvim yazi; do
    src="$DOTFILES/.config/$dir"
    if [ -d "$src" ]; then
      ln -sfT "$src" "$HOME/.config/$dir"
      echo "  linked .config/$dir"
    fi
  done
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
