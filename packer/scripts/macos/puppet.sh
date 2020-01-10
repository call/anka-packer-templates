#!/bin/bash
set -euo pipefail

brew tap puppetlabs/puppet
brew cask install puppet-agent-6

# Puppet module installs
sudo /opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version 1.8.3

# Set locale to address https://tickets.puppetlabs.com/browse/PUP-5042
echo 'export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
' >> ~/.bash_profile

echo 'export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
' >> ~/.zshrc