#!/bin/bash

# Source directory containing the .zshrc and .tmux.conf files
SOURCE_DIR="$HOME/source_dir"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory '$SOURCE_DIR' does not exist."
  exit 1
fi

# Change to your home directory
cd "$HOME"

# List of files to copy and source
FILES=("zshrc" "tmux.conf")

# Iterate through the list of files
for FILE in "${FILES[@]}"; do
  SOURCE_FILE="$SOURCE_DIR/$FILE"
  
  # Check if the source file exists
  if [ -f "$SOURCE_FILE" ]; then
    # Check if a file with the same name exists in your home directory
    if [ -e "$FILE" ]; then
      # Delete the existing file in your home directory
      rm "$FILE"
      echo "Deleted '$FILE' in your home directory."
    fi

    # Copy the file from the source directory to your home directory
    cp "$SOURCE_FILE" .

    # Source the copied file
    source "$FILE"
    echo "Sourced '$FILE'."
  fi
done

echo "File copying and sourcing complete."

