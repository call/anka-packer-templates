package { 'serverspec':
  ensure   => 'present',
  provider => 'gem',
}

package { 'autopkgr':
  ensure   => 'present',
  provider => 'brewcask',
}
