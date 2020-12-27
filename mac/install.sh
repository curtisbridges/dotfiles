#!/bin/sh
# Setup installer for a new Mac

# Assuming Xcode is installed, install the command line tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install homebrew packages

