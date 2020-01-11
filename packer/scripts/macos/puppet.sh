#!/bin/bash
set -euo pipefail

HOMEBREW_MODULE_VERSION='1.8.3'
VSCREPO_MODULE_VERSION='3.1.0'
MACDEFAULTS_MODULE_GIT_REF='35ca6165d39808aeffe40c89eceb272b5de4da5b'

export HOMEBREW_NO_AUTO_UPDATE=1
brew tap puppetlabs/puppet
brew cask install puppet-agent-6

# Puppet module installs using CLI
sudo /opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version "${HOMEBREW_MODULE_VERSION}"
sudo /opt/puppetlabs/puppet/bin/puppet module install puppetlabs-vcsrepo --version "${VCSREPO_MODULE_VERSION}"

# Make work dir for module cloning
WORK_DIR=$(mktemp -d)

# Puppet module installs using Git, pinned to a ref
git clone https://github.com/puppetlabs/puppet-macdefaults.git "${WORK_DIR}/macdefaults"
cd "${WORK_DIR}/macdefaults" && git reset --hard $MACDEFAULTS_MODULE_GIT_REF
sudo mv $WORK_DIR /etc/puppetlabs/code/modules/macdefaults