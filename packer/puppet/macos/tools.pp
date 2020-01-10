
# Set locale to address https://tickets.puppetlabs.com/browse/PUP-5042
exec { 'set_locale' :
  command => "/bin/bash -c \"export LANG=en_us.UTF-8\"",
}

class { 'homebrew':
  user => 'anka',
}

package { 'serverspec':
  ensure   => 'present',
  provider => 'gem',
}

package { 'autopkgr':
  ensure   => 'present',
  provider => 'brewcask',
  require  => Exec['set_locale'],
}
