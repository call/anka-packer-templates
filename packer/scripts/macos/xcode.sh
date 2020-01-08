#!/bin/bash

# Unset variable $ZSH_VERSION in asdf.sh makes `set -u` here fail
set -eo pipefail
source ~/.bash_profile

# Install ruby
asdf plugin-add ruby
asdf install ruby 2.6.5
asdf global ruby 2.6.5

# See https://github.com/xcpretty/xcode-install#installation
curl -sL -O https://github.com/neonichu/ruby-domain_name/releases/download/v0.5.99999999/domain_name-0.5.99999999.gem
gem install domain_name-0.5.99999999.gem
gem install --conservative xcode-install
rm -f domain_name-0.5.99999999.gem

xcversion install --verbose "${XCODE_VERSION}"
xcversion cleanup

export HOMEBREW_NO_AUTO_UPDATE=1
brew install swiftlint