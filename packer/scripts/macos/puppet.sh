#!/bin/bash
set -euo pipefail

brew tap puppetlabs/puppet
brew cask install puppet-agent-6

# Puppet module installs using CLI
sudo /opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version 1.8.3
sudo /opt/puppetlabs/puppet/bin/puppet module install puppetlabs-vcsrepo --version 3.1.0

# Puppet module installs using git, pinned to a ref
MACDEFAULTS_REF='35ca6165d39808aeffe40c89eceb272b5de4da5b'
git clone https://github.com/puppetlabs/puppet-macdefaults.git /etc/puppetlabs/code/modules/macdefaults
cd /etc/puppetlabs/code/modules/macdefaults && git reset --hard $MACDEFAULTS_REF