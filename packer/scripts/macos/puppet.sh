#!/bin/bash
set -euo pipefail

brew tap puppetlabs/puppet
brew cask install puppet-agent-6

# Puppet module installs
sudo /opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version 1.8.3
