#!/bin/bash

# Check if libfuse2 is installed, and if not, install it
if ! dpkg-query -W -f='${Status}' libfuse2 2>/dev/null | grep -q "ok installed"; then
    echo "libfuse2 is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install -y libfuse2
fi

# Check if fuse is installed, and if not, install it
if ! dpkg-query -W -f='${Status}' fuse 2>/dev/null | grep -q "ok installed"; then
    echo "fuse is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install -y fuse
fi
#end
###########################################################
#Symlink nvim
source_folder="$(pwd)/nvim" # Assuming the 'nvim' folder is in the same directory as the script
target_folder="$HOME"
# Check if the source folder exists
if [ -d "$source_folder" ]; then
    # Check if the target folder already exists
    if [ -d "$target_folder" ]; then
        # Create a symbolic link to the 'nvim' folder in the home directory
        ln -sf "$source_folder" "$target_folder/.config/nvim"
        echo "Symlink created: $target_folder/.config/nvim -> $source_folder"
    else
        echo "Error: Target folder '$target_folder' does not exist."
    fi
else
    echo "Error: Source folder '$source_folder' does not exist."
fi

###########################################################
#Symlink tmux.conf
source_file="$(pwd)/tmux.conf"  # Assuming 'tmux.conf' is in the same directory as the script
target_file="$HOME/.tmux.conf"

# Check if the source file exists
if [ -f "$source_file" ]; then
    # Check if the target file already exists
    if [ -f "$target_file" ]; then
	source "$HOME/tmux.conf"
        echo "Symlink already exists: $target_file -> $source_file"
    else
        # Create a symbolic link to 'tmux.conf' in the home directory
        ln -sf "$source_file" "$target_file"
	source "$HOME/tmux.conf"
        echo "Symlink created: $target_file -> $source_file"
    fi
else
    echo "Error: Source file '$source_file' does not exist."
fi
###########################################################

# Check if zap is already installed
if command -v zap &>/dev/null; then
    echo "zap is already installed."
else
    # Install zap using the provided command
    echo "Installing zap..."
    zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
fi

###########################################################

# Define the path to the 'nvim.appimage' and the alias you want to create
alias_name="nvim"
alias_command="$(pwd)/nvim.appimage"

# Check if the alias is already defined in .zshrc
if grep -q "alias $alias_name=" "$HOME/.zshrc"; then
    echo "Alias '$alias_name' already exists in .zshrc."
else
    # Add a new line and then the alias to .zshrc
    echo -e "\nalias $alias_name=\"$alias_command\"" >> "$HOME/.zshrc"
    echo "Alias '$alias_name' added to .zshrc."

    # Activate the alias for the current session
    alias "$alias_name=$alias_command"
    echo "Alias '$alias_name' is now available for this session."
     # Source .zshrc to make the alias available in the current session
    source "$HOME/.zshrc"
    echo "Reloaded .zshrc to make the alias available."
fi



###########################################################
