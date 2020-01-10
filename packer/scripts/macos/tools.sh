brew tap puppetlabs/puppet
brew cask install puppet-agent-6

echo 'alias puppet="/opt/puppetlabs/puppet/bin/puppet"' >> ~/.bash_profile
echo 'alias puppet="/opt/puppetlabs/puppet/bin/puppet"' >> ~/.zshrc

# Puppet module installs
/opt/puppetlabs/puppet/bin/puppet module install thekevjames-homebrew --version 1.8.3