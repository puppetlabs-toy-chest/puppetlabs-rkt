# == Class: acbuild
#
# Module to install and manage the acbuild command line tools
#
# === Parameters
# [*version*]
#   What version of acbuild to install
#
# [*ensure*]
#   Whether to install or uninstall the command line tools
#   Defaults to present, can also be set to absent
#

class rkt::acbuild(
  $version = $rkt::params::acbuild_version,
  $ensure = $rkt::params::ensure,
) inherits rkt::params {

  validate_string($version)
  validate_re($ensure, '^(present|absent)$')

  archive { 'acbuild':
    ensure           => $ensure,
    target           => '/usr/local/src',
    checksum         => false,
    follow_redirects => true,
    src_target       => '/usr/local/src',
    url              => "https://github.com/appc/acbuild/releases/download/v${version}/acbuild-v${version}.tar.gz",
  }

  if $ensure == 'present' {
    $file_ensure = 'link'
  } else {
    $file_ensure = $ensure
  }

  file { '/usr/local/bin/acbuild':
    ensure  => $file_ensure,
    target  => "/usr/local/src/acbuild-v${version}/acbuild",
    require => Archive['acbuild'],
  }

  file { '/usr/local/bin/acbuild-script':
    ensure  => $file_ensure,
    target  => "/usr/local/src/acbuild-v${version}/acbuild-script",
    require => Archive['acbuild'],
  }

  file { '/usr/local/bin/acbuild-chroot':
    ensure  => $file_ensure,
    target  => "/usr/local/src/acbuild-v${version}/acbuild-chroot",
    require => Archive['acbuild'],
  }
}
