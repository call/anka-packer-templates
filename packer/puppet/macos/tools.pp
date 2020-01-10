package { 'autopkgr':
  ensure   => 'present',
  provider => 'homebrew',
}

package { 'serverspec':
  ensure   => 'present',
  provider => 'gem',
}
