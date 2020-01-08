#!/bin/bash
set -eu

# Make homebrew bin dir first in $PATH
echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile
echo "export PATH=/usr/local/bin:$PATH" >> ~/.zshenv
source ~/.bash_profile

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install https://github.com/Homebrew/homebrew-bundle
brew bundle