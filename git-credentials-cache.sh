#!/bin/bash

# Configure Git credential caching
git config --global credential.helper cache

# Set the cache timeout (in seconds)
git config --global credential.helper '25200'

# Replace <seconds> with your desired cache timeout duration

echo "Git credential caching configured."

