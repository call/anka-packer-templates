#!/bin/bash
set -euo pipefail

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

# Set completion for both bash and zsh
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zprofile

brew install \
  coreutils automake autoconf openssl \
  libyaml readline libxslt libtool unixodbc \
  unzip curl
