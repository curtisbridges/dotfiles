#!/bin/sh
# Setup installer for a new Mac

# Assuming Xcode is installed, install the command line tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install homebrew packages

# Setup prompt (requires node installed)
npm install -g spaceship-prompt
# The above might require: `npm install -g pure-prompt`
