$autopkg_version = '1.4.1'
$jssimporter_version = '1.0.5'
$serverspec_version = '2.36.0'
$tccprofile_ref = '487e121275ff98e532e5b44fcbf85d0aca375ed8'

package { 'serverspec':
  ensure   => $serverspec_version,
  provider => 'gem',
}

package { 'autopkg':
  ensure => 'installed',
  source => "https://github.com/autopkg/autopkg/releases/download/v${autopkg_version}/autopkg-${autopkg_version}.pkg",
}

package { 'autopkgr':
  ensure   => 'present',
  provider => 'brewcask',
}

package { 'jssimporter':
  ensure => 'installed',
  source => "https://github.com/jssimporter/JSSImporter/releases/download/v${jssimporter_version}/jssimporter-${jssimporter_version}.pkg"
}

vcsrepo { '/opt/tccprofile':
  ensure   => 'present',
  provider => 'git',
  source   => 'https://github.com/carlashley/tccprofile.git',
  revision => $tccprofile_ref,
}
