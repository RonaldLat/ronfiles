# Install zap-zsh on startup
if [ ! -d "$HOME/.zap" ]; then
    echo "Installing zap-zsh..."
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
    echo "zap-zsh installed."
fi

