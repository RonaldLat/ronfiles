#!/bin/zsh

# Function to check if a symbolic link exists
symlink_exists() {
    [[ -L "$1" ]]
}

# Array to keep track of linked files
LINKED_FILES=()

# Create a symbolic link if it doesn't exist already
create_symlink() {
    local source_file="$1"
    local link_name="$2"

    if ! symlink_exists "$link_name"; then
        ln -s "$source_file" "$link_name"
        LINKED_FILES+=("$link_name")
    fi
}

# Example usage:
#create_symlink "/path/to/source_file1" "/path/to/link1"
#create_symlink "/path/to/source_file2" "/path/to/link2"
create_symlink "~/dotfiles/ron.sh" "~/ron.sh"

# Source the .zshrc file
source ~/.zshrc

