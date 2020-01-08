#!/bin/bash
set -eu

# Make Homebrew bin dir first in $PATH
echo "export PATH=/usr/local/bin:$PATH" >> ~/.bash_profile
echo "export PATH=/usr/local/bin:$PATH" >> ~/.zshenv
source ~/.bash_profile

# Manually install Xcode CLI tools, it fails sometimes in the Homebrew installer
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;

# This one-liner brought to you by the Homebrew install script
PROD=$(/usr/sbin/softwareupdate -l |
  grep -B 1 -E 'Command Line Tools' |
  awk -F'*' '/^ *\\*/ {print $2}' |
  sed -e 's/^ *Label: //' -e 's/^ *//' |
  sort -V |
  tail -n1)
softwareupdate -i "${PROD}";

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap Homebrew/bundle
