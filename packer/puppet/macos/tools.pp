$autopkg_version = '1.4.1'
$jssimporter_version = '1.0.5'
$serverspec_version = '2.36.0'
$tccprofile_ref = '487e121275ff98e532e5b44fcbf85d0aca375ed8'
$puppet_pkgdmg = 'puppet-agent-6.11.1-1.osx10.14.dmg'

package {'puppet_agent':
  ensure => 'present',
  source => "http://downloads.puppet.com/mac/puppet6/10.14/x86_64/${puppet_pkgdmg}",
}

package { 'serverspec':
  ensure   => $serverspec_version,
  provider => 'gem',
}

package { 'autopkg':
  ensure => 'present',
  source => "https://github.com/autopkg/autopkg/releases/download/v${autopkg_version}/autopkg-${autopkg_version}.pkg",
}

package { 'autopkgr':
  ensure   => 'present',
  provider => 'brewcask',
}

package { 'jssimporter':
  ensure => 'present',
  source => "https://github.com/jssimporter/JSSImporter/releases/download/v${jssimporter_version}/jssimporter-${jssimporter_version}.pkg"
}

vcsrepo { '/opt/tccprofile':
  ensure   => 'present',
  provider => 'git',
  source   => 'https://github.com/carlashley/tccprofile.git',
  revision => $tccprofile_ref,
}

# Settings for JSSImporter
macdefaults { 'jss_url':
  domain => '/Library/Preferences/com.github.autopkg.plist',
  key    => 'JSS_URL',
  type   => 'string',
  value  => 'https://test.jss.private:8443',
}

macdefaults { 'jss_api_username':
  domain => '/Library/Preferences/com.github.autopkg.plist',
  key    => 'API_USERNAME',
  type   => 'string',
  value  => 'apiUser',
}

macdefaults { 'jss_api_password':
  domain => '/Library/Preferences/com.github.autopkg.plist',
  key    => 'API_PASSWORD',
  type   => 'string',
  value  => 'apiPassword',
}
