#!/bin/bash

# Function to check if a package is installed
is_package_installed() {
    dpkg -l | grep -q $1
}

# Check if "fuse" package is installed
if ! is_package_installed fuse; then
    echo "Installing 'fuse'..."
    sudo apt-get update
    sudo apt-get install -y fuse
else
    echo "'fuse' is already installed."
fi

# Check if "libfuse2" package is installed
if ! is_package_installed libfuse2; then
    echo "Installing 'libfuse2'..."
    sudo apt-get update
    sudo apt-get install -y libfuse2
else
    echo "'libfuse2' is already installed."
fi

echo "Packages installation complete."

