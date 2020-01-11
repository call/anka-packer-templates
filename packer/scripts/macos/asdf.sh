#!/bin/bash
set -euo pipefail

# Install asdf for tool version management
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

# Set completion for both bash and zsh
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshenv
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshenv
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile

# Install plugin dependencies
# https://asdf-vm.com/#/core-manage-asdf-vm?id=plugin-dependencies
export HOMEBREW_NO_AUTO_UPDATE=1
brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl
