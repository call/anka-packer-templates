$pkgs = ['autopkgr']
$gems = ['serverspec']

package { $pkgs:
  ensure   => 'present',
  provider => 'homebrew',
}

package { $gems:
  ensure   => 'present',
  provider => 'gem',
}
