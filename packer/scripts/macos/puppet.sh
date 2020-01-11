#!/bin/bash
set -euo pipefail

HOMEBREW_MODULE_VERSION='1.8.3'
VCSREPO_MODULE_VERSION='3.1.0'
MACDEFAULTS_MODULE_GIT_REF='35ca6165d39808aeffe40c89eceb272b5de4da5b'
PUPPET_DMG_BASENAME='puppet-agent-6.11.1-1.osx10.14'
PUPPET_DMG_URL="https://downloads.puppet.com/mac/puppet6/10.14/x86_64/${PUPPET_DMG_BASENAME}.dmg"

# Git clone and puppet package download dir
WORK_DIR=$(mktemp -d)

# # Install puppet package with Homebrew. 
# # This is not pin-able, so pinned version of puppet pkg is installed in tools.pp
# export HOMEBREW_NO_AUTO_UPDATE=1
# brew tap puppetlabs/puppet
# brew cask install puppet-agent-6

# Download & install puppet agent
curl -o "${WORK_DIR}/puppet-agent.dmg" "${PUPPET_DMG_URL}"
hdiutil attach "${WORK_DIR}/puppet-agent.dmg"
sudo installer -package "/Volumes/${PUPPET_DMG_BASENAME}/${PUPPET_DMG_BASENAME}.pkg"
hdiutil detach "/Volumes/${PUPPET_DMG_BASENAME}"

# Puppet module installs using CLI
sudo /opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version "${HOMEBREW_MODULE_VERSION}"
sudo /opt/puppetlabs/puppet/bin/puppet module install puppetlabs-vcsrepo --version "${VCSREPO_MODULE_VERSION}"

# Puppet module installs using Git, pinned to a ref
git clone https://github.com/puppetlabs/puppet-macdefaults.git "${WORK_DIR}/macdefaults"
cd "${WORK_DIR}/macdefaults" && git reset --hard $MACDEFAULTS_MODULE_GIT_REF
sudo mv "${WORK_DIR}/macdefaults" /etc/puppetlabs/code/modules/macdefaults