#!/bin/bash
set -euo pipefail

# Install ruby
asdf plugin-add ruby
asdf install ruby 3.7.0

# See https://github.com/xcpretty/xcode-install#installation
curl -sL -O https://github.com/neonichu/ruby-domain_name/releases/download/v0.5.99999999/domain_name-0.5.99999999.gem
gem install domain_name-0.5.99999999.gem
gem install --conservative xcode-install
rm -f domain_name-0.5.99999999.gem
rbenv rehash

xcversion install --verbose "$XCODE_VERSION"
xcversion cleanup

export HOMEBREW_NO_AUTO_UPDATE=1
brew install carthage swiftlint cocoapods