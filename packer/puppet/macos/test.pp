$pkgs = ['autopkgr']

package { $pkgs:
  ensure   => 'present',
  provider => 'homebrew',
}
